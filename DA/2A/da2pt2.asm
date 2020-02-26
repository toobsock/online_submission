/*
 * DA2PT2.asm
 *
 *  Created: 2/25/2020 7:51:39 PM
 *   Author: lbc
 */ 

 .include <m328pbdef.inc>
	;LDI R16, 0x00
	;;IN DDRC, R16
	;LDI R16, 1<<3
	;IN PORTC, R16

	SBI PORTC, 3

 DUTY_CYCLE:

	;IF BUTTON PORTC3 PRESSED
	;JUMP TO IF_BUTTON LABEL ELSE CONTINUE
	SBIS PINc, 3;Skip if Bit PB2 is HIGH
	;DIRECTION PORTB3 OUTPUT
	SBI  DDRB,3
	;SETTING PORTB3 BIT "LED ON"
	SBI PORTB, 3
	;CAL; DELAY_412MS
	CALL DELAY_412ms
	;CLEARING PORTB3 BIT "LED OFF"
	CBI PORTB, 3
	;CALL DELAY_337MS 
	CALL DELAY_337ms
	RJMP DUTY_CYCLE

	BUTTON:
	;CLEARI PORTB3 OUTPUT
	CBI PORTB, 3
	;CLEAR PORTB3 BIT "LED OFF"
	CBI PORTB, 3
	;PORTB2 OUTPUT "LED ON"
	SBI PORTB, 2
	;CALL DELAY OF 2s
	CALL DELAY_2s
	;CLEAR PORTB2 OUTPUT
	CBI PORTB, 2
	;CLEAR PORTB2 BIT "LED OFF"
	CBI PORTB, 2
	;ret
	SBI PORTC, 3
	SBIS PINc, 3
	RJMP DUTY_CYCLE

 

	delay_337ms: ;DELAY OF 0.3375s 5.4 million cycles
    ldi  r18, 28
    ldi  r19, 101
    ldi  r20, 233
L2: dec  r20
    brne L2
    dec  r19
    brne L2
    dec  r18
    brne L2
    nop
	ret  

	delay_412ms: ;DELAY OF 0.4125s 6.6 million cycles
	ldi  r18, 34
    ldi  r19, 124
    ldi  r20, 86
L1: dec  r20
    brne L1
    dec  r19
    brne L1
    dec  r18
    brne L1
	ret              

	delay_2s: ;DELAY OF 2s
    ldi  r18, 163
    ldi  r19, 87
    ldi  r20, 3
L3: dec  r20
    brne L3
    dec  r19
    brne L3
    dec  r18
    brne L3
    nop
	ret 