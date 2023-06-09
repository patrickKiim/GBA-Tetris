#include "sprites.h"
#include "global.h"
#define INPUT                      (KEY_MASK & (~REG_KEYS))


void drawSprite(int numb, int N, int x, int y)
{
	// Same as CA2, make specific sprite (based on its name/numb) appear on screen, as slide number N (each sprite needs a different, arbitrary, N >= 0)
    *(unsigned short *)(0x7000000 + 8*N) = y | 0x2000;
    *(unsigned short *)(0x7000002 + 8*N) = x | 0x4000;
    *(unsigned short *)(0x7000004 + 8*N) = numb*8;
}

//function prototype declarations
void moveL();
void moveR();
void moveD();
void hardDrop();
void rotateCW();
void rotateCCW();
void swapBlk();
void exitStartScreen();

//button to function mapping
void buttonS(){
}

void buttonSel(){
    //do something
}


void buttonA(){
    if(gamestate==0)
        gamestate = 1;
    rotateCW();
}

void buttonB(){
    rotateCCW();
}

void buttonR(){
    moveR();
}

void buttonL(){
    moveL();
}

void buttonD(){
    moveD();
}

void buttonU(){
    hardDrop();
}

void buttonLT(){
    swapBlk();
}

void buttonRT(){
    swapBlk();
}

void checkbutton(void)
{
	// Gift function to show you how a function that can be called upon button interrupt to detect which button was pressed and run a specific function for each button could look like. You would have to define each buttonA/buttonB/... function yourself.
    u16 buttons = INPUT;
    
    if ((buttons & KEY_A) == KEY_A)
    {
        buttonA();
        //disable hold (loops until button release)
        while ((buttons & KEY_A) == KEY_A){
            buttons = INPUT;
        }
    }
    if ((buttons & KEY_B) == KEY_B)
    {
        buttonB();
        //disable hold (loops until button release)
        while ((buttons & KEY_B) == KEY_B){
            buttons = INPUT;
        }
    }
    if ((buttons & KEY_SELECT) == KEY_SELECT)
    {
        buttonSel();
    }
    if ((buttons & KEY_START) == KEY_START)
    {
        buttonS();
    }
    if ((buttons & KEY_RIGHT) == KEY_RIGHT)
    {
        buttonR();
        while ((buttons & KEY_RIGHT) == KEY_RIGHT){
            buttons = INPUT;
        }
    }
    if ((buttons & KEY_LEFT) == KEY_LEFT)
    {
        buttonL();
        while ((buttons & KEY_LEFT) == KEY_LEFT){
            buttons = INPUT;
        }
    }
    if ((buttons & KEY_UP) == KEY_UP)
    {
        buttonU();
        //disable hold (loops until button release)
        while ((buttons & KEY_UP) == KEY_UP){
            buttons = INPUT;
        }
    }
    if ((buttons & KEY_DOWN) == KEY_DOWN)
    {
        buttonD();
        //disable hold (loops until button release)
        while ((buttons & KEY_DOWN) == KEY_DOWN){
            buttons = INPUT;
        }
    }

    //L and R triggers
    if ((buttons & KEY_L) == KEY_L)
    {
        buttonLT();
        //disable hold (loops until button release)
        while ((buttons & KEY_L) == KEY_L){
            buttons = INPUT;
        }
    }
    if ((buttons & KEY_R) == KEY_R)
    {
        buttonRT();
        //disable hold (loops until button release)
        while ((buttons & KEY_R) == KEY_R){
            buttons = INPUT;
        }
    }
}


void fillPalette(void)
{
    int     i;

	// Fill the palette in GBA memory
    for (i = 0; i < NCOLS; i++)
        spritePal[i] = palette[i];
}


void fillSprites(void)
{
    int     i;

    // Load all sprites in GBA memory
    for (i = 0; i < sizeof(sprites) / 2; i++)
        spriteData[i] = (sprites[i*2+1] << 8) + sprites[i*2];

    // draw all sprites on screen, but all of them outside of the screen (starting at position (240,160) the bottom right corner of the GBA screen)
    for(i = 0; i < 128; i++)
        drawSprite(0, i, 240, 160);
}

// void drawTetromino(int tetromino, int x, int y)
// {
//     // Draw the specified Tetromino sprite (4 tiles) as a 2x2 block at position (x,y)
//     drawSprite(tetromino, 0, x, y);
//     //drawSprite(tetromino + 1, 1, x + 8, y);
//     //drawSprite(tetromino + 2, 2, x, y + 8);
//     //drawSprite(tetromino + 3, 3, x + 8, y + 8);
// }

