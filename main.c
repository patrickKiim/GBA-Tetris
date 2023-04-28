// -----------------------------------------------------------------------------
// C-Skeleton to be used with HAM Library from www.ngine.de
// -----------------------------------------------------------------------------
#include "numbers.h"
//#include "mygbalib.h"
#include <stdlib.h>
#include <time.h>
#include "gamestate.h"
//#include "gameLogic.h"

#define TIMER_ENABLE_N 0xC7 //1100 0111 (enable bit 7,6,2 for H), bit 0,1 for f.1024
#define TIMER_MAX  66535
#define TIMER_FREQ 16387
#define DIGIT_X 120
#define DIGIT_Y 100

//int count = 0;
int points_gained = 1;
gamestate;

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


// Function to perform assembly logic
void assembly(void) {
    // Implement assembly logic here
}


void Handler(void)
{    
	REG_IME = 0x00; // Stop all other interrupt handling, while we handle this current one  

    if (((REG_IF & INT_TIMER0) == INT_TIMER0)&& gamestate ==1 ){
        // if(points_gained ){
        //         score++; //increase score if point has been gained
        // }

        moveD(); //move block down periodically

        //Set up counter
        int temp = score;
        int digit = 0;
        while(temp > 0){
            drawSprite(temp%10, digit +21, 208 -10*digit, 112);
            temp /= 10;
            digit++;
        }
    }

    if (((REG_IF & INT_TIMER1) == INT_TIMER1) && gamestate ==2){
            // if(points_gained){
            //     score++;
            //     }

        moveD(); //move block down periodically

        int temp = score;
        int digit = 0;
        while(temp > 0){
            drawSprite(temp%10, digit +21, 208 -10*digit, 112);
            temp /= 10;
            digit++;
        }
    }
			
    
    REG_IF = REG_IF; // Update interrupt table, to confirm we have handled this interrupt
    REG_IME = 0x01;  // Re-enable interrupt handling
}

// -----------------------------------------------------------------------------
// Project Entry Point
// -----------------------------------------------------------------------------
int main(void)
{
    //int i;

    // //initialize mode 2 for backgrounds
    // REG_DISPCNT = MODE2 | OBJ_MAP_1D;

    //intialize randomizer
    //time_t t;
    srand(REG_VCOUNT + time(0));

    // // Set Mode 2
     *(unsigned short *) 0x4000000 = 0x40 | 0x2 | 0x1000;
    
    fillPalette();
    fillSprites();

    // // Set Handler Function for interrupts and enable selected interrupts
    // REG_INT = (int)&Handler;
    // REG_IE =  INT_TIMER0; //TODO: complete this line to choose which timer interrupts to enable
    
    // REG_IME = 0x1;		// Enable interrupt handling


    
    // // Set Timer Mode (fill that section and replace TMX with selected timer number)
    // REG_TM0D =	TIMER_MAX - TIMER_FREQ;		// TODO: complete this line to set timer initial value
	//  //REG_TM0D = TIMER_MAX - 1000;				//TURN ON FOR SPEEEEEED
    // REG_TM0CNT = (TIMER_ENABLE | TIMER_INTERRUPTS | TIMER_FREQUENCY_1024);		// TODO: complete this line to set timer frequency and enable timer
				
    // gameLoop();


    // Set Handler Function for interrupts and enable selected interrupts
    REG_INT = (int)&Handler;
    REG_IE = INT_TIMER0 | INT_TIMER1; // Enable both timer interrupts

	
	 assembly(); //call assembly function to set up Timer 1

	// Timer Level 2 (every 0.67 seconds)
	 REG_TM1D = 54551;
	 REG_TM1CNT = TIMER_ENABLE | TIMER_INTERRUPTS | TIMER_FREQUENCY_1024;
    REG_IME = 0x1;		// Enable interrupt handling

	//switch statement to toggle between gamestates
       switch(gamestate) {
            case  0:
                	main_screen();
						break;
               
				case  1:
						level_1();
						break;
				case  2:
						level_2();
						break;
				}

    while(1);

    
	return 0;
}
