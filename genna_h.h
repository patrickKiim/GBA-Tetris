#include "gba.h"
//#include "sprites.h"

#define NULL ((void *)0)

void drawSprite_teto(int numb, int N, int x, int y) {
    // Display sprite number numb on screen at position (x,y), as sprite object N
    *(unsigned short *)(0x7000000 + 8*N) = y | 0x2000;
    *(unsigned short *)(0x7000002 + 8*N) = x;
    *(unsigned short *)(0x7000004 + 8*N) = numb*2;
}

void drawTetromino(int numb, int N, int x, int y) {
    int i, j, tile;
    u16 *tetromino_ptr = NULL;

    switch (numb) {
        case 0:
            tetromino_ptr = &spriteData[0 * 8 * 8];
            break;
        /*
        case O_TETROMINO:
            tetromino_ptr = &spriteData[O_TETROMINO * 8 * 8];
            break;
        case T_TETROMINO:
            tetromino_ptr = &spriteData[T_TETROMINO * 8 * 8];
            break;
        case S_TETROMINO:
            tetromino_ptr = &spriteData[S_TETROMINO * 8 * 8];
            break;
        case Z_TETROMINO:
            tetromino_ptr = &spriteData[Z_TETROMINO * 8 * 8];
            break;
        case J_TETROMINO:
            tetromino_ptr = &spriteData[J_TETROMINO * 8 * 8];
            break;
        case L_TETROMINO:
            tetromino_ptr = &spriteData[L_TETROMINO * 8 * 8];
            break;
        */
        default:
            break;
    }

    if (tetromino_ptr == NULL) {
        return;
    }

    for (tile = 0; tile < 4; tile++) {
        int tile_x_offset = (tile % 2) * 8;
        int tile_y_offset = (tile / 2) * 8;

        for (i = 0; i < 8; i++) {
            for (j = 0; j < 8; j++) {
                u16 color = tetromino_ptr[tile * 8 * 8 + i * 8 + j];
                if (color != 0) {
                    int sprite_idx = N * 16 + tile * 8 + i * 2 + j;
                    int sprite_x = x + tile_x_offset + j;
                    int sprite_y = y + tile_y_offset + i;
                    int sprite_numb = (color - 1) / 2;

                    //drawSprite_teto(sprite_numb, sprite_idx, sprite_x, sprite_y);
                }
            }
        }
    }
}

