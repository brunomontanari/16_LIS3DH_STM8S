// usado em controle.c já seta como saida em controle_Init
#define SPI_MISO     							GPIOC,GPIO_PIN_7
#define SPI_MOSI     							GPIOC,GPIO_PIN_6
#define SPI_SCK      							GPIOC,GPIO_PIN_5
#define CHIPSELECT  							GPIOE,GPIO_PIN_5
#define INTERRUPT1   							GPIOC,GPIO_PIN_2
#define INTERRUPT1_SENSIBILIDADE  EXTI_PORT_GPIOC,EXTI_SENSITIVITY_RISE_ONLY
#define INTERRUPT2   							GPIOD,GPIO_PIN_3
#define INTERRUPT2_SENSIBILIDADE 	EXTI_PORT_GPIOD,EXTI_SENSITIVITY_RISE_ONLY

//usado no controle.c para configurar os pinos das teclas
#define ABRE                GPIOB,GPIO_PIN_7
#define ABRE_SENSIBILIDADE  EXTI_PORT_GPIOB,EXTI_SENSITIVITY_FALL_LOW
