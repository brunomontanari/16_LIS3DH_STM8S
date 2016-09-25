   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  17                     .const:	section	.text
  18  0000               _HSIDivFactor:
  19  0000 01            	dc.b	1
  20  0001 02            	dc.b	2
  21  0002 04            	dc.b	4
  22  0003 08            	dc.b	8
  23  0004               _CLKPrescTable:
  24  0004 01            	dc.b	1
  25  0005 02            	dc.b	2
  26  0006 04            	dc.b	4
  27  0007 08            	dc.b	8
  28  0008 0a            	dc.b	10
  29  0009 10            	dc.b	16
  30  000a 14            	dc.b	20
  31  000b 28            	dc.b	40
  60                     ; 72 void CLK_DeInit(void)
  60                     ; 73 {
  62                     .text:	section	.text,new
  63  0000               _CLK_DeInit:
  67                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
  69  0000 350150c0      	mov	20672,#1
  70                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
  72  0004 725f50c1      	clr	20673
  73                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
  75  0008 35e150c4      	mov	20676,#225
  76                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  78  000c 725f50c5      	clr	20677
  79                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  81  0010 351850c6      	mov	20678,#24
  82                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  84  0014 35ff50c7      	mov	20679,#255
  85                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  87  0018 35ff50ca      	mov	20682,#255
  88                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
  90  001c 725f50c8      	clr	20680
  91                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  93  0020 725f50c9      	clr	20681
  95  0024               L52:
  96                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
  98  0024 c650c9        	ld	a,20681
  99  0027 a501          	bcp	a,#1
 100  0029 26f9          	jrne	L52
 101                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
 103  002b 725f50c9      	clr	20681
 104                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 106  002f 725f50cc      	clr	20684
 107                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 109  0033 725f50cd      	clr	20685
 110                     ; 88 }
 113  0037 81            	ret
 169                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 169                     ; 100 {
 170                     .text:	section	.text,new
 171  0000               _CLK_FastHaltWakeUpCmd:
 175                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 177                     ; 104   if (NewState != DISABLE)
 179  0000 a30000        	cpw	x,#0
 180  0003 2706          	jreq	L75
 181                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 183  0005 721450c0      	bset	20672,#2
 185  0009 2004          	jra	L16
 186  000b               L75:
 187                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 189  000b 721550c0      	bres	20672,#2
 190  000f               L16:
 191                     ; 114 }
 194  000f 81            	ret
 229                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 229                     ; 122 {
 230                     .text:	section	.text,new
 231  0000               _CLK_HSECmd:
 235                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 237                     ; 126   if (NewState != DISABLE)
 239  0000 a30000        	cpw	x,#0
 240  0003 2706          	jreq	L101
 241                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 243  0005 721050c1      	bset	20673,#0
 245  0009 2004          	jra	L301
 246  000b               L101:
 247                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 249  000b 721150c1      	bres	20673,#0
 250  000f               L301:
 251                     ; 136 }
 254  000f 81            	ret
 289                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 289                     ; 144 {
 290                     .text:	section	.text,new
 291  0000               _CLK_HSICmd:
 295                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 297                     ; 148   if (NewState != DISABLE)
 299  0000 a30000        	cpw	x,#0
 300  0003 2706          	jreq	L321
 301                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 303  0005 721050c0      	bset	20672,#0
 305  0009 2004          	jra	L521
 306  000b               L321:
 307                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 309  000b 721150c0      	bres	20672,#0
 310  000f               L521:
 311                     ; 158 }
 314  000f 81            	ret
 349                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 349                     ; 167 {
 350                     .text:	section	.text,new
 351  0000               _CLK_LSICmd:
 355                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 357                     ; 171   if (NewState != DISABLE)
 359  0000 a30000        	cpw	x,#0
 360  0003 2706          	jreq	L541
 361                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 363  0005 721650c0      	bset	20672,#3
 365  0009 2004          	jra	L741
 366  000b               L541:
 367                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 369  000b 721750c0      	bres	20672,#3
 370  000f               L741:
 371                     ; 181 }
 374  000f 81            	ret
 409                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 409                     ; 190 {
 410                     .text:	section	.text,new
 411  0000               _CLK_CCOCmd:
 415                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 417                     ; 194   if (NewState != DISABLE)
 419  0000 a30000        	cpw	x,#0
 420  0003 2706          	jreq	L761
 421                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 423  0005 721050c9      	bset	20681,#0
 425  0009 2004          	jra	L171
 426  000b               L761:
 427                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 429  000b 721150c9      	bres	20681,#0
 430  000f               L171:
 431                     ; 204 }
 434  000f 81            	ret
 469                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 469                     ; 214 {
 470                     .text:	section	.text,new
 471  0000               _CLK_ClockSwitchCmd:
 475                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 477                     ; 218   if (NewState != DISABLE )
 479  0000 a30000        	cpw	x,#0
 480  0003 2706          	jreq	L112
 481                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 483  0005 721250c5      	bset	20677,#1
 485  0009 2004          	jra	L312
 486  000b               L112:
 487                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 489  000b 721350c5      	bres	20677,#1
 490  000f               L312:
 491                     ; 228 }
 494  000f 81            	ret
 530                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 530                     ; 239 {
 531                     .text:	section	.text,new
 532  0000               _CLK_SlowActiveHaltWakeUpCmd:
 536                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 538                     ; 243   if (NewState != DISABLE)
 540  0000 a30000        	cpw	x,#0
 541  0003 2706          	jreq	L332
 542                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 544  0005 721a50c0      	bset	20672,#5
 546  0009 2004          	jra	L532
 547  000b               L332:
 548                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 550  000b 721b50c0      	bres	20672,#5
 551  000f               L532:
 552                     ; 253 }
 555  000f 81            	ret
 714                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 714                     ; 264 {
 715                     .text:	section	.text,new
 716  0000               _CLK_PeripheralClockConfig:
 718  0000 89            	pushw	x
 719       00000000      OFST:	set	0
 722                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 724                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 726                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 728  0001 9f            	ld	a,xl
 729  0002 a510          	bcp	a,#16
 730  0004 2633          	jrne	L123
 731                     ; 271     if (NewState != DISABLE)
 733  0006 1e05          	ldw	x,(OFST+5,sp)
 734  0008 2717          	jreq	L323
 735                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 737  000a 7b02          	ld	a,(OFST+2,sp)
 738  000c a40f          	and	a,#15
 739  000e 5f            	clrw	x
 740  000f 97            	ld	xl,a
 741  0010 a601          	ld	a,#1
 742  0012 5d            	tnzw	x
 743  0013 2704          	jreq	L62
 744  0015               L03:
 745  0015 48            	sll	a
 746  0016 5a            	decw	x
 747  0017 26fc          	jrne	L03
 748  0019               L62:
 749  0019 ca50c7        	or	a,20679
 750  001c c750c7        	ld	20679,a
 752  001f 2049          	jra	L723
 753  0021               L323:
 754                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 756  0021 7b02          	ld	a,(OFST+2,sp)
 757  0023 a40f          	and	a,#15
 758  0025 5f            	clrw	x
 759  0026 97            	ld	xl,a
 760  0027 a601          	ld	a,#1
 761  0029 5d            	tnzw	x
 762  002a 2704          	jreq	L23
 763  002c               L43:
 764  002c 48            	sll	a
 765  002d 5a            	decw	x
 766  002e 26fc          	jrne	L43
 767  0030               L23:
 768  0030 43            	cpl	a
 769  0031 c450c7        	and	a,20679
 770  0034 c750c7        	ld	20679,a
 771  0037 2031          	jra	L723
 772  0039               L123:
 773                     ; 284     if (NewState != DISABLE)
 775  0039 1e05          	ldw	x,(OFST+5,sp)
 776  003b 2717          	jreq	L133
 777                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 779  003d 7b02          	ld	a,(OFST+2,sp)
 780  003f a40f          	and	a,#15
 781  0041 5f            	clrw	x
 782  0042 97            	ld	xl,a
 783  0043 a601          	ld	a,#1
 784  0045 5d            	tnzw	x
 785  0046 2704          	jreq	L63
 786  0048               L04:
 787  0048 48            	sll	a
 788  0049 5a            	decw	x
 789  004a 26fc          	jrne	L04
 790  004c               L63:
 791  004c ca50ca        	or	a,20682
 792  004f c750ca        	ld	20682,a
 794  0052 2016          	jra	L723
 795  0054               L133:
 796                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 798  0054 7b02          	ld	a,(OFST+2,sp)
 799  0056 a40f          	and	a,#15
 800  0058 5f            	clrw	x
 801  0059 97            	ld	xl,a
 802  005a a601          	ld	a,#1
 803  005c 5d            	tnzw	x
 804  005d 2704          	jreq	L24
 805  005f               L44:
 806  005f 48            	sll	a
 807  0060 5a            	decw	x
 808  0061 26fc          	jrne	L44
 809  0063               L24:
 810  0063 43            	cpl	a
 811  0064 c450ca        	and	a,20682
 812  0067 c750ca        	ld	20682,a
 813  006a               L723:
 814                     ; 295 }
 817  006a 85            	popw	x
 818  006b 81            	ret
