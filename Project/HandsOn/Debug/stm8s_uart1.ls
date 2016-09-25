   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  45                     ; 53 void UART1_DeInit(void)
  45                     ; 54 {
  47                     .text:	section	.text,new
  48  0000               _UART1_DeInit:
  52                     ; 57   (void)UART1->SR;
  54  0000 c65230        	ld	a,21040
  55                     ; 58   (void)UART1->DR;
  57  0003 c65231        	ld	a,21041
  58                     ; 60   UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
  60  0006 725f5233      	clr	21043
  61                     ; 61   UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
  63  000a 725f5232      	clr	21042
  64                     ; 63   UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
  66  000e 725f5234      	clr	21044
  67                     ; 64   UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
  69  0012 725f5235      	clr	21045
  70                     ; 65   UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
  72  0016 725f5236      	clr	21046
  73                     ; 66   UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
  75  001a 725f5237      	clr	21047
  76                     ; 67   UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
  78  001e 725f5238      	clr	21048
  79                     ; 69   UART1->GTR = UART1_GTR_RESET_VALUE;
  81  0022 725f5239      	clr	21049
  82                     ; 70   UART1->PSCR = UART1_PSCR_RESET_VALUE;
  84  0026 725f523a      	clr	21050
  85                     ; 71 }
  88  002a 81            	ret
 391                     .const:	section	.text
 392  0000               L01:
 393  0000 00000064      	dc.l	100
 394                     ; 90 void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
 394                     ; 91                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
 394                     ; 92                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
 394                     ; 93 {
 395                     .text:	section	.text,new
 396  0000               _UART1_Init:
 398  0000 520c          	subw	sp,#12
 399       0000000c      OFST:	set	12
 402                     ; 94   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 406                     ; 97   assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
 408                     ; 98   assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
 410                     ; 99   assert_param(IS_UART1_STOPBITS_OK(StopBits));
 412                     ; 100   assert_param(IS_UART1_PARITY_OK(Parity));
 414                     ; 101   assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
 416                     ; 102   assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
 418                     ; 105   UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
 420  0002 72195234      	bres	21044,#4
 421                     ; 108   UART1->CR1 |= (uint8_t)WordLength;
 423  0006 c65234        	ld	a,21044
 424  0009 1a14          	or	a,(OFST+8,sp)
 425  000b c75234        	ld	21044,a
 426                     ; 111   UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
 428  000e c65236        	ld	a,21046
 429  0011 a4cf          	and	a,#207
 430  0013 c75236        	ld	21046,a
 431                     ; 113   UART1->CR3 |= (uint8_t)StopBits;  
 433  0016 c65236        	ld	a,21046
 434  0019 1a16          	or	a,(OFST+10,sp)
 435  001b c75236        	ld	21046,a
 436                     ; 116   UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
 438  001e c65234        	ld	a,21044
 439  0021 a4f9          	and	a,#249
 440  0023 c75234        	ld	21044,a
 441                     ; 118   UART1->CR1 |= (uint8_t)Parity;  
 443  0026 c65234        	ld	a,21044
 444  0029 1a18          	or	a,(OFST+12,sp)
 445  002b c75234        	ld	21044,a
 446                     ; 121   UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
 448  002e 725f5232      	clr	21042
 449                     ; 123   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
 451  0032 c65233        	ld	a,21043
 452  0035 a40f          	and	a,#15
 453  0037 c75233        	ld	21043,a
 454                     ; 125   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
 456  003a c65233        	ld	a,21043
 457  003d a4f0          	and	a,#240
 458  003f c75233        	ld	21043,a
 459                     ; 128   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 461  0042 96            	ldw	x,sp
 462  0043 1c000f        	addw	x,#OFST+3
 463  0046 cd0000        	call	c_ltor
 465  0049 a604          	ld	a,#4
 466  004b cd0000        	call	c_llsh
 468  004e 96            	ldw	x,sp
 469  004f 1c0001        	addw	x,#OFST-11
 470  0052 cd0000        	call	c_rtol
 473  0055 cd0000        	call	_CLK_GetClockFreq
 475  0058 96            	ldw	x,sp
 476  0059 1c0001        	addw	x,#OFST-11
 477  005c cd0000        	call	c_ludv
 479  005f 96            	ldw	x,sp
 480  0060 1c0009        	addw	x,#OFST-3
 481  0063 cd0000        	call	c_rtol
 484                     ; 129   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 486  0066 96            	ldw	x,sp
 487  0067 1c000f        	addw	x,#OFST+3
 488  006a cd0000        	call	c_ltor
 490  006d a604          	ld	a,#4
 491  006f cd0000        	call	c_llsh
 493  0072 96            	ldw	x,sp
 494  0073 1c0001        	addw	x,#OFST-11
 495  0076 cd0000        	call	c_rtol
 498  0079 cd0000        	call	_CLK_GetClockFreq
 500  007c a664          	ld	a,#100
 501  007e cd0000        	call	c_smul
 503  0081 96            	ldw	x,sp
 504  0082 1c0001        	addw	x,#OFST-11
 505  0085 cd0000        	call	c_ludv
 507  0088 96            	ldw	x,sp
 508  0089 1c0005        	addw	x,#OFST-7
 509  008c cd0000        	call	c_rtol
 512                     ; 131   UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
 514  008f 96            	ldw	x,sp
 515  0090 1c0009        	addw	x,#OFST-3
 516  0093 cd0000        	call	c_ltor
 518  0096 a664          	ld	a,#100
 519  0098 cd0000        	call	c_smul
 521  009b 96            	ldw	x,sp
 522  009c 1c0001        	addw	x,#OFST-11
 523  009f cd0000        	call	c_rtol
 526  00a2 96            	ldw	x,sp
 527  00a3 1c0005        	addw	x,#OFST-7
 528  00a6 cd0000        	call	c_ltor
 530  00a9 96            	ldw	x,sp
 531  00aa 1c0001        	addw	x,#OFST-11
 532  00ad cd0000        	call	c_lsub
 534  00b0 a604          	ld	a,#4
 535  00b2 cd0000        	call	c_llsh
 537  00b5 ae0000        	ldw	x,#L01
 538  00b8 cd0000        	call	c_ludv
 540  00bb b603          	ld	a,c_lreg+3
 541  00bd a40f          	and	a,#15
 542  00bf ca5233        	or	a,21043
 543  00c2 c75233        	ld	21043,a
 544                     ; 133   UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
 546  00c5 96            	ldw	x,sp
 547  00c6 1c0009        	addw	x,#OFST-3
 548  00c9 cd0000        	call	c_ltor
 550  00cc a604          	ld	a,#4
 551  00ce cd0000        	call	c_lursh
 553  00d1 b603          	ld	a,c_lreg+3
 554  00d3 a4f0          	and	a,#240
 555  00d5 b703          	ld	c_lreg+3,a
 556  00d7 3f02          	clr	c_lreg+2
 557  00d9 3f01          	clr	c_lreg+1
 558  00db 3f00          	clr	c_lreg
 559  00dd b603          	ld	a,c_lreg+3
 560  00df ca5233        	or	a,21043
 561  00e2 c75233        	ld	21043,a
 562                     ; 135   UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
 564  00e5 c65232        	ld	a,21042
 565  00e8 1a0c          	or	a,(OFST+0,sp)
 566  00ea c75232        	ld	21042,a
 567                     ; 138   UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
 569  00ed c65235        	ld	a,21045
 570  00f0 a4f3          	and	a,#243
 571  00f2 c75235        	ld	21045,a
 572                     ; 140   UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
 574  00f5 c65236        	ld	a,21046
 575  00f8 a4f8          	and	a,#248
 576  00fa c75236        	ld	21046,a
 577                     ; 142   UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
 577                     ; 143                                                         UART1_CR3_CPHA | UART1_CR3_LBCL));  
 579  00fd 7b1a          	ld	a,(OFST+14,sp)
 580  00ff a407          	and	a,#7
 581  0101 ca5236        	or	a,21046
 582  0104 c75236        	ld	21046,a
 583                     ; 145   if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
 585  0107 7b1c          	ld	a,(OFST+16,sp)
 586  0109 a504          	bcp	a,#4
 587  010b 2706          	jreq	L371
 588                     ; 148     UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
 590  010d 72165235      	bset	21045,#3
 592  0111 2004          	jra	L571
 593  0113               L371:
 594                     ; 153     UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
 596  0113 72175235      	bres	21045,#3
 597  0117               L571:
 598                     ; 155   if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
 600  0117 7b1c          	ld	a,(OFST+16,sp)
 601  0119 a508          	bcp	a,#8
 602  011b 2706          	jreq	L771
 603                     ; 158     UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 605  011d 72145235      	bset	21045,#2
 607  0121 2004          	jra	L102
 608  0123               L771:
 609                     ; 163     UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
 611  0123 72155235      	bres	21045,#2
 612  0127               L102:
 613                     ; 167   if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
 615  0127 7b1a          	ld	a,(OFST+14,sp)
 616  0129 a580          	bcp	a,#128
 617  012b 2706          	jreq	L302
 618                     ; 170     UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
 620  012d 72175236      	bres	21046,#3
 622  0131 200a          	jra	L502
 623  0133               L302:
 624                     ; 174     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
 626  0133 7b1a          	ld	a,(OFST+14,sp)
 627  0135 a408          	and	a,#8
 628  0137 ca5236        	or	a,21046
 629  013a c75236        	ld	21046,a
 630  013d               L502:
 631                     ; 176 }
 634  013d 5b0c          	addw	sp,#12
 635  013f 81            	ret
 690                     ; 184 void UART1_Cmd(FunctionalState NewState)
 690                     ; 185 {
 691                     .text:	section	.text,new
 692  0000               _UART1_Cmd:
 696                     ; 186   if (NewState != DISABLE)
 698  0000 a30000        	cpw	x,#0
 699  0003 2706          	jreq	L532
 700                     ; 189     UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
 702  0005 721b5234      	bres	21044,#5
 704  0009 2004          	jra	L732
 705  000b               L532:
 706                     ; 194     UART1->CR1 |= UART1_CR1_UARTD;  
 708  000b 721a5234      	bset	21044,#5
 709  000f               L732:
 710                     ; 196 }
 713  000f 81            	ret
 838                     ; 211 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
 838                     ; 212 {
 839                     .text:	section	.text,new
 840  0000               _UART1_ITConfig:
 842  0000 89            	pushw	x
 843  0001 89            	pushw	x
 844       00000002      OFST:	set	2
 847                     ; 213   uint8_t uartreg = 0, itpos = 0x00;
 851                     ; 216   assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
 853                     ; 217   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 855                     ; 220   uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
 857  0002 4f            	clr	a
 858  0003 01            	rrwa	x,a
 859  0004 9f            	ld	a,xl
 860  0005 6b01          	ld	(OFST-1,sp),a
 862                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
 864  0007 7b04          	ld	a,(OFST+2,sp)
 865  0009 a40f          	and	a,#15
 866  000b 5f            	clrw	x
 867  000c 97            	ld	xl,a
 868  000d a601          	ld	a,#1
 869  000f 5d            	tnzw	x
 870  0010 2704          	jreq	L61
 871  0012               L02:
 872  0012 48            	sll	a
 873  0013 5a            	decw	x
 874  0014 26fc          	jrne	L02
 875  0016               L61:
 876  0016 6b02          	ld	(OFST+0,sp),a
 878                     ; 224   if (NewState != DISABLE)
 880  0018 1e07          	ldw	x,(OFST+5,sp)
 881  001a 272a          	jreq	L713
 882                     ; 227     if (uartreg == 0x01)
 884  001c 7b01          	ld	a,(OFST-1,sp)
 885  001e a101          	cp	a,#1
 886  0020 260a          	jrne	L123
 887                     ; 229       UART1->CR1 |= itpos;
 889  0022 c65234        	ld	a,21044
 890  0025 1a02          	or	a,(OFST+0,sp)
 891  0027 c75234        	ld	21044,a
 893  002a 2045          	jra	L133
 894  002c               L123:
 895                     ; 231     else if (uartreg == 0x02)
 897  002c 7b01          	ld	a,(OFST-1,sp)
 898  002e a102          	cp	a,#2
 899  0030 260a          	jrne	L523
 900                     ; 233       UART1->CR2 |= itpos;
 902  0032 c65235        	ld	a,21045
 903  0035 1a02          	or	a,(OFST+0,sp)
 904  0037 c75235        	ld	21045,a
 906  003a 2035          	jra	L133
 907  003c               L523:
 908                     ; 237       UART1->CR4 |= itpos;
 910  003c c65237        	ld	a,21047
 911  003f 1a02          	or	a,(OFST+0,sp)
 912  0041 c75237        	ld	21047,a
 913  0044 202b          	jra	L133
 914  0046               L713:
 915                     ; 243     if (uartreg == 0x01)
 917  0046 7b01          	ld	a,(OFST-1,sp)
 918  0048 a101          	cp	a,#1
 919  004a 260b          	jrne	L333
 920                     ; 245       UART1->CR1 &= (uint8_t)(~itpos);
 922  004c 7b02          	ld	a,(OFST+0,sp)
 923  004e 43            	cpl	a
 924  004f c45234        	and	a,21044
 925  0052 c75234        	ld	21044,a
 927  0055 201a          	jra	L133
 928  0057               L333:
 929                     ; 247     else if (uartreg == 0x02)
 931  0057 7b01          	ld	a,(OFST-1,sp)
 932  0059 a102          	cp	a,#2
 933  005b 260b          	jrne	L733
 934                     ; 249       UART1->CR2 &= (uint8_t)(~itpos);
 936  005d 7b02          	ld	a,(OFST+0,sp)
 937  005f 43            	cpl	a
 938  0060 c45235        	and	a,21045
 939  0063 c75235        	ld	21045,a
 941  0066 2009          	jra	L133
 942  0068               L733:
 943                     ; 253       UART1->CR4 &= (uint8_t)(~itpos);
 945  0068 7b02          	ld	a,(OFST+0,sp)
 946  006a 43            	cpl	a
 947  006b c45237        	and	a,21047
 948  006e c75237        	ld	21047,a
 949  0071               L133:
 950                     ; 257 }
 953  0071 5b04          	addw	sp,#4
 954  0073 81            	ret
 990                     ; 265 void UART1_HalfDuplexCmd(FunctionalState NewState)
 990                     ; 266 {
 991                     .text:	section	.text,new
 992  0000               _UART1_HalfDuplexCmd:
 996                     ; 267   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 998                     ; 269   if (NewState != DISABLE)
1000  0000 a30000        	cpw	x,#0
1001  0003 2706          	jreq	L163
1002                     ; 271     UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
1004  0005 72165238      	bset	21048,#3
1006  0009 2004          	jra	L363
1007  000b               L163:
1008                     ; 275     UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
1010  000b 72175238      	bres	21048,#3
1011  000f               L363:
1012                     ; 277 }
1015  000f 81            	ret
1072                     ; 285 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
1072                     ; 286 {
1073                     .text:	section	.text,new
1074  0000               _UART1_IrDAConfig:
1078                     ; 287   assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
1080                     ; 289   if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
1082  0000 a30000        	cpw	x,#0
1083  0003 2706          	jreq	L314
1084                     ; 291     UART1->CR5 |= UART1_CR5_IRLP;
1086  0005 72145238      	bset	21048,#2
1088  0009 2004          	jra	L514
1089  000b               L314:
1090                     ; 295     UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
1092  000b 72155238      	bres	21048,#2
1093  000f               L514:
1094                     ; 297 }
1097  000f 81            	ret
1132                     ; 305 void UART1_IrDACmd(FunctionalState NewState)
1132                     ; 306 {
1133                     .text:	section	.text,new
1134  0000               _UART1_IrDACmd:
1138                     ; 308   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1140                     ; 310   if (NewState != DISABLE)
1142  0000 a30000        	cpw	x,#0
1143  0003 2706          	jreq	L534
1144                     ; 313     UART1->CR5 |= UART1_CR5_IREN;
1146  0005 72125238      	bset	21048,#1
1148  0009 2004          	jra	L734
1149  000b               L534:
1150                     ; 318     UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
1152  000b 72135238      	bres	21048,#1
1153  000f               L734:
1154                     ; 320 }
1157  000f 81            	ret
1216                     ; 329 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
1216                     ; 330 {
1217                     .text:	section	.text,new
1218  0000               _UART1_LINBreakDetectionConfig:
1222                     ; 331   assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
1224                     ; 333   if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
1226  0000 a30000        	cpw	x,#0
1227  0003 2706          	jreq	L764
1228                     ; 335     UART1->CR4 |= UART1_CR4_LBDL;
1230  0005 721a5237      	bset	21047,#5
1232  0009 2004          	jra	L174
1233  000b               L764:
1234                     ; 339     UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
1236  000b 721b5237      	bres	21047,#5
1237  000f               L174:
1238                     ; 341 }
1241  000f 81            	ret
1276                     ; 349 void UART1_LINCmd(FunctionalState NewState)
1276                     ; 350 {
1277                     .text:	section	.text,new
1278  0000               _UART1_LINCmd:
1282                     ; 351   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1284                     ; 353   if (NewState != DISABLE)
1286  0000 a30000        	cpw	x,#0
1287  0003 2706          	jreq	L115
1288                     ; 356     UART1->CR3 |= UART1_CR3_LINEN;
1290  0005 721c5236      	bset	21046,#6
1292  0009 2004          	jra	L315
1293  000b               L115:
1294                     ; 361     UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
1296  000b 721d5236      	bres	21046,#6
1297  000f               L315:
1298                     ; 363 }
1301  000f 81            	ret
1336                     ; 371 void UART1_SmartCardCmd(FunctionalState NewState)
1336                     ; 372 {
1337                     .text:	section	.text,new
1338  0000               _UART1_SmartCardCmd:
1342                     ; 373   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1344                     ; 375   if (NewState != DISABLE)
1346  0000 a30000        	cpw	x,#0
1347  0003 2706          	jreq	L335
1348                     ; 378     UART1->CR5 |= UART1_CR5_SCEN;
1350  0005 721a5238      	bset	21048,#5
1352  0009 2004          	jra	L535
1353  000b               L335:
1354                     ; 383     UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
1356  000b 721b5238      	bres	21048,#5
1357  000f               L535:
1358                     ; 385 }
1361  000f 81            	ret
1397                     ; 394 void UART1_SmartCardNACKCmd(FunctionalState NewState)
1397                     ; 395 {
1398                     .text:	section	.text,new
1399  0000               _UART1_SmartCardNACKCmd:
1403                     ; 396   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1405                     ; 398   if (NewState != DISABLE)
1407  0000 a30000        	cpw	x,#0
1408  0003 2706          	jreq	L555
1409                     ; 401     UART1->CR5 |= UART1_CR5_NACK;
1411  0005 72185238      	bset	21048,#4
1413  0009 2004          	jra	L755
1414  000b               L555:
1415                     ; 406     UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
1417  000b 72195238      	bres	21048,#4
1418  000f               L755:
1419                     ; 408 }
1422  000f 81            	ret
1479                     ; 416 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
1479                     ; 417 {
1480                     .text:	section	.text,new
1481  0000               _UART1_WakeUpConfig:
1485                     ; 418   assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
1487                     ; 420   UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
1489  0000 72175234      	bres	21044,#3
1490                     ; 421   UART1->CR1 |= (uint8_t)UART1_WakeUp;
1492  0004 9f            	ld	a,xl
1493  0005 ca5234        	or	a,21044
1494  0008 c75234        	ld	21044,a
1495                     ; 422 }
1498  000b 81            	ret
1534                     ; 430 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
1534                     ; 431 {
1535                     .text:	section	.text,new
1536  0000               _UART1_ReceiverWakeUpCmd:
1540                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1542                     ; 434   if (NewState != DISABLE)
1544  0000 a30000        	cpw	x,#0
1545  0003 2706          	jreq	L526
1546                     ; 437     UART1->CR2 |= UART1_CR2_RWU;
1548  0005 72125235      	bset	21045,#1
1550  0009 2004          	jra	L726
1551  000b               L526:
1552                     ; 442     UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
1554  000b 72135235      	bres	21045,#1
1555  000f               L726:
1556                     ; 444 }
1559  000f 81            	ret
1582                     ; 451 uint8_t UART1_ReceiveData8(void)
1582                     ; 452 {
1583                     .text:	section	.text,new
1584  0000               _UART1_ReceiveData8:
1588                     ; 453   return ((uint8_t)UART1->DR);
1590  0000 c65231        	ld	a,21041
1593  0003 81            	ret
1627                     ; 461 uint16_t UART1_ReceiveData9(void)
1627                     ; 462 {
1628                     .text:	section	.text,new
1629  0000               _UART1_ReceiveData9:
1631  0000 89            	pushw	x
1632       00000002      OFST:	set	2
1635                     ; 463   uint16_t temp = 0;
1637                     ; 465   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
1639  0001 c65234        	ld	a,21044
1640  0004 5f            	clrw	x
1641  0005 a480          	and	a,#128
1642  0007 5f            	clrw	x
1643  0008 02            	rlwa	x,a
1644  0009 58            	sllw	x
1645  000a 1f01          	ldw	(OFST-1,sp),x
1647                     ; 466   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
1649  000c c65231        	ld	a,21041
1650  000f 5f            	clrw	x
1651  0010 97            	ld	xl,a
1652  0011 01            	rrwa	x,a
1653  0012 1a02          	or	a,(OFST+0,sp)
1654  0014 01            	rrwa	x,a
1655  0015 1a01          	or	a,(OFST-1,sp)
1656  0017 01            	rrwa	x,a
1657  0018 01            	rrwa	x,a
1658  0019 a4ff          	and	a,#255
1659  001b 01            	rrwa	x,a
1660  001c a401          	and	a,#1
1661  001e 01            	rrwa	x,a
1664  001f 5b02          	addw	sp,#2
1665  0021 81            	ret
1699                     ; 474 void UART1_SendData8(uint8_t Data)
1699                     ; 475 {
1700                     .text:	section	.text,new
1701  0000               _UART1_SendData8:
1705                     ; 477   UART1->DR = Data;
1707  0000 c75231        	ld	21041,a
1708                     ; 478 }
1711  0003 81            	ret
1745                     ; 486 void UART1_SendData9(uint16_t Data)
1745                     ; 487 {
1746                     .text:	section	.text,new
1747  0000               _UART1_SendData9:
1749  0000 89            	pushw	x
1750       00000000      OFST:	set	0
1753                     ; 489   UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
1755  0001 721d5234      	bres	21044,#6
1756                     ; 491   UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
1758  0005 54            	srlw	x
1759  0006 54            	srlw	x
1760  0007 9f            	ld	a,xl
1761  0008 a440          	and	a,#64
1762  000a ca5234        	or	a,21044
1763  000d c75234        	ld	21044,a
1764                     ; 493   UART1->DR   = (uint8_t)(Data);
1766  0010 7b02          	ld	a,(OFST+2,sp)
1767  0012 c75231        	ld	21041,a
1768                     ; 494 }
1771  0015 85            	popw	x
1772  0016 81            	ret
1795                     ; 501 void UART1_SendBreak(void)
1795                     ; 502 {
1796                     .text:	section	.text,new
1797  0000               _UART1_SendBreak:
1801                     ; 503   UART1->CR2 |= UART1_CR2_SBK;
1803  0000 72105235      	bset	21045,#0
1804                     ; 504 }
1807  0004 81            	ret
1841                     ; 511 void UART1_SetAddress(uint8_t UART1_Address)
1841                     ; 512 {
1842                     .text:	section	.text,new
1843  0000               _UART1_SetAddress:
1845  0000 88            	push	a
1846       00000000      OFST:	set	0
1849                     ; 514   assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
1851                     ; 517   UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
1853  0001 c65237        	ld	a,21047
1854  0004 a4f0          	and	a,#240
1855  0006 c75237        	ld	21047,a
1856                     ; 519   UART1->CR4 |= UART1_Address;
1858  0009 c65237        	ld	a,21047
1859  000c 1a01          	or	a,(OFST+1,sp)
1860  000e c75237        	ld	21047,a
1861                     ; 520 }
1864  0011 84            	pop	a
1865  0012 81            	ret
1899                     ; 528 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
1899                     ; 529 {
1900                     .text:	section	.text,new
1901  0000               _UART1_SetGuardTime:
1905                     ; 531   UART1->GTR = UART1_GuardTime;
1907  0000 c75239        	ld	21049,a
1908                     ; 532 }
1911  0003 81            	ret
1945                     ; 556 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
1945                     ; 557 {
1946                     .text:	section	.text,new
1947  0000               _UART1_SetPrescaler:
1951                     ; 559   UART1->PSCR = UART1_Prescaler;
1953  0000 c7523a        	ld	21050,a
1954                     ; 560 }
1957  0003 81            	ret
2100                     ; 568 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
2100                     ; 569 {
2101                     .text:	section	.text,new
2102  0000               _UART1_GetFlagStatus:
2104  0000 89            	pushw	x
2105  0001 89            	pushw	x
2106       00000002      OFST:	set	2
2109                     ; 570   FlagStatus status = RESET;
2111                     ; 573   assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
2113                     ; 577   if (UART1_FLAG == UART1_FLAG_LBDF)
2115  0002 a30210        	cpw	x,#528
2116  0005 2612          	jrne	L7501
2117                     ; 579     if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2119  0007 9f            	ld	a,xl
2120  0008 c45237        	and	a,21047
2121  000b 2707          	jreq	L1601
2122                     ; 582       status = SET;
2124  000d ae0001        	ldw	x,#1
2125  0010 1f01          	ldw	(OFST-1,sp),x
2128  0012 2030          	jra	L5601
2129  0014               L1601:
2130                     ; 587       status = RESET;
2132  0014 5f            	clrw	x
2133  0015 1f01          	ldw	(OFST-1,sp),x
2135  0017 202b          	jra	L5601
2136  0019               L7501:
2137                     ; 590   else if (UART1_FLAG == UART1_FLAG_SBK)
2139  0019 1e03          	ldw	x,(OFST+1,sp)
2140  001b a30101        	cpw	x,#257
2141  001e 2613          	jrne	L7601
2142                     ; 592     if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2144  0020 c65235        	ld	a,21045
2145  0023 1504          	bcp	a,(OFST+2,sp)
2146  0025 2707          	jreq	L1701
2147                     ; 595       status = SET;
2149  0027 ae0001        	ldw	x,#1
2150  002a 1f01          	ldw	(OFST-1,sp),x
2153  002c 2016          	jra	L5601
2154  002e               L1701:
2155                     ; 600       status = RESET;
2157  002e 5f            	clrw	x
2158  002f 1f01          	ldw	(OFST-1,sp),x
2160  0031 2011          	jra	L5601
2161  0033               L7601:
2162                     ; 605     if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2164  0033 c65230        	ld	a,21040
2165  0036 1504          	bcp	a,(OFST+2,sp)
2166  0038 2707          	jreq	L7701
2167                     ; 608       status = SET;
2169  003a ae0001        	ldw	x,#1
2170  003d 1f01          	ldw	(OFST-1,sp),x
2173  003f 2003          	jra	L5601
2174  0041               L7701:
2175                     ; 613       status = RESET;
2177  0041 5f            	clrw	x
2178  0042 1f01          	ldw	(OFST-1,sp),x
2180  0044               L5601:
2181                     ; 617   return status;
2183  0044 1e01          	ldw	x,(OFST-1,sp)
2186  0046 5b04          	addw	sp,#4
2187  0048 81            	ret
2222                     ; 646 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
2222                     ; 647 {
2223                     .text:	section	.text,new
2224  0000               _UART1_ClearFlag:
2228                     ; 648   assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
2230                     ; 651   if (UART1_FLAG == UART1_FLAG_RXNE)
2232  0000 a30020        	cpw	x,#32
2233  0003 2606          	jrne	L1211
2234                     ; 653     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2236  0005 35df5230      	mov	21040,#223
2238  0009 2004          	jra	L3211
2239  000b               L1211:
2240                     ; 658     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2242  000b 72195237      	bres	21047,#4
2243  000f               L3211:
2244                     ; 660 }
2247  000f 81            	ret
2329                     ; 675 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
2329                     ; 676 {
2330                     .text:	section	.text,new
2331  0000               _UART1_GetITStatus:
2333  0000 89            	pushw	x
2334  0001 5204          	subw	sp,#4
2335       00000004      OFST:	set	4
2338                     ; 677   ITStatus pendingbitstatus = RESET;
2340                     ; 678   uint8_t itpos = 0;
2342                     ; 679   uint8_t itmask1 = 0;
2344                     ; 680   uint8_t itmask2 = 0;
2346                     ; 681   uint8_t enablestatus = 0;
2348                     ; 684   assert_param(IS_UART1_GET_IT_OK(UART1_IT));
2350                     ; 687   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
2352  0003 9f            	ld	a,xl
2353  0004 a40f          	and	a,#15
2354  0006 5f            	clrw	x
2355  0007 97            	ld	xl,a
2356  0008 a601          	ld	a,#1
2357  000a 5d            	tnzw	x
2358  000b 2704          	jreq	L27
2359  000d               L47:
2360  000d 48            	sll	a
2361  000e 5a            	decw	x
2362  000f 26fc          	jrne	L47
2363  0011               L27:
2364  0011 6b01          	ld	(OFST-3,sp),a
2366                     ; 689   itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
2368  0013 7b06          	ld	a,(OFST+2,sp)
2369  0015 4e            	swap	a
2370  0016 a40f          	and	a,#15
2371  0018 6b04          	ld	(OFST+0,sp),a
2373                     ; 691   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2375  001a 7b04          	ld	a,(OFST+0,sp)
2376  001c 5f            	clrw	x
2377  001d 97            	ld	xl,a
2378  001e a601          	ld	a,#1
2379  0020 5d            	tnzw	x
2380  0021 2704          	jreq	L67
2381  0023               L001:
2382  0023 48            	sll	a
2383  0024 5a            	decw	x
2384  0025 26fc          	jrne	L001
2385  0027               L67:
2386  0027 6b04          	ld	(OFST+0,sp),a
2388                     ; 695   if (UART1_IT == UART1_IT_PE)
2390  0029 1e05          	ldw	x,(OFST+1,sp)
2391  002b a30100        	cpw	x,#256
2392  002e 261e          	jrne	L7611
2393                     ; 698     enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
2395  0030 c65234        	ld	a,21044
2396  0033 1404          	and	a,(OFST+0,sp)
2397  0035 6b04          	ld	(OFST+0,sp),a
2399                     ; 701     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2401  0037 c65230        	ld	a,21040
2402  003a 1501          	bcp	a,(OFST-3,sp)
2403  003c 270b          	jreq	L1711
2405  003e 0d04          	tnz	(OFST+0,sp)
2406  0040 2707          	jreq	L1711
2407                     ; 704       pendingbitstatus = SET;
2409  0042 ae0001        	ldw	x,#1
2410  0045 1f02          	ldw	(OFST-2,sp),x
2413  0047 2046          	jra	L5711
2414  0049               L1711:
2415                     ; 709       pendingbitstatus = RESET;
2417  0049 5f            	clrw	x
2418  004a 1f02          	ldw	(OFST-2,sp),x
2420  004c 2041          	jra	L5711
2421  004e               L7611:
2422                     ; 713   else if (UART1_IT == UART1_IT_LBDF)
2424  004e 1e05          	ldw	x,(OFST+1,sp)
2425  0050 a30346        	cpw	x,#838
2426  0053 261e          	jrne	L7711
2427                     ; 716     enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
2429  0055 c65237        	ld	a,21047
2430  0058 1404          	and	a,(OFST+0,sp)
2431  005a 6b04          	ld	(OFST+0,sp),a
2433                     ; 718     if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2435  005c c65237        	ld	a,21047
2436  005f 1501          	bcp	a,(OFST-3,sp)
2437  0061 270b          	jreq	L1021
2439  0063 0d04          	tnz	(OFST+0,sp)
2440  0065 2707          	jreq	L1021
2441                     ; 721       pendingbitstatus = SET;
2443  0067 ae0001        	ldw	x,#1
2444  006a 1f02          	ldw	(OFST-2,sp),x
2447  006c 2021          	jra	L5711
2448  006e               L1021:
2449                     ; 726       pendingbitstatus = RESET;
2451  006e 5f            	clrw	x
2452  006f 1f02          	ldw	(OFST-2,sp),x
2454  0071 201c          	jra	L5711
2455  0073               L7711:
2456                     ; 732     enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
2458  0073 c65235        	ld	a,21045
2459  0076 1404          	and	a,(OFST+0,sp)
2460  0078 6b04          	ld	(OFST+0,sp),a
2462                     ; 734     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2464  007a c65230        	ld	a,21040
2465  007d 1501          	bcp	a,(OFST-3,sp)
2466  007f 270b          	jreq	L7021
2468  0081 0d04          	tnz	(OFST+0,sp)
2469  0083 2707          	jreq	L7021
2470                     ; 737       pendingbitstatus = SET;
2472  0085 ae0001        	ldw	x,#1
2473  0088 1f02          	ldw	(OFST-2,sp),x
2476  008a 2003          	jra	L5711
2477  008c               L7021:
2478                     ; 742       pendingbitstatus = RESET;
2480  008c 5f            	clrw	x
2481  008d 1f02          	ldw	(OFST-2,sp),x
2483  008f               L5711:
2484                     ; 747   return  pendingbitstatus;
2486  008f 1e02          	ldw	x,(OFST-2,sp)
2489  0091 5b06          	addw	sp,#6
2490  0093 81            	ret
2526                     ; 775 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
2526                     ; 776 {
2527                     .text:	section	.text,new
2528  0000               _UART1_ClearITPendingBit:
2532                     ; 777   assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
2534                     ; 780   if (UART1_IT == UART1_IT_RXNE)
2536  0000 a30255        	cpw	x,#597
2537  0003 2606          	jrne	L1321
2538                     ; 782     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2540  0005 35df5230      	mov	21040,#223
2542  0009 2004          	jra	L3321
2543  000b               L1321:
2544                     ; 787     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2546  000b 72195237      	bres	21047,#4
2547  000f               L3321:
2548                     ; 789 }
2551  000f 81            	ret
2564                     	xdef	_UART1_ClearITPendingBit
2565                     	xdef	_UART1_GetITStatus
2566                     	xdef	_UART1_ClearFlag
2567                     	xdef	_UART1_GetFlagStatus
2568                     	xdef	_UART1_SetPrescaler
2569                     	xdef	_UART1_SetGuardTime
2570                     	xdef	_UART1_SetAddress
2571                     	xdef	_UART1_SendBreak
2572                     	xdef	_UART1_SendData9
2573                     	xdef	_UART1_SendData8
2574                     	xdef	_UART1_ReceiveData9
2575                     	xdef	_UART1_ReceiveData8
2576                     	xdef	_UART1_ReceiverWakeUpCmd
2577                     	xdef	_UART1_WakeUpConfig
2578                     	xdef	_UART1_SmartCardNACKCmd
2579                     	xdef	_UART1_SmartCardCmd
2580                     	xdef	_UART1_LINCmd
2581                     	xdef	_UART1_LINBreakDetectionConfig
2582                     	xdef	_UART1_IrDACmd
2583                     	xdef	_UART1_IrDAConfig
2584                     	xdef	_UART1_HalfDuplexCmd
2585                     	xdef	_UART1_ITConfig
2586                     	xdef	_UART1_Cmd
2587                     	xdef	_UART1_Init
2588                     	xdef	_UART1_DeInit
2589                     	xref	_CLK_GetClockFreq
2590                     	xref.b	c_lreg
2591                     	xref.b	c_x
2610                     	xref	c_lursh
2611                     	xref	c_lsub
2612                     	xref	c_smul
2613                     	xref	c_ludv
2614                     	xref	c_rtol
2615                     	xref	c_llsh
2616                     	xref	c_ltor
2617                     	end
