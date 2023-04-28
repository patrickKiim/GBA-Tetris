
//#include "mygbalib.h" <- included in gameLogic.h
#include "gameLogic.h"

#define LEVEL1_SCORE_THRESHOLD 3000


//int score = 0; //current score
int game_over = 0; //Make iot so this varibale is linked to a function stating whether the game is over
//int gamestate = 0;

void exitStartScreen(){
    gamestate = 1;
}

//patrick's code from tetris game logic
void gameLoop(){
    //formatInitalBG();
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
        showInfo();
    
        if(gameTick % 20 == 0){
            
            //if block cannot move down (ie. settled)
            if(canMove(currX, currY + 1, orientationIndex) == 0){
                if(isGameOver()){
                    game_over = 1;
                    return; //exit game
                }

                if((score >= LEVEL1_SCORE_THRESHOLD)&& gamestate==1)
                    return; //exit game
                
                deleteFullRows();
                initNewPiece();
                swapAllowed = 1; //allow swap since it is new block
            }
        }


        gameTick = (gameTick + 1) % 100;
    }
}


void main_screen() {
    int first = 60;
    int second = 100;


    // Draw “TETRIS” “PRESS A TO START”
    drawSprite(10, 0, 62, first); //T
    drawSprite(11, 1, 82, first); //E
    drawSprite(12, 2, 102, first); //T
    drawSprite(13, 3, 122, first); //R
    drawSprite(14, 4, 142, first);//I
    drawSprite(15, 5, 162, first);//S
   drawSprite(16, 6, 22, second);
	drawSprite(17, 7, 42, second);
	drawSprite(18, 8, 62, second);
   drawSprite(19, 9, 82, second);
    drawSprite(19, 10, 102, second);
   drawSprite(19, 11, 132, second);
   drawSprite(20, 12, 152, second);
    drawSprite(21, 13, 172, second);
	 drawSprite(17, 14, 192, second);
	drawSprite(20, 15, 210, second); 

} 

void level_1(){

//Clear homescreen sprites

	int first = 60;
    int second = 100;
	 drawSprite(23, 0, 62, first); //T
    drawSprite(23, 1, 82, first); //E
    drawSprite(23, 2, 102, first); //T
    drawSprite(23, 3, 122, first); //R
    drawSprite(23, 4, 142, first);
    drawSprite(23, 5, 162, first);
    drawSprite(23, 6, 22, second);//P
    drawSprite(23, 7, 42, second);//R
    drawSprite(23, 8, 62, second);//E
    drawSprite(23, 9, 82, second);//S
    drawSprite(23, 10, 102, second);//S
    drawSprite(23, 11, 132, second);
    drawSprite(23, 12, 152, second);
    drawSprite(23, 13, 172, second);
    drawSprite(23, 14, 192, second);
    drawSprite(23, 15, 210, second); 


    // Declare and initialize variables
    int i = 0; // y position
    int j = 0; // Sprite number left
    int k = 10; // Sprite number right

    // Draw lines on the right and left using for loop
    for(i = 0; i < 160; i += 16) {
        drawSprite(22, j, 0, i);
        drawSprite(22, k, 96, i);
        j++;
        k++;

    }

    // Draw Level1
    drawSprite(1, 20, 208, 16);

    // Next sprite
    // Current sprite

    while(score < 100 &&  !game_over){
        // Backend Game logic!
        //gameLoop();
    }

    if(game_over) {
        gamestate = 0;
    } else {
        gamestate = 2;
    }
}

void level_2(){

    // Declare and initialize variables
    int i = 0; // y position
    int j = 0; // Sprite number left
    int k = 10; // Sprite number right

    // Draw lines on the right and left using for loop
    for(i = 0; i < 160; i += 16) {
        drawSprite(22, j, 0, i);
        drawSprite(22, k, 96, i);
        j++;
        k++;
    }

// Draw Level2
    drawSprite(2, 20, 208, 16);

    while(!game_over) {
        //gameLoop();

	
    }
	gamestate = 0;
}
