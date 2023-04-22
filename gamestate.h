
#include "mygbalib.h"




int score = 0; //current score
int game_over = 0; //Make iot so this varibale is linked to a function stating whether the game is over


void main_screen() {
    int first = 80;
    int second = 120;

    // Draw “TETRIS” “PRESS A TO START”
    drawSprite(10, 0, 72, first); //T
    drawSprite(11, 1, 92, first); //E
    drawSprite(12, 2, 112, first); //T
    drawSprite(13, 3, 132, first); //R
    drawSprite(14, 4, 152, first);
    drawSprite(15, 5, 172, first);
    drawSprite(16, 6, 32, second);
    drawSprite(17, 7, 50, second);
    drawSprite(18, 8, 68, second);
    drawSprite(19, 9, 86, second);
    drawSprite(19, 10, 122, second);
    drawSprite(19, 11, 140, second);
    drawSprite(20, 12, 158, second);
    drawSprite(21, 13, 176, second);
    drawSprite(13, 14, 194, second);
    drawSprite(20, 15, 212, second); 
    //draw “TETRIS” “PRESS A TO START”
  
} 

void level_1(){
    // Declare and initialize variables
    int i = 0; // y position
    int j = 0; // Sprite number left
    int k = 10; // Sprite number right

    // Draw lines on the right and left using for loop
    for(i; i < 160; i += 16) {
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
        // Backend Game logic!

	gamestate = 0;
    }
}
