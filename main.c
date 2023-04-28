// -----------------------------------------------------------------------------
// C-Skeleton to be used with HAM Library from www.ngine.de
// -----------------------------------------------------------------------------

#include "gba.h"
#include "gamestate.h"



#define u32 unsigned int
#define RGB(r, g, b) (r | (g << 5) | (b << 10))

extern void assembly();


int count = 0;
int points_gained = 1;
int score;
gamestate=2;


void Handler(void)
{    
	REG_IME = 0x00; // Stop all other interrupt handling, while we handle this current one  

   if (((REG_IF & INT_TIMER0) == INT_TIMER0)&& gamestate ==1 )
    {
	if(points_gained ){
			score++; //increase score if point has been gained
	}

	//Set up counter
	int temp = score;
	int digit = 0;
	while(temp > 0){
		drawSprite(temp%10, digit +21, 208 -10*digit, 112);
		temp /= 10;
		digit++;
	}
}

if (((REG_IF & INT_TIMER1) == INT_TIMER1) && gamestate ==2)
    {
		if(points_gained){
			score++;
			}

	int temp = score;
	int digit = 0;
	while(temp > 0){
		drawSprite(temp%10, digit +21, 208 -10*digit, 112);
		temp /= 10;
		digit++;
	}
   }
    
    if ((REG_IF & INT_BUTTON) == INT_BUTTON) {
       checkbutton(); // call function to handle button interrupt
    } 
    
    REG_IF = REG_IF; // Update interrupt table, to confirm we have handled this interrupt
    REG_IME = 0x01;  // Re-enable interrupt handling
}

// -----------------------------------------------------------------------------
// Project Entry Point
// -----------------------------------------------------------------------------
int main(void) {   
    int i;

    // Set Mode 2
    *(unsigned short *) 0x4000000 = 0x40 | 0x2 | 0x1000;
	

fillPalette();
fillSprites();

    // Set Handler Function for interrupts and enable selected interrupts
    REG_INT = (int)&Handler;
    REG_IE = INT_TIMER0 | INT_TIMER1; // Enable both timer interrupts

	
	 assembly(); //call assembly function to set up Timer 1

	// Timer Level 2 (every 0.67 seconds)
	 REG_TM1D = 54551;
	 REG_TM1CNT = TIMER_ENABLE | TIMER_INTERRUPTS | TIMER_FREQUENCY_1024;
    REG_IME = 0x1;		// Enable interrupt handling

	//switch statement to toggle between gamestates
       switch(gamestate) {
            case  0:
                	main_screen();
						break;
               
				case  1:
						level_1();
						break;
				case  2:
						level_2();
						break;
				}

	return 0;
}
