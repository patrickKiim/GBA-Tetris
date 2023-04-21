// -----------------------------------------------------------------------------
// C-Skeleton to be used with HAM Library from www.ngine.de
// -----------------------------------------------------------------------------
#include "numbers.h"
#include "mygbalib.h"
#include <stdlib.h>
#include <time.h>
#include "gameLogic.h"

#define TIMER_ENABLE_N 0xC7 //1100 0111 (enable bit 7,6,2 for H), bit 0,1 for f.1024
#define TIMER_MAX  66535
#define TIMER_FREQ 16387
#define DIGIT_X 120
#define DIGIT_Y 100

//Game loop
//randomize queue of tetris block
//init block
//await user input
//allow single block swap
//periodically drop block by 1
//check periodic drop cannot occur
    // if(canMove(currX, currY + 1, orientationIndex) == 0)
//check for game over
    //isGameOver()
//delete full rows, update score
    //deleteFullRows()
//add block in queue
//init next block in queue

void gameLoop(){
    formatInitalBG();
    initBoard();
    initBlkQueue();
    initNewPiece();
    initHoldBlk();
    swapAllowed = 1;
    int gameTick = 0;
    while(1){
       
        //if(gameTick % 2 == 0)
            checkbutton();
        

        drawPlayingField(board);
    
        if(gameTick % 20 == 0){
            
        //if block cannot move down (ie. settled)
        if(canMove(currX, currY + 1, orientationIndex) == 0){
            if(isGameOver())
                break;
            
            deleteFullRows();
            initNewPiece();
            swapAllowed = 1; //allow swap since it is new block
        }
        }


        gameTick = (gameTick + 1) % 100;
    }
}



void Handler(void)
{    
	REG_IME = 0x00; // Stop all other interrupt handling, while we handle this current one  

    //initialize playing field
    if((REG_IF & INT_VBLANK) == INT_VBLANK){
        drawPlayingField(board);
    }
    

    if ((REG_IF & INT_TIMER0) == INT_TIMER0) // TODO: replace XXX with the specific interrupt you are handling
    {
        
        moveD(); //move block down periodically
        
            //legacy CA2 code
            /*
			timerCount++;
			int temp = timerCount;
			int digit = 0;
			while(temp > 0){
				drawSprite(temp%10, digit, DIGIT_X -10*digit, DIGIT_Y);
				temp /= 10;
				digit++;
			}
            */
            
			//drawSprite(count/10, 1, 110, 100);
			//drawSprite(count%10, 0, 120, 100);
    }
    
    REG_IF = REG_IF; // Update interrupt table, to confirm we have handled this interrupt
    
    REG_IME = 0x01;  // Re-enable interrupt handling
}

// -----------------------------------------------------------------------------
// Project Entry Point
// -----------------------------------------------------------------------------
int main(void)
{
    int i;

    //initialize mode 2 for backgrounds
    REG_DISPCNT = MODE2 | OBJ_MAP_1D;

    //intialize randomizer
    //time_t t;
    srand(REG_VCOUNT + time(0));

    
    
    // Set Mode 2
    *(unsigned short *) 0x4000000 = 0x40 | 0x2 | 0x1000;
    
    

    initVram();

   fillPalette();
   fillSprites();

    // Fill SpriteData

    // code is for timers
     /*
    for (i = 0; i < 10*8*8/2; i++)
        spriteData[i] = (numbers[i*2+1] << 8) + numbers[i*2];
    for (i = 0; i < 128; i++)
        drawSprite(0, i, 240, 160);
    */

    

    // Set Handler Function for interrupts and enable selected interrupts
    REG_INT = (int)&Handler;
    REG_IE =  INT_TIMER0; //TODO: complete this line to choose which timer interrupts to enable
    
    //for backgrounds
    // Set up the Interrupt Request (IRQ) register to enable the VBlank interrupt and trigger it at the appropriate time
    REG_DISPSTAT |= (1 << 3);   // Enable VBlank interrupt in the Display Status (DISPSTAT) register
    REG_IE |= (1 << 0);         // Enable VBlank interrupt in the Interrupt Enable (IE) register

    REG_IME = 0x1;		// Enable interrupt handling


    
    // Set Timer Mode (fill that section and replace TMX with selected timer number)
    REG_TM0D =	TIMER_MAX - TIMER_FREQ;		// TODO: complete this line to set timer initial value
	 //REG_TM0D = TIMER_MAX - 1000;				//TURN ON FOR SPEEEEEED
    REG_TM0CNT = (TIMER_ENABLE | TIMER_INTERRUPTS | TIMER_FREQUENCY_1024);		// TODO: complete this line to set timer frequency and enable timer
				
	//drawSprite(0, 0, DIGIT_X, DIGIT_Y);
	
    gameLoop();

    //while(1);

	return 0;
}

