#include <stdio.h>
#include "system.h"
#include <alt_types.h>
#include <io.h> /* Leiutura e escrita no Avalon */
#include "altera_avalon_pio_regs.h"
#include <unistd.h>

volatile int edge_capture;

// LED Peripheral
#define REG_DATA_OFFSET 1

#define PERIPHERAL_PS2_0_BASE 0x81000

int ps2_init(unsigned int BASE);
int ps2_halt(unsigned int BASE);
int ps2_read_clickleft(unsigned int BASE);


int main(void){

	unsigned int  * p_led = (unsigned int *)PERIPHERAL_LED_0_BASE;
	volatile unsigned int *p_ps2 = (unsigned int *) PERIPHERAL_PS2_0_BASE;

	printf(" dawdwadaw \n");

	if(ps2_init(PERIPHERAL_PS2_0_BASE)){
		printf("ERRO periferico nao encontrado \n");
		while(1){};
	}
	*(p_ps2+0) = 0;
	  while(1){
		  int left = ps2_read_clickleft(PERIPHERAL_PS2_0_BASE);
//		  *p_led = 0xA5A5A5A; //(left >> 15);
		  printf("%x \n", left);
		 // usleep(5000);
	  };

  return 0;
}

int ps2_init(unsigned int BASE)
{
	volatile unsigned int *p_ps2 = (unsigned int *) BASE;
	if(*(p_ps2+2) != 0x5A5AFFFF)
		return 1;
	*p_ps2 = 1 << 1;
	return 0;
}

int ps2_halt(unsigned int BASE)
{
	volatile unsigned int *p_ps2 = (unsigned int *) BASE;
	if(*(p_ps2+2) != 0x5A5AFFFF)
		return 1;
	*p_ps2 = 0;
	return 0;
}

int ps2_read_clickleft(unsigned int BASE)
{
	volatile unsigned int *p_ps2 = (unsigned int *) BASE;
	return *(p_ps2 + 1);
}