1006                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1006                     ; 310 {
1007                     .text:	section	.text,new
1008  0000               _CLK_ClockSwitchConfig:
1010  0000 89            	pushw	x
1011  0001 5204          	subw	sp,#4
1012       00000004      OFST:	set	4
1015                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
1017  0003 aeffff        	ldw	x,#65535
1018  0006 1f03          	ldw	(OFST-1,sp),x
1020                     ; 313   ErrorStatus Swif = ERROR;
1022                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1024                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1026                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1028                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1030                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1032  0008 c650c3        	ld	a,20675
1033  000b 5f            	clrw	x
1034  000c 97            	ld	xl,a
1035  000d 1f01          	ldw	(OFST-3,sp),x
1037                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1039  000f 1e05          	ldw	x,(OFST+1,sp)
1040  0011 a30001        	cpw	x,#1
1041  0014 264e          	jrne	L544
1042                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1044  0016 721250c5      	bset	20677,#1
1045                     ; 331     if (ITState != DISABLE)
1047  001a 1e0b          	ldw	x,(OFST+7,sp)
1048  001c 2706          	jreq	L744
1049                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1051  001e 721450c5      	bset	20677,#2
1053  0022 2004          	jra	L154
1054  0024               L744:
1055                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1057  0024 721550c5      	bres	20677,#2
1058  0028               L154:
1059                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1061  0028 7b0a          	ld	a,(OFST+6,sp)
1062  002a c750c4        	ld	20676,a
1064  002d 2007          	jra	L754
1065  002f               L354:
1066                     ; 346       DownCounter--;
1068  002f 1e03          	ldw	x,(OFST-1,sp)
1069  0031 1d0001        	subw	x,#1
1070  0034 1f03          	ldw	(OFST-1,sp),x
1072  0036               L754:
1073                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1075  0036 c650c5        	ld	a,20677
1076  0039 a501          	bcp	a,#1
1077  003b 2704          	jreq	L364
1079  003d 1e03          	ldw	x,(OFST-1,sp)
1080  003f 26ee          	jrne	L354
1081  0041               L364:
1082                     ; 349     if(DownCounter != 0)
1084  0041 1e03          	ldw	x,(OFST-1,sp)
1085  0043 2707          	jreq	L564
1086                     ; 351       Swif = SUCCESS;
1088  0045 ae0001        	ldw	x,#1
1089  0048 1f03          	ldw	(OFST-1,sp),x
1092  004a 2003          	jra	L174
1093  004c               L564:
1094                     ; 355       Swif = ERROR;
1096  004c 5f            	clrw	x
1097  004d 1f03          	ldw	(OFST-1,sp),x
1099  004f               L174:
1100                     ; 390   if(Swif != ERROR)
1102  004f 1e03          	ldw	x,(OFST-1,sp)
1103  0051 276c          	jreq	L515
1104                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1106  0053 1e0d          	ldw	x,(OFST+9,sp)
1107  0055 2648          	jrne	L715
1109  0057 1e01          	ldw	x,(OFST-3,sp)
1110  0059 a300e1        	cpw	x,#225
1111  005c 2641          	jrne	L715
1112                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1114  005e 721150c0      	bres	20672,#0
1116  0062 205b          	jra	L515
1117  0064               L544:
1118                     ; 361     if (ITState != DISABLE)
1120  0064 1e0b          	ldw	x,(OFST+7,sp)
1121  0066 2706          	jreq	L374
1122                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1124  0068 721450c5      	bset	20677,#2
1126  006c 2004          	jra	L574
1127  006e               L374:
1128                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1130  006e 721550c5      	bres	20677,#2
1131  0072               L574:
1132                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1134  0072 7b0a          	ld	a,(OFST+6,sp)
1135  0074 c750c4        	ld	20676,a
1137  0077 2007          	jra	L305
1138  0079               L774:
1139                     ; 376       DownCounter--;
1141  0079 1e03          	ldw	x,(OFST-1,sp)
1142  007b 1d0001        	subw	x,#1
1143  007e 1f03          	ldw	(OFST-1,sp),x
1145  0080               L305:
1146                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1148  0080 c650c5        	ld	a,20677
1149  0083 a508          	bcp	a,#8
1150  0085 2704          	jreq	L705
1152  0087 1e03          	ldw	x,(OFST-1,sp)
1153  0089 26ee          	jrne	L774
1154  008b               L705:
1155                     ; 379     if(DownCounter != 0)
1157  008b 1e03          	ldw	x,(OFST-1,sp)
1158  008d 270b          	jreq	L115
1159                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1161  008f 721250c5      	bset	20677,#1
1162                     ; 383       Swif = SUCCESS;
1164  0093 ae0001        	ldw	x,#1
1165  0096 1f03          	ldw	(OFST-1,sp),x
1168  0098 20b5          	jra	L174
1169  009a               L115:
1170                     ; 387       Swif = ERROR;
1172  009a 5f            	clrw	x
1173  009b 1f03          	ldw	(OFST-1,sp),x
1175  009d 20b0          	jra	L174
1176  009f               L715:
1177                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1179  009f 1e0d          	ldw	x,(OFST+9,sp)
1180  00a1 260d          	jrne	L325
1182  00a3 1e01          	ldw	x,(OFST-3,sp)
1183  00a5 a300d2        	cpw	x,#210
1184  00a8 2606          	jrne	L325
1185                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1187  00aa 721750c0      	bres	20672,#3
1189  00ae 200f          	jra	L515
1190  00b0               L325:
1191                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1193  00b0 1e0d          	ldw	x,(OFST+9,sp)
1194  00b2 260b          	jrne	L515
1196  00b4 1e01          	ldw	x,(OFST-3,sp)
1197  00b6 a300b4        	cpw	x,#180
1198  00b9 2604          	jrne	L515
1199                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1201  00bb 721150c1      	bres	20673,#0
1202  00bf               L515:
1203                     ; 406   return(Swif);
1205  00bf 1e03          	ldw	x,(OFST-1,sp)
1208  00c1 5b06          	addw	sp,#6
1209  00c3 81            	ret
1347                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1347                     ; 416 {
1348                     .text:	section	.text,new
1349  0000               _CLK_HSIPrescalerConfig:
1353                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1355                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1357  0000 c650c6        	ld	a,20678
1358  0003 a4e7          	and	a,#231
1359  0005 c750c6        	ld	20678,a
1360                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1362  0008 9f            	ld	a,xl
1363  0009 ca50c6        	or	a,20678
1364  000c c750c6        	ld	20678,a
1365                     ; 425 }
1368  000f 81            	ret
1503                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1503                     ; 437 {
1504                     .text:	section	.text,new
1505  0000               _CLK_CCOConfig:
1509                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1511                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1513  0000 c650c9        	ld	a,20681
1514  0003 a4e1          	and	a,#225
1515  0005 c750c9        	ld	20681,a
1516                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1518  0008 9f            	ld	a,xl
1519  0009 ca50c9        	or	a,20681
1520  000c c750c9        	ld	20681,a
1521                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1523  000f 721050c9      	bset	20681,#0
1524                     ; 449 }
1527  0013 81            	ret
1592                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1592                     ; 460 {
1593                     .text:	section	.text,new
1594  0000               _CLK_ITConfig:
1596  0000 89            	pushw	x
1597       00000000      OFST:	set	0
1600                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1602                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
1604                     ; 465   if (NewState != DISABLE)
1606  0001 1e05          	ldw	x,(OFST+5,sp)
1607  0003 271c          	jreq	L527
1608                     ; 467     switch (CLK_IT)
1610  0005 1e01          	ldw	x,(OFST+1,sp)
1612                     ; 475     default:
1612                     ; 476       break;
1613  0007 1d000c        	subw	x,#12
1614  000a 270b          	jreq	L166
1615  000c 1d0010        	subw	x,#16
1616  000f 2626          	jrne	L337
1617                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1617                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
1619  0011 721450c5      	bset	20677,#2
1620                     ; 471       break;
1622  0015 2020          	jra	L337
1623  0017               L166:
1624                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1624                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
1626  0017 721450c8      	bset	20680,#2
1627                     ; 474       break;
1629  001b 201a          	jra	L337
1630  001d               L366:
1631                     ; 475     default:
1631                     ; 476       break;
1633  001d 2018          	jra	L337
1634  001f               L137:
1636  001f 2016          	jra	L337
1637  0021               L527:
1638                     ; 481     switch (CLK_IT)
1640  0021 1e01          	ldw	x,(OFST+1,sp)
1642                     ; 489     default:
1642                     ; 490       break;
1643  0023 1d000c        	subw	x,#12
1644  0026 270b          	jreq	L766
1645  0028 1d0010        	subw	x,#16
1646  002b 260a          	jrne	L337
1647                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1647                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1649  002d 721550c5      	bres	20677,#2
1650                     ; 485       break;
1652  0031 2004          	jra	L337
1653  0033               L766:
1654                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1654                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1656  0033 721550c8      	bres	20680,#2
1657                     ; 488       break;
1658  0037               L337:
1659                     ; 493 }
1662  0037 85            	popw	x
1663  0038 81            	ret
1664  0039               L176:
1665                     ; 489     default:
1665                     ; 490       break;
1667  0039 20fc          	jra	L337
1668  003b               L737:
1669  003b 20fa          	jra	L337
1704                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1704                     ; 501 {
1705                     .text:	section	.text,new
1706  0000               _CLK_SYSCLKConfig:
1708  0000 89            	pushw	x
1709       00000000      OFST:	set	0
1712                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1714                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1716  0001 9f            	ld	a,xl
1717  0002 a580          	bcp	a,#128
1718  0004 2614          	jrne	L757
1719                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1721  0006 c650c6        	ld	a,20678
1722  0009 a4e7          	and	a,#231
1723  000b c750c6        	ld	20678,a
1724                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
1726  000e 7b02          	ld	a,(OFST+2,sp)
1727  0010 a418          	and	a,#24
1728  0012 ca50c6        	or	a,20678
1729  0015 c750c6        	ld	20678,a
1731  0018 2012          	jra	L167
1732  001a               L757:
1733                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
1735  001a c650c6        	ld	a,20678
1736  001d a4f8          	and	a,#248
1737  001f c750c6        	ld	20678,a
1738                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
1740  0022 7b02          	ld	a,(OFST+2,sp)
1741  0024 a407          	and	a,#7
1742  0026 ca50c6        	or	a,20678
1743  0029 c750c6        	ld	20678,a
1744  002c               L167:
1745                     ; 515 }
1748  002c 85            	popw	x
1749  002d 81            	ret
1805                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1805                     ; 524 {
1806                     .text:	section	.text,new
1807  0000               _CLK_SWIMConfig:
1811                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1813                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1815  0000 a30000        	cpw	x,#0
1816  0003 2706          	jreq	L1101
1817                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1819  0005 721050cd      	bset	20685,#0
1821  0009 2004          	jra	L3101
1822  000b               L1101:
1823                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
1825  000b 721150cd      	bres	20685,#0
1826  000f               L3101:
1827                     ; 538 }
1830  000f 81            	ret
1854                     ; 547 void CLK_ClockSecuritySystemEnable(void)
1854                     ; 548 {
1855                     .text:	section	.text,new
1856  0000               _CLK_ClockSecuritySystemEnable:
1860                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
1862  0000 721050c8      	bset	20680,#0
1863                     ; 551 }
1866  0004 81            	ret
1891                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1891                     ; 560 {
1892                     .text:	section	.text,new
1893  0000               _CLK_GetSYSCLKSource:
1897                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
1899  0000 c650c3        	ld	a,20675
1900  0003 5f            	clrw	x
1901  0004 97            	ld	xl,a
1904  0005 81            	ret
1967                     ; 569 uint32_t CLK_GetClockFreq(void)
1967                     ; 570 {
1968                     .text:	section	.text,new
1969  0000               _CLK_GetClockFreq:
1971  0000 520b          	subw	sp,#11
1972       0000000b      OFST:	set	11
1975                     ; 571   uint32_t clockfrequency = 0;
1977                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
1979                     ; 573   uint8_t tmp = 0, presc = 0;
1983                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
1985  0002 c650c3        	ld	a,20675
1986  0005 5f            	clrw	x
1987  0006 97            	ld	xl,a
1988  0007 1f05          	ldw	(OFST-6,sp),x
1990                     ; 578   if (clocksource == CLK_SOURCE_HSI)
1992  0009 1e05          	ldw	x,(OFST-6,sp)
1993  000b a300e1        	cpw	x,#225
1994  000e 2641          	jrne	L7601
1995                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
1997  0010 c650c6        	ld	a,20678
1998  0013 a418          	and	a,#24
1999  0015 6b0b          	ld	(OFST+0,sp),a
2001                     ; 581     tmp = (uint8_t)(tmp >> 3);
2003  0017 040b          	srl	(OFST+0,sp)
2004  0019 040b          	srl	(OFST+0,sp)
2005  001b 040b          	srl	(OFST+0,sp)
2007                     ; 582     presc = HSIDivFactor[tmp];
2009  001d 7b0b          	ld	a,(OFST+0,sp)
2010  001f 5f            	clrw	x
2011  0020 97            	ld	xl,a
2012  0021 d60000        	ld	a,(_HSIDivFactor,x)
2013  0024 6b0b          	ld	(OFST+0,sp),a
2015                     ; 583     clockfrequency = HSI_VALUE / presc;
2017  0026 7b0b          	ld	a,(OFST+0,sp)
2018  0028 b703          	ld	c_lreg+3,a
2019  002a 3f02          	clr	c_lreg+2
2020  002c 3f01          	clr	c_lreg+1
2021  002e 3f00          	clr	c_lreg
2022  0030 96            	ldw	x,sp
2023  0031 1c0001        	addw	x,#OFST-10
2024  0034 cd0000        	call	c_rtol
2027  0037 ae2400        	ldw	x,#9216
2028  003a bf02          	ldw	c_lreg+2,x
2029  003c ae00f4        	ldw	x,#244
2030  003f bf00          	ldw	c_lreg,x
2031  0041 96            	ldw	x,sp
2032  0042 1c0001        	addw	x,#OFST-10
2033  0045 cd0000        	call	c_ludv
2035  0048 96            	ldw	x,sp
2036  0049 1c0007        	addw	x,#OFST-4
2037  004c cd0000        	call	c_rtol
2041  004f 201d          	jra	L1701
2042  0051               L7601:
2043                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
2045  0051 1e05          	ldw	x,(OFST-6,sp)
2046  0053 a300d2        	cpw	x,#210
2047  0056 260c          	jrne	L3701
2048                     ; 587     clockfrequency = LSI_VALUE;
2050  0058 aef400        	ldw	x,#62464
2051  005b 1f09          	ldw	(OFST-2,sp),x
2052  005d ae0001        	ldw	x,#1
2053  0060 1f07          	ldw	(OFST-4,sp),x
2056  0062 200a          	jra	L1701
2057  0064               L3701:
2058                     ; 591     clockfrequency = HSE_VALUE;
2060  0064 ae2400        	ldw	x,#9216
2061  0067 1f09          	ldw	(OFST-2,sp),x
2062  0069 ae00f4        	ldw	x,#244
2063  006c 1f07          	ldw	(OFST-4,sp),x
2065  006e               L1701:
2066                     ; 594   return((uint32_t)clockfrequency);
2068  006e 96            	ldw	x,sp
2069  006f 1c0007        	addw	x,#OFST-4
2070  0072 cd0000        	call	c_ltor
2074  0075 5b0b          	addw	sp,#11
2075  0077 81            	ret
2174                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2174                     ; 605 {
2175                     .text:	section	.text,new
2176  0000               _CLK_AdjustHSICalibrationValue:
2178  0000 89            	pushw	x
2179       00000000      OFST:	set	0
2182                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2184                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2186  0001 c650cc        	ld	a,20684
2187  0004 a4f8          	and	a,#248
2188  0006 1a02          	or	a,(OFST+2,sp)
2189  0008 c750cc        	ld	20684,a
2190                     ; 611 }
2193  000b 85            	popw	x
2194  000c 81            	ret
2218                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2218                     ; 623 {
2219                     .text:	section	.text,new
2220  0000               _CLK_SYSCLKEmergencyClear:
2224                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2226  0000 721150c5      	bres	20677,#0
2227                     ; 625 }
2230  0004 81            	ret
2383                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2383                     ; 635 {
2384                     .text:	section	.text,new
2385  0000               _CLK_GetFlagStatus:
2387  0000 89            	pushw	x
2388  0001 5203          	subw	sp,#3
2389       00000003      OFST:	set	3
2392                     ; 636   uint16_t statusreg = 0;
2394                     ; 637   uint8_t tmpreg = 0;
2396                     ; 638   FlagStatus bitstatus = RESET;
2398                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2400                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2402  0003 01            	rrwa	x,a
2403  0004 9f            	ld	a,xl
2404  0005 a4ff          	and	a,#255
2405  0007 97            	ld	xl,a
2406  0008 4f            	clr	a
2407  0009 02            	rlwa	x,a
2408  000a 1f02          	ldw	(OFST-1,sp),x
2409  000c 01            	rrwa	x,a
2411                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2413  000d 1e02          	ldw	x,(OFST-1,sp)
2414  000f a30100        	cpw	x,#256
2415  0012 2607          	jrne	L1421
2416                     ; 649     tmpreg = CLK->ICKR;
2418  0014 c650c0        	ld	a,20672
2419  0017 6b01          	ld	(OFST-2,sp),a
2422  0019 202f          	jra	L3421
2423  001b               L1421:
2424                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2426  001b 1e02          	ldw	x,(OFST-1,sp)
2427  001d a30200        	cpw	x,#512
2428  0020 2607          	jrne	L5421
2429                     ; 653     tmpreg = CLK->ECKR;
2431  0022 c650c1        	ld	a,20673
2432  0025 6b01          	ld	(OFST-2,sp),a
2435  0027 2021          	jra	L3421
2436  0029               L5421:
2437                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2439  0029 1e02          	ldw	x,(OFST-1,sp)
2440  002b a30300        	cpw	x,#768
2441  002e 2607          	jrne	L1521
2442                     ; 657     tmpreg = CLK->SWCR;
2444  0030 c650c5        	ld	a,20677
2445  0033 6b01          	ld	(OFST-2,sp),a
2448  0035 2013          	jra	L3421
2449  0037               L1521:
2450                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2452  0037 1e02          	ldw	x,(OFST-1,sp)
2453  0039 a30400        	cpw	x,#1024
2454  003c 2607          	jrne	L5521
2455                     ; 661     tmpreg = CLK->CSSR;
2457  003e c650c8        	ld	a,20680
2458  0041 6b01          	ld	(OFST-2,sp),a
2461  0043 2005          	jra	L3421
2462  0045               L5521:
2463                     ; 665     tmpreg = CLK->CCOR;
2465  0045 c650c9        	ld	a,20681
2466  0048 6b01          	ld	(OFST-2,sp),a
2468  004a               L3421:
2469                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2471  004a 7b05          	ld	a,(OFST+2,sp)
2472  004c 1501          	bcp	a,(OFST-2,sp)
2473  004e 2707          	jreq	L1621
2474                     ; 670     bitstatus = SET;
2476  0050 ae0001        	ldw	x,#1
2477  0053 1f02          	ldw	(OFST-1,sp),x
2480  0055 2003          	jra	L3621
2481  0057               L1621:
2482                     ; 674     bitstatus = RESET;
2484  0057 5f            	clrw	x
2485  0058 1f02          	ldw	(OFST-1,sp),x
2487  005a               L3621:
2488                     ; 678   return((FlagStatus)bitstatus);
2490  005a 1e02          	ldw	x,(OFST-1,sp)
2493  005c 5b05          	addw	sp,#5
2494  005e 81            	ret
2540                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2540                     ; 688 {
2541                     .text:	section	.text,new
2542  0000               _CLK_GetITStatus:
2544  0000 89            	pushw	x
2545  0001 89            	pushw	x
2546       00000002      OFST:	set	2
2549                     ; 689   ITStatus bitstatus = RESET;
2551                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
2553                     ; 694   if (CLK_IT == CLK_IT_SWIF)
2555  0002 a3001c        	cpw	x,#28
2556  0005 2614          	jrne	L7031
2557                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2559  0007 9f            	ld	a,xl
2560  0008 c450c5        	and	a,20677
2561  000b a10c          	cp	a,#12
2562  000d 2607          	jrne	L1131
2563                     ; 699       bitstatus = SET;
2565  000f ae0001        	ldw	x,#1
2566  0012 1f01          	ldw	(OFST-1,sp),x
2569  0014 2018          	jra	L5131
2570  0016               L1131:
2571                     ; 703       bitstatus = RESET;
2573  0016 5f            	clrw	x
2574  0017 1f01          	ldw	(OFST-1,sp),x
2576  0019 2013          	jra	L5131
2577  001b               L7031:
2578                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2580  001b c650c8        	ld	a,20680
2581  001e 1404          	and	a,(OFST+2,sp)
2582  0020 a10c          	cp	a,#12
2583  0022 2607          	jrne	L7131
2584                     ; 711       bitstatus = SET;
2586  0024 ae0001        	ldw	x,#1
2587  0027 1f01          	ldw	(OFST-1,sp),x
2590  0029 2003          	jra	L5131
2591  002b               L7131:
2592                     ; 715       bitstatus = RESET;
2594  002b 5f            	clrw	x
2595  002c 1f01          	ldw	(OFST-1,sp),x
2597  002e               L5131:
2598                     ; 720   return bitstatus;
2600  002e 1e01          	ldw	x,(OFST-1,sp)
2603  0030 5b04          	addw	sp,#4
2604  0032 81            	ret
2640                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2640                     ; 730 {
2641                     .text:	section	.text,new
2642  0000               _CLK_ClearITPendingBit:
2646                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
2648                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2650  0000 a3000c        	cpw	x,#12
2651  0003 2606          	jrne	L1431
2652                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
2654  0005 721750c8      	bres	20680,#3
2656  0009 2004          	jra	L3431
2657  000b               L1431:
2658                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2660  000b 721750c5      	bres	20677,#3
2661  000f               L3431:
2662                     ; 745 }
2665  000f 81            	ret
2700                     	xdef	_CLKPrescTable
2701                     	xdef	_HSIDivFactor
2702                     	xdef	_CLK_ClearITPendingBit
2703                     	xdef	_CLK_GetITStatus
2704                     	xdef	_CLK_GetFlagStatus
2705                     	xdef	_CLK_GetSYSCLKSource
2706                     	xdef	_CLK_GetClockFreq
2707                     	xdef	_CLK_AdjustHSICalibrationValue
2708                     	xdef	_CLK_SYSCLKEmergencyClear
2709                     	xdef	_CLK_ClockSecuritySystemEnable
2710                     	xdef	_CLK_SWIMConfig
2711                     	xdef	_CLK_SYSCLKConfig
2712                     	xdef	_CLK_ITConfig
2713                     	xdef	_CLK_CCOConfig
2714                     	xdef	_CLK_HSIPrescalerConfig
2715                     	xdef	_CLK_ClockSwitchConfig
2716                     	xdef	_CLK_PeripheralClockConfig
2717                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2718                     	xdef	_CLK_FastHaltWakeUpCmd
2719                     	xdef	_CLK_ClockSwitchCmd
2720                     	xdef	_CLK_CCOCmd
2721                     	xdef	_CLK_LSICmd
2722                     	xdef	_CLK_HSICmd
2723                     	xdef	_CLK_HSECmd
2724                     	xdef	_CLK_DeInit
2725                     	xref.b	c_lreg
2726                     	xref.b	c_x
2745                     	xref	c_ltor
2746                     	xref	c_ludv
2747                     	xref	c_rtol
2748                     	end
