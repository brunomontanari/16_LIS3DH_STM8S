   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  45                     ; 53 void EXTI_DeInit(void)
  45                     ; 54 {
  47                     .text:	section	.text,new
  48  0000               _EXTI_DeInit:
  52                     ; 55   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  54  0000 725f50a0      	clr	20640
  55                     ; 56   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  57  0004 725f50a1      	clr	20641
  58                     ; 57 }
  61  0008 81            	ret
 186                     ; 70 void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
 186                     ; 71 {
 187                     .text:	section	.text,new
 188  0000               _EXTI_SetExtIntSensitivity:
 190  0000 89            	pushw	x
 191       00000000      OFST:	set	0
 194                     ; 73   assert_param(IS_EXTI_PORT_OK(Port));
 196                     ; 74   assert_param(IS_EXTI_SENSITIVITY_OK(SensitivityValue));
 198                     ; 77   switch (Port)
 201                     ; 99   default:
 201                     ; 100     break;
 202  0001 5d            	tnzw	x
 203  0002 270e          	jreq	L12
 204  0004 5a            	decw	x
 205  0005 271d          	jreq	L32
 206  0007 5a            	decw	x
 207  0008 272e          	jreq	L52
 208  000a 5a            	decw	x
 209  000b 2742          	jreq	L72
 210  000d 5a            	decw	x
 211  000e 2756          	jreq	L13
 212  0010 2064          	jra	L311
 213  0012               L12:
 214                     ; 79   case EXTI_PORT_GPIOA:
 214                     ; 80     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
 216  0012 c650a0        	ld	a,20640
 217  0015 a4fc          	and	a,#252
 218  0017 c750a0        	ld	20640,a
 219                     ; 81     EXTI->CR1 |= (uint8_t)(SensitivityValue);
 221  001a c650a0        	ld	a,20640
 222  001d 1a06          	or	a,(OFST+6,sp)
 223  001f c750a0        	ld	20640,a
 224                     ; 82     break;
 226  0022 2052          	jra	L311
 227  0024               L32:
 228                     ; 83   case EXTI_PORT_GPIOB:
 228                     ; 84     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
 230  0024 c650a0        	ld	a,20640
 231  0027 a4f3          	and	a,#243
 232  0029 c750a0        	ld	20640,a
 233                     ; 85     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
 235  002c 7b06          	ld	a,(OFST+6,sp)
 236  002e 48            	sll	a
 237  002f 48            	sll	a
 238  0030 ca50a0        	or	a,20640
 239  0033 c750a0        	ld	20640,a
 240                     ; 86     break;
 242  0036 203e          	jra	L311
 243  0038               L52:
 244                     ; 87   case EXTI_PORT_GPIOC:
 244                     ; 88     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
 246  0038 c650a0        	ld	a,20640
 247  003b a4cf          	and	a,#207
 248  003d c750a0        	ld	20640,a
 249                     ; 89     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
 251  0040 7b06          	ld	a,(OFST+6,sp)
 252  0042 97            	ld	xl,a
 253  0043 a610          	ld	a,#16
 254  0045 42            	mul	x,a
 255  0046 9f            	ld	a,xl
 256  0047 ca50a0        	or	a,20640
 257  004a c750a0        	ld	20640,a
 258                     ; 90     break;
 260  004d 2027          	jra	L311
 261  004f               L72:
 262                     ; 91   case EXTI_PORT_GPIOD:
 262                     ; 92     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
 264  004f c650a0        	ld	a,20640
 265  0052 a43f          	and	a,#63
 266  0054 c750a0        	ld	20640,a
 267                     ; 93     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
 269  0057 7b06          	ld	a,(OFST+6,sp)
 270  0059 97            	ld	xl,a
 271  005a a640          	ld	a,#64
 272  005c 42            	mul	x,a
 273  005d 9f            	ld	a,xl
 274  005e ca50a0        	or	a,20640
 275  0061 c750a0        	ld	20640,a
 276                     ; 94     break;
 278  0064 2010          	jra	L311
 279  0066               L13:
 280                     ; 95   case EXTI_PORT_GPIOE:
 280                     ; 96     EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
 282  0066 c650a1        	ld	a,20641
 283  0069 a4fc          	and	a,#252
 284  006b c750a1        	ld	20641,a
 285                     ; 97     EXTI->CR2 |= (uint8_t)(SensitivityValue);
 287  006e c650a1        	ld	a,20641
 288  0071 1a06          	or	a,(OFST+6,sp)
 289  0073 c750a1        	ld	20641,a
 290                     ; 98     break;
 292  0076               L33:
 293                     ; 99   default:
 293                     ; 100     break;
 295  0076               L311:
 296                     ; 102 }
 299  0076 85            	popw	x
 300  0077 81            	ret
 358                     ; 111 void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
 358                     ; 112 {
 359                     .text:	section	.text,new
 360  0000               _EXTI_SetTLISensitivity:
 364                     ; 114   assert_param(IS_EXTI_TLISENSITIVITY_OK(SensitivityValue));
 366                     ; 117   EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
 368  0000 721550a1      	bres	20641,#2
 369                     ; 118   EXTI->CR2 |= (uint8_t)(SensitivityValue);
 371  0004 9f            	ld	a,xl
 372  0005 ca50a1        	or	a,20641
 373  0008 c750a1        	ld	20641,a
 374                     ; 119 }
 377  000b 81            	ret
 423                     ; 126 EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
 423                     ; 127 {
 424                     .text:	section	.text,new
 425  0000               _EXTI_GetExtIntSensitivity:
 427  0000 88            	push	a
 428       00000001      OFST:	set	1
 431                     ; 128   uint8_t value = 0;
 433  0001 0f01          	clr	(OFST+0,sp)
 435                     ; 131   assert_param(IS_EXTI_PORT_OK(Port));
 437                     ; 133   switch (Port)
 440                     ; 150   default:
 440                     ; 151     break;
 441  0003 5d            	tnzw	x
 442  0004 270e          	jreq	L341
 443  0006 5a            	decw	x
 444  0007 2714          	jreq	L541
 445  0009 5a            	decw	x
 446  000a 271c          	jreq	L741
 447  000c 5a            	decw	x
 448  000d 2725          	jreq	L151
 449  000f 5a            	decw	x
 450  0010 2730          	jreq	L351
 451  0012 2035          	jra	L302
 452  0014               L341:
 453                     ; 135   case EXTI_PORT_GPIOA:
 453                     ; 136     value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
 455  0014 c650a0        	ld	a,20640
 456  0017 a403          	and	a,#3
 457  0019 6b01          	ld	(OFST+0,sp),a
 459                     ; 137     break;
 461  001b 202c          	jra	L302
 462  001d               L541:
 463                     ; 138   case EXTI_PORT_GPIOB:
 463                     ; 139     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
 465  001d c650a0        	ld	a,20640
 466  0020 a40c          	and	a,#12
 467  0022 44            	srl	a
 468  0023 44            	srl	a
 469  0024 6b01          	ld	(OFST+0,sp),a
 471                     ; 140     break;
 473  0026 2021          	jra	L302
 474  0028               L741:
 475                     ; 141   case EXTI_PORT_GPIOC:
 475                     ; 142     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
 477  0028 c650a0        	ld	a,20640
 478  002b a430          	and	a,#48
 479  002d 4e            	swap	a
 480  002e a40f          	and	a,#15
 481  0030 6b01          	ld	(OFST+0,sp),a
 483                     ; 143     break;
 485  0032 2015          	jra	L302
 486  0034               L151:
 487                     ; 144   case EXTI_PORT_GPIOD:
 487                     ; 145     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
 489  0034 c650a0        	ld	a,20640
 490  0037 a4c0          	and	a,#192
 491  0039 4e            	swap	a
 492  003a 44            	srl	a
 493  003b 44            	srl	a
 494  003c a403          	and	a,#3
 495  003e 6b01          	ld	(OFST+0,sp),a
 497                     ; 146     break;
 499  0040 2007          	jra	L302
 500  0042               L351:
 501                     ; 147   case EXTI_PORT_GPIOE:
 501                     ; 148     value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
 503  0042 c650a1        	ld	a,20641
 504  0045 a403          	and	a,#3
 505  0047 6b01          	ld	(OFST+0,sp),a
 507                     ; 149     break;
 509  0049               L551:
 510                     ; 150   default:
 510                     ; 151     break;
 512  0049               L302:
 513                     ; 154   return((EXTI_Sensitivity_TypeDef)value);
 515  0049 7b01          	ld	a,(OFST+0,sp)
 516  004b 5f            	clrw	x
 517  004c 97            	ld	xl,a
 520  004d 84            	pop	a
 521  004e 81            	ret
 557                     ; 162 EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
 557                     ; 163 {
 558                     .text:	section	.text,new
 559  0000               _EXTI_GetTLISensitivity:
 561  0000 88            	push	a
 562       00000001      OFST:	set	1
 565                     ; 164   uint8_t value = 0;
 567                     ; 167   value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
 569  0001 c650a1        	ld	a,20641
 570  0004 a404          	and	a,#4
 571  0006 6b01          	ld	(OFST+0,sp),a
 573                     ; 169   return((EXTI_TLISensitivity_TypeDef)value);
 575  0008 7b01          	ld	a,(OFST+0,sp)
 576  000a 5f            	clrw	x
 577  000b 97            	ld	xl,a
 580  000c 84            	pop	a
 581  000d 81            	ret
 594                     	xdef	_EXTI_GetTLISensitivity
 595                     	xdef	_EXTI_GetExtIntSensitivity
 596                     	xdef	_EXTI_SetTLISensitivity
 597                     	xdef	_EXTI_SetExtIntSensitivity
 598                     	xdef	_EXTI_DeInit
 617                     	end
