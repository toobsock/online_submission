/*
 * 1b.asm
 *
 *  Created: 2/21/2020 7:55:52 PM
 *   Author: lbc
 */ 

  .include <m328pbdef.inc>

 .ORG 0

;Store 200 Numbers starting from STARTADDS=0x300 location
;Populate the value of the memory location by using
;high and low. Consecutive numbers

;loop counter
LDI R19,0xFF

;store value
;LDI R16, 0x26
LDI R16, LOW(0x26)
LDI R17, HIGH(0x00)

;store location starting 0x300
LDI YL, 0x00
LDI YH, 0x03

;loop to store consecutive numbers starting at 0x300
L1: 
ST	Y, R16 ;Store the number to Y
INC YL ;increment memory location value
INC R16 ;increase value to store
DEC R19 ;decrement counter

ST	Y,R16 ;Store the number to Y
INC YL ;increment memory location value
INC R16 ;increase value to store
DEC R19 ;decrement counter

ST	Y,R16 ;Store the number to Y
INC YL ;increment memory location value
INC R16 ;increase value to store
DEC R19 ;decrement counter

ST	Y,R16 ;Store the number to Y
INC YL ;increment memory location value
INC R16 ;increase low value to store
INC R17 ;increase high value to store
DEC R19 ;decrement counter
BRNE L1 ;finish when counter = 0