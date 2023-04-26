#include "sprites.h"
#define INPUT                      (KEY_MASK & (~REG_KEYS))

//function prototype declarations
void moveL();
void moveR();
void moveD();
void hardDrop();
void rotateCW();
void rotateCCW();
void swapBlk();

//button to function mapping
void buttonS(){
    //do something
}

void buttonSel(){
    //do something
}


void buttonA(){
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
    }
    if ((buttons & KEY_B) == KEY_B)
    {
        buttonB();
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
    }
    if ((buttons & KEY_LEFT) == KEY_LEFT)
    {
        buttonL();
    }
    if ((buttons & KEY_UP) == KEY_UP)
    {
        buttonU();
    }
    if ((buttons & KEY_DOWN) == KEY_DOWN)
    {
        buttonD();
    }

    //L and R triggers
    if ((buttons & KEY_L) == KEY_L)
    {
        buttonLT();
    }
    if ((buttons & KEY_R) == KEY_R)
    {
        buttonRT();
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

void drawTetromino(int tetromino, int x, int y)
{
    // Draw the specified Tetromino sprite (4 tiles) as a 2x2 block at position (x,y)
    drawSprite(tetromino, 0, x, y);
    drawSprite(tetromino + 1, 1, x + 8, y);
    drawSprite(tetromino + 2, 2, x, y + 8);
    drawSprite(tetromino + 3, 3, x + 8, y + 8);
}

/*
void drawLaser(void)
void drawITetromino2(int x, int y)
{
    // Draw the I_TETROMINO sprite (4 tiles) as a 2x2 block at position (x,y)
    drawSprite(0, 0, x, y);
    drawSprite(0 + 1, 1, x + 8, y);
    drawSprite(0 + 2, 2, x, y + 8);
    drawSprite(0 + 3, 3, x + 8, y + 8);
}

*/