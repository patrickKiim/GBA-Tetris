#include "sprites.h"
#define INPUT                      (KEY_MASK & (~REG_KEYS))


void checkbutton(void)
{
	
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

void drawITetromino2(int x, int y)
{
    // Draw the I_TETROMINO sprite (4 tiles) as a 2x2 block at position (x,y)
    drawSprite(0, 0, x, y);
    drawSprite(0 + 1, 1, x + 8, y);
    drawSprite(0 + 2, 2, x, y + 8);
    drawSprite(0 + 3, 3, x + 8, y + 8);
}

