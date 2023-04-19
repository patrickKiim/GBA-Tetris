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
drawSprite(22, 14, 176, second),
drawSprite(20, 15, 192, second);
//draw “TETRIS” “PRESS A TO START”
//How do I know if this button is pressed? --> check button function --> change g ==1?
} 

}

Void level_1(){

//draw lines on the right and left using for loop
i=0; //y position
j=0; // Sprite number left
k=10; // Sprite number right
for(i, i<160, i+=16){
drawSprite(22,j, 0, i);
drawSprite(22,k, 96, i);
j++;
k++;
}

//Level1

drawSprite(1,20, 208, 16);


//Next sprite
//Current sprite

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

//draw lines on the right and left using for loop
i=0; //y position
j=0; // Sprite number left
k=10; // Sprite number right
for(i, i<160, i+=16){
drawSprite(22,j, 0, i);
drawSprite(22,k, 96, i);
j++;
k++;


}
//level 2

drawSprite(2,20, 208, 16);



while(status!= game_over){
// BAckend Game logic!

}

}

