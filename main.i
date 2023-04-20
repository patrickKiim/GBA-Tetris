# 1 "main.c"
# 1 "<built-in>"
# 1 "<command line>"
# 1 "main.c"



# 1 "numbers.h" 1
# 14 "numbers.h"
unsigned short numbers[] = {

    0,0,1,1,1,1,0,0,
    0,1,1,0,0,0,1,0,
    0,1,1,0,0,1,1,0,
    0,1,1,0,1,0,1,0,
    0,1,1,1,0,0,1,0,
    0,1,1,0,0,0,1,0,
    0,1,1,0,0,0,1,0,
    0,0,1,1,1,1,0,0,

    0,0,0,0,1,0,0,0,
    0,0,1,1,1,0,0,0,
    0,0,0,1,1,0,0,0,
    0,0,0,1,1,0,0,0,
    0,0,0,1,1,0,0,0,
    0,0,0,1,1,0,0,0,
    0,0,0,1,1,0,0,0,
    0,0,1,1,1,1,0,0,

    0,0,1,1,1,1,0,0,
    0,1,1,1,1,1,1,0,
    0,1,0,0,0,0,1,0,
    0,0,0,0,0,1,1,0,
    0,0,0,0,1,1,0,0,
    0,0,0,1,1,0,0,0,
    0,0,1,1,0,0,0,0,
    0,1,1,1,1,1,1,0,

    0,0,1,1,1,1,0,0,
    0,1,1,1,1,1,1,0,
    0,1,0,0,0,0,1,0,
    0,0,0,0,0,0,1,0,
    0,0,0,1,1,1,0,0,
    0,0,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,0,1,1,1,1,0,0,

    0,0,0,0,1,1,0,0,
    0,0,0,1,1,1,0,0,
    0,0,1,1,0,1,0,0,
    0,1,1,0,0,1,0,0,
    0,1,1,1,1,1,0,0,
    0,0,0,0,1,1,0,0,
    0,0,0,0,1,1,0,0,
    0,0,0,0,1,1,0,0,

    0,1,1,1,1,1,1,0,
    0,1,1,1,1,1,1,0,
    0,1,1,0,0,0,0,0,
    0,1,1,0,0,0,0,0,
    0,0,1,1,1,1,0,0,
    0,0,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,0,1,1,1,1,0,0,

    0,0,0,1,1,1,1,0,
    0,0,1,1,1,1,1,0,
    0,1,1,0,0,0,0,0,
    0,1,1,0,0,0,0,0,
    0,1,1,1,1,1,0,0,
    0,1,1,0,0,0,1,0,
    0,1,1,0,0,0,1,0,
    0,0,1,1,1,1,0,0,

    0,1,1,1,1,1,1,0,
    0,1,1,1,1,1,1,0,
    0,1,0,0,0,1,1,0,
    0,0,0,0,1,1,0,0,
    0,0,0,0,1,1,0,0,
    0,0,0,1,1,0,0,0,
    0,0,0,1,1,0,0,0,
    0,0,1,1,0,0,0,0,

    0,0,1,1,1,1,0,0,
    0,1,1,1,1,1,1,0,
    0,1,1,0,0,0,1,0,
    0,0,1,0,0,0,1,0,
    0,0,1,1,1,1,0,0,
    0,1,1,0,0,0,1,0,
    0,1,1,0,0,0,1,0,
    0,0,1,1,1,1,0,0,

    0,0,1,1,1,1,0,0,
    0,1,1,1,1,1,1,0,
    0,1,1,0,0,0,1,0,
    0,1,1,0,0,0,1,0,
    0,0,1,1,1,1,1,0,
    0,0,0,0,0,1,1,0,
    0,0,0,0,0,1,1,0,
    0,0,0,0,0,1,1,0,
};
# 5 "main.c" 2
# 1 "gba.h" 1







typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

typedef signed char s8;
typedef signed short s16;
typedef signed int s32;

typedef unsigned char byte;
typedef unsigned short hword;
typedef unsigned int word;
# 211 "gba.h"
enum
{
    VBLANK_HANDLER,
    HBLANK_HANDLER,
    VCOUNT_HANDLER,
    TIMER0_HANDLER,
    TIMER1_HANDLER,
    TIMER2_HANDLER,
    TIMER3_HANDLER,
    SERIAL_COM_HANDLER,
    DMA0_HANDLER,
    DMA1_HANDLER,
    DMA2_HANDLER,
    DMA3_HANDLER,
    KEYS_HANDLER,
    CART_HANDLER,
    MAX_INTERRUPT_HANDLERS,
};
# 267 "gba.h"
typedef void (*fp)(void);
# 6 "main.c" 2

# 1 "genna_h.h" 1

# 1 "tetomino_v2.h" 1


