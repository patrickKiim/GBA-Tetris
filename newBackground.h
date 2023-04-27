#include "gba.h"
#include <stdlib.h>
#include <string.h>

#define BG_32x32        0x0000
#define BG_COLOR_256    0x0000
#define BG_MAP_BASE(n) ((n) << 8)
#define BG_TILE_BASE(n) ((n) << 13)
#define BG_TILE_RAM     ((u16*)0x06000000)
#define BG_MAP_RAM      ((u16*)0x06008000)

#define SCREEN_WIDTH  240
#define SCREEN_HEIGHT 160

// Define the dimensions of a tile
#define TILE_SIZE 8

// Define the dimensions of the tile map
#define MAP_WIDTH (SCREEN_WIDTH / TILE_SIZE)
#define MAP_HEIGHT (SCREEN_HEIGHT / TILE_SIZE)

// Define the VRAM addresses for the tile data and map
#define TILE_DATA ((unsigned short*)0x06000000)
#define TILE_MAP ((unsigned short*)0x06000600)

#define BG_PALETTE     ((u16*)0x05000000)
#define VRAM           ((u16*)0x06000000)
#define REG_DISPCNT    *((volatile u16*)0x04000000)
#define REG_BG2CNT     *((volatile u16*)0x0400000c)
#define REG_BG2HOFS    *((volatile u16*)0x04000018)
#define REG_BG2VOFS    *((volatile u16*)0x0400001a)

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

    // Define the tile data for each 8x8 tile
const unsigned short tileData[] = {
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, // Black
    0x318C, 0x318C, 0x318C, 0x318C, 0x318C, 0x318C, 0x318C, 0x318C, // Light blue
    0x31B4, 0x31B4, 0x31B4, 0x31B4, 0x31B4, 0x31B4, 0x31B4, 0x31B4, // Pure purple
    0x31C0, 0x31C0, 0x31C0, 0x31C0, 0x31C0, 0x31C0, 0x31C0, 0x31C0, // Pure red
    0x18E7, 0x18E7, 0x18E7, 0x18E7, 0x18E7, 0x18E7, 0x18E7, 0x18E7, // Light green
    0x31EC, 0x31EC, 0x31EC, 0x31EC, 0x31EC, 0x31EC, 0x31EC, 0x31EC, // Orange
    0x003F, 0x003F, 0x003F, 0x003F, 0x003F, 0x003F, 0x003F, 0x003F, // Pure blue
    0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF  // Pure yellow
};

// Define the tile map for the 8 tiles
unsigned short tileMap[MAP_WIDTH*MAP_HEIGHT];

// Copy the tile data into VRAM
void loadTileData() {
    // memcpy((unsigned short*)0x06000000, tileData, sizeof(tileData));
    memcpy(BG_TILE_RAM, tileData, sizeof(tileData));
}

// Copy the tile map into VRAM
void loadTileMap() {
    // memcpy((unsigned short*)0x06010000, tileMap, sizeof(tileMap));
    memcpy(BG_MAP_RAM, tileMap, sizeof(tileMap));
}

// Set the palette to the blkColors array
void loadPalette() {
    memcpy((unsigned short*)0x05000000, blkColors, sizeof(blkColors));

}

// Initialize the tiles
void initTiles() {
    // Load the tile data and map
    loadTileData();
    loadTileMap();
    // Load the palette
    loadPalette();
}

void setTile(int x, int y, int tileIndex) {
  tileMap[y * 32 + x] = tileIndex;
  REG_BG0CNT |= (1 << 8);  // Enable mosaic
  //loadTileMap();
}

void testTiles(){
    int i = 0;
    int j = 0;
    for(i = 0; i < 20; i++) {
        for(j = 0; j < 30; j++) {
            tileMap[i*30+j] = 3;
        }
    }
    initVRAM();
}


void copyTiles(u16* dst, const u16* src, int size) {
    int i;
    for (i = 0; i < size; i++) {
        dst[i] = src[i];
    }
}

void initVRAM(void) {
    // Set up mode 2 with 1D mapping
    REG_DISPCNT = 0x0002 | OBJ_MAP_1D | BG2_ENABLE;
    REG_BG2CNT  = 0x1080;

    // Copy tile data to VRAM
    // const u16* tileDataSrc = &tileData[0]; 
    // u16* tileDataDst = (u16*)TILE_DATA;
    // copyTiles(tileDataDst, tileDataSrc, sizeof(&tileData[0]) / sizeof(&tileData[0]));

    // // Copy tile map to VRAM
    // const u16* tileMapSrc = &tileMap[0];
    // u16* tileMapDst = (u16*)TILE_MAP;
    // copyTiles(tileMapDst, tileMapSrc, sizeof(&tileMap[0]) / sizeof(&tileMap[0]));

    //or this
     // Load tile data into memory
    memcpy(BG_TILE_RAM, tileData, sizeof(tileData));
    
    // Load tile map data into memory
    memcpy(BG_MAP_RAM, tileMap, sizeof(tileMap));

    REG_BG2CNT = BG_MAP_BASE(0) | BG_TILE_BASE(1);
    // Set scroll registers
    REG_BG2HOFS = 0;
    REG_BG2VOFS = 0;
}



// void initVRAM(void) {
//     int i;

//     // Set up mode 2 with 1D mapping
//     REG_DISPCNT = 0x0002 | OBJ_MAP_1D | BG2_ENABLE;
//     REG_BG2CNT  = 0x1080;

//     // Set scroll registers
//     REG_BG2HOFS = 0;
//     REG_BG2VOFS = 0;
// }

void drawBlk(int x, int y, int colorIndex) {

    int tileOffset = y * 32 + x;
    u16 color = BG_PALETTE[colorIndex];
    
    // Set the tile colors in VRAM
    int row = 0;
    int col = 0;
    for (row = 0; row < 8; row++) {
        for (col = 0; col < 8; col++) {
            VRAM[tileOffset * 64 + row * 8 + col] = color;
        }
    }
}

//draw black rectangle across entire screen
void formatInitalBG(){
    int row = 0;
    int col = 0;
    for (row = 0; row < 20; row++) {
        for (col = 0; col < 40; col++) {
            drawBlk(col*8, row*8, 0);
        }
    }

}

void drawPlayingField(int field[24][10]) {
    memset(VRAM, 0, SCREEN_WIDTH*SCREEN_HEIGHT*2);
    int i, j;
    for (i = 4; i < 24; i++) {
        for (j = 0; j < 10; j++) {
            int x = j * TILE_SIZE;
            int y = (i - 4) * TILE_SIZE;
            int colorIndex = field[i][j];
            //drawBlk(x, y, colorIndex);
            setTile(j, (i-4), colorIndex);
        }
    }
    loadTileMap();
}
