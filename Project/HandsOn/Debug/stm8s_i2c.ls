   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  45                     ; 67 void I2C_DeInit(void)
  45                     ; 68 {
  47                     .text:	section	.text,new
  48  0000               _I2C_DeInit:
  52                     ; 69   I2C->CR1 = I2C_CR1_RESET_VALUE;
  54  0000 725f5210      	clr	21008
  55                     ; 70   I2C->CR2 = I2C_CR2_RESET_VALUE;
  57  0004 725f5211      	clr	21009
  58                     ; 71   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  60  0008 725f5212      	clr	21010
  61                     ; 72   I2C->OARL = I2C_OARL_RESET_VALUE;
  63  000c 725f5213      	clr	21011
  64                     ; 73   I2C->OARH = I2C_OARH_RESET_VALUE;
  66  0010 725f5214      	clr	21012
  67                     ; 74   I2C->ITR = I2C_ITR_RESET_VALUE;
  69  0014 725f521a      	clr	21018
  70                     ; 75   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  72  0018 725f521b      	clr	21019
  73                     ; 76   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  75  001c 725f521c      	clr	21020
  76                     ; 77   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  78  0020 3502521d      	mov	21021,#2
  79                     ; 78 }
  82  0024 81            	ret
 261                     .const:	section	.text
 262  0000               L01:
 263  0000 000186a1      	dc.l	100001
 264  0004               L21:
 265  0004 000f4240      	dc.l	1000000
 266                     ; 96 void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
 266                     ; 97               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
 266                     ; 98               I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
 266                     ; 99 {
 267                     .text:	section	.text,new
 268  0000               _I2C_Init:
 270  0000 5209          	subw	sp,#9
 271       00000009      OFST:	set	9
 274                     ; 100   uint16_t result = 0x0004;
 276                     ; 101   uint16_t tmpval = 0;
 278                     ; 102   uint8_t tmpccrh = 0;
 280  0002 0f07          	clr	(OFST-2,sp)
 282                     ; 105   assert_param(IS_I2C_ACK_OK(Ack));
 284                     ; 106   assert_param(IS_I2C_ADDMODE_OK(AddMode));
 286                     ; 107   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
 288                     ; 108   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
 290                     ; 109   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
 292                     ; 110   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
 294                     ; 115   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 296  0004 c65212        	ld	a,21010
 297  0007 a4c0          	and	a,#192
 298  0009 c75212        	ld	21010,a
 299                     ; 117   I2C->FREQR |= InputClockFrequencyMHz;
 301  000c c65212        	ld	a,21010
 302  000f 1a18          	or	a,(OFST+15,sp)
 303  0011 c75212        	ld	21010,a
 304                     ; 121   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 306  0014 72115210      	bres	21008,#0
 307                     ; 124   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 309  0018 c6521c        	ld	a,21020
 310  001b a430          	and	a,#48
 311  001d c7521c        	ld	21020,a
 312                     ; 125   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 314  0020 725f521b      	clr	21019
 315                     ; 128   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 317  0024 96            	ldw	x,sp
 318  0025 1c000c        	addw	x,#OFST+3
 319  0028 cd0000        	call	c_ltor
 321  002b ae0000        	ldw	x,#L01
 322  002e cd0000        	call	c_lcmp
 324  0031 2403          	jruge	L41
 325  0033 cc00c0        	jp	L131
 326  0036               L41:
 327                     ; 131     tmpccrh = I2C_CCRH_FS;
 329  0036 a680          	ld	a,#128
 330  0038 6b07          	ld	(OFST-2,sp),a
 332                     ; 133     if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
 334  003a 1e12          	ldw	x,(OFST+9,sp)
 335  003c 2630          	jrne	L331
 336                     ; 136       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
 338  003e 96            	ldw	x,sp
 339  003f 1c000c        	addw	x,#OFST+3
 340  0042 cd0000        	call	c_ltor
 342  0045 a603          	ld	a,#3
 343  0047 cd0000        	call	c_smul
 345  004a 96            	ldw	x,sp
 346  004b 1c0001        	addw	x,#OFST-8
 347  004e cd0000        	call	c_rtol
 350  0051 7b18          	ld	a,(OFST+15,sp)
 351  0053 b703          	ld	c_lreg+3,a
 352  0055 3f02          	clr	c_lreg+2
 353  0057 3f01          	clr	c_lreg+1
 354  0059 3f00          	clr	c_lreg
 355  005b ae0004        	ldw	x,#L21
 356  005e cd0000        	call	c_lmul
 358  0061 96            	ldw	x,sp
 359  0062 1c0001        	addw	x,#OFST-8
 360  0065 cd0000        	call	c_ludv
 362  0068 be02          	ldw	x,c_lreg+2
 363  006a 1f08          	ldw	(OFST-1,sp),x
 366  006c 2034          	jra	L531
 367  006e               L331:
 368                     ; 141       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
 370  006e 96            	ldw	x,sp
 371  006f 1c000c        	addw	x,#OFST+3
 372  0072 cd0000        	call	c_ltor
 374  0075 a619          	ld	a,#25
 375  0077 cd0000        	call	c_smul
 377  007a 96            	ldw	x,sp
 378  007b 1c0001        	addw	x,#OFST-8
 379  007e cd0000        	call	c_rtol
 382  0081 7b18          	ld	a,(OFST+15,sp)
 383  0083 b703          	ld	c_lreg+3,a
 384  0085 3f02          	clr	c_lreg+2
 385  0087 3f01          	clr	c_lreg+1
 386  0089 3f00          	clr	c_lreg
 387  008b ae0004        	ldw	x,#L21
 388  008e cd0000        	call	c_lmul
 390  0091 96            	ldw	x,sp
 391  0092 1c0001        	addw	x,#OFST-8
 392  0095 cd0000        	call	c_ludv
 394  0098 be02          	ldw	x,c_lreg+2
 395  009a 1f08          	ldw	(OFST-1,sp),x
 397                     ; 143       tmpccrh |= I2C_CCRH_DUTY;
 399  009c 7b07          	ld	a,(OFST-2,sp)
 400  009e aa40          	or	a,#64
 401  00a0 6b07          	ld	(OFST-2,sp),a
 403  00a2               L531:
 404                     ; 147     if (result < (uint16_t)0x01)
 406  00a2 1e08          	ldw	x,(OFST-1,sp)
 407  00a4 2605          	jrne	L731
 408                     ; 150       result = (uint16_t)0x0001;
 410  00a6 ae0001        	ldw	x,#1
 411  00a9 1f08          	ldw	(OFST-1,sp),x
 413  00ab               L731:
 414                     ; 156     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
 416  00ab 7b18          	ld	a,(OFST+15,sp)
 417  00ad 97            	ld	xl,a
 418  00ae a603          	ld	a,#3
 419  00b0 42            	mul	x,a
 420  00b1 a60a          	ld	a,#10
 421  00b3 cd0000        	call	c_sdivx
 423  00b6 5c            	incw	x
 424  00b7 1f05          	ldw	(OFST-4,sp),x
 426                     ; 157     I2C->TRISER = (uint8_t)tmpval;
 428  00b9 7b06          	ld	a,(OFST-3,sp)
 429  00bb c7521d        	ld	21021,a
 431  00be 2043          	jra	L141
 432  00c0               L131:
 433                     ; 164     result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
 435  00c0 96            	ldw	x,sp
 436  00c1 1c000c        	addw	x,#OFST+3
 437  00c4 cd0000        	call	c_ltor
 439  00c7 3803          	sll	c_lreg+3
 440  00c9 3902          	rlc	c_lreg+2
 441  00cb 3901          	rlc	c_lreg+1
 442  00cd 3900          	rlc	c_lreg
 443  00cf 96            	ldw	x,sp
 444  00d0 1c0001        	addw	x,#OFST-8
 445  00d3 cd0000        	call	c_rtol
 448  00d6 7b18          	ld	a,(OFST+15,sp)
 449  00d8 b703          	ld	c_lreg+3,a
 450  00da 3f02          	clr	c_lreg+2
 451  00dc 3f01          	clr	c_lreg+1
 452  00de 3f00          	clr	c_lreg
 453  00e0 ae0004        	ldw	x,#L21
 454  00e3 cd0000        	call	c_lmul
 456  00e6 96            	ldw	x,sp
 457  00e7 1c0001        	addw	x,#OFST-8
 458  00ea cd0000        	call	c_ludv
 460  00ed be02          	ldw	x,c_lreg+2
 461  00ef 1f08          	ldw	(OFST-1,sp),x
 463                     ; 167     if (result < (uint16_t)0x0004)
 465  00f1 1e08          	ldw	x,(OFST-1,sp)
 466  00f3 a30004        	cpw	x,#4
 467  00f6 2405          	jruge	L341
 468                     ; 170       result = (uint16_t)0x0004;
 470  00f8 ae0004        	ldw	x,#4
 471  00fb 1f08          	ldw	(OFST-1,sp),x
 473  00fd               L341:
 474                     ; 176     I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
 476  00fd 7b18          	ld	a,(OFST+15,sp)
 477  00ff 4c            	inc	a
 478  0100 c7521d        	ld	21021,a
 479  0103               L141:
 480                     ; 181   I2C->CCRL = (uint8_t)result;
 482  0103 7b09          	ld	a,(OFST+0,sp)
 483  0105 c7521b        	ld	21019,a
 484                     ; 182   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 486  0108 7b08          	ld	a,(OFST-1,sp)
 487  010a a40f          	and	a,#15
 488  010c 1a07          	or	a,(OFST-2,sp)
 489  010e c7521c        	ld	21020,a
 490                     ; 185   I2C->CR1 |= I2C_CR1_PE;
 492  0111 72105210      	bset	21008,#0
 493                     ; 188   I2C_AcknowledgeConfig(Ack);
 495  0115 1e14          	ldw	x,(OFST+11,sp)
 496  0117 cd0000        	call	_I2C_AcknowledgeConfig
 498                     ; 191   I2C->OARL = (uint8_t)(OwnAddress);
 500  011a 7b11          	ld	a,(OFST+8,sp)
 501  011c c75213        	ld	21011,a
 502                     ; 192   I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
 502                     ; 193                    (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
 504  011f 1e10          	ldw	x,(OFST+7,sp)
 505  0121 4f            	clr	a
 506  0122 01            	rrwa	x,a
 507  0123 48            	sll	a
 508  0124 59            	rlcw	x
 509  0125 01            	rrwa	x,a
 510  0126 a406          	and	a,#6
 511  0128 5f            	clrw	x
 512  0129 6b04          	ld	(OFST-5,sp),a
 514  012b 7b17          	ld	a,(OFST+14,sp)
 515  012d aa40          	or	a,#64
 516  012f 1a04          	or	a,(OFST-5,sp)
 517  0131 c75214        	ld	21012,a
 518                     ; 194 }
 521  0134 5b09          	addw	sp,#9
 522  0136 81            	ret
 577                     ; 202 void I2C_Cmd(FunctionalState NewState)
 577                     ; 203 {
 578                     .text:	section	.text,new
 579  0000               _I2C_Cmd:
 583                     ; 205   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 585                     ; 207   if (NewState != DISABLE)
 587  0000 a30000        	cpw	x,#0
 588  0003 2706          	jreq	L371
 589                     ; 210     I2C->CR1 |= I2C_CR1_PE;
 591  0005 72105210      	bset	21008,#0
 593  0009 2004          	jra	L571
 594  000b               L371:
 595                     ; 215     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 597  000b 72115210      	bres	21008,#0
 598  000f               L571:
 599                     ; 217 }
 602  000f 81            	ret
 637                     ; 225 void I2C_GeneralCallCmd(FunctionalState NewState)
 637                     ; 226 {
 638                     .text:	section	.text,new
 639  0000               _I2C_GeneralCallCmd:
 643                     ; 228   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 645                     ; 230   if (NewState != DISABLE)
 647  0000 a30000        	cpw	x,#0
 648  0003 2706          	jreq	L512
 649                     ; 233     I2C->CR1 |= I2C_CR1_ENGC;
 651  0005 721c5210      	bset	21008,#6
 653  0009 2004          	jra	L712
 654  000b               L512:
 655                     ; 238     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 657  000b 721d5210      	bres	21008,#6
 658  000f               L712:
 659                     ; 240 }
 662  000f 81            	ret
 697                     ; 250 void I2C_GenerateSTART(FunctionalState NewState)
 697                     ; 251 {
 698                     .text:	section	.text,new
 699  0000               _I2C_GenerateSTART:
 703                     ; 253   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 705                     ; 255   if (NewState != DISABLE)
 707  0000 a30000        	cpw	x,#0
 708  0003 2706          	jreq	L732
 709                     ; 258     I2C->CR2 |= I2C_CR2_START;
 711  0005 72105211      	bset	21009,#0
 713  0009 2004          	jra	L142
 714  000b               L732:
 715                     ; 263     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 717  000b 72115211      	bres	21009,#0
 718  000f               L142:
 719                     ; 265 }
 722  000f 81            	ret
 757                     ; 273 void I2C_GenerateSTOP(FunctionalState NewState)
 757                     ; 274 {
 758                     .text:	section	.text,new
 759  0000               _I2C_GenerateSTOP:
 763                     ; 276   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 765                     ; 278   if (NewState != DISABLE)
 767  0000 a30000        	cpw	x,#0
 768  0003 2706          	jreq	L162
 769                     ; 281     I2C->CR2 |= I2C_CR2_STOP;
 771  0005 72125211      	bset	21009,#1
 773  0009 2004          	jra	L362
 774  000b               L162:
 775                     ; 286     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 777  000b 72135211      	bres	21009,#1
 778  000f               L362:
 779                     ; 288 }
 782  000f 81            	ret
 818                     ; 296 void I2C_SoftwareResetCmd(FunctionalState NewState)
 818                     ; 297 {
 819                     .text:	section	.text,new
 820  0000               _I2C_SoftwareResetCmd:
 824                     ; 299   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 826                     ; 301   if (NewState != DISABLE)
 828  0000 a30000        	cpw	x,#0
 829  0003 2706          	jreq	L303
 830                     ; 304     I2C->CR2 |= I2C_CR2_SWRST;
 832  0005 721e5211      	bset	21009,#7
 834  0009 2004          	jra	L503
 835  000b               L303:
 836                     ; 309     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
 838  000b 721f5211      	bres	21009,#7
 839  000f               L503:
 840                     ; 311 }
 843  000f 81            	ret
 879                     ; 320 void I2C_StretchClockCmd(FunctionalState NewState)
 879                     ; 321 {
 880                     .text:	section	.text,new
 881  0000               _I2C_StretchClockCmd:
 885                     ; 323   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 887                     ; 325   if (NewState != DISABLE)
 889  0000 a30000        	cpw	x,#0
 890  0003 2706          	jreq	L523
 891                     ; 328     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
 893  0005 721f5210      	bres	21008,#7
 895  0009 2004          	jra	L723
 896  000b               L523:
 897                     ; 334     I2C->CR1 |= I2C_CR1_NOSTRETCH;
 899  000b 721e5210      	bset	21008,#7
 900  000f               L723:
 901                     ; 336 }
 904  000f 81            	ret
 940                     ; 345 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
 940                     ; 346 {
 941                     .text:	section	.text,new
 942  0000               _I2C_AcknowledgeConfig:
 944  0000 89            	pushw	x
 945       00000000      OFST:	set	0
 948                     ; 348   assert_param(IS_I2C_ACK_OK(Ack));
 950                     ; 350   if (Ack == I2C_ACK_NONE)
 952  0001 a30000        	cpw	x,#0
 953  0004 2606          	jrne	L743
 954                     ; 353     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
 956  0006 72155211      	bres	21009,#2
 958  000a 2015          	jra	L153
 959  000c               L743:
 960                     ; 358     I2C->CR2 |= I2C_CR2_ACK;
 962  000c 72145211      	bset	21009,#2
 963                     ; 360     if (Ack == I2C_ACK_CURR)
 965  0010 1e01          	ldw	x,(OFST+1,sp)
 966  0012 a30001        	cpw	x,#1
 967  0015 2606          	jrne	L353
 968                     ; 363       I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
 970  0017 72175211      	bres	21009,#3
 972  001b 2004          	jra	L153
 973  001d               L353:
 974                     ; 368       I2C->CR2 |= I2C_CR2_POS;
 976  001d 72165211      	bset	21009,#3
 977  0021               L153:
 978                     ; 371 }
 981  0021 85            	popw	x
 982  0022 81            	ret
1054                     ; 381 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1054                     ; 382 {
1055                     .text:	section	.text,new
1056  0000               _I2C_ITConfig:
1058  0000 89            	pushw	x
1059       00000000      OFST:	set	0
1062                     ; 384   assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
1064                     ; 385   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1066                     ; 387   if (NewState != DISABLE)
1068  0001 1e05          	ldw	x,(OFST+5,sp)
1069  0003 270a          	jreq	L314
1070                     ; 390     I2C->ITR |= (uint8_t)I2C_IT;
1072  0005 c6521a        	ld	a,21018
1073  0008 1a02          	or	a,(OFST+2,sp)
1074  000a c7521a        	ld	21018,a
1076  000d 2009          	jra	L514
1077  000f               L314:
1078                     ; 395     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1080  000f 7b02          	ld	a,(OFST+2,sp)
1081  0011 43            	cpl	a
1082  0012 c4521a        	and	a,21018
1083  0015 c7521a        	ld	21018,a
1084  0018               L514:
1085                     ; 397 }
1088  0018 85            	popw	x
1089  0019 81            	ret
1125                     ; 405 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1125                     ; 406 {
1126                     .text:	section	.text,new
1127  0000               _I2C_FastModeDutyCycleConfig:
1131                     ; 408   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
1133                     ; 410   if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
1135  0000 a30040        	cpw	x,#64
1136  0003 2606          	jrne	L534
1137                     ; 413     I2C->CCRH |= I2C_CCRH_DUTY;
1139  0005 721c521c      	bset	21020,#6
1141  0009 2004          	jra	L734
1142  000b               L534:
1143                     ; 418     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1145  000b 721d521c      	bres	21020,#6
1146  000f               L734:
1147                     ; 420 }
1150  000f 81            	ret
1173                     ; 427 uint8_t I2C_ReceiveData(void)
1173                     ; 428 {
1174                     .text:	section	.text,new
1175  0000               _I2C_ReceiveData:
1179                     ; 430   return ((uint8_t)I2C->DR);
1181  0000 c65216        	ld	a,21014
1184  0003 81            	ret
1249                     ; 440 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
1249                     ; 441 {
1250                     .text:	section	.text,new
1251  0000               _I2C_Send7bitAddress:
1253  0000 88            	push	a
1254       00000000      OFST:	set	0
1257                     ; 443   assert_param(IS_I2C_ADDRESS_OK(Address));
1259                     ; 444   assert_param(IS_I2C_DIRECTION_OK(Direction));
1261                     ; 447   Address &= (uint8_t)0xFE;
1263  0001 7b01          	ld	a,(OFST+1,sp)
1264  0003 a4fe          	and	a,#254
1265  0005 6b01          	ld	(OFST+1,sp),a
1266                     ; 450   I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
1268  0007 7b05          	ld	a,(OFST+5,sp)
1269  0009 1a01          	or	a,(OFST+1,sp)
1270  000b c75216        	ld	21014,a
1271                     ; 451 }
1274  000e 84            	pop	a
1275  000f 81            	ret
1309                     ; 458 void I2C_SendData(uint8_t Data)
1309                     ; 459 {
1310                     .text:	section	.text,new
1311  0000               _I2C_SendData:
1315                     ; 461   I2C->DR = Data;
1317  0000 c75216        	ld	21014,a
1318                     ; 462 }
1321  0003 81            	ret
1545                     ; 578 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1545                     ; 579 {
1546                     .text:	section	.text,new
1547  0000               _I2C_CheckEvent:
1549  0000 89            	pushw	x
1550  0001 5208          	subw	sp,#8
1551       00000008      OFST:	set	8
1554                     ; 580   __IO uint16_t lastevent = 0x00;
1556  0003 5f            	clrw	x
1557  0004 1f05          	ldw	(OFST-3,sp),x
1559                     ; 581   uint8_t flag1 = 0x00 ;
1561                     ; 582   uint8_t flag2 = 0x00;
1563                     ; 583   ErrorStatus status = ERROR;
1565                     ; 586   assert_param(IS_I2C_EVENT_OK(I2C_Event));
1567                     ; 588   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1569  0006 1e09          	ldw	x,(OFST+1,sp)
1570  0008 a30004        	cpw	x,#4
1571  000b 260b          	jrne	L136
1572                     ; 590     lastevent = I2C->SR2 & I2C_SR2_AF;
1574  000d c65218        	ld	a,21016
1575  0010 a404          	and	a,#4
1576  0012 5f            	clrw	x
1577  0013 97            	ld	xl,a
1578  0014 1f05          	ldw	(OFST-3,sp),x
1581  0016 201f          	jra	L336
1582  0018               L136:
1583                     ; 594     flag1 = I2C->SR1;
1585  0018 c65217        	ld	a,21015
1586  001b 6b03          	ld	(OFST-5,sp),a
1588                     ; 595     flag2 = I2C->SR3;
1590  001d c65219        	ld	a,21017
1591  0020 6b04          	ld	(OFST-4,sp),a
1593                     ; 596     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
1595  0022 7b03          	ld	a,(OFST-5,sp)
1596  0024 5f            	clrw	x
1597  0025 97            	ld	xl,a
1598  0026 1f01          	ldw	(OFST-7,sp),x
1600  0028 7b04          	ld	a,(OFST-4,sp)
1601  002a 5f            	clrw	x
1602  002b 97            	ld	xl,a
1603  002c 4f            	clr	a
1604  002d 02            	rlwa	x,a
1605  002e 01            	rrwa	x,a
1606  002f 1a02          	or	a,(OFST-6,sp)
1607  0031 01            	rrwa	x,a
1608  0032 1a01          	or	a,(OFST-7,sp)
1609  0034 01            	rrwa	x,a
1610  0035 1f05          	ldw	(OFST-3,sp),x
1612  0037               L336:
1613                     ; 599   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
1615  0037 1e09          	ldw	x,(OFST+1,sp)
1616  0039 01            	rrwa	x,a
1617  003a 1406          	and	a,(OFST-2,sp)
1618  003c 01            	rrwa	x,a
1619  003d 1405          	and	a,(OFST-3,sp)
1620  003f 01            	rrwa	x,a
1621  0040 1309          	cpw	x,(OFST+1,sp)
1622  0042 2607          	jrne	L536
1623                     ; 602     status = SUCCESS;
1625  0044 ae0001        	ldw	x,#1
1626  0047 1f07          	ldw	(OFST-1,sp),x
1629  0049 2003          	jra	L736
1630  004b               L536:
1631                     ; 607     status = ERROR;
1633  004b 5f            	clrw	x
1634  004c 1f07          	ldw	(OFST-1,sp),x
1636  004e               L736:
1637                     ; 611   return status;
1639  004e 1e07          	ldw	x,(OFST-1,sp)
1642  0050 5b0a          	addw	sp,#10
1643  0052 81            	ret
1696                     ; 628 I2C_Event_TypeDef I2C_GetLastEvent(void)
1696                     ; 629 {
1697                     .text:	section	.text,new
1698  0000               _I2C_GetLastEvent:
1700  0000 5206          	subw	sp,#6
1701       00000006      OFST:	set	6
1704                     ; 630   __IO uint16_t lastevent = 0;
1706  0002 5f            	clrw	x
1707  0003 1f05          	ldw	(OFST-1,sp),x
1709                     ; 631   uint16_t flag1 = 0;
1711                     ; 632   uint16_t flag2 = 0;
1713                     ; 634   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
1715  0005 c65218        	ld	a,21016
1716  0008 a504          	bcp	a,#4
1717  000a 2707          	jreq	L766
1718                     ; 636     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
1720  000c ae0004        	ldw	x,#4
1721  000f 1f05          	ldw	(OFST-1,sp),x
1724  0011 201b          	jra	L176
1725  0013               L766:
1726                     ; 641     flag1 = I2C->SR1;
1728  0013 c65217        	ld	a,21015
1729  0016 5f            	clrw	x
1730  0017 97            	ld	xl,a
1731  0018 1f01          	ldw	(OFST-5,sp),x
1733                     ; 642     flag2 = I2C->SR3;
1735  001a c65219        	ld	a,21017
1736  001d 5f            	clrw	x
1737  001e 97            	ld	xl,a
1738  001f 1f03          	ldw	(OFST-3,sp),x
1740                     ; 645     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
1742  0021 1e03          	ldw	x,(OFST-3,sp)
1743  0023 4f            	clr	a
1744  0024 02            	rlwa	x,a
1745  0025 01            	rrwa	x,a
1746  0026 1a02          	or	a,(OFST-4,sp)
1747  0028 01            	rrwa	x,a
1748  0029 1a01          	or	a,(OFST-5,sp)
1749  002b 01            	rrwa	x,a
1750  002c 1f05          	ldw	(OFST-1,sp),x
1752  002e               L176:
1753                     ; 648   return (I2C_Event_TypeDef)lastevent;
1755  002e 1e05          	ldw	x,(OFST-1,sp)
1758  0030 5b06          	addw	sp,#6
1759  0032 81            	ret
1974                     ; 679 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
1974                     ; 680 {
1975                     .text:	section	.text,new
1976  0000               _I2C_GetFlagStatus:
1978  0000 89            	pushw	x
1979  0001 5204          	subw	sp,#4
1980       00000004      OFST:	set	4
1983                     ; 681   uint8_t tempreg = 0;
1985  0003 0f04          	clr	(OFST+0,sp)
1987                     ; 682   uint8_t regindex = 0;
1989                     ; 683   FlagStatus bitstatus = RESET;
1991                     ; 686   assert_param(IS_I2C_FLAG_OK(I2C_Flag));
1993                     ; 689   regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
1995  0005 4f            	clr	a
1996  0006 01            	rrwa	x,a
1997  0007 9f            	ld	a,xl
1998  0008 6b01          	ld	(OFST-3,sp),a
2000                     ; 691   switch (regindex)
2002  000a 7b01          	ld	a,(OFST-3,sp)
2004                     ; 708     default:
2004                     ; 709       break;
2005  000c 4a            	dec	a
2006  000d 2708          	jreq	L376
2007  000f 4a            	dec	a
2008  0010 270c          	jreq	L576
2009  0012 4a            	dec	a
2010  0013 2710          	jreq	L776
2011  0015 2013          	jra	L3101
2012  0017               L376:
2013                     ; 694     case 0x01:
2013                     ; 695       tempreg = (uint8_t)I2C->SR1;
2015  0017 c65217        	ld	a,21015
2016  001a 6b04          	ld	(OFST+0,sp),a
2018                     ; 696       break;
2020  001c 200c          	jra	L3101
2021  001e               L576:
2022                     ; 699     case 0x02:
2022                     ; 700       tempreg = (uint8_t)I2C->SR2;
2024  001e c65218        	ld	a,21016
2025  0021 6b04          	ld	(OFST+0,sp),a
2027                     ; 701       break;
2029  0023 2005          	jra	L3101
2030  0025               L776:
2031                     ; 704     case 0x03:
2031                     ; 705       tempreg = (uint8_t)I2C->SR3;
2033  0025 c65219        	ld	a,21017
2034  0028 6b04          	ld	(OFST+0,sp),a
2036                     ; 706       break;
2038  002a               L107:
2039                     ; 708     default:
2039                     ; 709       break;
2041  002a               L3101:
2042                     ; 713   if ((tempreg & (uint8_t)I2C_Flag ) != 0)
2044  002a 7b06          	ld	a,(OFST+2,sp)
2045  002c 1504          	bcp	a,(OFST+0,sp)
2046  002e 2707          	jreq	L5101
2047                     ; 716     bitstatus = SET;
2049  0030 ae0001        	ldw	x,#1
2050  0033 1f02          	ldw	(OFST-2,sp),x
2053  0035 2003          	jra	L7101
2054  0037               L5101:
2055                     ; 721     bitstatus = RESET;
2057  0037 5f            	clrw	x
2058  0038 1f02          	ldw	(OFST-2,sp),x
2060  003a               L7101:
2061                     ; 724   return bitstatus;
2063  003a 1e02          	ldw	x,(OFST-2,sp)
2066  003c 5b06          	addw	sp,#6
2067  003e 81            	ret
2111                     ; 759 void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
2111                     ; 760 {
2112                     .text:	section	.text,new
2113  0000               _I2C_ClearFlag:
2115  0000 89            	pushw	x
2116       00000002      OFST:	set	2
2119                     ; 761   uint16_t flagpos = 0;
2121                     ; 763   assert_param(IS_I2C_CLEAR_FLAG_OK(I2C_FLAG));
2123                     ; 766   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2125  0001 01            	rrwa	x,a
2126  0002 a4ff          	and	a,#255
2127  0004 5f            	clrw	x
2128  0005 02            	rlwa	x,a
2129  0006 1f01          	ldw	(OFST-1,sp),x
2130  0008 01            	rrwa	x,a
2132                     ; 768   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2134  0009 7b02          	ld	a,(OFST+0,sp)
2135  000b 43            	cpl	a
2136  000c c75218        	ld	21016,a
2137                     ; 769 }
2140  000f 85            	popw	x
2141  0010 81            	ret
2307                     ; 791 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2307                     ; 792 {
2308                     .text:	section	.text,new
2309  0000               _I2C_GetITStatus:
2311  0000 89            	pushw	x
2312  0001 5203          	subw	sp,#3
2313       00000003      OFST:	set	3
2316                     ; 793   ITStatus bitstatus = RESET;
2318                     ; 794   __IO uint8_t enablestatus = 0;
2320  0003 0f01          	clr	(OFST-2,sp)
2322                     ; 795   uint16_t tempregister = 0;
2324                     ; 798     assert_param(IS_I2C_ITPENDINGBIT_OK(I2C_ITPendingBit));
2326                     ; 800   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
2328  0005 4f            	clr	a
2329  0006 01            	rrwa	x,a
2330  0007 01            	rrwa	x,a
2331  0008 a407          	and	a,#7
2332  000a 5f            	clrw	x
2333  000b 5f            	clrw	x
2334  000c 97            	ld	xl,a
2335  000d 1f02          	ldw	(OFST-1,sp),x
2337                     ; 803   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2339  000f c6521a        	ld	a,21018
2340  0012 1403          	and	a,(OFST+0,sp)
2341  0014 6b01          	ld	(OFST-2,sp),a
2343                     ; 805   if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
2345  0016 7b04          	ld	a,(OFST+1,sp)
2346  0018 97            	ld	xl,a
2347  0019 7b05          	ld	a,(OFST+2,sp)
2348  001b 9f            	ld	a,xl
2349  001c a430          	and	a,#48
2350  001e 97            	ld	xl,a
2351  001f 4f            	clr	a
2352  0020 02            	rlwa	x,a
2353  0021 a30100        	cpw	x,#256
2354  0024 2617          	jrne	L1311
2355                     ; 808     if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2357  0026 c65217        	ld	a,21015
2358  0029 1505          	bcp	a,(OFST+2,sp)
2359  002b 270b          	jreq	L3311
2361  002d 0d01          	tnz	(OFST-2,sp)
2362  002f 2707          	jreq	L3311
2363                     ; 811       bitstatus = SET;
2365  0031 ae0001        	ldw	x,#1
2366  0034 1f02          	ldw	(OFST-1,sp),x
2369  0036 201a          	jra	L7311
2370  0038               L3311:
2371                     ; 816       bitstatus = RESET;
2373  0038 5f            	clrw	x
2374  0039 1f02          	ldw	(OFST-1,sp),x
2376  003b 2015          	jra	L7311
2377  003d               L1311:
2378                     ; 822     if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2380  003d c65218        	ld	a,21016
2381  0040 1505          	bcp	a,(OFST+2,sp)
2382  0042 270b          	jreq	L1411
2384  0044 0d01          	tnz	(OFST-2,sp)
2385  0046 2707          	jreq	L1411
2386                     ; 825       bitstatus = SET;
2388  0048 ae0001        	ldw	x,#1
2389  004b 1f02          	ldw	(OFST-1,sp),x
2392  004d 2003          	jra	L7311
2393  004f               L1411:
2394                     ; 830       bitstatus = RESET;
2396  004f 5f            	clrw	x
2397  0050 1f02          	ldw	(OFST-1,sp),x
2399  0052               L7311:
2400                     ; 834   return  bitstatus;
2402  0052 1e02          	ldw	x,(OFST-1,sp)
2405  0054 5b05          	addw	sp,#5
2406  0056 81            	ret
2451                     ; 871 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2451                     ; 872 {
2452                     .text:	section	.text,new
2453  0000               _I2C_ClearITPendingBit:
2455  0000 89            	pushw	x
2456       00000002      OFST:	set	2
2459                     ; 873   uint16_t flagpos = 0;
2461                     ; 876   assert_param(IS_I2C_CLEAR_ITPENDINGBIT_OK(I2C_ITPendingBit));
2463                     ; 879   flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
2465  0001 01            	rrwa	x,a
2466  0002 a4ff          	and	a,#255
2467  0004 5f            	clrw	x
2468  0005 02            	rlwa	x,a
2469  0006 1f01          	ldw	(OFST-1,sp),x
2470  0008 01            	rrwa	x,a
2472                     ; 882   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
2474  0009 7b02          	ld	a,(OFST+0,sp)
2475  000b 43            	cpl	a
2476  000c c75218        	ld	21016,a
2477                     ; 883 }
2480  000f 85            	popw	x
2481  0010 81            	ret
2494                     	xdef	_I2C_ClearITPendingBit
2495                     	xdef	_I2C_GetITStatus
2496                     	xdef	_I2C_ClearFlag
2497                     	xdef	_I2C_GetFlagStatus
2498                     	xdef	_I2C_GetLastEvent
2499                     	xdef	_I2C_CheckEvent
2500                     	xdef	_I2C_SendData
2501                     	xdef	_I2C_Send7bitAddress
2502                     	xdef	_I2C_ReceiveData
2503                     	xdef	_I2C_ITConfig
2504                     	xdef	_I2C_FastModeDutyCycleConfig
2505                     	xdef	_I2C_AcknowledgeConfig
2506                     	xdef	_I2C_StretchClockCmd
2507                     	xdef	_I2C_SoftwareResetCmd
2508                     	xdef	_I2C_GenerateSTOP
2509                     	xdef	_I2C_GenerateSTART
2510                     	xdef	_I2C_GeneralCallCmd
2511                     	xdef	_I2C_Cmd
2512                     	xdef	_I2C_Init
2513                     	xdef	_I2C_DeInit
2514                     	xref.b	c_lreg
2515                     	xref.b	c_x
2534                     	xref	c_sdivx
2535                     	xref	c_ludv
2536                     	xref	c_rtol
2537                     	xref	c_smul
2538                     	xref	c_lmul
2539                     	xref	c_lcmp
2540                     	xref	c_ltor
2541                     	end
