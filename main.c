// -----------------------------------------------------------------------------
// C-Skeleton to be used with HAM Library from www.ngine.de
// -----------------------------------------------------------------------------
#include "numbers.h"
#include "gba.h"
#include "tetrimino.h"
#include "background.h"
#include "mygbalib.h"
#include <stdlib.h>
#include <time.h>

#define TIMER_ENABLE_N 0xC7 //1100 0111 (enable bit 7,6,2 for H), bit 0,1 for f.1024
#define TIMER_MAX  66535
#define TIMER_FREQ 16387
#define DIGIT_X 120
#define DIGIT_Y 100
#define BOARD_WIDTH 10
#define BOARD_HEIGHT 24

int board[BOARD_HEIGHT][BOARD_WIDTH];
int score = 0;

int timerCount = 0;

//TODO: how to print sprites have row has been deleted

//7 PIECE BAG ALGORITHM (for generating tetris blocks)//
int bag[7] = {0, 1, 2, 3, 4, 5, 6}; // init bag with all 7 pieces
int bagIndex = 7; //index at 7 to indicate empty bag

void shuffleBag() {
    
    int j = 0;
    int temp = 0;
    int i =  0;
    for (i = 6; i >= 0; i--) {
        //j = 1;
        j = rand() % (i + 1);
        temp = bag[i];
        bag[i] = bag[j];
        bag[j] = temp;
    }
    
    bagIndex = 0; // reset the index to the beginning of the bag
}

int getNextPiece() {
    if (bagIndex >= 7) {
        //shuffle bag if bag is empty
        shuffleBag();
    }
    int piece = bag[bagIndex];
    bagIndex++;
    return piece;
}
//END OF 7 PIECE BAG ALGORITHM //


void initBoard() {

    //initialize the board (2d array) with zeroes
    int i = 0;
    int j = 0;
    for (i = 0; i < BOARD_HEIGHT; i++) {
        for (j = 0; j < BOARD_WIDTH; j++)
            board[i][j] = 0; 
    }
    drawPlayingField(board);
}

//define falling block
int orientationIndex = 0;
int tetriminoIndex = 0;
int (*currentBlk)[4];

//define hold block;
int (*holdBlk)[4];

void initHoldBlk(){
    holdBlk = nullTetrimino;
}

//define position (top left) of falling block
int currX = 3;
int currY = 0;

void eraseCurrentPiece(){
    // Erase the current piece from the board
    int i = 0;
    int j = 0;
    for (i = 0; i < 4; i++) {
        for (j = 0; j < 4; j++) {
            if ((currentBlk)[i][j] != 0) {
                board[currY + i][currX + j] = 0;
            }
        }
    }
    //drawPlayingField(board);
}

void drawCurrentPiece(){
    // Draw current piece on the board
    int i = 0;
    int j = 0;
    for (i = 0; i < 4; i++) {
        for (j = 0; j < 4; j++) {
            if ((currentBlk)[i][j] != 0) {
                board[currY + i][currX + j] = (currentBlk)[i][j];
            }
        }
    }
    //drawPlayingField(board);
}

//define falling block depending on its index
//index given in tetrimino.h
void initNewPiece(){
    tetriminoIndex = getNextPiece();
    orientationIndex = 0;
    currX = 3;
    currY = 0;
    currentBlk = tetriminos[tetriminoIndex][orientationIndex];
    drawCurrentPiece();
};

//CHECK IF BLOCK CAN BE MOVED OR ROTATED//
int canMove(int newX, int newY, int newRotation) {
    eraseCurrentPiece();
    int i = 0;
    int j = 0;
    for (i = 0; i < 4; i++) {
        for (j = 0; j < 4; j++) {
            if (tetriminos[tetriminoIndex][newRotation][j][i] != 0) {
                int x = newX + i;
                int y = newY + j;
                if (x < 0 || x >= BOARD_WIDTH || y >= BOARD_HEIGHT) {
                    drawCurrentPiece();
                    return 0; // Movement out of bounds
                }
                if (y >= 0 && board[y][x] != 0) {
                    drawCurrentPiece();
                    return 0; // Movement onto an occupied space
                }
            }
        }
    }
    drawCurrentPiece();
    return 1; // Valid move
}

//MOVE FUNCTIONS//

void moveL(){
    int newX = currX - 1;
    //check if move is possible
    if(canMove(newX, currY, orientationIndex) == 1){
        eraseCurrentPiece();
        currX = newX;
        drawCurrentPiece();
    }
    
        
}

void moveR(){
    int newX = currX + 1;
    //check if move is possible
    if(canMove(newX, currY, orientationIndex) == 1){
        eraseCurrentPiece();
        currX = newX;
        drawCurrentPiece();
    }
}

