// -----------------------------------------------------------------------------
// C-Skeleton to be used with HAM Library from www.ngine.de
// -----------------------------------------------------------------------------
#include "numbers.h"
#include "gba.h"
#include "tetrimino.h"

#define TIMER_ENABLE_N 0xC7 //1100 0111 (enable bit 7,6,2 for H), bit 0,1 for f.1024
#define TIMER_MAX  66535
#define TIMER_FREQ 16387
#define DIGIT_X 120
#define DIGIT_Y 100
#define BOARD_WIDTH 10
#define BOARD_HEIGHT 20

int board[BOARD_HEIGHT][BOARD_WIDTH];

int count = 0;

void initBoard() {

    //initialize the board (2d array) with zeroes
    for (int i = 0; i < BOARD_HEIGHT; i++) {
        for (int j = 0; j < BOARD_WIDTH; j++)
            board[i][j] = 0; 
    }
}

int (*currentPiece)[4];
int (*currentBlkTemplate)[4][4];

void initCurrentPiece(int index){
    if(index == 0){
        currentBlkTemplate = &I_Blk;

    }
    currentPiece = currentBlkTemplate[0];

};

void updatePiecePos(){
    //erase current piece
    int apple = 0;
}





//push test

void moveIsPossible()
{}

void drawSprite(int numb, int N, int x, int y)
{
    // Gift function: displays sprite number numb on screen at position (x,y), as sprite object N
    *(unsigned short *)(0x7000000 + 8*N) = y | 0x2000;
    *(unsigned short *)(0x7000002 + 8*N) = x;
    *(unsigned short *)(0x7000004 + 8*N) = numb*2;
}


void Handler(void)
{    
	REG_IME = 0x00; // Stop all other interrupt handling, while we handle this current one  

    if ((REG_IF & INT_TIMER0) == INT_TIMER0) // TODO: replace XXX with the specific interrupt you are handling
    {
        // TODO: Handle timer interrupt here
			count++;
			int temp = count;
			int digit = 0;
			while(temp > 0){
				drawSprite(temp%10, digit, DIGIT_X -10*digit, DIGIT_Y);
				temp /= 10;
				digit++;
			}
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
	
    /*
    // Set Mode 2
    *(unsigned short *) 0x4000000 = 0x40 | 0x2 | 0x1000;

    // Fill SpritePal
    *(unsigned short *) 0x5000200 = 0;
    *(unsigned short *) 0x5000202 = RGB(31,31,31);

    // Fill SpriteData
    for (i = 0; i < 10*8*8/2; i++)
        spriteData[i] = (numbers[i*2+1] << 8) + numbers[i*2];
    for (i = 0; i < 128; i++)
        drawSprite(0, i, 240, 160);

    // Set Handler Function for interrupts and enable selected interrupts
    REG_INT = (int)&Handler;
    REG_IE =  INT_TIMER0; //TODO: complete this line to choose which timer interrupts to enable
    REG_IME = 0x1;		// Enable interrupt handling

    // Set Timer Mode (fill that section and replace TMX with selected timer number)
    REG_TM0D =	TIMER_MAX - TIMER_FREQ;		// TODO: complete this line to set timer initial value
	 //REG_TM0D = TIMER_MAX - 1000;				//TURN ON FOR SPEEEEEED
    REG_TM0CNT = (TIMER_ENABLE | TIMER_INTERRUPTS | TIMER_FREQUENCY_1024);		// TODO: complete this line to set timer frequency and enable timer
				
	 drawSprite(0, 0, DIGIT_X, DIGIT_Y);
	
    while(1);

    */
	return 0;
}

