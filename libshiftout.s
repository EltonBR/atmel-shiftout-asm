#include<avr/io.h>

#define SOPORT PORTB
#define SODDR DDRB
#define SOCLOCK 0
#define SODATA 1
#define SOSTROBE 2

.global shiftOut_setup
.global shiftOut_write

shiftOut_setup:
sbi (SODDR-0x20), SOCLOCK ;set clock pin as output
sbi (SODDR-0x20), SODATA ;set data pin as output
sbi (SODDR-0x20), SOSTROBE ;set strobe pin as output
nop
cbi (SOPORT-0x20), SOCLOCK ;set pin as low
cbi (SOPORT-0x20), SODATA ;set pin as low
cbi (SOPORT-0x20), SOSTROBE ;set pin as low
ret

shiftOut_write:
mov r18, r24
ldi r19, 0
ldi r20, 8
continueSend:
cp r19,r20
breq  strobe
sbrc r18,7
rjmp sendHigh
rjmp sendLow
strobe:
sbi (SOPORT-0x20), SOSTROBE ; enable strobe pin
nop ; for sync
cbi (SOPORT-0x20), SOSTROBE ; disable strobe pin
ret

sendHigh:
sbi (SOPORT-0x20), SODATA ; enable data pin high
sbi (SOPORT-0x20), SOCLOCK ; enable clock pin
lsl r18 ; shift right bit
inc r19 ;increment
cbi (SOPORT-0x20), SOCLOCK ; disable clock pin
rjmp continueSend

sendLow:
cbi (SOPORT-0x20), SODATA ; disable data pin high
sbi (SOPORT-0x20), SOCLOCK ; enable clock pin
lsl r18 ;sift right bit
inc r19 ;increment
cbi (SOPORT-0x20), SOCLOCK ; disable clock pin
rjmp continueSend