#include "drawsprites.h"
#include <gba.h>

void drawTetromino(int tetromino, int N, int x, int y) {
    int tile_offset = tetromino * 8 * 8; // Each tile has 8x8 pixels, so we need an offset

    for (int i = 0; i < 4; i++) { // 4 tiles for the I_TETROMINO
        int tile_x = x + (i % 2) * 8; // Calculate the x position of the current tile
        int tile_y = y + (i / 2) * 8; // Calculate the y position of the current tile
        drawSprite(N + i, tile_offset / 2 + i, tile_x, tile_y); // Call drawSprite() to draw the tile
    }
}

