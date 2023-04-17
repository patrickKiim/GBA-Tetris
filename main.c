// -----------------------------------------------------------------------------
// C-Skeleton to be used with HAM Library from www.ngine.de
// -----------------------------------------------------------------------------
#include "numbers.h"
#include "gba.h"
#include "sprites.h"
#include "gamestate.h"
#include "drawsprites.h"

#define TIMER_ENABLE_N 0xC7 //1100 0111 (enable bit 7,6,2 for H), bit 0,1 for f.1024
#define TIMER_MAX  66535
#define TIMER_FREQ 16387
#define DIGIT_X 120
#define DIGIT_Y 100


int count = 0;




void Handler(void)
{    
	REG_IME = 0x00; // Stop all other interrupt handling, while we handle this current one  

    if ((REG_IF & INT_TIMER0) == INT_TIMER0) // TODO: replace XXX with the specific interrupt you are handling
    {
        // TODO: Handle timer interrupt here
			count++;
			int temp = count;
			int digit = 0;
			while(temp > 0){
				drawSprite(temp%10, digit, DIGIT_X -10*digit, DIGIT_Y);
				temp /= 10;
				digit++;
			}
			//drawSprite(count/10, 1, 110, 100);
			//drawSprite(count%10, 0, 120, 100);
    }
	if ((REG_IF & INT_BUTTON) == INT_BUTTON) //see how to programme that I mean the exact buttom
	{ checkbutton();
} 
    
    REG_IF = REG_IF; // Update interrupt table, to confirm we have handled this interrupt
    
    REG_IME = 0x01;  // Re-enable interrupt handling
}


// -----------------------------------------------------------------------------
// Project Entry Point
// -----------------------------------------------------------------------------
int main(void)
{
	int i;
	
    // Set Mode 2
    *(unsigned short *) 0x4000000 = 0x40 | 0x2 | 0x1000;

    // Fill SpritePal
    *(unsigned short *) 0x5000200 = 0;
    *(unsigned short *) 0x5000202 = RGB(31,31,31);

    // Fill SpriteData
    for (i = 0; i < 10*8*8/2; i++)
        spriteData[i] = (numbers[i*2+1] << 8) + numbers[i*2];
    for (i = 0; i < 128; i++)
        drawSprite(0, i, 240, 160);

    // Set Handler Function for interrupts and enable selected interrupts
    REG_INT = (int)&Handler;
    REG_IE =  INT_TIMER0 && INT_TIMER1; //TODO: complete this line to choose which timer interrupts to enable
    REG_IME = 0x1;		// Enable interrupt handling

    // Set Timer Mode (fill that section and replace TMX with selected timer number)

	//Timer Level 1 (every second)
   
	// REG_TM0D =	50142;		// TODO: complete this line to set timer initial value
	LDR r0, 0x4000100 //load into r0 to REG_TM0D address *(u16*)0x4000100
	MOV r1, #50142
   STRH r1, [r0]

	// REG_TM0CNT = (TIMER_ENABLE | TIMER_INTERRUPTS | TIMER_FREQUENCY_1024);		// TODO: complete this line to set timer frequency and enable timer

	LDR r2, 0x4000102 //REG_TM0CNT
	LDR r3, 0x0080//TIMER_ENABLE
	LDR r4  0x0040// TIMER_INTERRUPTS
	LDR r5, 0x0003// TIMER_FREQUENCY_1024

	ORR r6, r2, r3
	ORR r6, r6, r4
	ORR r6, r6, r2
	STR r6, [r2]

	
	//Timer Level 2 (every 0.67 seconds)
	REG_TM1D= 54551;//Find exact address --> cant use MOV because its 32 bits
	REG_TM1CNT = (TIMER_ENABLE | TIMER_INTERRUPTS | TIMER_FREQUENCY_1024);

gamestate g;
g = home_screen;

while(1){
	switch(g){
	case 'home_screen':
			home_screen();
	case 'level_1':
			level1();
	case 'level_2':
			level2();
}
	
    while(1);

	return 0;
}