u16 sprites_t[] = {



    0, 0, 0, 0, 0, 0, 1, 1,
    0, 0, 0, 0, 0, 0, 1, 1,
    0, 0, 0, 0, 0, 0, 1, 1,
    0, 0, 0, 0, 0, 0, 1, 1,
    0, 0, 0, 0, 0, 0, 1, 1,
    0, 0, 0, 0, 0, 0, 1, 1,
    0, 0, 0, 0, 0, 0, 1, 1,
    0, 0, 0, 0, 0, 0, 1, 1,

    0, 0, 0, 0, 0, 0, 1, 1,
    0, 0, 0, 0, 0, 0, 1, 1,
    0, 0, 0, 0, 0, 0, 1, 1,
    0, 0, 0, 0, 0, 0, 1, 1,
    0, 0, 0, 0, 0, 0, 1, 1,
    0, 0, 0, 0, 0, 0, 1, 1,
    0, 0, 0, 0, 0, 0, 1, 1,
    0, 0, 0, 0, 0, 0, 1, 1,

    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,

    0, 0, 0, 0, 0, 0, 1, 1,
    0, 0, 0, 0, 0, 0, 1, 1,
    0, 0, 0, 0, 0, 0, 1, 1,
    0, 0, 0, 0, 0, 0, 1, 1,
    0, 0, 0, 0, 0, 0, 1, 1,
    0, 0, 0, 0, 0, 0, 1, 1,
    0, 0, 0, 0, 0, 0, 1, 1,
    0, 0, 0, 0, 0, 0, 1, 1,

};
# 3 "genna_h.h" 2




void drawSprite_teto(int numb, int N, int x, int y) {

    *(unsigned short *)(0x7000000 + 8*N) = y | 0x2000;
    *(unsigned short *)(0x7000002 + 8*N) = x;
    *(unsigned short *)(0x7000004 + 8*N) = numb*2;
}
void drawTetromino(int numb, int N, int x, int y) {
    int i, j, tile;
    u16 *tetromino_ptr = ((void *)0);

    switch (numb) {
        case 0:
            tetromino_ptr = &sprites_t[0 * 8 * 8];
            break;
# 40 "genna_h.h"
        default:
            break;
    }

   if (tetromino_ptr == ((void *)0)) {
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

                    drawSprite_teto(sprite_numb, sprite_idx, sprite_x, sprite_y);
                }
            }
        }
    }
}
# 8 "main.c" 2

# 1 "gamestate.h" 1
# 1 "drawsprites.h" 1
void drawSprite(int numb, int N, int x, int y)
{

    *(unsigned short *)(0x7000000 + 8*N) = y | 0x2000;
    *(unsigned short *)(0x7000002 + 8*N) = x;
    *(unsigned short *)(0x7000004 + 8*N) = numb*2;
}
# 2 "gamestate.h" 2



int score = 0;
int game_over = 0;
int gamestate = 0;

void main_screen() {
    int first = 80;
    int second = 96;


    drawSprite(10, 0, 72, first);
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
    drawSprite(22, 14, 176, second);
    drawSprite(20, 15, 192, second);


}

void level_1(){

    int i = 0;
    int j = 0;
    int k = 10;


    for(i = 0; i < 160; i += 16) {
        drawSprite(22, j, 0, i);
        drawSprite(22, k, 96, i);
        j++;
        k++;
    }


    drawSprite(1, 20, 208, 16);




    while(score < 100 && !game_over){

    }

    if(game_over) {
        gamestate = 0;
    } else {
        gamestate = 2;
    }
}

void level_2(){

    int i = 0;
    int j = 0;
    int k = 10;


    for(i = 0; i < 160; i += 16) {
        drawSprite(22, j, 0, i);
        drawSprite(22, k, 96, i);
        j++;
        k++;
    }

    while(!game_over) {


        gamestate = 0;
    }
}
# 10 "main.c" 2

int count = 0;
int points_gained;

void checkbutton(void) {

}

void assembly(void) {

}


void Handler(void) {
    *(u16*)0x4000208 = 0x00;

    if (((*(volatile u16*)0x4000202 & 0x8) == 0x8) || ((*(volatile u16*)0x4000202 & 0x10) == 0x10)) {

        if (points_gained) {
            score++;
        }

        int temp = score;
        int digit = 0;
        while (temp > 0) {
            drawSprite(temp % 10, digit, 208 - 10 * digit, 112);
            temp /= 10;
            digit++;
        }

        drawTetromino(0, 0, 50, 50);
    }

    if ((*(volatile u16*)0x4000202 & 0x1000) == 0x1000) {
        checkbutton();
    }

    *(volatile u16*)0x4000202 = *(volatile u16*)0x4000202;
    *(u16*)0x4000208 = 0x01;
}

int main(void) {
    int i;
    int g = 0;
    points_gained = 0;

    *(unsigned short *)0x4000000 = 0x40 | 0x2 | 0x1000;


    *(unsigned short *)0x5000200 = 0;
    *(unsigned short *)0x5000202 = ((31) + (31<<5) + (31<<10));


    for (i = 0; i < 10 * 8 * 8 / 2; i++) {
        ((unsigned short *) 0x6010000)[i] = (numbers[i * 2 + 1] << 8) + numbers[i * 2];
    }
    for (i = 0; i < 128; i++) {
        drawSprite(0, i, 240, 160);
    }


    (*(unsigned int*)0x3007FFC) = (int)&Handler;
    *(u16*)0x4000200 = 0x8 | 0x10;
    *(u16*)0x4000208 = 0x1;

    assembly();


    *(u16*)0x4000104 = 54551;
    *(u16*)0x4000106 = 0x0080 | 0x0040 | 0x0003;

    while (1) {
        switch (g) {
            case 0:
                main_screen();
                g = 1;
                break;

            case 1:
                level_1();
                g = game_over ? 0 : 2;
                break;

            case 2:
                level_2();
                g = game_over ? 0 : 2;
                break;
        }
    }

    return 0;
}
