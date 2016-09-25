#include "defines.h"
#include "lis3dh_driver.h"
#include <math.h>

#define READ_REG 1
#define Transf_graus 57.29578//180 graus dividido por pi

float Angulo;
extern AxesRaw_t leitura;
extern AxesRaw_t leitura_inicial;
extern u8 StatusRegVar;
extern u8 StatusAUXVar;

void LIS3DH_INT1_ISR(void)
{	
	//Configura o pino MISO
	GPIO_Init(SPI_MISO,GPIO_MODE_IN_FL_NO_IT);
	//Configura o pino MOSI
	GPIO_Init(SPI_MOSI,GPIO_MODE_OUT_PP_LOW_FAST);
	//Configura o pino SCK
	GPIO_Init(SPI_SCK,GPIO_MODE_OUT_PP_LOW_FAST);
	//Configura o pino de chip select
	GPIO_Init(CHIPSELECT,GPIO_MODE_OUT_PP_LOW_FAST);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, ENABLE);
	SPI_Cmd(ENABLE);
	LIS3DH_ResetInt1Latch();
	LIS3DH_GetStatusReg(&StatusRegVar);
	LIS3DH_GetStatusAUX(&StatusAUXVar);
	LIS3DH_GetAccAxesRaw(&leitura);
	DataReady = 1;
}

void LIS3DH_INT2_ISR(void)
{
	//Configura o pino MISO
	GPIO_Init(SPI_MISO,GPIO_MODE_IN_FL_NO_IT);
	//Configura o pino MOSI
	GPIO_Init(SPI_MOSI,GPIO_MODE_OUT_PP_LOW_FAST);
	//Configura o pino SCK
	GPIO_Init(SPI_SCK,GPIO_MODE_OUT_PP_LOW_FAST);
	//Configura o pino de chip select
	GPIO_Init(CHIPSELECT,GPIO_MODE_OUT_PP_LOW_FAST);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, ENABLE);
	SPI_Cmd(ENABLE);
	LIS3DH_ResetInt2Latch();
	LIS3DH_GetStatusReg(&StatusRegVar);
	LIS3DH_GetStatusAUX(&StatusAUXVar);
  LIS3DH_GetAccAxesRaw(&leitura);
}

void LIS3DH_Init(void)
{
	//Configura o pino MISO
	GPIO_Init(SPI_MISO,GPIO_MODE_IN_FL_NO_IT);
	//Configura o pino MOSI
	GPIO_Init(SPI_MOSI,GPIO_MODE_OUT_PP_LOW_FAST);
	//Configura o pino SCK
	GPIO_Init(SPI_SCK,GPIO_MODE_OUT_PP_LOW_FAST);
	//Configura o pino de chip select
	GPIO_Init(CHIPSELECT,GPIO_MODE_OUT_PP_LOW_FAST);
	//Configura o pino de interrupção proveniente do acelerometro
	GPIO_Init(INTERRUPT1,GPIO_MODE_IN_FL_IT);
	//Configura a sensibilidade de borda da interrupção do acelerometro
	EXTI_SetExtIntSensitivity(INTERRUPT1_SENSIBILIDADE);
	//Configura o pino de interrupção proveniente do acelerometro
	GPIO_Init(INTERRUPT2,GPIO_MODE_IN_FL_IT);
	//Configura a sensibilidade de borda da interrupção do acelerometro
	EXTI_SetExtIntSensitivity(INTERRUPT2_SENSIBILIDADE);	
	//Configura prioridade da interrupção proveniente do MEMS
	ITC_SetSoftwarePriority(ITC_IRQ_PORTC, ITC_PRIORITYLEVEL_1);
	ITC_SetSoftwarePriority(ITC_IRQ_PORTD, ITC_PRIORITYLEVEL_1);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, ENABLE);
	//Configura a SPI em modo Master, com as especificações do acelerometro
	SPI_Init(SPI_FIRSTBIT_MSB, SPI_BAUDRATEPRESCALER_16, SPI_MODE_MASTER, SPI_CLOCKPOLARITY_HIGH,SPI_CLOCKPHASE_2EDGE, SPI_DATADIRECTION_2LINES_FULLDUPLEX,SPI_NSS_SOFT,0x07);
	//Desabilita o CRC
	SPI->CR2 &= 0xDF;
	//Habilita SPI
	SPI_Cmd(ENABLE);	
	//Habilita as interrupções
	enableInterrupts();
	//Inicializa o acelerometro
	MEMS_Startup();

}


