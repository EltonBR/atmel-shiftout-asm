# atmel-shiftout-asm
simple lib to use shiftout 74hc595 on atmel microcontrolers writen in assembly to use in C

open libshiftout.s to configure used ports and pins
```
#define SOPORT PORTB //port used by lib
#define SODDR DDRB //data direction register of port used by lib
#define SOCLOCK 0 //clock bit
#define SODATA 1 //data bit
#define SOSTROBE 2 //strobe bit
```
Simulation Speed test

![speed test of lib](https://github.com/EltonBR/atmel-shiftout-asm/raw/master/libshiftASM.png)

62.47us in simulation to set 74hc595
