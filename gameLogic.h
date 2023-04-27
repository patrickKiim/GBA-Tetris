#include "tetrimino.h"
#include "mygbalib.h"
//#include "background.h"
//#include "newBackground.h"
#include <stdlib.h>

#define BOARD_WIDTH 8
#define BOARD_HEIGHT 18

#define startingX 0
#define startingY 0

#define BOARD_SPRITE_START 8

#define DISP_HOLD_X 120
#define DISP_HOLD_Y 50

#define DISP_QUEUE_X 200
#define DISP_QUEUE_Y 20

int board[BOARD_HEIGHT][BOARD_WIDTH];
int score = 0;

int timerCount = 0;

void drawPlayingField(int field[BOARD_HEIGHT][BOARD_WIDTH]) {
    int i, j;
    int fieldSpriteIndex = BOARD_SPRITE_START;
    for (i = 4; i < BOARD_HEIGHT; i++) {
        for (j = 0; j < BOARD_WIDTH; j++) {
            int x = j * 8;
            int y = (i - 4) * 8;
            int colorIndex = field[i][j];
            //drawBlk(x, y, colorIndex);
            //setTile(j, (i-4), colorIndex);
            if(colorIndex == 0){
                drawSprite(NULL_SPRITE, fieldSpriteIndex, x,y);
            }
            if(colorIndex == 1){
                drawSprite(LB_block, fieldSpriteIndex, x,y);
            }
            if(colorIndex == 2){
                drawSprite(Purple_block, fieldSpriteIndex, x,y);
            }
            if(colorIndex == 3){
                drawSprite(Red_block, fieldSpriteIndex, x,y);
            }
            if(colorIndex == 4){
                drawSprite(Green_block, fieldSpriteIndex, x,y);
            }
            if(colorIndex == 5){
                drawSprite(Orange_block, fieldSpriteIndex, x,y);
            }
            if(colorIndex == 6){
                drawSprite(Blue_block, fieldSpriteIndex, x,y);
            }
            if(colorIndex == 7){
                drawSprite(Yellow_block, fieldSpriteIndex, x,y);
            }
            //else
                //drawSprite(LB_block, fieldSpriteIndex, x,y);
            fieldSpriteIndex++;
        }
    }
    
}


//7 PIECE BAG ALGORITHM (for generating tetris blocks)//
int bag[7] = {0, 1, 2, 3, 4, 5, 6}; // init bag with all 7 pieces
int bagIndex = 7; //index at 7 to indicate empty bag

int blockQueue[7]; //queue of tetris blocks
int blockQueueIndex = 0;

void shuffleBag() {
    
    int j = 0;
    int temp = 0;
    int i =  0;
    //iterate through each element in bag
    for (i = 6; i >= 0; i--) {
        j = rand() % (i + 1); //choose random element
        temp = bag[i]; //swap element i and element j
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
    //get piece from queue
    int piece = blockQueue[blockQueueIndex];

    //take piece out from bag and put it in queue
    blockQueue[blockQueueIndex] = bag[bagIndex];
    
    //iterate bag and queue indexes
    blockQueueIndex = (blockQueueIndex + 1) % 7; //0, 1, ... 7, 0, 1...
    bagIndex++;
    return piece;
}

void initBlkQueue(){
    int i;
    shuffleBag();

    //populate block queue by taking 7 items out from the bag
    for(i = 0; i < 7; i++){
        blockQueue[i] = bag[bagIndex];
        bagIndex++;
    }
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
int holdBlkIndex = 0;

void initHoldBlk(){
    holdBlk = nullTetrimino;
}

//define position (top left) of falling block
int currX = 0;
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
   
}

//define falling block depending on its index
//index given in tetrimino.h
void initNewPiece(){
    tetriminoIndex = getNextPiece();
    orientationIndex = 0;
    currX = startingX;
    currY = startingY;
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

//variable to check if player already swapped
int swapAllowed = 1;

//swap block with hold block
void swapBlk(){
    if(swapAllowed){
        //if nothing on hold
        if((*holdBlk) == nullTetrimino){
            //put blk on hold and bring out new blk
            eraseCurrentPiece();
            holdBlk = currentBlk;
            holdBlkIndex = tetriminoIndex;
            initNewPiece();
        }
        else{
            //swap current blk and hold blk
            //respawn blk at the top
            eraseCurrentPiece();
            int (*temp)[4] = holdBlk;
            holdBlk = currentBlk;
            currentBlk = temp;

            //swap tetrimino index
            int tempIndex = holdBlkIndex;
            holdBlkIndex = tetriminoIndex;
            tetriminoIndex = tempIndex;

            //reset position
            currX = startingX;
            currY = startingY;
            
            drawCurrentPiece();
        }
    }
    swapAllowed = 0; //swap is used up
}

//call below function after block has been placed
//returns 1 if top row is full (game over)
int isGameOver(){
    int gameOver = 0; //initially assume game is not done
    int i = 0;
        for (i = 0; i < BOARD_WIDTH; i++) {
            //check row index 3 (top 4 rows are where blocks spawn)
            if (board[3][i] != 0) { // found a filled cell
                    gameOver = 1;
                }
        }
    return gameOver;
}

//print hold block and queued blocks
void showInfo(){
    //display hold block
    if((*holdBlk) != nullTetrimino)
    //only show hold block after hold blk gets stored
        drawSprite(holdBlkIndex*4+1, 0, DISP_HOLD_X, DISP_HOLD_Y);

    //display queue
    int i = 0;
    //iterate from start of block queue and display 7 blocks in order
    int queueHead = blockQueueIndex;
    for(i = 0; i < 7;i++){
        drawSprite((blockQueue[queueHead])*4, i+1, DISP_QUEUE_X, DISP_QUEUE_Y+(10*i));
        queueHead = (queueHead + 1) % 7; //0-> 1-> ... -> 6 -> 0
    }
}




