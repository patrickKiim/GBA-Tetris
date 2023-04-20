#include "drawsprites.h"



int score = 0; //current score
int game_over = 0; //Make iot so this varibale is linked to a function stating whether the game is over
int gamestate = 0;

void main_screen() {
    int first = 80;
    int second = 96;

    // Draw “TETRIS” “PRESS A TO START”
    drawSprite(10, 0, 72, first); //T
    drawSprite(11, 1, 88, first);
    drawSprite(12, 2, 104, first);
    drawSprite(13, 3, 120, first);
    drawSprite(14, 4, 136, first);
    drawSprite(15, 5, 152, first);
    drawSprite(16, 6, 32, second);
    drawSprite(17, 7, 48, second);
    drawSprite(18, 8, 64, second);
    drawSprite(19, 9, 80, second);
    drawSprite(19, 10, 112, second);
    drawSprite(19, 11, 128, second);
    drawSprite(20, 12, 144, second);
    drawSprite(21, 13, 160, second);
    drawSprite(22, 14, 176, second);
    drawSprite(20, 15, 192, second);
    //draw “TETRIS” “PRESS A TO START”
    //How do I know if this button is pressed? --> check button function --> change g ==1?
} 

void level_1(){
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

    while(!game_over) {
        // Backend Game logic!

	gamestate = 0;
    }
}

