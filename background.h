#include "gba.h"
#include <stdlib.h>
#include <string.h>

//u16 tile_block[200][8]; // 200 tiles, each tile is 8x8 pixels

#define VRAM ((u16*)0x6000000)
// #define REG_DISPLAY_CONTROL (*(volatile unsigned short*)0x04000000)
// #define REG_DISPLAY_STATUS  (*(volatile unsigned short*)0x04000004)
// #define REG_BG2_CONTROL     (*(volatile unsigned short*)0x04000010)
// #define REG_BG2_SCROLL_X    (*(volatile unsigned short*)0x04000014)
// #define REG_BG2_SCROLL_Y    (*(volatile unsigned short*)0x04000016)

//new defs
#define REG_DISPLAY_CONTROL (*(volatile u16*)0x04000000)
#define REG_BG2_CONTROL     (*(volatile u16*)0x04000018)
#define REG_BG2_SCROLL_X    (*(volatile u16*)0x04000028)
#define REG_BG2_SCROLL_Y    (*(volatile u16*)0x0400002A)

#define REG_PALETTE ((u16*) 0x5000000)

#define NUM_BLOCKS 32

// volatile u16* bg2_map = (volatile u16*)0x6008000;
// REG_VRAM_ADDR = (u32)bg2_map;

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

void initVram(){

    // Set the display control register to enable BG2
    REG_DISPLAY_CONTROL = 0x0202;
    
    // Set the background control register for BG2 to mode 2 and enable mosaic effects
    REG_BG2_CONTROL = 0x0010;
    
    // Set the scroll positions to (0,0)
    REG_BG2_SCROLL_X = 0;
    REG_BG2_SCROLL_Y = 0;

    // Copy the color palette to the background palette memory
    int i = 0;
    //volatile unsigned short *palette = (unsigned short*)0x5000000;
    for (i = 0; i < 8; i++) {
        REG_PALETTE[i] = blkColors[i];
    }

}

// Draw a single 8x8 pixel block at (x, y) with the given color
void drawBlk(int x, int y, int colorIndex) {
    // u16* screen = (u16*)VRAM;
    // int screenOffset = y * SCREEN_WIDTH + x;
    // int blockOffset = 0;
    // int i = 0; 
    // int j = 0;
    // for (i = 0; i < 8; i++) {
    //     for (j = 0; j < 8; j++) {
    //         screen[screenOffset + j] = color;
    //         blockOffset++;
    //     }
    //     screenOffset += SCREEN_WIDTH;
    // 

    u16 color = (u16)colorIndex;

    // Determine the memory address of the tile block to draw on
    u16* screenBlock = VRAM + ((y >> 3) * 32) + (x >> 3);
    // Determine the tile offset to use within the block
    int tileOffset = ((y % 8) << 1) | (x % 8);
    // Set the tile data to the specified color index
    screenBlock[tileOffset] = colorIndex;
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
            //u16 blockColor = blkColors[blockType]; //assign color depending on block type
            drawBlk(x, y, blockType);
        }
    }
}
