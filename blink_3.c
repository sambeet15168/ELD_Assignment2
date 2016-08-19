#include <avr/io.h>
#include <util/delay.h>

int main (void)
{
	DDRB |= _BV(DDB5); //setting led pin as output
	
	while(1) //infinite loop
	{

		PORTB |= _BV(PORTB5);    // pin=high
		_delay_ms(1000);         //wait for 1 second

		PORTB &= ~_BV(PORTB5);   //pin=low
		_delay_ms(1000);         //wait for 1 second
	}
}