/**
*  Inicializa o acelerometro
**/
void MEMS_Startup (void)
{
	LIS3DH_GetWHO_AM_I(&WhoAmI);
	LIS3DH_WriteReg(LIS3DH_TEMP_CFG_REG, 0x00);	
	LIS3DH_WriteReg(LIS3DH_CTRL_REG1, 0x5F);
	LIS3DH_WriteReg(LIS3DH_CTRL_REG2, 0x00);
	LIS3DH_WriteReg(LIS3DH_CTRL_REG3, 0x50);
	LIS3DH_WriteReg(LIS3DH_CTRL_REG4, 0x80);
	LIS3DH_WriteReg(LIS3DH_CTRL_REG5, 0x00);
	LIS3DH_WriteReg(LIS3DH_CTRL_REG6, 0x00);	
	LIS3DH_WriteReg(LIS3DH_REFERENCE_REG, 0x00);	
	LIS3DH_WriteReg(LIS3DH_FIFO_CTRL_REG, 0x00);	
	LIS3DH_WriteReg(LIS3DH_INT1_CFG, 0x00);
	LIS3DH_WriteReg(LIS3DH_INT1_THS, 0x00);
	LIS3DH_WriteReg(LIS3DH_INT1_DURATION, 0x00);
	LIS3DH_WriteReg(LIS3DH_INT2_CFG, 0x00);	
	LIS3DH_WriteReg(LIS3DH_INT2_THS, 0x00);	
	LIS3DH_WriteReg(LIS3DH_INT2_DURATION, 0x00);	
	LIS3DH_WriteReg(LIS3DH_CLICK_CFG, 0x00);	
	LIS3DH_WriteReg(LIS3DH_CLICK_THS, 0x00);	
	LIS3DH_WriteReg(LIS3DH_TIME_LIMIT, 0x00);	
	LIS3DH_WriteReg(LIS3DH_TIME_LATENCY, 0x00);	
	LIS3DH_WriteReg(LIS3DH_TIME_WINDOW, 0x00);	
	LIS3DH_WriteReg(0X3E, 0x00);	
	LIS3DH_WriteReg(0X3F, 0x00);	
	
#ifdef READ_REG	
  LIS3DH_ReadReg(LIS3DH_CTRL_REG1 ,&Ctrl_reg1);
	LIS3DH_ReadReg(LIS3DH_CTRL_REG2 ,&Ctrl_reg2);
	LIS3DH_ReadReg(LIS3DH_CTRL_REG3 ,&Ctrl_reg3);
	LIS3DH_ReadReg(LIS3DH_CTRL_REG4 ,&Ctrl_reg4);
	LIS3DH_ReadReg(LIS3DH_CTRL_REG5 ,&Ctrl_reg5);
	LIS3DH_ReadReg(LIS3DH_CTRL_REG6 ,&Ctrl_reg6);
	LIS3DH_ReadReg(LIS3DH_INT1_CFG ,&Int1_cfg);
	LIS3DH_ReadReg(LIS3DH_INT1_THS ,&Int1_ths);
	LIS3DH_ReadReg(LIS3DH_INT1_DURATION ,&Int1_dur);	
#endif	
}

u16 Modulo (s16 var){
		if(var < 0){
		var *=-1; //realiza o módulo
	}
	return var;
}


void Buttons_Init(void)
{
	//Configura o pino ABRE
	GPIO_Init(ABRE,GPIO_MODE_IN_PU_IT);
	EXTI_SetExtIntSensitivity(ABRE_SENSIBILIDADE);	
}

void Buttons_ISR (void)
{
	//Verifica a origem da interrupçãp
	if(!GPIO_ReadInputPin(ABRE))
	{
		//adicionar qualquer função para tecla pressionada, como low power mode
	}
	else
	{
		//erro de leitura
	}	
}



//angulo entre vetor instantaneo e vetor de referencia
float GetAngle (s16 x1, s16 y1 , s16 z1, s16 x2, s16 y2 , s16 z2)
{
	//s32 n;
	float teta;
	float aux_teta,aux_teta1;
	float square_sum1; 
	float square_sum2;
	double aux_x1,aux_y1,aux_z1,aux_x2,aux_y2,aux_z2;	 
	aux_x1 = Modulo(x1); //calcula o modulo de x1
	aux_x1 *= aux_x1;    //calcula o quadrado de x1
	aux_y1 = Modulo(y1); //calcula o modulo de y1
	aux_y1 *= aux_y1;    //calcula o quadrado de y1
	aux_z1 = Modulo(z1); //calcula o modulo de z1
	aux_z1 *= aux_z1;    //calcula o quadrado de z1
	aux_x2 = Modulo(x2); //calcula o modulo de x2
	aux_x2 *= aux_x2;    //calcula o quadrado de x2
	aux_y2 = Modulo(y2); //calcula o modulo de y2
	aux_y2 *= aux_y2;    //calcula o quadrado de y2
	aux_z2 = Modulo(z2); //calcula o modulo de z2	
	aux_z2 *= aux_z2;    //calcula o quadrado de z2
	square_sum1 = sqrt(aux_x1 + aux_y1 + aux_z1); //calcula a raiz da soma dos quadrados do vetor de entrada
	square_sum2 = sqrt(aux_x2 + aux_y2 + aux_z2); //calcula a raiz da soma dos quadrados do vetor de referencia
    /****** produto escalar é dado por: A*B = |A|*|B|*cosO   ****/
	//inicio do claculo de A*B 
	aux_x1 = (s32)((s32)x1* (s32)x2);
	aux_y1 = (s32)((s32)y1* (s32)y2);
	aux_z1 = (s32)((s32)z1* (s32)z2);
	aux_teta = (aux_x1 + aux_y1 + aux_z1);//término do calculo de A*B
	aux_teta1 = (square_sum1*square_sum2);//calculo do produto |A|*|B| 
	//inicio do calculo de angulo teta
	teta = (float)(((float)aux_teta)/((float)aux_teta1)); 
	teta = acos(teta); //teta esta em radianos
	// arredondamento angular   
	teta = (float)(teta*(float)Transf_graus); //converte de radianos para graus (Transf_graus = 180/pi)
	//n = (teta - floor(teta) > 0.5) ? ceil(teta) : floor(teta); //usado no lugar da função round() se fosse devolver um inteiro
	return (teta);
 }
