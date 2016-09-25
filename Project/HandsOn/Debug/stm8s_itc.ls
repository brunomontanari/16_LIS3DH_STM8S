   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  45                     ; 50 uint8_t ITC_GetCPUCC(void)
  45                     ; 51 {
  47                     .text:	section	.text,new
  48  0000               _ITC_GetCPUCC:
  52                     ; 53   _asm("push cc");
  55  0000 8a            push cc
  57                     ; 54   _asm("pop a");
  60  0001 84            pop a
  62                     ; 55   return; /* Ignore compiler warning, the returned value is in A register */
  65  0002 81            	ret
  88                     ; 80 void ITC_DeInit(void)
  88                     ; 81 {
  89                     .text:	section	.text,new
  90  0000               _ITC_DeInit:
  94                     ; 82   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  96  0000 35ff7f70      	mov	32624,#255
  97                     ; 83   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  99  0004 35ff7f71      	mov	32625,#255
 100                     ; 84   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 102  0008 35ff7f72      	mov	32626,#255
 103                     ; 85   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 105  000c 35ff7f73      	mov	32627,#255
 106                     ; 86   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 108  0010 35ff7f74      	mov	32628,#255
 109                     ; 87   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 111  0014 35ff7f75      	mov	32629,#255
 112                     ; 88   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 114  0018 35ff7f76      	mov	32630,#255
 115                     ; 89   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 117  001c 35ff7f77      	mov	32631,#255
 118                     ; 90 }
 121  0020 81            	ret
 146                     ; 97 uint8_t ITC_GetSoftIntStatus(void)
 146                     ; 98 {
 147                     .text:	section	.text,new
 148  0000               _ITC_GetSoftIntStatus:
 152                     ; 99   return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 154  0000 cd0000        	call	_ITC_GetCPUCC
 156  0003 a428          	and	a,#40
 159  0005 81            	ret
 408                     .const:	section	.text
 409  0000               L22:
 410  0000 0023          	dc.w	L14
 411  0002 0023          	dc.w	L14
 412  0004 0023          	dc.w	L14
 413  0006 0023          	dc.w	L14
 414  0008 002c          	dc.w	L34
 415  000a 002c          	dc.w	L34
 416  000c 002c          	dc.w	L34
 417  000e 002c          	dc.w	L34
 418  0010 0060          	dc.w	L302
 419  0012 0060          	dc.w	L302
 420  0014 0035          	dc.w	L54
 421  0016 0035          	dc.w	L54
 422  0018 003e          	dc.w	L74
 423  001a 003e          	dc.w	L74
 424  001c 003e          	dc.w	L74
 425  001e 003e          	dc.w	L74
 426  0020 0047          	dc.w	L15
 427  0022 0047          	dc.w	L15
 428  0024 0047          	dc.w	L15
 429  0026 0047          	dc.w	L15
 430  0028 0060          	dc.w	L302
 431  002a 0060          	dc.w	L302
 432  002c 0050          	dc.w	L35
 433  002e 0050          	dc.w	L35
 434  0030 0059          	dc.w	L55
 435                     ; 107 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 435                     ; 108 {
 436                     .text:	section	.text,new
 437  0000               _ITC_GetSoftwarePriority:
 439  0000 89            	pushw	x
 440  0001 89            	pushw	x
 441       00000002      OFST:	set	2
 444                     ; 109   uint8_t Value = 0;
 446  0002 0f02          	clr	(OFST+0,sp)
 448                     ; 110   uint8_t Mask = 0;
 450                     ; 113   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 452                     ; 116   Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 454  0004 9f            	ld	a,xl
 455  0005 a403          	and	a,#3
 456  0007 48            	sll	a
 457  0008 5f            	clrw	x
 458  0009 97            	ld	xl,a
 459  000a a603          	ld	a,#3
 460  000c 5d            	tnzw	x
 461  000d 2704          	jreq	L41
 462  000f               L61:
 463  000f 48            	sll	a
 464  0010 5a            	decw	x
 465  0011 26fc          	jrne	L61
 466  0013               L41:
 467  0013 6b01          	ld	(OFST-1,sp),a
 469                     ; 118   switch (IrqNum)
 471  0015 1e03          	ldw	x,(OFST+1,sp)
 473                     ; 198   default:
 473                     ; 199     break;
 474  0017 a30019        	cpw	x,#25
 475  001a 2405          	jruge	L02
 476  001c 58            	sllw	x
 477  001d de0000        	ldw	x,(L22,x)
 478  0020 fc            	jp	(x)
 479  0021               L02:
 480  0021 203d          	jra	L302
 481  0023               L14:
 482                     ; 120   case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 482                     ; 121   case ITC_IRQ_AWU:
 482                     ; 122   case ITC_IRQ_CLK:
 482                     ; 123   case ITC_IRQ_PORTA:
 482                     ; 124     Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 484  0023 c67f70        	ld	a,32624
 485  0026 1401          	and	a,(OFST-1,sp)
 486  0028 6b02          	ld	(OFST+0,sp),a
 488                     ; 125     break;
 490  002a 2034          	jra	L302
 491  002c               L34:
 492                     ; 127   case ITC_IRQ_PORTB:
 492                     ; 128   case ITC_IRQ_PORTC:
 492                     ; 129   case ITC_IRQ_PORTD:
 492                     ; 130   case ITC_IRQ_PORTE:
 492                     ; 131     Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 494  002c c67f71        	ld	a,32625
 495  002f 1401          	and	a,(OFST-1,sp)
 496  0031 6b02          	ld	(OFST+0,sp),a
 498                     ; 132     break;
 500  0033 202b          	jra	L302
 501  0035               L54:
 502                     ; 141   case ITC_IRQ_SPI:
 502                     ; 142   case ITC_IRQ_TIM1_OVF:
 502                     ; 143     Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 504  0035 c67f72        	ld	a,32626
 505  0038 1401          	and	a,(OFST-1,sp)
 506  003a 6b02          	ld	(OFST+0,sp),a
 508                     ; 144     break;
 510  003c 2022          	jra	L302
 511  003e               L74:
 512                     ; 146   case ITC_IRQ_TIM1_CAPCOM:
 512                     ; 147 #if defined (STM8S903) || defined (STM8AF622x)
 512                     ; 148   case ITC_IRQ_TIM5_OVFTRI:
 512                     ; 149   case ITC_IRQ_TIM5_CAPCOM:
 512                     ; 150 #else
 512                     ; 151   case ITC_IRQ_TIM2_OVF:
 512                     ; 152   case ITC_IRQ_TIM2_CAPCOM:
 512                     ; 153 #endif /* STM8S903 or STM8AF622x*/
 512                     ; 154   case ITC_IRQ_TIM3_OVF:
 512                     ; 155     Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 514  003e c67f73        	ld	a,32627
 515  0041 1401          	and	a,(OFST-1,sp)
 516  0043 6b02          	ld	(OFST+0,sp),a
 518                     ; 156     break;
 520  0045 2019          	jra	L302
 521  0047               L15:
 522                     ; 158   case ITC_IRQ_TIM3_CAPCOM:
 522                     ; 159 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 522                     ; 160     defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 522                     ; 161   case ITC_IRQ_UART1_TX:
 522                     ; 162   case ITC_IRQ_UART1_RX:
 522                     ; 163 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 522                     ; 164 #if defined(STM8AF622x)
 522                     ; 165   case ITC_IRQ_UART4_TX:
 522                     ; 166   case ITC_IRQ_UART4_RX:
 522                     ; 167 #endif /*STM8AF622x */
 522                     ; 168   case ITC_IRQ_I2C:
 522                     ; 169     Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 524  0047 c67f74        	ld	a,32628
 525  004a 1401          	and	a,(OFST-1,sp)
 526  004c 6b02          	ld	(OFST+0,sp),a
 528                     ; 170     break;
 530  004e 2010          	jra	L302
 531  0050               L35:
 532                     ; 184   case ITC_IRQ_ADC1:
 532                     ; 185 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S903 or STM8AF626x or STM8AF622x */
 532                     ; 186 #if defined (STM8S903) || defined (STM8AF622x)
 532                     ; 187   case ITC_IRQ_TIM6_OVFTRI:
 532                     ; 188 #else
 532                     ; 189   case ITC_IRQ_TIM4_OVF:
 532                     ; 190 #endif /*STM8S903 or STM8AF622x */
 532                     ; 191     Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 534  0050 c67f75        	ld	a,32629
 535  0053 1401          	and	a,(OFST-1,sp)
 536  0055 6b02          	ld	(OFST+0,sp),a
 538                     ; 192     break;
 540  0057 2007          	jra	L302
 541  0059               L55:
 542                     ; 194   case ITC_IRQ_EEPROM_EEC:
 542                     ; 195     Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 544  0059 c67f76        	ld	a,32630
 545  005c 1401          	and	a,(OFST-1,sp)
 546  005e 6b02          	ld	(OFST+0,sp),a
 548                     ; 196     break;
 550  0060               L75:
 551                     ; 198   default:
 551                     ; 199     break;
 553  0060               L302:
 554                     ; 202   Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 556  0060 7b04          	ld	a,(OFST+2,sp)
 557  0062 a403          	and	a,#3
 558  0064 48            	sll	a
 559  0065 5f            	clrw	x
 560  0066 97            	ld	xl,a
 561  0067 7b02          	ld	a,(OFST+0,sp)
 562  0069 5d            	tnzw	x
 563  006a 2704          	jreq	L42
 564  006c               L62:
 565  006c 44            	srl	a
 566  006d 5a            	decw	x
 567  006e 26fc          	jrne	L62
 568  0070               L42:
 569  0070 6b02          	ld	(OFST+0,sp),a
 571                     ; 204   return((ITC_PriorityLevel_TypeDef)Value);
 573  0072 7b02          	ld	a,(OFST+0,sp)
 574  0074 5f            	clrw	x
 575  0075 97            	ld	xl,a
 578  0076 5b04          	addw	sp,#4
 579  0078 81            	ret
 643                     	switch	.const
 644  0032               L44:
 645  0032 0034          	dc.w	L502
 646  0034 0034          	dc.w	L502
 647  0036 0034          	dc.w	L502
 648  0038 0034          	dc.w	L502
 649  003a 0046          	dc.w	L702
 650  003c 0046          	dc.w	L702
 651  003e 0046          	dc.w	L702
 652  0040 0046          	dc.w	L702
 653  0042 00b0          	dc.w	L162
 654  0044 00b0          	dc.w	L162
 655  0046 0058          	dc.w	L112
 656  0048 0058          	dc.w	L112
 657  004a 006a          	dc.w	L312
 658  004c 006a          	dc.w	L312
 659  004e 006a          	dc.w	L312
 660  0050 006a          	dc.w	L312
 661  0052 007c          	dc.w	L512
 662  0054 007c          	dc.w	L512
 663  0056 007c          	dc.w	L512
 664  0058 007c          	dc.w	L512
 665  005a 00b0          	dc.w	L162
 666  005c 00b0          	dc.w	L162
 667  005e 008e          	dc.w	L712
 668  0060 008e          	dc.w	L712
 669  0062 00a0          	dc.w	L122
 670                     ; 220 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 670                     ; 221 {
 671                     .text:	section	.text,new
 672  0000               _ITC_SetSoftwarePriority:
 674  0000 89            	pushw	x
 675  0001 89            	pushw	x
 676       00000002      OFST:	set	2
 679                     ; 222   uint8_t Mask = 0;
 681                     ; 223   uint8_t NewPriority = 0;
 683                     ; 226   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 685                     ; 227   assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 687                     ; 230   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 689                     ; 234   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 691  0002 9f            	ld	a,xl
 692  0003 a403          	and	a,#3
 693  0005 48            	sll	a
 694  0006 5f            	clrw	x
 695  0007 97            	ld	xl,a
 696  0008 a603          	ld	a,#3
 697  000a 5d            	tnzw	x
 698  000b 2704          	jreq	L23
 699  000d               L43:
 700  000d 48            	sll	a
 701  000e 5a            	decw	x
 702  000f 26fc          	jrne	L43
 703  0011               L23:
 704  0011 43            	cpl	a
 705  0012 6b01          	ld	(OFST-1,sp),a
 707                     ; 237   NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 709  0014 7b04          	ld	a,(OFST+2,sp)
 710  0016 a403          	and	a,#3
 711  0018 48            	sll	a
 712  0019 5f            	clrw	x
 713  001a 97            	ld	xl,a
 714  001b 7b08          	ld	a,(OFST+6,sp)
 715  001d 5d            	tnzw	x
 716  001e 2704          	jreq	L63
 717  0020               L04:
 718  0020 48            	sll	a
 719  0021 5a            	decw	x
 720  0022 26fc          	jrne	L04
 721  0024               L63:
 722  0024 6b02          	ld	(OFST+0,sp),a
 724                     ; 239   switch (IrqNum)
 726  0026 1e03          	ldw	x,(OFST+1,sp)
 728                     ; 329   default:
 728                     ; 330     break;
 729  0028 a30019        	cpw	x,#25
 730  002b 2405          	jruge	L24
 731  002d 58            	sllw	x
 732  002e de0032        	ldw	x,(L44,x)
 733  0031 fc            	jp	(x)
 734  0032               L24:
 735  0032 207c          	jra	L162
 736  0034               L502:
 737                     ; 241   case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 737                     ; 242   case ITC_IRQ_AWU:
 737                     ; 243   case ITC_IRQ_CLK:
 737                     ; 244   case ITC_IRQ_PORTA:
 737                     ; 245     ITC->ISPR1 &= Mask;
 739  0034 c67f70        	ld	a,32624
 740  0037 1401          	and	a,(OFST-1,sp)
 741  0039 c77f70        	ld	32624,a
 742                     ; 246     ITC->ISPR1 |= NewPriority;
 744  003c c67f70        	ld	a,32624
 745  003f 1a02          	or	a,(OFST+0,sp)
 746  0041 c77f70        	ld	32624,a
 747                     ; 247     break;
 749  0044 206a          	jra	L162
 750  0046               L702:
 751                     ; 249   case ITC_IRQ_PORTB:
 751                     ; 250   case ITC_IRQ_PORTC:
 751                     ; 251   case ITC_IRQ_PORTD:
 751                     ; 252   case ITC_IRQ_PORTE:
 751                     ; 253     ITC->ISPR2 &= Mask;
 753  0046 c67f71        	ld	a,32625
 754  0049 1401          	and	a,(OFST-1,sp)
 755  004b c77f71        	ld	32625,a
 756                     ; 254     ITC->ISPR2 |= NewPriority;
 758  004e c67f71        	ld	a,32625
 759  0051 1a02          	or	a,(OFST+0,sp)
 760  0053 c77f71        	ld	32625,a
 761                     ; 255     break;
 763  0056 2058          	jra	L162
 764  0058               L112:
 765                     ; 264   case ITC_IRQ_SPI:
 765                     ; 265   case ITC_IRQ_TIM1_OVF:
 765                     ; 266     ITC->ISPR3 &= Mask;
 767  0058 c67f72        	ld	a,32626
 768  005b 1401          	and	a,(OFST-1,sp)
 769  005d c77f72        	ld	32626,a
 770                     ; 267     ITC->ISPR3 |= NewPriority;
 772  0060 c67f72        	ld	a,32626
 773  0063 1a02          	or	a,(OFST+0,sp)
 774  0065 c77f72        	ld	32626,a
 775                     ; 268     break;
 777  0068 2046          	jra	L162
 778  006a               L312:
 779                     ; 270   case ITC_IRQ_TIM1_CAPCOM:
 779                     ; 271 #if defined(STM8S903) || defined(STM8AF622x) 
 779                     ; 272   case ITC_IRQ_TIM5_OVFTRI:
 779                     ; 273   case ITC_IRQ_TIM5_CAPCOM:
 779                     ; 274 #else
 779                     ; 275   case ITC_IRQ_TIM2_OVF:
 779                     ; 276   case ITC_IRQ_TIM2_CAPCOM:
 779                     ; 277 #endif /*STM8S903 or STM8AF622x */
 779                     ; 278   case ITC_IRQ_TIM3_OVF:
 779                     ; 279     ITC->ISPR4 &= Mask;
 781  006a c67f73        	ld	a,32627
 782  006d 1401          	and	a,(OFST-1,sp)
 783  006f c77f73        	ld	32627,a
 784                     ; 280     ITC->ISPR4 |= NewPriority;
 786  0072 c67f73        	ld	a,32627
 787  0075 1a02          	or	a,(OFST+0,sp)
 788  0077 c77f73        	ld	32627,a
 789                     ; 281     break;
 791  007a 2034          	jra	L162
 792  007c               L512:
 793                     ; 283   case ITC_IRQ_TIM3_CAPCOM:
 793                     ; 284 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 793                     ; 285     defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 793                     ; 286   case ITC_IRQ_UART1_TX:
 793                     ; 287   case ITC_IRQ_UART1_RX:
 793                     ; 288 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 793                     ; 289 #if defined(STM8AF622x)
 793                     ; 290   case ITC_IRQ_UART4_TX:
 793                     ; 291   case ITC_IRQ_UART4_RX:
 793                     ; 292 #endif /*STM8AF622x */
 793                     ; 293   case ITC_IRQ_I2C:
 793                     ; 294     ITC->ISPR5 &= Mask;
 795  007c c67f74        	ld	a,32628
 796  007f 1401          	and	a,(OFST-1,sp)
 797  0081 c77f74        	ld	32628,a
 798                     ; 295     ITC->ISPR5 |= NewPriority;
 800  0084 c67f74        	ld	a,32628
 801  0087 1a02          	or	a,(OFST+0,sp)
 802  0089 c77f74        	ld	32628,a
 803                     ; 296     break;
 805  008c 2022          	jra	L162
 806  008e               L712:
 807                     ; 312   case ITC_IRQ_ADC1:
 807                     ; 313 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S903 or STM8AF626x or STM8AF622x */
 807                     ; 314     
 807                     ; 315 #if defined (STM8S903) || defined (STM8AF622x)
 807                     ; 316   case ITC_IRQ_TIM6_OVFTRI:
 807                     ; 317 #else
 807                     ; 318   case ITC_IRQ_TIM4_OVF:
 807                     ; 319 #endif /* STM8S903 or STM8AF622x */
 807                     ; 320     ITC->ISPR6 &= Mask;
 809  008e c67f75        	ld	a,32629
 810  0091 1401          	and	a,(OFST-1,sp)
 811  0093 c77f75        	ld	32629,a
 812                     ; 321     ITC->ISPR6 |= NewPriority;
 814  0096 c67f75        	ld	a,32629
 815  0099 1a02          	or	a,(OFST+0,sp)
 816  009b c77f75        	ld	32629,a
 817                     ; 322     break;
 819  009e 2010          	jra	L162
 820  00a0               L122:
 821                     ; 324   case ITC_IRQ_EEPROM_EEC:
 821                     ; 325     ITC->ISPR7 &= Mask;
 823  00a0 c67f76        	ld	a,32630
 824  00a3 1401          	and	a,(OFST-1,sp)
 825  00a5 c77f76        	ld	32630,a
 826                     ; 326     ITC->ISPR7 |= NewPriority;
 828  00a8 c67f76        	ld	a,32630
 829  00ab 1a02          	or	a,(OFST+0,sp)
 830  00ad c77f76        	ld	32630,a
 831                     ; 327     break;
 833  00b0               L322:
 834                     ; 329   default:
 834                     ; 330     break;
 836  00b0               L162:
 837                     ; 332 }
 840  00b0 5b04          	addw	sp,#4
 841  00b2 81            	ret
 854                     	xdef	_ITC_GetSoftwarePriority
 855                     	xdef	_ITC_SetSoftwarePriority
 856                     	xdef	_ITC_GetSoftIntStatus
 857                     	xdef	_ITC_DeInit
 858                     	xdef	_ITC_GetCPUCC
 877                     	end
