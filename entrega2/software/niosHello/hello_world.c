#include <stdio.h>
#include "system.h"
#include <alt_types.h>
#include <io.h> /* Leiutura e escrita no Avalon */
#include "altera_avalon_pio_regs.h"
#include <unistd.h>

/* A variable to hold the value of the button pio edge capture register. */
volatile int edge_capture;
int n = 0;
int novo_valor = 0;

int main(void){

  unsigned int led = 0;

  printf("Embarcados++ \n");
  volatile unsigned int *p_led = (unsigned int *)(PIO_0_BASE);
  volatile unsigned int *p_sw = (unsigned int *)(PIO_1_BASE);

  /*
  while(1){

	  *(p_led + 1) = 0x02;

  }

  while(1){
      if (led <= 5){
          IOWR_32DIRECT(PIO_0_BASE, 0, 0x01 << led++);
          usleep(100000 >>  *p_sw);
      }
      else{
          led = 0;
      }
  };
 */
	init_1_pio();
	uint freq = 0;
	while(1){

		if(novo_valor){
			freq = *p_sw;
			novo_valor = 0;
		}


		if (led <= 5){
		          IOWR_32DIRECT(PIO_0_BASE, 0, 0x01 << led++);
		          usleep(100000 >>  freq);
		      }
		      else{
		          led = 0;
		      }

	}

  return 0;
}

void handle_sw_interrupts(void* context, alt_u32 id)
{
    /* Cast context to edge_capture's type. It is important that this be
     * declared volatile to avoid unwanted compiler optimization.
     */
    volatile int* edge_capture_ptr = (volatile int*) context;
    /* Store the value in the Button's edge capture register in *context. */
    *edge_capture_ptr = IORD_ALTERA_AVALON_PIO_EDGE_CAP(PIO_1_BASE);
    n++;
    /* Reset the Button's edge capture register. */
    IOWR_ALTERA_AVALON_PIO_EDGE_CAP(PIO_1_BASE, 0);

    novo_valor = 1;
}

void init_1_pio()
{
    /* Recast the edge_capture pointer to match the alt_irq_register() function
     * prototype. */
    void* edge_capture_ptr = (void*) &edge_capture;
    /* Enable first four interrupts. */
    IOWR_ALTERA_AVALON_PIO_IRQ_MASK(PIO_1_BASE, 0xF);
    /* Reset the edge capture register. */
    IOWR_ALTERA_AVALON_PIO_EDGE_CAP(PIO_1_BASE, 0x0);
    /* Register the interrupt handler. */
    alt_irq_register( PIO_1_IRQ, edge_capture_ptr,
                      handle_sw_interrupts );
}

