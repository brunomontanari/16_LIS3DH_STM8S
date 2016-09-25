   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  56                     ; 14 void LIS3DH_INT1_ISR(void)
  56                     ; 15 {	
  58                     .text:	section	.text,new
  59  0000               _LIS3DH_INT1_ISR:
  63                     ; 17 	GPIO_Init(SPI_MISO,GPIO_MODE_IN_FL_NO_IT);
  65  0000 5f            	clrw	x
  66  0001 89            	pushw	x
  67  0002 ae0080        	ldw	x,#128
  68  0005 89            	pushw	x
  69  0006 ae500a        	ldw	x,#20490
  70  0009 cd0000        	call	_GPIO_Init
  72  000c 5b04          	addw	sp,#4
  73                     ; 19 	GPIO_Init(SPI_MOSI,GPIO_MODE_OUT_PP_LOW_FAST);
  75  000e ae00e0        	ldw	x,#224
  76  0011 89            	pushw	x
  77  0012 ae0040        	ldw	x,#64
  78  0015 89            	pushw	x
  79  0016 ae500a        	ldw	x,#20490
  80  0019 cd0000        	call	_GPIO_Init
  82  001c 5b04          	addw	sp,#4
  83                     ; 21 	GPIO_Init(SPI_SCK,GPIO_MODE_OUT_PP_LOW_FAST);
  85  001e ae00e0        	ldw	x,#224
  86  0021 89            	pushw	x
  87  0022 ae0020        	ldw	x,#32
  88  0025 89            	pushw	x
  89  0026 ae500a        	ldw	x,#20490
  90  0029 cd0000        	call	_GPIO_Init
  92  002c 5b04          	addw	sp,#4
  93                     ; 23 	GPIO_Init(CHIPSELECT,GPIO_MODE_OUT_PP_LOW_FAST);
  95  002e ae00e0        	ldw	x,#224
  96  0031 89            	pushw	x
  97  0032 ae0020        	ldw	x,#32
  98  0035 89            	pushw	x
  99  0036 ae5014        	ldw	x,#20500
 100  0039 cd0000        	call	_GPIO_Init
 102  003c 5b04          	addw	sp,#4
 103                     ; 24 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, ENABLE);
 105  003e ae0001        	ldw	x,#1
 106  0041 89            	pushw	x
 107  0042 ae0001        	ldw	x,#1
 108  0045 cd0000        	call	_CLK_PeripheralClockConfig
 110  0048 85            	popw	x
 111                     ; 25 	SPI_Cmd(ENABLE);
 113  0049 ae0001        	ldw	x,#1
 114  004c cd0000        	call	_SPI_Cmd
 116                     ; 26 	LIS3DH_ResetInt1Latch();
 118  004f cd0000        	call	_LIS3DH_ResetInt1Latch
 120                     ; 27 	LIS3DH_GetStatusReg(&StatusRegVar);
 122  0052 ae0000        	ldw	x,#_StatusRegVar
 123  0055 cd0000        	call	_LIS3DH_GetStatusReg
 125                     ; 28 	LIS3DH_GetStatusAUX(&StatusAUXVar);
 127  0058 ae0000        	ldw	x,#_StatusAUXVar
 128  005b cd0000        	call	_LIS3DH_GetStatusAUX
 130                     ; 29 	LIS3DH_GetAccAxesRaw(&leitura);
 132  005e ae0000        	ldw	x,#_leitura
 133  0061 cd0000        	call	_LIS3DH_GetAccAxesRaw
 135                     ; 30 	DataReady = 1;
 137  0064 ae0001        	ldw	x,#1
 138  0067 bf00          	ldw	_DataReady,x
 139                     ; 31 }
 142  0069 81            	ret
 175                     ; 33 void LIS3DH_INT2_ISR(void)
 175                     ; 34 {
 176                     .text:	section	.text,new
 177  0000               _LIS3DH_INT2_ISR:
 181                     ; 36 	GPIO_Init(SPI_MISO,GPIO_MODE_IN_FL_NO_IT);
 183  0000 5f            	clrw	x
 184  0001 89            	pushw	x
 185  0002 ae0080        	ldw	x,#128
 186  0005 89            	pushw	x
 187  0006 ae500a        	ldw	x,#20490
 188  0009 cd0000        	call	_GPIO_Init
 190  000c 5b04          	addw	sp,#4
 191                     ; 38 	GPIO_Init(SPI_MOSI,GPIO_MODE_OUT_PP_LOW_FAST);
 193  000e ae00e0        	ldw	x,#224
 194  0011 89            	pushw	x
 195  0012 ae0040        	ldw	x,#64
 196  0015 89            	pushw	x
 197  0016 ae500a        	ldw	x,#20490
 198  0019 cd0000        	call	_GPIO_Init
 200  001c 5b04          	addw	sp,#4
 201                     ; 40 	GPIO_Init(SPI_SCK,GPIO_MODE_OUT_PP_LOW_FAST);
 203  001e ae00e0        	ldw	x,#224
 204  0021 89            	pushw	x
 205  0022 ae0020        	ldw	x,#32
 206  0025 89            	pushw	x
 207  0026 ae500a        	ldw	x,#20490
 208  0029 cd0000        	call	_GPIO_Init
 210  002c 5b04          	addw	sp,#4
 211                     ; 42 	GPIO_Init(CHIPSELECT,GPIO_MODE_OUT_PP_LOW_FAST);
 213  002e ae00e0        	ldw	x,#224
 214  0031 89            	pushw	x
 215  0032 ae0020        	ldw	x,#32
 216  0035 89            	pushw	x
 217  0036 ae5014        	ldw	x,#20500
 218  0039 cd0000        	call	_GPIO_Init
 220  003c 5b04          	addw	sp,#4
 221                     ; 43 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, ENABLE);
 223  003e ae0001        	ldw	x,#1
 224  0041 89            	pushw	x
 225  0042 ae0001        	ldw	x,#1
 226  0045 cd0000        	call	_CLK_PeripheralClockConfig
 228  0048 85            	popw	x
 229                     ; 44 	SPI_Cmd(ENABLE);
 231  0049 ae0001        	ldw	x,#1
 232  004c cd0000        	call	_SPI_Cmd
 234                     ; 45 	LIS3DH_ResetInt2Latch();
 236  004f cd0000        	call	_LIS3DH_ResetInt2Latch
 238                     ; 46 	LIS3DH_GetStatusReg(&StatusRegVar);
 240  0052 ae0000        	ldw	x,#_StatusRegVar
 241  0055 cd0000        	call	_LIS3DH_GetStatusReg
 243                     ; 47 	LIS3DH_GetStatusAUX(&StatusAUXVar);
 245  0058 ae0000        	ldw	x,#_StatusAUXVar
 246  005b cd0000        	call	_LIS3DH_GetStatusAUX
 248                     ; 48   LIS3DH_GetAccAxesRaw(&leitura);
 250  005e ae0000        	ldw	x,#_leitura
 251  0061 cd0000        	call	_LIS3DH_GetAccAxesRaw
 253                     ; 49 }
 256  0064 81            	ret
 287                     ; 51 void LIS3DH_Init(void)
 287                     ; 52 {
 288                     .text:	section	.text,new
 289  0000               _LIS3DH_Init:
 293                     ; 54 	GPIO_Init(SPI_MISO,GPIO_MODE_IN_FL_NO_IT);
 295  0000 5f            	clrw	x
 296  0001 89            	pushw	x
 297  0002 ae0080        	ldw	x,#128
 298  0005 89            	pushw	x
 299  0006 ae500a        	ldw	x,#20490
 300  0009 cd0000        	call	_GPIO_Init
 302  000c 5b04          	addw	sp,#4
 303                     ; 56 	GPIO_Init(SPI_MOSI,GPIO_MODE_OUT_PP_LOW_FAST);
 305  000e ae00e0        	ldw	x,#224
 306  0011 89            	pushw	x
 307  0012 ae0040        	ldw	x,#64
 308  0015 89            	pushw	x
 309  0016 ae500a        	ldw	x,#20490
 310  0019 cd0000        	call	_GPIO_Init
 312  001c 5b04          	addw	sp,#4
 313                     ; 58 	GPIO_Init(SPI_SCK,GPIO_MODE_OUT_PP_LOW_FAST);
 315  001e ae00e0        	ldw	x,#224
 316  0021 89            	pushw	x
 317  0022 ae0020        	ldw	x,#32
 318  0025 89            	pushw	x
 319  0026 ae500a        	ldw	x,#20490
 320  0029 cd0000        	call	_GPIO_Init
 322  002c 5b04          	addw	sp,#4
 323                     ; 60 	GPIO_Init(CHIPSELECT,GPIO_MODE_OUT_PP_LOW_FAST);
 325  002e ae00e0        	ldw	x,#224
 326  0031 89            	pushw	x
 327  0032 ae0020        	ldw	x,#32
 328  0035 89            	pushw	x
 329  0036 ae5014        	ldw	x,#20500
 330  0039 cd0000        	call	_GPIO_Init
 332  003c 5b04          	addw	sp,#4
 333                     ; 62 	GPIO_Init(INTERRUPT1,GPIO_MODE_IN_FL_IT);
 335  003e ae0020        	ldw	x,#32
 336  0041 89            	pushw	x
 337  0042 ae0004        	ldw	x,#4
 338  0045 89            	pushw	x
 339  0046 ae500a        	ldw	x,#20490
 340  0049 cd0000        	call	_GPIO_Init
 342  004c 5b04          	addw	sp,#4
 343                     ; 64 	EXTI_SetExtIntSensitivity(INTERRUPT1_SENSIBILIDADE);
 345  004e ae0001        	ldw	x,#1
 346  0051 89            	pushw	x
 347  0052 ae0002        	ldw	x,#2
 348  0055 cd0000        	call	_EXTI_SetExtIntSensitivity
 350  0058 85            	popw	x
 351                     ; 66 	GPIO_Init(INTERRUPT2,GPIO_MODE_IN_FL_IT);
 353  0059 ae0020        	ldw	x,#32
 354  005c 89            	pushw	x
 355  005d ae0008        	ldw	x,#8
 356  0060 89            	pushw	x
 357  0061 ae500f        	ldw	x,#20495
 358  0064 cd0000        	call	_GPIO_Init
 360  0067 5b04          	addw	sp,#4
 361                     ; 68 	EXTI_SetExtIntSensitivity(INTERRUPT2_SENSIBILIDADE);	
 363  0069 ae0001        	ldw	x,#1
 364  006c 89            	pushw	x
 365  006d ae0003        	ldw	x,#3
 366  0070 cd0000        	call	_EXTI_SetExtIntSensitivity
 368  0073 85            	popw	x
 369                     ; 70 	ITC_SetSoftwarePriority(ITC_IRQ_PORTC, ITC_PRIORITYLEVEL_1);
 371  0074 ae0001        	ldw	x,#1
 372  0077 89            	pushw	x
 373  0078 ae0005        	ldw	x,#5
 374  007b cd0000        	call	_ITC_SetSoftwarePriority
 376  007e 85            	popw	x
 377                     ; 71 	ITC_SetSoftwarePriority(ITC_IRQ_PORTD, ITC_PRIORITYLEVEL_1);
 379  007f ae0001        	ldw	x,#1
 380  0082 89            	pushw	x
 381  0083 ae0006        	ldw	x,#6
 382  0086 cd0000        	call	_ITC_SetSoftwarePriority
 384  0089 85            	popw	x
 385                     ; 72 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, ENABLE);
 387  008a ae0001        	ldw	x,#1
 388  008d 89            	pushw	x
 389  008e ae0001        	ldw	x,#1
 390  0091 cd0000        	call	_CLK_PeripheralClockConfig
 392  0094 85            	popw	x
 393                     ; 74 	SPI_Init(SPI_FIRSTBIT_MSB, SPI_BAUDRATEPRESCALER_16, SPI_MODE_MASTER, SPI_CLOCKPOLARITY_HIGH,SPI_CLOCKPHASE_2EDGE, SPI_DATADIRECTION_2LINES_FULLDUPLEX,SPI_NSS_SOFT,0x07);
 395  0095 4b07          	push	#7
 396  0097 ae0002        	ldw	x,#2
 397  009a 89            	pushw	x
 398  009b 5f            	clrw	x
 399  009c 89            	pushw	x
 400  009d ae0001        	ldw	x,#1
 401  00a0 89            	pushw	x
 402  00a1 ae0002        	ldw	x,#2
 403  00a4 89            	pushw	x
 404  00a5 ae0004        	ldw	x,#4
 405  00a8 89            	pushw	x
 406  00a9 ae0018        	ldw	x,#24
 407  00ac 89            	pushw	x
 408  00ad 5f            	clrw	x
 409  00ae cd0000        	call	_SPI_Init
 411  00b1 5b0d          	addw	sp,#13
 412                     ; 76 	SPI->CR2 &= 0xDF;
 414  00b3 721b5201      	bres	20993,#5
 415                     ; 78 	SPI_Cmd(ENABLE);	
 417  00b7 ae0001        	ldw	x,#1
 418  00ba cd0000        	call	_SPI_Cmd
 420                     ; 80 	enableInterrupts();
 423  00bd 9a            rim
 425                     ; 82 	MEMS_Startup();
 428  00be cd0000        	call	_MEMS_Startup
 430                     ; 84 }
 433  00c1 81            	ret
 469                     ; 90 void MEMS_Startup (void)
 469                     ; 91 {
 470                     .text:	section	.text,new
 471  0000               _MEMS_Startup:
 475                     ; 92 	LIS3DH_GetWHO_AM_I(&WhoAmI);
 477  0000 ae0000        	ldw	x,#_WhoAmI
 478  0003 cd0000        	call	_LIS3DH_GetWHO_AM_I
 480                     ; 93 	LIS3DH_WriteReg(LIS3DH_TEMP_CFG_REG, 0x00);	
 482  0006 ae1f00        	ldw	x,#7936
 483  0009 cd0000        	call	_LIS3DH_WriteReg
 485                     ; 94 	LIS3DH_WriteReg(LIS3DH_CTRL_REG1, 0x5F);
 487  000c ae205f        	ldw	x,#8287
 488  000f cd0000        	call	_LIS3DH_WriteReg
 490                     ; 95 	LIS3DH_WriteReg(LIS3DH_CTRL_REG2, 0x00);
 492  0012 ae2100        	ldw	x,#8448
 493  0015 cd0000        	call	_LIS3DH_WriteReg
 495                     ; 96 	LIS3DH_WriteReg(LIS3DH_CTRL_REG3, 0x50);
 497  0018 ae2250        	ldw	x,#8784
 498  001b cd0000        	call	_LIS3DH_WriteReg
 500                     ; 97 	LIS3DH_WriteReg(LIS3DH_CTRL_REG4, 0x80);
 502  001e ae2380        	ldw	x,#9088
 503  0021 cd0000        	call	_LIS3DH_WriteReg
 505                     ; 98 	LIS3DH_WriteReg(LIS3DH_CTRL_REG5, 0x00);
 507  0024 ae2400        	ldw	x,#9216
 508  0027 cd0000        	call	_LIS3DH_WriteReg
 510                     ; 99 	LIS3DH_WriteReg(LIS3DH_CTRL_REG6, 0x00);	
 512  002a ae2500        	ldw	x,#9472
 513  002d cd0000        	call	_LIS3DH_WriteReg
 515                     ; 100 	LIS3DH_WriteReg(LIS3DH_REFERENCE_REG, 0x00);	
 517  0030 ae2600        	ldw	x,#9728
 518  0033 cd0000        	call	_LIS3DH_WriteReg
 520                     ; 101 	LIS3DH_WriteReg(LIS3DH_FIFO_CTRL_REG, 0x00);	
 522  0036 ae2e00        	ldw	x,#11776
 523  0039 cd0000        	call	_LIS3DH_WriteReg
 525                     ; 102 	LIS3DH_WriteReg(LIS3DH_INT1_CFG, 0x00);
 527  003c ae3000        	ldw	x,#12288
 528  003f cd0000        	call	_LIS3DH_WriteReg
 530                     ; 103 	LIS3DH_WriteReg(LIS3DH_INT1_THS, 0x00);
 532  0042 ae3200        	ldw	x,#12800
 533  0045 cd0000        	call	_LIS3DH_WriteReg
 535                     ; 104 	LIS3DH_WriteReg(LIS3DH_INT1_DURATION, 0x00);
 537  0048 ae3300        	ldw	x,#13056
 538  004b cd0000        	call	_LIS3DH_WriteReg
 540                     ; 105 	LIS3DH_WriteReg(LIS3DH_INT2_CFG, 0x00);	
 542  004e ae3400        	ldw	x,#13312
 543  0051 cd0000        	call	_LIS3DH_WriteReg
 545                     ; 106 	LIS3DH_WriteReg(LIS3DH_INT2_THS, 0x00);	
 547  0054 ae3600        	ldw	x,#13824
 548  0057 cd0000        	call	_LIS3DH_WriteReg
 550                     ; 107 	LIS3DH_WriteReg(LIS3DH_INT2_DURATION, 0x00);	
 552  005a ae3700        	ldw	x,#14080
 553  005d cd0000        	call	_LIS3DH_WriteReg
 555                     ; 108 	LIS3DH_WriteReg(LIS3DH_CLICK_CFG, 0x00);	
 557  0060 ae3800        	ldw	x,#14336
 558  0063 cd0000        	call	_LIS3DH_WriteReg
 560                     ; 109 	LIS3DH_WriteReg(LIS3DH_CLICK_THS, 0x00);	
 562  0066 ae3a00        	ldw	x,#14848
 563  0069 cd0000        	call	_LIS3DH_WriteReg
 565                     ; 110 	LIS3DH_WriteReg(LIS3DH_TIME_LIMIT, 0x00);	
 567  006c ae3b00        	ldw	x,#15104
 568  006f cd0000        	call	_LIS3DH_WriteReg
 570                     ; 111 	LIS3DH_WriteReg(LIS3DH_TIME_LATENCY, 0x00);	
 572  0072 ae3c00        	ldw	x,#15360
 573  0075 cd0000        	call	_LIS3DH_WriteReg
 575                     ; 112 	LIS3DH_WriteReg(LIS3DH_TIME_WINDOW, 0x00);	
 577  0078 ae3d00        	ldw	x,#15616
 578  007b cd0000        	call	_LIS3DH_WriteReg
 580                     ; 113 	LIS3DH_WriteReg(0X3E, 0x00);	
 582  007e ae3e00        	ldw	x,#15872
 583  0081 cd0000        	call	_LIS3DH_WriteReg
 585                     ; 114 	LIS3DH_WriteReg(0X3F, 0x00);	
 587  0084 ae3f00        	ldw	x,#16128
 588  0087 cd0000        	call	_LIS3DH_WriteReg
 590                     ; 117   LIS3DH_ReadReg(LIS3DH_CTRL_REG1 ,&Ctrl_reg1);
 592  008a ae0000        	ldw	x,#_Ctrl_reg1
 593  008d 89            	pushw	x
 594  008e a620          	ld	a,#32
 595  0090 cd0000        	call	_LIS3DH_ReadReg
 597  0093 85            	popw	x
 598                     ; 118 	LIS3DH_ReadReg(LIS3DH_CTRL_REG2 ,&Ctrl_reg2);
 600  0094 ae0000        	ldw	x,#_Ctrl_reg2
 601  0097 89            	pushw	x
 602  0098 a621          	ld	a,#33
 603  009a cd0000        	call	_LIS3DH_ReadReg
 605  009d 85            	popw	x
 606                     ; 119 	LIS3DH_ReadReg(LIS3DH_CTRL_REG3 ,&Ctrl_reg3);
 608  009e ae0000        	ldw	x,#_Ctrl_reg3
 609  00a1 89            	pushw	x
 610  00a2 a622          	ld	a,#34
 611  00a4 cd0000        	call	_LIS3DH_ReadReg
 613  00a7 85            	popw	x
 614                     ; 120 	LIS3DH_ReadReg(LIS3DH_CTRL_REG4 ,&Ctrl_reg4);
 616  00a8 ae0000        	ldw	x,#_Ctrl_reg4
 617  00ab 89            	pushw	x
 618  00ac a623          	ld	a,#35
 619  00ae cd0000        	call	_LIS3DH_ReadReg
 621  00b1 85            	popw	x
 622                     ; 121 	LIS3DH_ReadReg(LIS3DH_CTRL_REG5 ,&Ctrl_reg5);
 624  00b2 ae0000        	ldw	x,#_Ctrl_reg5
 625  00b5 89            	pushw	x
 626  00b6 a624          	ld	a,#36
 627  00b8 cd0000        	call	_LIS3DH_ReadReg
 629  00bb 85            	popw	x
 630                     ; 122 	LIS3DH_ReadReg(LIS3DH_CTRL_REG6 ,&Ctrl_reg6);
 632  00bc ae0000        	ldw	x,#_Ctrl_reg6
 633  00bf 89            	pushw	x
 634  00c0 a625          	ld	a,#37
 635  00c2 cd0000        	call	_LIS3DH_ReadReg
 637  00c5 85            	popw	x
 638                     ; 123 	LIS3DH_ReadReg(LIS3DH_INT1_CFG ,&Int1_cfg);
 640  00c6 ae0000        	ldw	x,#_Int1_cfg
 641  00c9 89            	pushw	x
 642  00ca a630          	ld	a,#48
 643  00cc cd0000        	call	_LIS3DH_ReadReg
 645  00cf 85            	popw	x
 646                     ; 124 	LIS3DH_ReadReg(LIS3DH_INT1_THS ,&Int1_ths);
 648  00d0 ae0000        	ldw	x,#_Int1_ths
 649  00d3 89            	pushw	x
 650  00d4 a632          	ld	a,#50
 651  00d6 cd0000        	call	_LIS3DH_ReadReg
 653  00d9 85            	popw	x
 654                     ; 125 	LIS3DH_ReadReg(LIS3DH_INT1_DURATION ,&Int1_dur);	
 656  00da ae0000        	ldw	x,#_Int1_dur
 657  00dd 89            	pushw	x
 658  00de a633          	ld	a,#51
 659  00e0 cd0000        	call	_LIS3DH_ReadReg
 661  00e3 85            	popw	x
 662                     ; 127 }
 665  00e4 81            	ret
 699                     ; 129 u16 Modulo (s16 var){
 700                     .text:	section	.text,new
 701  0000               _Modulo:
 703  0000 89            	pushw	x
 704       00000000      OFST:	set	0
 707                     ; 130 		if(var < 0){
 709  0001 9c            	rvf
 710  0002 a30000        	cpw	x,#0
 711  0005 2e05          	jrsge	L76
 712                     ; 131 		var *=-1; //realiza o módulo
 714  0007 1e01          	ldw	x,(OFST+1,sp)
 715  0009 50            	negw	x
 716  000a 1f01          	ldw	(OFST+1,sp),x
 717  000c               L76:
 718                     ; 133 	return var;
 720  000c 1e01          	ldw	x,(OFST+1,sp)
 723  000e 5b02          	addw	sp,#2
 724  0010 81            	ret
 749                     ; 137 void Buttons_Init(void)
 749                     ; 138 {
 750                     .text:	section	.text,new
 751  0000               _Buttons_Init:
 755                     ; 140 	GPIO_Init(ABRE,GPIO_MODE_IN_PU_IT);
 757  0000 ae0060        	ldw	x,#96
 758  0003 89            	pushw	x
 759  0004 ae0080        	ldw	x,#128
 760  0007 89            	pushw	x
 761  0008 ae5005        	ldw	x,#20485
 762  000b cd0000        	call	_GPIO_Init
 764  000e 5b04          	addw	sp,#4
 765                     ; 141 	EXTI_SetExtIntSensitivity(ABRE_SENSIBILIDADE);	
 767  0010 5f            	clrw	x
 768  0011 89            	pushw	x
 769  0012 ae0001        	ldw	x,#1
 770  0015 cd0000        	call	_EXTI_SetExtIntSensitivity
 772  0018 85            	popw	x
 773                     ; 142 }
 776  0019 81            	ret
 800                     ; 144 void Buttons_ISR (void)
 800                     ; 145 {
 801                     .text:	section	.text,new
 802  0000               _Buttons_ISR:
 806                     ; 147 	if(!GPIO_ReadInputPin(ABRE))
 808  0000 ae0080        	ldw	x,#128
 809  0003 89            	pushw	x
 810  0004 ae5005        	ldw	x,#20485
 811  0007 cd0000        	call	_GPIO_ReadInputPin
 813  000a 5b02          	addw	sp,#2
 814  000c a30000        	cpw	x,#0
 816  000f               L311:
 817                     ; 155 }
 820  000f 81            	ret
1001                     ; 160 float GetAngle (s16 x1, s16 y1 , s16 z1, s16 x2, s16 y2 , s16 z2)
1001                     ; 161 {
1002                     .text:	section	.text,new
1003  0000               _GetAngle:
1005  0000 89            	pushw	x
1006  0001 521c          	subw	sp,#28
1007       0000001c      OFST:	set	28
1010                     ; 168 	aux_x1 = Modulo(x1); //calcula o modulo de x1
1012  0003 cd0000        	call	_Modulo
1014  0006 cd0000        	call	c_uitof
1016  0009 96            	ldw	x,sp
1017  000a 1c0019        	addw	x,#OFST-3
1018  000d cd0000        	call	c_rtol
1021                     ; 169 	aux_x1 *= aux_x1;    //calcula o quadrado de x1
1023  0010 96            	ldw	x,sp
1024  0011 1c0019        	addw	x,#OFST-3
1025  0014 cd0000        	call	c_ltor
1027  0017 96            	ldw	x,sp
1028  0018 1c0019        	addw	x,#OFST-3
1029  001b cd0000        	call	c_fgmul
1032                     ; 170 	aux_y1 = Modulo(y1); //calcula o modulo de y1
1034  001e 1e21          	ldw	x,(OFST+5,sp)
1035  0020 cd0000        	call	_Modulo
1037  0023 cd0000        	call	c_uitof
1039  0026 96            	ldw	x,sp
1040  0027 1c0009        	addw	x,#OFST-19
1041  002a cd0000        	call	c_rtol
1044                     ; 171 	aux_y1 *= aux_y1;    //calcula o quadrado de y1
1046  002d 96            	ldw	x,sp
1047  002e 1c0009        	addw	x,#OFST-19
1048  0031 cd0000        	call	c_ltor
1050  0034 96            	ldw	x,sp
1051  0035 1c0009        	addw	x,#OFST-19
1052  0038 cd0000        	call	c_fgmul
1055                     ; 172 	aux_z1 = Modulo(z1); //calcula o modulo de z1
1057  003b 1e23          	ldw	x,(OFST+7,sp)
1058  003d cd0000        	call	_Modulo
1060  0040 cd0000        	call	c_uitof
1062  0043 96            	ldw	x,sp
1063  0044 1c000d        	addw	x,#OFST-15
1064  0047 cd0000        	call	c_rtol
1067                     ; 173 	aux_z1 *= aux_z1;    //calcula o quadrado de z1
1069  004a 96            	ldw	x,sp
1070  004b 1c000d        	addw	x,#OFST-15
1071  004e cd0000        	call	c_ltor
1073  0051 96            	ldw	x,sp
1074  0052 1c000d        	addw	x,#OFST-15
1075  0055 cd0000        	call	c_fgmul
1078                     ; 174 	aux_x2 = Modulo(x2); //calcula o modulo de x2
1080  0058 1e25          	ldw	x,(OFST+9,sp)
1081  005a cd0000        	call	_Modulo
1083  005d cd0000        	call	c_uitof
1085  0060 96            	ldw	x,sp
1086  0061 1c0011        	addw	x,#OFST-11
1087  0064 cd0000        	call	c_rtol
1090                     ; 175 	aux_x2 *= aux_x2;    //calcula o quadrado de x2
1092  0067 96            	ldw	x,sp
1093  0068 1c0011        	addw	x,#OFST-11
1094  006b cd0000        	call	c_ltor
1096  006e 96            	ldw	x,sp
1097  006f 1c0011        	addw	x,#OFST-11
1098  0072 cd0000        	call	c_fgmul
1101                     ; 176 	aux_y2 = Modulo(y2); //calcula o modulo de y2
1103  0075 1e27          	ldw	x,(OFST+11,sp)
1104  0077 cd0000        	call	_Modulo
1106  007a cd0000        	call	c_uitof
1108  007d 96            	ldw	x,sp
1109  007e 1c0015        	addw	x,#OFST-7
1110  0081 cd0000        	call	c_rtol
1113                     ; 177 	aux_y2 *= aux_y2;    //calcula o quadrado de y2
1115  0084 96            	ldw	x,sp
1116  0085 1c0015        	addw	x,#OFST-7
1117  0088 cd0000        	call	c_ltor
1119  008b 96            	ldw	x,sp
1120  008c 1c0015        	addw	x,#OFST-7
1121  008f cd0000        	call	c_fgmul
1124                     ; 178 	aux_z2 = Modulo(z2); //calcula o modulo de z2	
1126  0092 1e29          	ldw	x,(OFST+13,sp)
1127  0094 cd0000        	call	_Modulo
1129  0097 cd0000        	call	c_uitof
1131  009a 96            	ldw	x,sp
1132  009b 1c0005        	addw	x,#OFST-23
1133  009e cd0000        	call	c_rtol
1136                     ; 179 	aux_z2 *= aux_z2;    //calcula o quadrado de z2
1138  00a1 96            	ldw	x,sp
1139  00a2 1c0005        	addw	x,#OFST-23
1140  00a5 cd0000        	call	c_ltor
1142  00a8 96            	ldw	x,sp
1143  00a9 1c0005        	addw	x,#OFST-23
1144  00ac cd0000        	call	c_fgmul
1147                     ; 180 	square_sum1 = sqrt(aux_x1 + aux_y1 + aux_z1); //calcula a raiz da soma dos quadrados do vetor de entrada
1149  00af 96            	ldw	x,sp
1150  00b0 1c0019        	addw	x,#OFST-3
1151  00b3 cd0000        	call	c_ltor
1153  00b6 96            	ldw	x,sp
1154  00b7 1c0009        	addw	x,#OFST-19
1155  00ba cd0000        	call	c_fadd
1157  00bd 96            	ldw	x,sp
1158  00be 1c000d        	addw	x,#OFST-15
1159  00c1 cd0000        	call	c_fadd
1161  00c4 be02          	ldw	x,c_lreg+2
1162  00c6 89            	pushw	x
1163  00c7 be00          	ldw	x,c_lreg
1164  00c9 89            	pushw	x
1165  00ca cd0000        	call	_sqrt
1167  00cd 5b04          	addw	sp,#4
1168  00cf 96            	ldw	x,sp
1169  00d0 1c0001        	addw	x,#OFST-27
1170  00d3 cd0000        	call	c_rtol
1173                     ; 181 	square_sum2 = sqrt(aux_x2 + aux_y2 + aux_z2); //calcula a raiz da soma dos quadrados do vetor de referencia
1175  00d6 96            	ldw	x,sp
1176  00d7 1c0011        	addw	x,#OFST-11
1177  00da cd0000        	call	c_ltor
1179  00dd 96            	ldw	x,sp
1180  00de 1c0015        	addw	x,#OFST-7
1181  00e1 cd0000        	call	c_fadd
1183  00e4 96            	ldw	x,sp
1184  00e5 1c0005        	addw	x,#OFST-23
1185  00e8 cd0000        	call	c_fadd
1187  00eb be02          	ldw	x,c_lreg+2
1188  00ed 89            	pushw	x
1189  00ee be00          	ldw	x,c_lreg
1190  00f0 89            	pushw	x
1191  00f1 cd0000        	call	_sqrt
1193  00f4 5b04          	addw	sp,#4
1194  00f6 96            	ldw	x,sp
1195  00f7 1c0011        	addw	x,#OFST-11
1196  00fa cd0000        	call	c_rtol
1199                     ; 184 	aux_x1 = (s32)((s32)x1* (s32)x2);
1201  00fd 1e1d          	ldw	x,(OFST+1,sp)
1202  00ff 1625          	ldw	y,(OFST+9,sp)
1203  0101 cd0000        	call	c_vmul
1205  0104 cd0000        	call	c_ltof
1207  0107 96            	ldw	x,sp
1208  0108 1c0019        	addw	x,#OFST-3
1209  010b cd0000        	call	c_rtol
1212                     ; 185 	aux_y1 = (s32)((s32)y1* (s32)y2);
1214  010e 1e21          	ldw	x,(OFST+5,sp)
1215  0110 1627          	ldw	y,(OFST+11,sp)
1216  0112 cd0000        	call	c_vmul
1218  0115 cd0000        	call	c_ltof
1220  0118 96            	ldw	x,sp
1221  0119 1c0009        	addw	x,#OFST-19
1222  011c cd0000        	call	c_rtol
1225                     ; 186 	aux_z1 = (s32)((s32)z1* (s32)z2);
1227  011f 1e23          	ldw	x,(OFST+7,sp)
1228  0121 1629          	ldw	y,(OFST+13,sp)
1229  0123 cd0000        	call	c_vmul
1231  0126 cd0000        	call	c_ltof
1233  0129 96            	ldw	x,sp
1234  012a 1c000d        	addw	x,#OFST-15
1235  012d cd0000        	call	c_rtol
1238                     ; 187 	aux_teta = (aux_x1 + aux_y1 + aux_z1);//término do calculo de A*B
1240  0130 96            	ldw	x,sp
1241  0131 1c0019        	addw	x,#OFST-3
1242  0134 cd0000        	call	c_ltor
1244  0137 96            	ldw	x,sp
1245  0138 1c0009        	addw	x,#OFST-19
1246  013b cd0000        	call	c_fadd
1248  013e 96            	ldw	x,sp
1249  013f 1c000d        	addw	x,#OFST-15
1250  0142 cd0000        	call	c_fadd
1252  0145 96            	ldw	x,sp
1253  0146 1c0015        	addw	x,#OFST-7
1254  0149 cd0000        	call	c_rtol
1257                     ; 188 	aux_teta1 = (square_sum1*square_sum2);//calculo do produto |A|*|B| 
1259  014c 96            	ldw	x,sp
1260  014d 1c0001        	addw	x,#OFST-27
1261  0150 cd0000        	call	c_ltor
1263  0153 96            	ldw	x,sp
1264  0154 1c0011        	addw	x,#OFST-11
1265  0157 cd0000        	call	c_fmul
1267  015a 96            	ldw	x,sp
1268  015b 1c0001        	addw	x,#OFST-27
1269  015e cd0000        	call	c_rtol
1272                     ; 190 	teta = (float)(((float)aux_teta)/((float)aux_teta1)); 
1274  0161 96            	ldw	x,sp
1275  0162 1c0015        	addw	x,#OFST-7
1276  0165 cd0000        	call	c_ltor
1278  0168 96            	ldw	x,sp
1279  0169 1c0001        	addw	x,#OFST-27
1280  016c cd0000        	call	c_fdiv
1282  016f 96            	ldw	x,sp
1283  0170 1c0019        	addw	x,#OFST-3
1284  0173 cd0000        	call	c_rtol
1287                     ; 191 	teta = acos(teta); //teta esta em radianos
1289  0176 1e1b          	ldw	x,(OFST-1,sp)
1290  0178 89            	pushw	x
1291  0179 1e1b          	ldw	x,(OFST-1,sp)
1292  017b 89            	pushw	x
1293  017c cd0000        	call	_acos
1295  017f 5b04          	addw	sp,#4
1296  0181 96            	ldw	x,sp
1297  0182 1c0019        	addw	x,#OFST-3
1298  0185 cd0000        	call	c_rtol
1301                     ; 193 	teta = (float)(teta*(float)Transf_graus); //converte de radianos para graus (Transf_graus = 180/pi)
1303  0188 ae0000        	ldw	x,#L732
1304  018b cd0000        	call	c_ltor
1306  018e 96            	ldw	x,sp
1307  018f 1c0019        	addw	x,#OFST-3
1308  0192 cd0000        	call	c_fgmul
1311                     ; 195 	return (teta);
1313  0195 96            	ldw	x,sp
1314  0196 1c0019        	addw	x,#OFST-3
1315  0199 cd0000        	call	c_ltor
1319  019c 5b1e          	addw	sp,#30
1320  019e 81            	ret
1344                     	xref.b	_StatusAUXVar
1345                     	xref.b	_StatusRegVar
1346                     	xref.b	_leitura
1347                     	switch	.ubsct
1348  0000               _Angulo:
1349  0000 00000000      	ds.b	4
1350                     	xdef	_Angulo
1351                     	xref	_sqrt
1352                     	xref	_acos
1353                     	xref	_LIS3DH_WriteReg
1354                     	xref	_LIS3DH_ReadReg
1355                     	xref	_LIS3DH_GetWHO_AM_I
1356                     	xref	_LIS3DH_GetAccAxesRaw
1357                     	xref	_LIS3DH_GetStatusAUX
1358                     	xref	_LIS3DH_GetStatusReg
1359                     	xref	_LIS3DH_ResetInt2Latch
1360                     	xref	_LIS3DH_ResetInt1Latch
1361                     	xdef	_GetAngle
1362                     	xdef	_Buttons_ISR
1363                     	xdef	_Buttons_Init
1364                     	xdef	_Modulo
1365                     	xdef	_MEMS_Startup
1366                     	xdef	_LIS3DH_INT2_ISR
1367                     	xdef	_LIS3DH_INT1_ISR
1368                     	xdef	_LIS3DH_Init
1369                     	xref.b	_DataReady
1370                     	xref.b	_Int1_cfg
1371                     	xref.b	_Int1_ths
1372                     	xref.b	_Int1_dur
1373                     	xref.b	_Ctrl_reg6
1374                     	xref.b	_Ctrl_reg5
1375                     	xref.b	_Ctrl_reg4
1376                     	xref.b	_Ctrl_reg3
1377                     	xref.b	_Ctrl_reg2
1378                     	xref.b	_Ctrl_reg1
1379                     	xref.b	_WhoAmI
1380                     	xref	_SPI_Cmd
1381                     	xref	_SPI_Init
1382                     	xref	_ITC_SetSoftwarePriority
1383                     	xref	_GPIO_ReadInputPin
1384                     	xref	_GPIO_Init
1385                     	xref	_EXTI_SetExtIntSensitivity
1386                     	xref	_CLK_PeripheralClockConfig
1387                     .const:	section	.text
1388  0000               L732:
1389  0000 42652ee0      	dc.w	16997,12000
1390                     	xref.b	c_lreg
1391                     	xref.b	c_x
1392                     	xref.b	c_y
1412                     	xref	c_fdiv
1413                     	xref	c_fmul
1414                     	xref	c_ltof
1415                     	xref	c_vmul
1416                     	xref	c_fadd
1417                     	xref	c_fgmul
1418                     	xref	c_ltor
1419                     	xref	c_rtol
1420                     	xref	c_uitof
1421                     	end
