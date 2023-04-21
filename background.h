#include "gba.h"
#include <stdlib.h>

u16 tile_block[200][8]; // 200 tiles, each tile is 8x8 pixels

#define VRAM ((u16*)0x6000000)

void initVram(){
    // Initialize the GBA hardware registers
    *(unsigned short*)0x4000000 = 0x0403;
    *(unsigned short*)0x4000004 = 0x0403;

}

// Create an array of block colors
u16 blkColors[] = {
    RGB(0, 0, 0),  // Empty space (black)
    RGB(0,31,31), // light blue (I block)
    RGB(31,0,31), // pure purple (T Blk)
    RGB(31,0,0), // pure red (z blk)
    RGB(16,31,16), // light green (s blk)
    RGB(31,20,0), //Orange (L blk)
    RGB(0,0,31), // pure blue (J blk)
    RGB(31,31,0), // pure yellow (O blk)
};

// Draw a single 8x8 pixel block at (x, y) with the given color
void drawBlk(int x, int y, u16 color) {
    u16* screen = (u16*)VRAM;
    int screenOffset = y * SCREEN_WIDTH + x;
    int blockOffset = 0;
    int i = 0; 
    int j = 0;
    for (i = 0; i < 8; i++) {
        for (j = 0; j < 8; j++) {
            screen[screenOffset + j] = color;
            blockOffset++;
        }
        screenOffset += SCREEN_WIDTH;
    }
}

//draw black rectangle across entire screen
void formatInitalBG(){
    int row = 0;
    int col = 0;
    for (row = 0; row < 20; row++) {
        for (col = 0; col < 40; col++) {
            drawBlk(col*8, row*8, blkColors[0]);
        }
    }

}

// Draw the entire playing field using the blkColors array
void drawPlayingField(int playingField[24][10]) {
    int row = 0;
    int col = 0;
    for (row = 4; row < 24; row++) { //start from 4 to exclude bufferzone outside of screen
        for (col = 0; col < 10; col++) {
            int x = col * 8;
            int y = (row-4) * 8;
            int blockType = playingField[row][col]; //read value of game field
            u16 blockColor = blkColors[blockType]; //assign color depending on block type
            drawBlk(x, y, blockColor);
        }
    }
}
