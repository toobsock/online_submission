/*
 * CFile1.c
 *
 * Created: 2/25/2020 7:01:21 PM
 *  Author: lbc
 */ 

#include <avr/io.h>       //This contains definitions for all the registers locations and some//   other things, must always be included
#define F_CPU 16000000UL  //F_CPU tells the compiler that our crystal is an 16Mhz one so it //   can generate an accurate delay, must be declared above delay so//    delay knows what is the value of F_CPU
#include <util/delay.h>   //Contains some delay functions that will generate accurate delays //    of msand us

int main(void){            //In ANSI C, the main function as always an int return and using  //   void will give you an warning

	DDRB |= (1 << 3); // MAKING PORTB3 OUTPUT
	PORTB = 0b00000000; // Turn LED off
	DDRC |= (1 << 3); // MAKING PORTC3 OUTPUT
	PORTC |= (1 << 3); // PULL UP RESISTOR ENABLE PINC3 Button
	
	while(1){            //This gives us an infinite loop
		//OUTPUT "LED ON"
		PORTB |= (1<<PB3);
		//DELAY FOR 412ms
		_delay_ms(412);
		//OUTPUT "LED OFF"
		PORTB &= ~(1<<PB3);
		//DELAY FOR 337ms
		_delay_ms(337);      //Wait 1 second
		if(!(PINC & (1<<3)))
		{
			//portb3 output "LED OFF"
			PORTB &= ~(1<<PB3);
			//portb2 output "LED ON"
			PORTB |= (1<<PB2);
			//Delay for 2s
			_delay_ms(2000);
			//PortB2 OutPut "OFF"
			PORTB &= ~(1<<PB2);
			//Portb2 output "led off"
			PORTB &= ~(1<<PB2);
			//portb3 output "on"
			PORTB &= (1<<PB3);
		}
	}
	return 1;
}
