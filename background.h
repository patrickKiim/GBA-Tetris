#include "gba.h"
#include <stdlib.h>

u16 tile_block[200][8]; // 200 tiles, each tile is 8x8 pixels

#define VRAM ((u16*)0x6000000)

//#define MEM_BG_PALETTE    ((uint16*)(0x05000000))
//#define MEM_OBJ_PALETTE   ((uint16*)(0x05000200))

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

// Draw a single block at (x, y) with the given color

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
    for (row = 4; row < 24; row++) {
        for (col = 0; col < 10; col++) {
            int x = col * 8;
            int y = (row-4) * 8;
            int blockType = playingField[row][col];
            u16 blockColor = blkColors[blockType];
            drawBlk(x, y, blockColor);
        }
    }
}





/*
void init_tile_block() {
    int tile_index = 0;
    for(int y = 0; y < 20; y++) { // 20 rows
        for(int x = 0; x < 10; x++) { // 10 columns
            for(int i = 0; i < 8; i++) { // 8 pixels per row
                tile_block[tile_index][i] = 0; // set all pixels to 0
            }
            tile_index++; // increment tile index
        }
    }
}


void load_tileblock(u16* tileblock, u16* tileset, int tileset_size, int tile_block_size) {
    // Load tileset
    memcpy((u16*) TILE_BASE_ADR(0), tileset, tileset_size);
    
    // Load tile block
    memcpy((u16*) &tile_block[0], (u16*) TILE_BASE_ADR(0), tileset_size);
    memcpy((u16*) &tile_block[tileset_size/2], (u16*) TILE_BASE_ADR(1), tileset_size);
    
    // Set palette
    BG_PALETTE[0] = RGB(31, 31, 31);
    
    // Load tile block to screen
    REG_BG2CNT = BG_TILE_BASE(0) | BG_COLOR_256 | BG_SIZE_WIDE;
    REG_BG2HOFS = 0;
    REG_BG2VOFS = 0;
    
    // Set tile block offset
    int offset = 0;
    
    for(int y = 0; y < 20; y++) {
        for(int x = 0; x < 10; x++) {
            int tile_num = offset + (x * 2);
            int tile_attr = 0;
            int map_offset = y * 32 + x;
            BG_MAP[2 * map_offset] = tile_num | tile_attr;
            BG_MAP[2 * map_offset + 1] = tile_num | tile_attr | (1 << 10);
        }
        offset += 32;
    }
}

*/