 void assembly(){
// Set Timer Mode (fill that section and replace TMX with selected timer number)

	// Timer Level 1 (every second)
  // REG_TM0D = 50142; // Set timer initial value

	LDR r0, 0x4000100 //load into r0 to REG_TM0D address *(u16*)0x4000100
	MOV r1, #50142
   STRH r1, [r0]

  //	REG_TM0CNT = TIMER_ENABLE | TIMER_INTERRUPTS | TIMER_FREQUENCY_1024; // Set timer frequency and enable timer

		LDR r2, 0x4000102 //REG_TM0CNT
	LDR r3, 0x0080//TIMER_ENABLE
	LDR r4  0x0040// TIMER_INTERRUPTS
	LDR r5, 0x0003// TIMER_FREQUENCY_1024

	ORR r6, r2, r3
	ORR r6, r6, r4
	ORR r6, r6, r2
	STR r6, [r2]

};