void moveD(){
    int newY = currY + 1;
    //check if move is possible
    if(canMove(currX, newY, orientationIndex) == 1){
        eraseCurrentPiece();
        currY = newY;
        drawCurrentPiece();
    }
}

void hardDrop(){
    while(canMove(currX, currY+1, orientationIndex)){
        moveD();
    }
}

void rotateCW(){
    int newR = (orientationIndex + 1) % 4; //0-> 1 -> 2 -> 3 -> 0
    //check if rotation is possible
    
    if (canMove(currX, currY, newR) == 1){
        eraseCurrentPiece();
        orientationIndex = newR;
        currentBlk = (tetriminos)[tetriminoIndex][orientationIndex];
         drawCurrentPiece();
    }
}

void rotateCCW(){
    int newR = (orientationIndex - 1 + 4) % 4; //0 -> 3 -> 2 -> 1

    //check if rotation is possible
    
    if (canMove(currX, currY, newR) == 1){
        eraseCurrentPiece();
        orientationIndex = newR;
        currentBlk = (tetriminos)[tetriminoIndex][orientationIndex];
        drawCurrentPiece();
    }
}

//END OF MOVE FUNCTIONS//

void deleteFullRows(){
    int fullRows = 0; //number of full rows
    int newBoard[BOARD_HEIGHT][BOARD_WIDTH]; //new empty board

    //initialize the new board (2d array) with zeroes
    int i = 0;
    int j = 0;
    for (i = 0; i < BOARD_HEIGHT; i++) {
        for (j = 0; j < BOARD_WIDTH; j++)
            newBoard[i][j] = 0; 
    }

    int k = BOARD_HEIGHT - 1; //check starting from bottom

    for(j = BOARD_HEIGHT - 1; j >= 0; j--){
        int isFull = 1; //initially assume row is full
        for (i = 0; i < BOARD_WIDTH; i++) {
            if (board[j][i] == 0) { // found a non-filled cell
                    isFull = 0;
                }
        }
        if(isFull == 1)
            fullRows++;
        else{
            //copy non-full row to new board
            for (i = 0; i < BOARD_WIDTH; i++) {
                newBoard[k][i] = board[j][i];
            }
            k--; //decrement row for new board
        }
    }

    //replace original board with new board
    for(j = 0; j < BOARD_HEIGHT; j++){
        for(i = 0; i < BOARD_WIDTH; i++){
            board[j][i] = newBoard[j][i];
        }
    }

    /*
    //put zeroes on unfilled rows
    for(j = 0; j < fullRows; j++){
        for(i = 0; i < BOARD_WIDTH; i++){
            board[j][i] = 0;
        }
    }
    */

    //add score (based on tetris scoring system)
    if(fullRows == 1)
        score += 40;
    else if(fullRows == 2)
        score += 100;
    else if(fullRows == 3)
        score += 300;
    else if(fullRows >= 4)
        score += 1200;
}

//TODO: swap block with hold block
void swapBlk(){
    //if nothing on hold
    if((*holdBlk) == nullTetrimino){
        //put blk on hold and bring out new blk
        eraseCurrentPiece();
        holdBlk = currentBlk;
        initNewPiece();
    }
    else{
        //swap current blk and hold blk
        //respawn blk at the top
        eraseCurrentPiece();
        int (*temp)[4] = holdBlk;
        currX = 3;
        currY = 0;
        holdBlk = currentBlk;
        currentBlk = temp;
        drawCurrentPiece();
    }
}





//call below function after block has been placed
//returns 1 if top row is full (game over)
int isGameOver(){
    int gameOver = 0; //initially assume game is not done
    int i = 0;
        for (i = 0; i < BOARD_WIDTH; i++) {
            //check row index 3 (top 4 rows are where blocks spawn)
            if (board[3][i] != 0) { // found a non-filled cell
                    gameOver = 1;
                }
        }
    return gameOver;
}


//TODO: Game loop
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
    initNewPiece();
    initHoldBlk();
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
            
        }
        }


        gameTick = (gameTick + 1) % 100;
    }
}

/*
void drawSprite(int numb, int N, int x, int y)
{
    // Gift function: displays sprite number numb on screen at position (x,y), as sprite object N
    *(unsigned short *)(0x7000000 + 8*N) = y | 0x2000;
    *(unsigned short *)(0x7000002 + 8*N) = x;
    *(unsigned short *)(0x7000004 + 8*N) = numb*2;
}
*/


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
    
    //set bits for background?
    *(unsigned short*)0x4000004 = 0x0403;

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

    while(1);

	return 0;
}

