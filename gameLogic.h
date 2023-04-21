#include "tetrimino.h"
#include "background.h"
#include <stdlib.h>

#define BOARD_WIDTH 10
#define BOARD_HEIGHT 24

int board[BOARD_HEIGHT][BOARD_WIDTH];
int score = 0;

int timerCount = 0;



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
            currX = 3;
            currY = 0;
            
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
            if (board[3][i] != 0) { // found a non-filled cell
                    gameOver = 1;
                }
        }
    return gameOver;
}

