#include drawsprites.h

enum gamestates{
main_screen;
level_1;
level_2;
//game_over;
}


void main_screen()
first= 80;
second= 96;

//draw “TETRIS” “PRESS A TO START”
drawSprite(T, 0, 72, first); 
drawSprite(E, 1, 88, first);
drawSprite(T, 2, 104, first);
drawSprite(R, 3, 120, first);
drawSprite(I, 4, 136, first);
drawSprite(S, 5, 152, first);
drawSprite(P, 6, 32, second);
drawSprite(R, 7, 48, second);
drawSprite(E, 8, 64, second);
drawSprite(S, 9, 80, second);
drawSprite(S, 10, 112, second);
drawSprite(S, 11, 128, second);
drawSprite(T, 12, 144, second);
drawSprite(A, 13, 160, second);
drawSprite(R, 14, 176, second),
drawSprite(T, 15, 192, second);
//draw “TETRIS” “PRESS A TO START”
//How do I know if this button is pressed? --> check button function --> change g ==1?
} 

}

Void level_1(){

//gameboard

//left box
drawSprite(linedown, 28, 144, 32)
drawSprite(linedown, 29, 144, 48)
drawSprite(linedown, 30, 176, 32)
drawSprite(linedown, 31, 176, 48)
drawSprite(lineside, 32, 144, 32)
drawSprite(lineside, 33, 160, 32)
drawSprite(lineside, 34, 144, 64)
drawSprite(lineside, 35, 160, 64)

//right box
drawSprite(linedown, 0, 192, 32)
drawSprite(linedown, 0, 192, 48)
drawSprite(linedown, 0, 224, 32)
drawSprite(linedown, 0, 224, 48)
drawSprite(lineside, 32, 144, 32)
drawSprite(lineside, 33, 160, 32)
drawSprite(lineside, 34, 144, 64)
drawSprite(lineside, 35, 160, 64)

//Level Box

//Score Box

while(score < ... && status != game_over){
// BAckend Game logic!
}

if(status= game_over){
gamestate = home_screen,
}
else{
game_state = level2;
}

Void level_2(){
//Draw Board using assembler --> imagine using sprites that are blocks for the game board
// Display LEVEL 2

while(status!= game_over){
// BAckend Game logic!
//Display score
}

}

