   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  46                     ; 53 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  46                     ; 54 {
  47                     .text:	section	.text,new
  48  0000               f_NonHandledInterrupt:
  52                     ; 58 }
  55  0000 80            	iret
  77                     ; 66 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  77                     ; 67 {
  78                     .text:	section	.text,new
  79  0000               f_TRAP_IRQHandler:
  83                     ; 71 }
  86  0000 80            	iret
 108                     ; 78 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 108                     ; 79 
 108                     ; 80 {
 109                     .text:	section	.text,new
 110  0000               f_TLI_IRQHandler:
 114                     ; 84 }
 117  0000 80            	iret
 139                     ; 91 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 139                     ; 92 {
 140                     .text:	section	.text,new
 141  0000               f_AWU_IRQHandler:
 145                     ; 96 }
 148  0000 80            	iret
 170                     ; 103 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 170                     ; 104 {
 171                     .text:	section	.text,new
 172  0000               f_CLK_IRQHandler:
 176                     ; 108 }
 179  0000 80            	iret
 202                     ; 115 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 202                     ; 116 {
 203                     .text:	section	.text,new
 204  0000               f_EXTI_PORTA_IRQHandler:
 208                     ; 120 }
 211  0000 80            	iret
 235                     ; 127 @svlreg INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 235                     ; 128 {
 236                     .text:	section	.text,new
 237  0000               f_EXTI_PORTB_IRQHandler:
 239  0000 8a            	push	cc
 240  0001 84            	pop	a
 241  0002 a4bf          	and	a,#191
 242  0004 88            	push	a
 243  0005 86            	pop	cc
 244  0006 3b0002        	push	c_x+2
 245  0009 be00          	ldw	x,c_x
 246  000b 89            	pushw	x
 247  000c 3b0002        	push	c_y+2
 248  000f be00          	ldw	x,c_y
 249  0011 89            	pushw	x
 250  0012 be02          	ldw	x,c_lreg+2
 251  0014 89            	pushw	x
 252  0015 be00          	ldw	x,c_lreg
 253  0017 89            	pushw	x
 256                     ; 132 	Buttons_ISR();	
 258  0018 cd0000        	call	_Buttons_ISR
 260                     ; 133 }
 263  001b 85            	popw	x
 264  001c bf00          	ldw	c_lreg,x
 265  001e 85            	popw	x
 266  001f bf02          	ldw	c_lreg+2,x
 267  0021 85            	popw	x
 268  0022 bf00          	ldw	c_y,x
 269  0024 320002        	pop	c_y+2
 270  0027 85            	popw	x
 271  0028 bf00          	ldw	c_x,x
 272  002a 320002        	pop	c_x+2
 273  002d 80            	iret
 297                     ; 140 @svlreg INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 297                     ; 141 {
 298                     .text:	section	.text,new
 299  0000               f_EXTI_PORTC_IRQHandler:
 301  0000 8a            	push	cc
 302  0001 84            	pop	a
 303  0002 a4bf          	and	a,#191
 304  0004 88            	push	a
 305  0005 86            	pop	cc
 306  0006 3b0002        	push	c_x+2
 307  0009 be00          	ldw	x,c_x
 308  000b 89            	pushw	x
 309  000c 3b0002        	push	c_y+2
 310  000f be00          	ldw	x,c_y
 311  0011 89            	pushw	x
 312  0012 be02          	ldw	x,c_lreg+2
 313  0014 89            	pushw	x
 314  0015 be00          	ldw	x,c_lreg
 315  0017 89            	pushw	x
 318                     ; 145 	LIS3DH_INT1_ISR();
 320  0018 cd0000        	call	_LIS3DH_INT1_ISR
 322                     ; 146 }
 325  001b 85            	popw	x
 326  001c bf00          	ldw	c_lreg,x
 327  001e 85            	popw	x
 328  001f bf02          	ldw	c_lreg+2,x
 329  0021 85            	popw	x
 330  0022 bf00          	ldw	c_y,x
 331  0024 320002        	pop	c_y+2
 332  0027 85            	popw	x
 333  0028 bf00          	ldw	c_x,x
 334  002a 320002        	pop	c_x+2
 335  002d 80            	iret
 359                     ; 153 @svlreg INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 359                     ; 154 {
 360                     .text:	section	.text,new
 361  0000               f_EXTI_PORTD_IRQHandler:
 363  0000 8a            	push	cc
 364  0001 84            	pop	a
 365  0002 a4bf          	and	a,#191
 366  0004 88            	push	a
 367  0005 86            	pop	cc
 368  0006 3b0002        	push	c_x+2
 369  0009 be00          	ldw	x,c_x
 370  000b 89            	pushw	x
 371  000c 3b0002        	push	c_y+2
 372  000f be00          	ldw	x,c_y
 373  0011 89            	pushw	x
 374  0012 be02          	ldw	x,c_lreg+2
 375  0014 89            	pushw	x
 376  0015 be00          	ldw	x,c_lreg
 377  0017 89            	pushw	x
 380                     ; 158 	LIS3DH_INT2_ISR();
 382  0018 cd0000        	call	_LIS3DH_INT2_ISR
 384                     ; 159 }
 387  001b 85            	popw	x
 388  001c bf00          	ldw	c_lreg,x
 389  001e 85            	popw	x
 390  001f bf02          	ldw	c_lreg+2,x
 391  0021 85            	popw	x
 392  0022 bf00          	ldw	c_y,x
 393  0024 320002        	pop	c_y+2
 394  0027 85            	popw	x
 395  0028 bf00          	ldw	c_x,x
 396  002a 320002        	pop	c_x+2
 397  002d 80            	iret
 420                     ; 166 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 420                     ; 167 {
 421                     .text:	section	.text,new
 422  0000               f_EXTI_PORTE_IRQHandler:
 426                     ; 171 }
 429  0000 80            	iret
 451                     ; 218 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 451                     ; 219 {
 452                     .text:	section	.text,new
 453  0000               f_SPI_IRQHandler:
 457                     ; 223 }
 460  0000 80            	iret
 483                     ; 230 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 483                     ; 231 {
 484                     .text:	section	.text,new
 485  0000               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 489                     ; 235 }
 492  0000 80            	iret
 515                     ; 242 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 515                     ; 243 {
 516                     .text:	section	.text,new
 517  0000               f_TIM1_CAP_COM_IRQHandler:
 521                     ; 247 }
 524  0000 80            	iret
 547                     ; 280  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 547                     ; 281  {
 548                     .text:	section	.text,new
 549  0000               f_TIM2_UPD_OVF_BRK_IRQHandler:
 553                     ; 285  }
 556  0000 80            	iret
 579                     ; 292  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 579                     ; 293  {
 580                     .text:	section	.text,new
 581  0000               f_TIM2_CAP_COM_IRQHandler:
 585                     ; 297  }
 588  0000 80            	iret
 611                     ; 334  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 611                     ; 335  {
 612                     .text:	section	.text,new
 613  0000               f_UART1_TX_IRQHandler:
 617                     ; 339  }
 620  0000 80            	iret
 643                     ; 346  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 643                     ; 347  {
 644                     .text:	section	.text,new
 645  0000               f_UART1_RX_IRQHandler:
 649                     ; 349  }
 652  0000 80            	iret
 674                     ; 383 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 674                     ; 384 {
 675                     .text:	section	.text,new
 676  0000               f_I2C_IRQHandler:
 680                     ; 388 }
 683  0000 80            	iret
 705                     ; 462  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 705                     ; 463  {
 706                     .text:	section	.text,new
 707  0000               f_ADC1_IRQHandler:
 711                     ; 467  }
 714  0000 80            	iret
 739                     ; 488  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 739                     ; 489  {
 740                     .text:	section	.text,new
 741  0000               f_TIM4_UPD_OVF_IRQHandler:
 743  0000 8a            	push	cc
 744  0001 84            	pop	a
 745  0002 a4bf          	and	a,#191
 746  0004 88            	push	a
 747  0005 86            	pop	cc
 748  0006 3b0002        	push	c_x+2
 749  0009 be00          	ldw	x,c_x
 750  000b 89            	pushw	x
 751  000c 3b0002        	push	c_y+2
 752  000f be00          	ldw	x,c_y
 753  0011 89            	pushw	x
 756                     ; 490 	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 758  0012 ae0001        	ldw	x,#1
 759  0015 cd0000        	call	_TIM4_ClearITPendingBit
 761                     ; 491 	if(Count_ms)
 763  0018 be00          	ldw	x,_Count_ms
 764  001a 2707          	jreq	L152
 765                     ; 493 		Count_ms--;
 767  001c be00          	ldw	x,_Count_ms
 768  001e 1d0001        	subw	x,#1
 769  0021 bf00          	ldw	_Count_ms,x
 770  0023               L152:
 771                     ; 495  }
 774  0023 85            	popw	x
 775  0024 bf00          	ldw	c_y,x
 776  0026 320002        	pop	c_y+2
 777  0029 85            	popw	x
 778  002a bf00          	ldw	c_x,x
 779  002c 320002        	pop	c_x+2
 780  002f 80            	iret
 803                     ; 503 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 803                     ; 504 {
 804                     .text:	section	.text,new
 805  0000               f_EEPROM_EEC_IRQHandler:
 809                     ; 508 }
 812  0000 80            	iret
 824                     	xref	_Buttons_ISR
 825                     	xref	_LIS3DH_INT2_ISR
 826                     	xref	_LIS3DH_INT1_ISR
 827                     	xref.b	_Count_ms
 828                     	xdef	f_EEPROM_EEC_IRQHandler
 829                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 830                     	xdef	f_ADC1_IRQHandler
 831                     	xdef	f_I2C_IRQHandler
 832                     	xdef	f_UART1_RX_IRQHandler
 833                     	xdef	f_UART1_TX_IRQHandler
 834                     	xdef	f_TIM2_CAP_COM_IRQHandler
 835                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 836                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 837                     	xdef	f_TIM1_CAP_COM_IRQHandler
 838                     	xdef	f_SPI_IRQHandler
 839                     	xdef	f_EXTI_PORTE_IRQHandler
 840                     	xdef	f_EXTI_PORTD_IRQHandler
 841                     	xdef	f_EXTI_PORTC_IRQHandler
 842                     	xdef	f_EXTI_PORTB_IRQHandler
 843                     	xdef	f_EXTI_PORTA_IRQHandler
 844                     	xdef	f_CLK_IRQHandler
 845                     	xdef	f_AWU_IRQHandler
 846                     	xdef	f_TLI_IRQHandler
 847                     	xdef	f_TRAP_IRQHandler
 848                     	xdef	f_NonHandledInterrupt
 849                     	xref	_TIM4_ClearITPendingBit
 850                     	xref.b	c_lreg
 851                     	xref.b	c_x
 852                     	xref.b	c_y
 871                     	end
