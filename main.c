/*
 * LibShiftOut.c
 *
 * Created: 14/10/2018 16:18:24
 * Author : elton
 */ 

#include <avr/io.h>
#include "shiftout.h"
int main(void)
{

	shiftOut_setup();

	while(1) {
		shiftOut_write(0x81);	
	}
			
}

