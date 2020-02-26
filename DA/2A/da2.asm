/*
 * DA2.asm
 *
 *  Created: 2/24/2020 8:59:00 PM
 *   Author: lbc
 */ 

.include <m328pbdef.inc>

DUTY_CYCLE:

	SBI DDRB, 3			;DIRECTION PORTB3 OUTPUT
	SBI PORTB, 3		;SET PORTB3 BIT "LED ON"
	CALL DELAY_412ms	;CALL DELAY 412ms
	CBI PORTB, 3		;CLEAR PORTB3 BIT "LED OFF"
	CALL DELAY_337ms	;CALL DELAY 337ms
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
	ldi  r21, 34
    ldi  r22, 124
    ldi  r23, 86
L1: dec  r23
    brne L1
    dec  r22
    brne L1
    dec  r21
    brne L1
	ret              

	           