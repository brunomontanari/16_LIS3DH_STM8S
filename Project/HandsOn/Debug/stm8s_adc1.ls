   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  45                     ; 52 void ADC1_DeInit(void)
  45                     ; 53 {
  47                     .text:	section	.text,new
  48  0000               _ADC1_DeInit:
  52                     ; 54   ADC1->CSR  = ADC1_CSR_RESET_VALUE;
  54  0000 725f5400      	clr	21504
  55                     ; 55   ADC1->CR1  = ADC1_CR1_RESET_VALUE;
  57  0004 725f5401      	clr	21505
  58                     ; 56   ADC1->CR2  = ADC1_CR2_RESET_VALUE;
  60  0008 725f5402      	clr	21506
  61                     ; 57   ADC1->CR3  = ADC1_CR3_RESET_VALUE;
  63  000c 725f5403      	clr	21507
  64                     ; 58   ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
  66  0010 725f5406      	clr	21510
  67                     ; 59   ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
  69  0014 725f5407      	clr	21511
  70                     ; 60   ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
  72  0018 35ff5408      	mov	21512,#255
  73                     ; 61   ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
  75  001c 35035409      	mov	21513,#3
  76                     ; 62   ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
  78  0020 725f540a      	clr	21514
  79                     ; 63   ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
  81  0024 725f540b      	clr	21515
  82                     ; 64   ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
  84  0028 725f540e      	clr	21518
  85                     ; 65   ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
  87  002c 725f540f      	clr	21519
  88                     ; 66 }
  91  0030 81            	ret
 542                     ; 88 void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
 542                     ; 89 {
 543                     .text:	section	.text,new
 544  0000               _ADC1_Init:
 546  0000 89            	pushw	x
 547       00000000      OFST:	set	0
 550                     ; 91   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
 552                     ; 92   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
 554                     ; 93   assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
 556                     ; 94   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
 558                     ; 95   assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
 560                     ; 96   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
 562                     ; 97   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 564                     ; 98   assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
 566                     ; 103   ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
 568  0001 1e0d          	ldw	x,(OFST+13,sp)
 569  0003 89            	pushw	x
 570  0004 1e07          	ldw	x,(OFST+7,sp)
 571  0006 89            	pushw	x
 572  0007 1e05          	ldw	x,(OFST+5,sp)
 573  0009 cd0000        	call	_ADC1_ConversionConfig
 575  000c 5b04          	addw	sp,#4
 576                     ; 105   ADC1_PrescalerConfig(ADC1_PrescalerSelection);
 578  000e 1e07          	ldw	x,(OFST+7,sp)
 579  0010 cd0000        	call	_ADC1_PrescalerConfig
 581                     ; 110   ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
 583  0013 1e0b          	ldw	x,(OFST+11,sp)
 584  0015 89            	pushw	x
 585  0016 1e0b          	ldw	x,(OFST+11,sp)
 586  0018 cd0000        	call	_ADC1_ExternalTriggerConfig
 588  001b 85            	popw	x
 589                     ; 115   ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
 591  001c 1e11          	ldw	x,(OFST+17,sp)
 592  001e 89            	pushw	x
 593  001f 1e11          	ldw	x,(OFST+17,sp)
 594  0021 cd0000        	call	_ADC1_SchmittTriggerConfig
 596  0024 85            	popw	x
 597                     ; 118   ADC1->CR1 |= ADC1_CR1_ADON;
 599  0025 72105401      	bset	21505,#0
 600                     ; 119 }
 603  0029 85            	popw	x
 604  002a 81            	ret
 639                     ; 126 void ADC1_Cmd(FunctionalState NewState)
 639                     ; 127 {
 640                     .text:	section	.text,new
 641  0000               _ADC1_Cmd:
 645                     ; 129   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 647                     ; 131   if (NewState != DISABLE)
 649  0000 a30000        	cpw	x,#0
 650  0003 2706          	jreq	L362
 651                     ; 133     ADC1->CR1 |= ADC1_CR1_ADON;
 653  0005 72105401      	bset	21505,#0
 655  0009 2004          	jra	L562
 656  000b               L362:
 657                     ; 137     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
 659  000b 72115401      	bres	21505,#0
 660  000f               L562:
 661                     ; 139 }
 664  000f 81            	ret
 699                     ; 146 void ADC1_ScanModeCmd(FunctionalState NewState)
 699                     ; 147 {
 700                     .text:	section	.text,new
 701  0000               _ADC1_ScanModeCmd:
 705                     ; 149   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 707                     ; 151   if (NewState != DISABLE)
 709  0000 a30000        	cpw	x,#0
 710  0003 2706          	jreq	L503
 711                     ; 153     ADC1->CR2 |= ADC1_CR2_SCAN;
 713  0005 72125402      	bset	21506,#1
 715  0009 2004          	jra	L703
 716  000b               L503:
 717                     ; 157     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
 719  000b 72135402      	bres	21506,#1
 720  000f               L703:
 721                     ; 159 }
 724  000f 81            	ret
 759                     ; 166 void ADC1_DataBufferCmd(FunctionalState NewState)
 759                     ; 167 {
 760                     .text:	section	.text,new
 761  0000               _ADC1_DataBufferCmd:
 765                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 767                     ; 171   if (NewState != DISABLE)
 769  0000 a30000        	cpw	x,#0
 770  0003 2706          	jreq	L723
 771                     ; 173     ADC1->CR3 |= ADC1_CR3_DBUF;
 773  0005 721e5403      	bset	21507,#7
 775  0009 2004          	jra	L133
 776  000b               L723:
 777                     ; 177     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
 779  000b 721f5403      	bres	21507,#7
 780  000f               L133:
 781                     ; 179 }
 784  000f 81            	ret
 940                     ; 190 void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
 940                     ; 191 {
 941                     .text:	section	.text,new
 942  0000               _ADC1_ITConfig:
 944  0000 89            	pushw	x
 945       00000000      OFST:	set	0
 948                     ; 193   assert_param(IS_ADC1_IT_OK(ADC1_IT));
 950                     ; 194   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 952                     ; 196   if (NewState != DISABLE)
 954  0001 1e05          	ldw	x,(OFST+5,sp)
 955  0003 270a          	jreq	L714
 956                     ; 199     ADC1->CSR |= (uint8_t)ADC1_IT;
 958  0005 c65400        	ld	a,21504
 959  0008 1a02          	or	a,(OFST+2,sp)
 960  000a c75400        	ld	21504,a
 962  000d 2009          	jra	L124
 963  000f               L714:
 964                     ; 204     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
 966  000f 7b02          	ld	a,(OFST+2,sp)
 967  0011 43            	cpl	a
 968  0012 c45400        	and	a,21504
 969  0015 c75400        	ld	21504,a
 970  0018               L124:
 971                     ; 206 }
 974  0018 85            	popw	x
 975  0019 81            	ret
