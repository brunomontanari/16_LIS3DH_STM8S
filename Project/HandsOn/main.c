/* 
 *Arquivo main 
 */
//------------------------------------------------------------------------------

#include "stm8s.h"
#include "defines.h"
#include "lis3dh_driver.h"
//------------------------------------------------------------------------------
extern AxesRaw_t leitura;
extern AxesRaw_t leitura_inicial;
extern float Angulo;

//------------------------------------------------------------------------------


//------------------------------------------------------------------------------

void Delay_ms (u16 tempo)
{
	Count_ms = tempo;
	while(Count_ms);
}

//------------------------------------------------------------------------------

main()
{
	
	CLK->CKDIVR = 0x00; // Master clock at 16MHz
 /* Enable TIM4 CLK */	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
	
	/* Enable TIM4 */
	TIM4_TimeBaseInit(TIM4_PRESCALER_128, 124);
	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
  TIM4_Cmd(ENABLE);
	Buttons_Init();
	LIS3DH_Init();
	enableInterrupts();
    /* Infinite loop */
    while (1)
    {
		if(DataReady)
		{
			DataReady = 0;
			Angulo = GetAngle(leitura.AXIS_X,leitura.AXIS_Y,leitura.AXIS_Z,0,0,GRAVIDADE);
		}
    }
}

//------------------------------------------------------------------------------

