assembly:
    // Set Timer Mode (fill that section and replace TMX with selected timer number)

    // Timer Level 1 (every second)
    // REG_TM0D = 50142; // Set timer initial value

    LDR r0, =0x4000100 // Load address of REG_TM0D into r0
    LDR r1, =50142
    STRH r1, [r0]

    // REG_TM0CNT = TIMER_ENABLE | TIMER_INTERRUPTS | TIMER_FREQUENCY_1024; // Set timer frequency and enable timer

    LDR r2, =0x4000102 // Load address of REG_TM0CNT into r2
    LDR r3, =0x0080    // Load TIMER_ENABLE into r3
    LDR r4, =0x0040    // Load TIMER_INTERRUPTS into r4
    LDR r5, =0x0003    // Load TIMER_FREQUENCY_1024 into r5

    ORR r6, r3, r4     // OR TIMER_ENABLE and TIMER_INTERRUPTS into r6
    ORR r6, r6, r5     // OR result with TIMER_FREQUENCY_1024
    STR r6, [r2]       // Store result in REG_TM0CNT