1011                     ; 214 void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
1011                     ; 215 {
1012                     .text:	section	.text,new
1013  0000               _ADC1_PrescalerConfig:
1017                     ; 217   assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
1019                     ; 220   ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
1021  0000 c65401        	ld	a,21505
1022  0003 a48f          	and	a,#143
1023  0005 c75401        	ld	21505,a
1024                     ; 222   ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
1026  0008 9f            	ld	a,xl
1027  0009 ca5401        	or	a,21505
1028  000c c75401        	ld	21505,a
1029                     ; 223 }
1032  000f 81            	ret
1079                     ; 233 void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
1079                     ; 234 {
1080                     .text:	section	.text,new
1081  0000               _ADC1_SchmittTriggerConfig:
1083  0000 89            	pushw	x
1084       00000000      OFST:	set	0
1087                     ; 236   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
1089                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1091                     ; 239   if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
1093  0001 a300ff        	cpw	x,#255
1094  0004 2620          	jrne	L364
1095                     ; 241     if (NewState != DISABLE)
1097  0006 1e05          	ldw	x,(OFST+5,sp)
1098  0008 270a          	jreq	L564
1099                     ; 243       ADC1->TDRL &= (uint8_t)0x0;
1101  000a 725f5407      	clr	21511
1102                     ; 244       ADC1->TDRH &= (uint8_t)0x0;
1104  000e 725f5406      	clr	21510
1106  0012 207a          	jra	L174
1107  0014               L564:
1108                     ; 248       ADC1->TDRL |= (uint8_t)0xFF;
1110  0014 c65407        	ld	a,21511
1111  0017 aaff          	or	a,#255
1112  0019 c75407        	ld	21511,a
1113                     ; 249       ADC1->TDRH |= (uint8_t)0xFF;
1115  001c c65406        	ld	a,21510
1116  001f aaff          	or	a,#255
1117  0021 c75406        	ld	21510,a
1118  0024 2068          	jra	L174
1119  0026               L364:
1120                     ; 252   else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
1122  0026 9c            	rvf
1123  0027 1e01          	ldw	x,(OFST+1,sp)
1124  0029 a30008        	cpw	x,#8
1125  002c 2e2f          	jrsge	L374
1126                     ; 254     if (NewState != DISABLE)
1128  002e 1e05          	ldw	x,(OFST+5,sp)
1129  0030 2716          	jreq	L574
1130                     ; 256       ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
1132  0032 7b02          	ld	a,(OFST+2,sp)
1133  0034 5f            	clrw	x
1134  0035 97            	ld	xl,a
1135  0036 a601          	ld	a,#1
1136  0038 5d            	tnzw	x
1137  0039 2704          	jreq	L42
1138  003b               L62:
1139  003b 48            	sll	a
1140  003c 5a            	decw	x
1141  003d 26fc          	jrne	L62
1142  003f               L42:
1143  003f 43            	cpl	a
1144  0040 c45407        	and	a,21511
1145  0043 c75407        	ld	21511,a
1147  0046 2046          	jra	L174
1148  0048               L574:
1149                     ; 260       ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
1151  0048 7b02          	ld	a,(OFST+2,sp)
1152  004a 5f            	clrw	x
1153  004b 97            	ld	xl,a
1154  004c a601          	ld	a,#1
1155  004e 5d            	tnzw	x
1156  004f 2704          	jreq	L03
1157  0051               L23:
1158  0051 48            	sll	a
1159  0052 5a            	decw	x
1160  0053 26fc          	jrne	L23
1161  0055               L03:
1162  0055 ca5407        	or	a,21511
1163  0058 c75407        	ld	21511,a
1164  005b 2031          	jra	L174
1165  005d               L374:
1166                     ; 265     if (NewState != DISABLE)
1168  005d 1e05          	ldw	x,(OFST+5,sp)
1169  005f 2718          	jreq	L305
1170                     ; 267       ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
1172  0061 7b02          	ld	a,(OFST+2,sp)
1173  0063 a008          	sub	a,#8
1174  0065 5f            	clrw	x
1175  0066 97            	ld	xl,a
1176  0067 a601          	ld	a,#1
1177  0069 5d            	tnzw	x
1178  006a 2704          	jreq	L43
1179  006c               L63:
1180  006c 48            	sll	a
1181  006d 5a            	decw	x
1182  006e 26fc          	jrne	L63
1183  0070               L43:
1184  0070 43            	cpl	a
1185  0071 c45406        	and	a,21510
1186  0074 c75406        	ld	21510,a
1188  0077 2015          	jra	L174
1189  0079               L305:
1190                     ; 271       ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
1192  0079 7b02          	ld	a,(OFST+2,sp)
1193  007b a008          	sub	a,#8
1194  007d 5f            	clrw	x
1195  007e 97            	ld	xl,a
1196  007f a601          	ld	a,#1
1197  0081 5d            	tnzw	x
1198  0082 2704          	jreq	L04
1199  0084               L24:
1200  0084 48            	sll	a
1201  0085 5a            	decw	x
1202  0086 26fc          	jrne	L24
1203  0088               L04:
1204  0088 ca5406        	or	a,21510
1205  008b c75406        	ld	21510,a
1206  008e               L174:
1207                     ; 274 }
1210  008e 85            	popw	x
1211  008f 81            	ret
1268                     ; 286 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
1268                     ; 287 {
1269                     .text:	section	.text,new
1270  0000               _ADC1_ConversionConfig:
1272  0000 89            	pushw	x
1273       00000000      OFST:	set	0
1276                     ; 289   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
1278                     ; 290   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
1280                     ; 291   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
1282                     ; 294   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
1284  0001 72175402      	bres	21506,#3
1285                     ; 296   ADC1->CR2 |= (uint8_t)(ADC1_Align);
1287  0005 c65402        	ld	a,21506
1288  0008 1a08          	or	a,(OFST+8,sp)
1289  000a c75402        	ld	21506,a
1290                     ; 298   if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
1292  000d a30001        	cpw	x,#1
1293  0010 2606          	jrne	L535
1294                     ; 301     ADC1->CR1 |= ADC1_CR1_CONT;
1296  0012 72125401      	bset	21505,#1
1298  0016 2004          	jra	L735
1299  0018               L535:
1300                     ; 306     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
1302  0018 72135401      	bres	21505,#1
1303  001c               L735:
1304                     ; 310   ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
1306  001c c65400        	ld	a,21504
1307  001f a4f0          	and	a,#240
1308  0021 c75400        	ld	21504,a
1309                     ; 312   ADC1->CSR |= (uint8_t)(ADC1_Channel);
1311  0024 c65400        	ld	a,21504
1312  0027 1a06          	or	a,(OFST+6,sp)
1313  0029 c75400        	ld	21504,a
1314                     ; 313 }
1317  002c 85            	popw	x
1318  002d 81            	ret
1364                     ; 325 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
1364                     ; 326 {
1365                     .text:	section	.text,new
1366  0000               _ADC1_ExternalTriggerConfig:
1368  0000 89            	pushw	x
1369       00000000      OFST:	set	0
1372                     ; 328   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
1374                     ; 329   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1376                     ; 332   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
1378  0001 c65402        	ld	a,21506
1379  0004 a4cf          	and	a,#207
1380  0006 c75402        	ld	21506,a
1381                     ; 334   if (NewState != DISABLE)
1383  0009 1e05          	ldw	x,(OFST+5,sp)
1384  000b 2706          	jreq	L365
1385                     ; 337     ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
1387  000d 721c5402      	bset	21506,#6
1389  0011 2004          	jra	L565
1390  0013               L365:
1391                     ; 342     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
1393  0013 721d5402      	bres	21506,#6
1394  0017               L565:
1395                     ; 346   ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
1397  0017 c65402        	ld	a,21506
1398  001a 1a02          	or	a,(OFST+2,sp)
1399  001c c75402        	ld	21506,a
1400                     ; 347 }
1403  001f 85            	popw	x
1404  0020 81            	ret
1428                     ; 358 void ADC1_StartConversion(void)
1428                     ; 359 {
1429                     .text:	section	.text,new
1430  0000               _ADC1_StartConversion:
1434                     ; 360   ADC1->CR1 |= ADC1_CR1_ADON;
1436  0000 72105401      	bset	21505,#0
1437                     ; 361 }
1440  0004 81            	ret
1484                     ; 370 uint16_t ADC1_GetConversionValue(void)
1484                     ; 371 {
1485                     .text:	section	.text,new
1486  0000               _ADC1_GetConversionValue:
1488  0000 5205          	subw	sp,#5
1489       00000005      OFST:	set	5
1492                     ; 372   uint16_t temph = 0;
1494                     ; 373   uint8_t templ = 0;
1496                     ; 375   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1498  0002 c65402        	ld	a,21506
1499  0005 a508          	bcp	a,#8
1500  0007 2715          	jreq	L126
1501                     ; 378     templ = ADC1->DRL;
1503  0009 c65405        	ld	a,21509
1504  000c 6b03          	ld	(OFST-2,sp),a
1506                     ; 380     temph = ADC1->DRH;
1508  000e c65404        	ld	a,21508
1509  0011 5f            	clrw	x
1510  0012 97            	ld	xl,a
1511  0013 1f04          	ldw	(OFST-1,sp),x
1513                     ; 382     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1515  0015 1e04          	ldw	x,(OFST-1,sp)
1516  0017 7b03          	ld	a,(OFST-2,sp)
1517  0019 02            	rlwa	x,a
1518  001a 1f04          	ldw	(OFST-1,sp),x
1521  001c 2021          	jra	L326
1522  001e               L126:
1523                     ; 387     temph = ADC1->DRH;
1525  001e c65404        	ld	a,21508
1526  0021 5f            	clrw	x
1527  0022 97            	ld	xl,a
1528  0023 1f04          	ldw	(OFST-1,sp),x
1530                     ; 389     templ = ADC1->DRL;
1532  0025 c65405        	ld	a,21509
1533  0028 6b03          	ld	(OFST-2,sp),a
1535                     ; 391     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1537  002a 1e04          	ldw	x,(OFST-1,sp)
1538  002c 4f            	clr	a
1539  002d 02            	rlwa	x,a
1540  002e 1f01          	ldw	(OFST-4,sp),x
1542  0030 7b03          	ld	a,(OFST-2,sp)
1543  0032 97            	ld	xl,a
1544  0033 a640          	ld	a,#64
1545  0035 42            	mul	x,a
1546  0036 01            	rrwa	x,a
1547  0037 1a02          	or	a,(OFST-3,sp)
1548  0039 01            	rrwa	x,a
1549  003a 1a01          	or	a,(OFST-4,sp)
1550  003c 01            	rrwa	x,a
1551  003d 1f04          	ldw	(OFST-1,sp),x
1553  003f               L326:
1554                     ; 394   return ((uint16_t)temph);
1556  003f 1e04          	ldw	x,(OFST-1,sp)
1559  0041 5b05          	addw	sp,#5
1560  0043 81            	ret
1606                     ; 405 void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
1606                     ; 406 {
1607                     .text:	section	.text,new
1608  0000               _ADC1_AWDChannelConfig:
1610  0000 89            	pushw	x
1611       00000000      OFST:	set	0
1614                     ; 408   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1616                     ; 409   assert_param(IS_ADC1_CHANNEL_OK(Channel));
1618                     ; 411   if (Channel < (uint8_t)8)
1620  0001 9c            	rvf
1621  0002 a30008        	cpw	x,#8
1622  0005 2e37          	jrsge	L746
1623                     ; 413     if (NewState != DISABLE)
1625  0007 1e05          	ldw	x,(OFST+5,sp)
1626  0009 2719          	jreq	L156
1627                     ; 415       ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
1629  000b 7b02          	ld	a,(OFST+2,sp)
1630  000d 5f            	clrw	x
1631  000e 4d            	tnz	a
1632  000f 2a01          	jrpl	L65
1633  0011 53            	cplw	x
1634  0012               L65:
1635  0012 97            	ld	xl,a
1636  0013 a601          	ld	a,#1
1637  0015 5d            	tnzw	x
1638  0016 2704          	jreq	L06
1639  0018               L26:
1640  0018 48            	sll	a
1641  0019 5a            	decw	x
1642  001a 26fc          	jrne	L26
1643  001c               L06:
1644  001c ca540f        	or	a,21519
1645  001f c7540f        	ld	21519,a
1647  0022 204b          	jra	L556
1648  0024               L156:
1649                     ; 419       ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
1651  0024 7b02          	ld	a,(OFST+2,sp)
1652  0026 5f            	clrw	x
1653  0027 4d            	tnz	a
1654  0028 2a01          	jrpl	L46
1655  002a 53            	cplw	x
1656  002b               L46:
1657  002b 97            	ld	xl,a
1658  002c a601          	ld	a,#1
1659  002e 5d            	tnzw	x
1660  002f 2704          	jreq	L66
1661  0031               L07:
1662  0031 48            	sll	a
1663  0032 5a            	decw	x
1664  0033 26fc          	jrne	L07
1665  0035               L66:
1666  0035 43            	cpl	a
1667  0036 c4540f        	and	a,21519
1668  0039 c7540f        	ld	21519,a
1669  003c 2031          	jra	L556
1670  003e               L746:
1671                     ; 424     if (NewState != DISABLE)
1673  003e 1e05          	ldw	x,(OFST+5,sp)
1674  0040 2717          	jreq	L756
1675                     ; 426       ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
1677  0042 7b02          	ld	a,(OFST+2,sp)
1678  0044 a008          	sub	a,#8
1679  0046 5f            	clrw	x
1680  0047 97            	ld	xl,a
1681  0048 a601          	ld	a,#1
1682  004a 5d            	tnzw	x
1683  004b 2704          	jreq	L27
1684  004d               L47:
1685  004d 48            	sll	a
1686  004e 5a            	decw	x
1687  004f 26fc          	jrne	L47
1688  0051               L27:
1689  0051 ca540e        	or	a,21518
1690  0054 c7540e        	ld	21518,a
1692  0057 2016          	jra	L556
1693  0059               L756:
1694                     ; 430       ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
1696  0059 7b02          	ld	a,(OFST+2,sp)
1697  005b a008          	sub	a,#8
1698  005d 5f            	clrw	x
1699  005e 97            	ld	xl,a
1700  005f a601          	ld	a,#1
1701  0061 5d            	tnzw	x
1702  0062 2704          	jreq	L67
1703  0064               L001:
1704  0064 48            	sll	a
1705  0065 5a            	decw	x
1706  0066 26fc          	jrne	L001
1707  0068               L67:
1708  0068 43            	cpl	a
1709  0069 c4540e        	and	a,21518
1710  006c c7540e        	ld	21518,a
1711  006f               L556:
1712                     ; 433 }
1715  006f 85            	popw	x
1716  0070 81            	ret
1751                     ; 441 void ADC1_SetHighThreshold(uint16_t Threshold)
1751                     ; 442 {
1752                     .text:	section	.text,new
1753  0000               _ADC1_SetHighThreshold:
1755  0000 89            	pushw	x
1756       00000000      OFST:	set	0
1759                     ; 443   ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
1761  0001 54            	srlw	x
1762  0002 54            	srlw	x
1763  0003 9f            	ld	a,xl
1764  0004 c75408        	ld	21512,a
1765                     ; 444   ADC1->HTRL = (uint8_t)Threshold;
1767  0007 7b02          	ld	a,(OFST+2,sp)
1768  0009 c75409        	ld	21513,a
1769                     ; 445 }
1772  000c 85            	popw	x
1773  000d 81            	ret
1808                     ; 453 void ADC1_SetLowThreshold(uint16_t Threshold)
1808                     ; 454 {
1809                     .text:	section	.text,new
1810  0000               _ADC1_SetLowThreshold:
1814                     ; 455   ADC1->LTRL = (uint8_t)Threshold;
1816  0000 9f            	ld	a,xl
1817  0001 c7540b        	ld	21515,a
1818                     ; 456   ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
1820  0004 54            	srlw	x
1821  0005 54            	srlw	x
1822  0006 9f            	ld	a,xl
1823  0007 c7540a        	ld	21514,a
1824                     ; 457 }
1827  000a 81            	ret
1880                     ; 466 uint16_t ADC1_GetBufferValue(uint8_t Buffer)
1880                     ; 467 {
1881                     .text:	section	.text,new
1882  0000               _ADC1_GetBufferValue:
1884  0000 88            	push	a
1885  0001 5205          	subw	sp,#5
1886       00000005      OFST:	set	5
1889                     ; 468   uint16_t temph = 0;
1891                     ; 469   uint8_t templ = 0;
1893                     ; 472   assert_param(IS_ADC1_BUFFER_OK(Buffer));
1895                     ; 474   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1897  0003 c65402        	ld	a,21506
1898  0006 a508          	bcp	a,#8
1899  0008 271f          	jreq	L547
1900                     ; 477     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1902  000a 7b06          	ld	a,(OFST+1,sp)
1903  000c 48            	sll	a
1904  000d 5f            	clrw	x
1905  000e 97            	ld	xl,a
1906  000f d653e1        	ld	a,(21473,x)
1907  0012 6b03          	ld	(OFST-2,sp),a
1909                     ; 479     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1911  0014 7b06          	ld	a,(OFST+1,sp)
1912  0016 48            	sll	a
1913  0017 5f            	clrw	x
1914  0018 97            	ld	xl,a
1915  0019 d653e0        	ld	a,(21472,x)
1916  001c 5f            	clrw	x
1917  001d 97            	ld	xl,a
1918  001e 1f04          	ldw	(OFST-1,sp),x
1920                     ; 481     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1922  0020 1e04          	ldw	x,(OFST-1,sp)
1923  0022 7b03          	ld	a,(OFST-2,sp)
1924  0024 02            	rlwa	x,a
1925  0025 1f04          	ldw	(OFST-1,sp),x
1928  0027 202b          	jra	L747
1929  0029               L547:
1930                     ; 486     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1932  0029 7b06          	ld	a,(OFST+1,sp)
1933  002b 48            	sll	a
1934  002c 5f            	clrw	x
1935  002d 97            	ld	xl,a
1936  002e d653e0        	ld	a,(21472,x)
1937  0031 5f            	clrw	x
1938  0032 97            	ld	xl,a
1939  0033 1f04          	ldw	(OFST-1,sp),x
1941                     ; 488     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1943  0035 7b06          	ld	a,(OFST+1,sp)
1944  0037 48            	sll	a
1945  0038 5f            	clrw	x
1946  0039 97            	ld	xl,a
1947  003a d653e1        	ld	a,(21473,x)
1948  003d 6b03          	ld	(OFST-2,sp),a
1950                     ; 490     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
1952  003f 1e04          	ldw	x,(OFST-1,sp)
1953  0041 4f            	clr	a
1954  0042 02            	rlwa	x,a
1955  0043 1f01          	ldw	(OFST-4,sp),x
1957  0045 7b03          	ld	a,(OFST-2,sp)
1958  0047 97            	ld	xl,a
1959  0048 a640          	ld	a,#64
1960  004a 42            	mul	x,a
1961  004b 01            	rrwa	x,a
1962  004c 1a02          	or	a,(OFST-3,sp)
1963  004e 01            	rrwa	x,a
1964  004f 1a01          	or	a,(OFST-4,sp)
1965  0051 01            	rrwa	x,a
1966  0052 1f04          	ldw	(OFST-1,sp),x
1968  0054               L747:
1969                     ; 493   return ((uint16_t)temph);
1971  0054 1e04          	ldw	x,(OFST-1,sp)
1974  0056 5b06          	addw	sp,#6
1975  0058 81            	ret
2041                     ; 502 FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
2041                     ; 503 {
2042                     .text:	section	.text,new
2043  0000               _ADC1_GetAWDChannelStatus:
2045  0000 89            	pushw	x
2046  0001 88            	push	a
2047       00000001      OFST:	set	1
2050                     ; 504   uint8_t status = 0;
2052                     ; 507   assert_param(IS_ADC1_CHANNEL_OK(Channel));
2054                     ; 509   if (Channel < (uint8_t)8)
2056  0002 9c            	rvf
2057  0003 a30008        	cpw	x,#8
2058  0006 2e17          	jrsge	L3001
2059                     ; 511     status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
2061  0008 9f            	ld	a,xl
2062  0009 5f            	clrw	x
2063  000a 4d            	tnz	a
2064  000b 2a01          	jrpl	L211
2065  000d 53            	cplw	x
2066  000e               L211:
2067  000e 97            	ld	xl,a
2068  000f a601          	ld	a,#1
2069  0011 5d            	tnzw	x
2070  0012 2704          	jreq	L411
2071  0014               L611:
2072  0014 48            	sll	a
2073  0015 5a            	decw	x
2074  0016 26fc          	jrne	L611
2075  0018               L411:
2076  0018 c4540d        	and	a,21517
2077  001b 6b01          	ld	(OFST+0,sp),a
2080  001d 2014          	jra	L5001
2081  001f               L3001:
2082                     ; 515     status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
2084  001f 7b03          	ld	a,(OFST+2,sp)
2085  0021 a008          	sub	a,#8
2086  0023 5f            	clrw	x
2087  0024 97            	ld	xl,a
2088  0025 a601          	ld	a,#1
2089  0027 5d            	tnzw	x
2090  0028 2704          	jreq	L021
2091  002a               L221:
2092  002a 48            	sll	a
2093  002b 5a            	decw	x
2094  002c 26fc          	jrne	L221
2095  002e               L021:
2096  002e c4540c        	and	a,21516
2097  0031 6b01          	ld	(OFST+0,sp),a
2099  0033               L5001:
2100                     ; 518   return ((FlagStatus)status);
2102  0033 7b01          	ld	a,(OFST+0,sp)
2103  0035 5f            	clrw	x
2104  0036 97            	ld	xl,a
2107  0037 5b03          	addw	sp,#3
2108  0039 81            	ret
2266                     ; 527 FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
2266                     ; 528 {
2267                     .text:	section	.text,new
2268  0000               _ADC1_GetFlagStatus:
2270  0000 89            	pushw	x
2271  0001 88            	push	a
2272       00000001      OFST:	set	1
2275                     ; 529   uint8_t flagstatus = 0;
2277                     ; 530   uint8_t temp = 0;
2279                     ; 533   assert_param(IS_ADC1_FLAG_OK(Flag));
2281                     ; 535   if ((Flag & 0x0F) == 0x01)
2283  0002 01            	rrwa	x,a
2284  0003 a40f          	and	a,#15
2285  0005 5f            	clrw	x
2286  0006 02            	rlwa	x,a
2287  0007 a30001        	cpw	x,#1
2288  000a 2609          	jrne	L5701
2289                     ; 538     flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
2291  000c c65403        	ld	a,21507
2292  000f a440          	and	a,#64
2293  0011 6b01          	ld	(OFST+0,sp),a
2296  0013 204b          	jra	L7701
2297  0015               L5701:
2298                     ; 540   else if ((Flag & 0xF0) == 0x10)
2300  0015 7b02          	ld	a,(OFST+1,sp)
2301  0017 97            	ld	xl,a
2302  0018 7b03          	ld	a,(OFST+2,sp)
2303  001a a4f0          	and	a,#240
2304  001c 5f            	clrw	x
2305  001d 02            	rlwa	x,a
2306  001e a30010        	cpw	x,#16
2307  0021 2636          	jrne	L1011
2308                     ; 543     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2310  0023 7b03          	ld	a,(OFST+2,sp)
2311  0025 a40f          	and	a,#15
2312  0027 6b01          	ld	(OFST+0,sp),a
2314                     ; 544     if (temp < 8)
2316  0029 7b01          	ld	a,(OFST+0,sp)
2317  002b a108          	cp	a,#8
2318  002d 2414          	jruge	L3011
2319                     ; 546       flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2321  002f 7b01          	ld	a,(OFST+0,sp)
2322  0031 5f            	clrw	x
2323  0032 97            	ld	xl,a
2324  0033 a601          	ld	a,#1
2325  0035 5d            	tnzw	x
2326  0036 2704          	jreq	L621
2327  0038               L031:
2328  0038 48            	sll	a
2329  0039 5a            	decw	x
2330  003a 26fc          	jrne	L031
2331  003c               L621:
2332  003c c4540d        	and	a,21517
2333  003f 6b01          	ld	(OFST+0,sp),a
2336  0041 201d          	jra	L7701
2337  0043               L3011:
2338                     ; 550       flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2340  0043 7b01          	ld	a,(OFST+0,sp)
2341  0045 a008          	sub	a,#8
2342  0047 5f            	clrw	x
2343  0048 97            	ld	xl,a
2344  0049 a601          	ld	a,#1
2345  004b 5d            	tnzw	x
2346  004c 2704          	jreq	L231
2347  004e               L431:
2348  004e 48            	sll	a
2349  004f 5a            	decw	x
2350  0050 26fc          	jrne	L431
2351  0052               L231:
2352  0052 c4540c        	and	a,21516
2353  0055 6b01          	ld	(OFST+0,sp),a
2355  0057 2007          	jra	L7701
2356  0059               L1011:
2357                     ; 555     flagstatus = (uint8_t)(ADC1->CSR & Flag);
2359  0059 c65400        	ld	a,21504
2360  005c 1403          	and	a,(OFST+2,sp)
2361  005e 6b01          	ld	(OFST+0,sp),a
2363  0060               L7701:
2364                     ; 557   return ((FlagStatus)flagstatus);
2366  0060 7b01          	ld	a,(OFST+0,sp)
2367  0062 5f            	clrw	x
2368  0063 97            	ld	xl,a
2371  0064 5b03          	addw	sp,#3
2372  0066 81            	ret
2416                     ; 567 void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
2416                     ; 568 {
2417                     .text:	section	.text,new
2418  0000               _ADC1_ClearFlag:
2420  0000 89            	pushw	x
2421  0001 88            	push	a
2422       00000001      OFST:	set	1
2425                     ; 569   uint8_t temp = 0;
2427                     ; 572   assert_param(IS_ADC1_FLAG_OK(Flag));
2429                     ; 574   if ((Flag & 0x0F) == 0x01)
2431  0002 01            	rrwa	x,a
2432  0003 a40f          	and	a,#15
2433  0005 5f            	clrw	x
2434  0006 02            	rlwa	x,a
2435  0007 a30001        	cpw	x,#1
2436  000a 2606          	jrne	L3311
2437                     ; 577     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
2439  000c 721d5403      	bres	21507,#6
2441  0010 2051          	jra	L5311
2442  0012               L3311:
2443                     ; 579   else if ((Flag & 0xF0) == 0x10)
2445  0012 7b02          	ld	a,(OFST+1,sp)
2446  0014 97            	ld	xl,a
2447  0015 7b03          	ld	a,(OFST+2,sp)
2448  0017 a4f0          	and	a,#240
2449  0019 5f            	clrw	x
2450  001a 02            	rlwa	x,a
2451  001b a30010        	cpw	x,#16
2452  001e 263a          	jrne	L7311
2453                     ; 582     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2455  0020 7b03          	ld	a,(OFST+2,sp)
2456  0022 a40f          	and	a,#15
2457  0024 6b01          	ld	(OFST+0,sp),a
2459                     ; 583     if (temp < 8)
2461  0026 7b01          	ld	a,(OFST+0,sp)
2462  0028 a108          	cp	a,#8
2463  002a 2416          	jruge	L1411
2464                     ; 585       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2466  002c 7b01          	ld	a,(OFST+0,sp)
2467  002e 5f            	clrw	x
2468  002f 97            	ld	xl,a
2469  0030 a601          	ld	a,#1
2470  0032 5d            	tnzw	x
2471  0033 2704          	jreq	L041
2472  0035               L241:
2473  0035 48            	sll	a
2474  0036 5a            	decw	x
2475  0037 26fc          	jrne	L241
2476  0039               L041:
2477  0039 43            	cpl	a
2478  003a c4540d        	and	a,21517
2479  003d c7540d        	ld	21517,a
2481  0040 2021          	jra	L5311
2482  0042               L1411:
2483                     ; 589       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2485  0042 7b01          	ld	a,(OFST+0,sp)
2486  0044 a008          	sub	a,#8
2487  0046 5f            	clrw	x
2488  0047 97            	ld	xl,a
2489  0048 a601          	ld	a,#1
2490  004a 5d            	tnzw	x
2491  004b 2704          	jreq	L441
2492  004d               L641:
2493  004d 48            	sll	a
2494  004e 5a            	decw	x
2495  004f 26fc          	jrne	L641
2496  0051               L441:
2497  0051 43            	cpl	a
2498  0052 c4540c        	and	a,21516
2499  0055 c7540c        	ld	21516,a
2500  0058 2009          	jra	L5311
2501  005a               L7311:
2502                     ; 594     ADC1->CSR &= (uint8_t) (~Flag);
2504  005a 7b03          	ld	a,(OFST+2,sp)
2505  005c 43            	cpl	a
2506  005d c45400        	and	a,21504
2507  0060 c75400        	ld	21504,a
2508  0063               L5311:
2509                     ; 596 }
2512  0063 5b03          	addw	sp,#3
2513  0065 81            	ret
2568                     ; 616 ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
2568                     ; 617 {
2569                     .text:	section	.text,new
2570  0000               _ADC1_GetITStatus:
2572  0000 89            	pushw	x
2573  0001 5205          	subw	sp,#5
2574       00000005      OFST:	set	5
2577                     ; 618   ITStatus itstatus = RESET;
2579                     ; 619   uint8_t temp = 0;
2581                     ; 622   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2583                     ; 624   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2585  0003 01            	rrwa	x,a
2586  0004 a4f0          	and	a,#240
2587  0006 5f            	clrw	x
2588  0007 02            	rlwa	x,a
2589  0008 a30010        	cpw	x,#16
2590  000b 2650          	jrne	L5711
2591                     ; 627     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2593  000d 7b07          	ld	a,(OFST+2,sp)
2594  000f a40f          	and	a,#15
2595  0011 6b05          	ld	(OFST+0,sp),a
2597                     ; 628     if (temp < 8)
2599  0013 7b05          	ld	a,(OFST+0,sp)
2600  0015 a108          	cp	a,#8
2601  0017 2421          	jruge	L7711
2602                     ; 630       itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2604  0019 c6540d        	ld	a,21517
2605  001c 5f            	clrw	x
2606  001d 97            	ld	xl,a
2607  001e 1f01          	ldw	(OFST-4,sp),x
2609  0020 7b05          	ld	a,(OFST+0,sp)
2610  0022 5f            	clrw	x
2611  0023 97            	ld	xl,a
2612  0024 a601          	ld	a,#1
2613  0026 5d            	tnzw	x
2614  0027 2704          	jreq	L251
2615  0029               L451:
2616  0029 48            	sll	a
2617  002a 5a            	decw	x
2618  002b 26fc          	jrne	L451
2619  002d               L251:
2620  002d 5f            	clrw	x
2621  002e 97            	ld	xl,a
2622  002f 01            	rrwa	x,a
2623  0030 1402          	and	a,(OFST-3,sp)
2624  0032 01            	rrwa	x,a
2625  0033 1401          	and	a,(OFST-4,sp)
2626  0035 01            	rrwa	x,a
2627  0036 1f03          	ldw	(OFST-2,sp),x
2630  0038 2037          	jra	L3021
2631  003a               L7711:
2632                     ; 634       itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2634  003a c6540c        	ld	a,21516
2635  003d 5f            	clrw	x
2636  003e 97            	ld	xl,a
2637  003f 1f01          	ldw	(OFST-4,sp),x
2639  0041 7b05          	ld	a,(OFST+0,sp)
2640  0043 a008          	sub	a,#8
2641  0045 5f            	clrw	x
2642  0046 97            	ld	xl,a
2643  0047 a601          	ld	a,#1
2644  0049 5d            	tnzw	x
2645  004a 2704          	jreq	L651
2646  004c               L061:
2647  004c 48            	sll	a
2648  004d 5a            	decw	x
2649  004e 26fc          	jrne	L061
2650  0050               L651:
2651  0050 5f            	clrw	x
2652  0051 97            	ld	xl,a
2653  0052 01            	rrwa	x,a
2654  0053 1402          	and	a,(OFST-3,sp)
2655  0055 01            	rrwa	x,a
2656  0056 1401          	and	a,(OFST-4,sp)
2657  0058 01            	rrwa	x,a
2658  0059 1f03          	ldw	(OFST-2,sp),x
2660  005b 2014          	jra	L3021
2661  005d               L5711:
2662                     ; 639     itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
2664  005d 7b07          	ld	a,(OFST+2,sp)
2665  005f 5f            	clrw	x
2666  0060 97            	ld	xl,a
2667  0061 1f01          	ldw	(OFST-4,sp),x
2669  0063 c65400        	ld	a,21504
2670  0066 5f            	clrw	x
2671  0067 97            	ld	xl,a
2672  0068 01            	rrwa	x,a
2673  0069 1402          	and	a,(OFST-3,sp)
2674  006b 01            	rrwa	x,a
2675  006c 1401          	and	a,(OFST-4,sp)
2676  006e 01            	rrwa	x,a
2677  006f 1f03          	ldw	(OFST-2,sp),x
2679  0071               L3021:
2680                     ; 641   return ((ITStatus)itstatus);
2682  0071 1e03          	ldw	x,(OFST-2,sp)
2685  0073 5b07          	addw	sp,#7
2686  0075 81            	ret
2731                     ; 662 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
2731                     ; 663 {
2732                     .text:	section	.text,new
2733  0000               _ADC1_ClearITPendingBit:
2735  0000 89            	pushw	x
2736  0001 88            	push	a
2737       00000001      OFST:	set	1
2740                     ; 664   uint8_t temp = 0;
2742                     ; 667   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2744                     ; 669   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2746  0002 01            	rrwa	x,a
2747  0003 a4f0          	and	a,#240
2748  0005 5f            	clrw	x
2749  0006 02            	rlwa	x,a
2750  0007 a30010        	cpw	x,#16
2751  000a 263a          	jrne	L7221
2752                     ; 672     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2754  000c 7b03          	ld	a,(OFST+2,sp)
2755  000e a40f          	and	a,#15
2756  0010 6b01          	ld	(OFST+0,sp),a
2758                     ; 673     if (temp < 8)
2760  0012 7b01          	ld	a,(OFST+0,sp)
2761  0014 a108          	cp	a,#8
2762  0016 2416          	jruge	L1321
2763                     ; 675       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2765  0018 7b01          	ld	a,(OFST+0,sp)
2766  001a 5f            	clrw	x
2767  001b 97            	ld	xl,a
2768  001c a601          	ld	a,#1
2769  001e 5d            	tnzw	x
2770  001f 2704          	jreq	L461
2771  0021               L661:
2772  0021 48            	sll	a
2773  0022 5a            	decw	x
2774  0023 26fc          	jrne	L661
2775  0025               L461:
2776  0025 43            	cpl	a
2777  0026 c4540d        	and	a,21517
2778  0029 c7540d        	ld	21517,a
2780  002c 2021          	jra	L5321
2781  002e               L1321:
2782                     ; 679       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2784  002e 7b01          	ld	a,(OFST+0,sp)
2785  0030 a008          	sub	a,#8
2786  0032 5f            	clrw	x
2787  0033 97            	ld	xl,a
2788  0034 a601          	ld	a,#1
2789  0036 5d            	tnzw	x
2790  0037 2704          	jreq	L071
2791  0039               L271:
2792  0039 48            	sll	a
2793  003a 5a            	decw	x
2794  003b 26fc          	jrne	L271
2795  003d               L071:
2796  003d 43            	cpl	a
2797  003e c4540c        	and	a,21516
2798  0041 c7540c        	ld	21516,a
2799  0044 2009          	jra	L5321
2800  0046               L7221:
2801                     ; 684     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
2803  0046 7b03          	ld	a,(OFST+2,sp)
2804  0048 43            	cpl	a
2805  0049 c45400        	and	a,21504
2806  004c c75400        	ld	21504,a
2807  004f               L5321:
2808                     ; 686 }
2811  004f 5b03          	addw	sp,#3
2812  0051 81            	ret
2825                     	xdef	_ADC1_ClearITPendingBit
2826                     	xdef	_ADC1_GetITStatus
2827                     	xdef	_ADC1_ClearFlag
2828                     	xdef	_ADC1_GetFlagStatus
2829                     	xdef	_ADC1_GetAWDChannelStatus
2830                     	xdef	_ADC1_GetBufferValue
2831                     	xdef	_ADC1_SetLowThreshold
2832                     	xdef	_ADC1_SetHighThreshold
2833                     	xdef	_ADC1_GetConversionValue
2834                     	xdef	_ADC1_StartConversion
2835                     	xdef	_ADC1_AWDChannelConfig
2836                     	xdef	_ADC1_ExternalTriggerConfig
2837                     	xdef	_ADC1_ConversionConfig
2838                     	xdef	_ADC1_SchmittTriggerConfig
2839                     	xdef	_ADC1_PrescalerConfig
2840                     	xdef	_ADC1_ITConfig
2841                     	xdef	_ADC1_DataBufferCmd
2842                     	xdef	_ADC1_ScanModeCmd
2843                     	xdef	_ADC1_Cmd
2844                     	xdef	_ADC1_Init
2845                     	xdef	_ADC1_DeInit
2864                     	end
