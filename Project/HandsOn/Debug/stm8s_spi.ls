   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  45                     ; 50 void SPI_DeInit(void)
  45                     ; 51 {
  47                     .text:	section	.text,new
  48  0000               _SPI_DeInit:
  52                     ; 52   SPI->CR1    = SPI_CR1_RESET_VALUE;
  54  0000 725f5200      	clr	20992
  55                     ; 53   SPI->CR2    = SPI_CR2_RESET_VALUE;
  57  0004 725f5201      	clr	20993
  58                     ; 54   SPI->ICR    = SPI_ICR_RESET_VALUE;
  60  0008 725f5202      	clr	20994
  61                     ; 55   SPI->SR     = SPI_SR_RESET_VALUE;
  63  000c 35025203      	mov	20995,#2
  64                     ; 56   SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
  66  0010 35075205      	mov	20997,#7
  67                     ; 57 }
  70  0014 81            	ret
 386                     ; 78 void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
 386                     ; 79 {
 387                     .text:	section	.text,new
 388  0000               _SPI_Init:
 390  0000 89            	pushw	x
 391  0001 88            	push	a
 392       00000001      OFST:	set	1
 395                     ; 81   assert_param(IS_SPI_FIRSTBIT_OK(FirstBit));
 397                     ; 82   assert_param(IS_SPI_BAUDRATE_PRESCALER_OK(BaudRatePrescaler));
 399                     ; 83   assert_param(IS_SPI_MODE_OK(Mode));
 401                     ; 84   assert_param(IS_SPI_POLARITY_OK(ClockPolarity));
 403                     ; 85   assert_param(IS_SPI_PHASE_OK(ClockPhase));
 405                     ; 86   assert_param(IS_SPI_DATA_DIRECTION_OK(Data_Direction));
 407                     ; 87   assert_param(IS_SPI_SLAVEMANAGEMENT_OK(Slave_Management));
 409                     ; 88   assert_param(IS_SPI_CRC_POLYNOMIAL_OK(CRCPolynomial));
 411                     ; 91   SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
 411                     ; 92                        (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
 413  0002 7b0b          	ld	a,(OFST+10,sp)
 414  0004 1a0d          	or	a,(OFST+12,sp)
 415  0006 6b01          	ld	(OFST+0,sp),a
 417  0008 9f            	ld	a,xl
 418  0009 1a07          	or	a,(OFST+6,sp)
 419  000b 1a01          	or	a,(OFST+0,sp)
 420  000d c75200        	ld	20992,a
 421                     ; 95   SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
 423  0010 7b0f          	ld	a,(OFST+14,sp)
 424  0012 1a11          	or	a,(OFST+16,sp)
 425  0014 c75201        	ld	20993,a
 426                     ; 97   if (Mode == SPI_MODE_MASTER)
 428  0017 1e08          	ldw	x,(OFST+7,sp)
 429  0019 a30004        	cpw	x,#4
 430  001c 2606          	jrne	L302
 431                     ; 99     SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
 433  001e 72105201      	bset	20993,#0
 435  0022 2004          	jra	L502
 436  0024               L302:
 437                     ; 103     SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 439  0024 72115201      	bres	20993,#0
 440  0028               L502:
 441                     ; 107   SPI->CR1 |= (uint8_t)(Mode);
 443  0028 c65200        	ld	a,20992
 444  002b 1a09          	or	a,(OFST+8,sp)
 445  002d c75200        	ld	20992,a
 446                     ; 110   SPI->CRCPR = (uint8_t)CRCPolynomial;
 448  0030 7b12          	ld	a,(OFST+17,sp)
 449  0032 c75205        	ld	20997,a
 450                     ; 111 }
 453  0035 5b03          	addw	sp,#3
 454  0037 81            	ret
 509                     ; 119 void SPI_Cmd(FunctionalState NewState)
 509                     ; 120 {
 510                     .text:	section	.text,new
 511  0000               _SPI_Cmd:
 515                     ; 122   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 517                     ; 124   if (NewState != DISABLE)
 519  0000 a30000        	cpw	x,#0
 520  0003 2706          	jreq	L532
 521                     ; 126     SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 523  0005 721c5200      	bset	20992,#6
 525  0009 2004          	jra	L732
 526  000b               L532:
 527                     ; 130     SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 529  000b 721d5200      	bres	20992,#6
 530  000f               L732:
 531                     ; 132 }
 534  000f 81            	ret
 643                     ; 141 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 643                     ; 142 {
 644                     .text:	section	.text,new
 645  0000               _SPI_ITConfig:
 647  0000 89            	pushw	x
 648  0001 88            	push	a
 649       00000001      OFST:	set	1
 652                     ; 143   uint8_t itpos = 0;
 654                     ; 145   assert_param(IS_SPI_CONFIG_IT_OK(SPI_IT));
 656                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 658                     ; 149   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 660  0002 9f            	ld	a,xl
 661  0003 a40f          	and	a,#15
 662  0005 5f            	clrw	x
 663  0006 97            	ld	xl,a
 664  0007 a601          	ld	a,#1
 665  0009 5d            	tnzw	x
 666  000a 2704          	jreq	L41
 667  000c               L61:
 668  000c 48            	sll	a
 669  000d 5a            	decw	x
 670  000e 26fc          	jrne	L61
 671  0010               L41:
 672  0010 6b01          	ld	(OFST+0,sp),a
 674                     ; 151   if (NewState != DISABLE)
 676  0012 1e06          	ldw	x,(OFST+5,sp)
 677  0014 270a          	jreq	L113
 678                     ; 153     SPI->ICR |= itpos; /* Enable interrupt*/
 680  0016 c65202        	ld	a,20994
 681  0019 1a01          	or	a,(OFST+0,sp)
 682  001b c75202        	ld	20994,a
 684  001e 2009          	jra	L313
 685  0020               L113:
 686                     ; 157     SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
 688  0020 7b01          	ld	a,(OFST+0,sp)
 689  0022 43            	cpl	a
 690  0023 c45202        	and	a,20994
 691  0026 c75202        	ld	20994,a
 692  0029               L313:
 693                     ; 159 }
 696  0029 5b03          	addw	sp,#3
 697  002b 81            	ret
 731                     ; 166 void SPI_SendData(uint8_t Data)
 731                     ; 167 {
 732                     .text:	section	.text,new
 733  0000               _SPI_SendData:
 737                     ; 168   SPI->DR = Data; /* Write in the DR register the data to be sent*/
 739  0000 c75204        	ld	20996,a
 740                     ; 169 }
 743  0003 81            	ret
 766                     ; 176 uint8_t SPI_ReceiveData(void)
 766                     ; 177 {
 767                     .text:	section	.text,new
 768  0000               _SPI_ReceiveData:
 772                     ; 178   return ((uint8_t)SPI->DR); /* Return the data in the DR register*/
 774  0000 c65204        	ld	a,20996
 777  0003 81            	ret
 813                     ; 187 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
 813                     ; 188 {
 814                     .text:	section	.text,new
 815  0000               _SPI_NSSInternalSoftwareCmd:
 819                     ; 190   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 821                     ; 192   if (NewState != DISABLE)
 823  0000 a30000        	cpw	x,#0
 824  0003 2706          	jreq	L163
 825                     ; 194     SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 827  0005 72105201      	bset	20993,#0
 829  0009 2004          	jra	L363
 830  000b               L163:
 831                     ; 198     SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 833  000b 72115201      	bres	20993,#0
 834  000f               L363:
 835                     ; 200 }
 838  000f 81            	ret
 861                     ; 207 void SPI_TransmitCRC(void)
 861                     ; 208 {
 862                     .text:	section	.text,new
 863  0000               _SPI_TransmitCRC:
 867                     ; 209   SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
 869  0000 72185201      	bset	20993,#4
 870                     ; 210 }
 873  0004 81            	ret
 909                     ; 218 void SPI_CalculateCRCCmd(FunctionalState NewState)
 909                     ; 219 {
 910                     .text:	section	.text,new
 911  0000               _SPI_CalculateCRCCmd:
 915                     ; 221   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 917                     ; 223   if (NewState != DISABLE)
 919  0000 a30000        	cpw	x,#0
 920  0003 2706          	jreq	L314
 921                     ; 225     SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
 923  0005 721a5201      	bset	20993,#5
 925  0009 2004          	jra	L514
 926  000b               L314:
 927                     ; 229     SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
 929  000b 721b5201      	bres	20993,#5
 930  000f               L514:
 931                     ; 231 }
 934  000f 81            	ret
 998                     ; 238 uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
 998                     ; 239 {
 999                     .text:	section	.text,new
1000  0000               _SPI_GetCRC:
1002  0000 88            	push	a
1003       00000001      OFST:	set	1
1006                     ; 240   uint8_t crcreg = 0;
1008                     ; 243   assert_param(IS_SPI_CRC_OK(SPI_CRC));
1010                     ; 245   if (SPI_CRC != SPI_CRC_RX)
1012  0001 a30000        	cpw	x,#0
1013  0004 2707          	jreq	L154
1014                     ; 247     crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
1016  0006 c65207        	ld	a,20999
1017  0009 6b01          	ld	(OFST+0,sp),a
1020  000b 2005          	jra	L354
1021  000d               L154:
1022                     ; 251     crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
1024  000d c65206        	ld	a,20998
1025  0010 6b01          	ld	(OFST+0,sp),a
1027  0012               L354:
1028                     ; 255   return crcreg;
1030  0012 7b01          	ld	a,(OFST+0,sp)
1033  0014 5b01          	addw	sp,#1
1034  0016 81            	ret
1059                     ; 263 void SPI_ResetCRC(void)
1059                     ; 264 {
1060                     .text:	section	.text,new
1061  0000               _SPI_ResetCRC:
1065                     ; 267   SPI_CalculateCRCCmd(ENABLE);
1067  0000 ae0001        	ldw	x,#1
1068  0003 cd0000        	call	_SPI_CalculateCRCCmd
1070                     ; 270   SPI_Cmd(ENABLE);
1072  0006 ae0001        	ldw	x,#1
1073  0009 cd0000        	call	_SPI_Cmd
1075                     ; 271 }
1078  000c 81            	ret
1102                     ; 278 uint8_t SPI_GetCRCPolynomial(void)
1102                     ; 279 {
1103                     .text:	section	.text,new
1104  0000               _SPI_GetCRCPolynomial:
1108                     ; 280   return SPI->CRCPR; /* Return the CRC polynomial register */
1110  0000 c65205        	ld	a,20997
1113  0003 81            	ret
1169                     ; 288 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
1169                     ; 289 {
1170                     .text:	section	.text,new
1171  0000               _SPI_BiDirectionalLineConfig:
1175                     ; 291   assert_param(IS_SPI_DIRECTION_OK(SPI_Direction));
1177                     ; 293   if (SPI_Direction != SPI_DIRECTION_RX)
1179  0000 a30000        	cpw	x,#0
1180  0003 2706          	jreq	L325
1181                     ; 295     SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
1183  0005 721c5201      	bset	20993,#6
1185  0009 2004          	jra	L525
1186  000b               L325:
1187                     ; 299     SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
1189  000b 721d5201      	bres	20993,#6
1190  000f               L525:
1191                     ; 301 }
1194  000f 81            	ret
1315                     ; 311 FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
1315                     ; 312 {
1316                     .text:	section	.text,new
1317  0000               _SPI_GetFlagStatus:
1319  0000 89            	pushw	x
1320       00000002      OFST:	set	2
1323                     ; 313   FlagStatus status = RESET;
1325                     ; 315   assert_param(IS_SPI_FLAGS_OK(SPI_FLAG));
1327                     ; 318   if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1329  0001 9f            	ld	a,xl
1330  0002 c45203        	and	a,20995
1331  0005 2707          	jreq	L306
1332                     ; 320     status = SET; /* SPI_FLAG is set */
1334  0007 ae0001        	ldw	x,#1
1335  000a 1f01          	ldw	(OFST-1,sp),x
1338  000c 2003          	jra	L506
1339  000e               L306:
1340                     ; 324     status = RESET; /* SPI_FLAG is reset*/
1342  000e 5f            	clrw	x
1343  000f 1f01          	ldw	(OFST-1,sp),x
1345  0011               L506:
1346                     ; 328   return status;
1348  0011 1e01          	ldw	x,(OFST-1,sp)
1351  0013 5b02          	addw	sp,#2
1352  0015 81            	ret
1387                     ; 346 void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
1387                     ; 347 {
1388                     .text:	section	.text,new
1389  0000               _SPI_ClearFlag:
1393                     ; 348   assert_param(IS_SPI_CLEAR_FLAGS_OK(SPI_FLAG));
1395                     ; 350   SPI->SR = (uint8_t)(~SPI_FLAG);
1397  0000 9f            	ld	a,xl
1398  0001 43            	cpl	a
1399  0002 c75203        	ld	20995,a
1400                     ; 351 }
1403  0005 81            	ret
1485                     ; 366 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
1485                     ; 367 {
1486                     .text:	section	.text,new
1487  0000               _SPI_GetITStatus:
1489  0000 89            	pushw	x
1490  0001 5204          	subw	sp,#4
1491       00000004      OFST:	set	4
1494                     ; 368   ITStatus pendingbitstatus = RESET;
1496                     ; 369   uint8_t itpos = 0;
1498                     ; 370   uint8_t itmask1 = 0;
1500                     ; 371   uint8_t itmask2 = 0;
1502                     ; 372   uint8_t enablestatus = 0;
1504                     ; 373   assert_param(IS_SPI_GET_IT_OK(SPI_IT));
1506                     ; 375   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1508  0003 9f            	ld	a,xl
1509  0004 a40f          	and	a,#15
1510  0006 5f            	clrw	x
1511  0007 97            	ld	xl,a
1512  0008 a601          	ld	a,#1
1513  000a 5d            	tnzw	x
1514  000b 2704          	jreq	L05
1515  000d               L25:
1516  000d 48            	sll	a
1517  000e 5a            	decw	x
1518  000f 26fc          	jrne	L25
1519  0011               L05:
1520  0011 6b01          	ld	(OFST-3,sp),a
1522                     ; 378   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1524  0013 7b06          	ld	a,(OFST+2,sp)
1525  0015 4e            	swap	a
1526  0016 a40f          	and	a,#15
1527  0018 6b04          	ld	(OFST+0,sp),a
1529                     ; 380   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1531  001a 7b04          	ld	a,(OFST+0,sp)
1532  001c 5f            	clrw	x
1533  001d 97            	ld	xl,a
1534  001e a601          	ld	a,#1
1535  0020 5d            	tnzw	x
1536  0021 2704          	jreq	L45
1537  0023               L65:
1538  0023 48            	sll	a
1539  0024 5a            	decw	x
1540  0025 26fc          	jrne	L65
1541  0027               L45:
1542  0027 6b04          	ld	(OFST+0,sp),a
1544                     ; 382   enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
1546  0029 c65203        	ld	a,20995
1547  002c 1404          	and	a,(OFST+0,sp)
1548  002e 6b04          	ld	(OFST+0,sp),a
1550                     ; 384   if (((SPI->ICR & itpos) != RESET) && enablestatus)
1552  0030 c65202        	ld	a,20994
1553  0033 1501          	bcp	a,(OFST-3,sp)
1554  0035 270b          	jreq	L766
1556  0037 0d04          	tnz	(OFST+0,sp)
1557  0039 2707          	jreq	L766
1558                     ; 387     pendingbitstatus = SET;
1560  003b ae0001        	ldw	x,#1
1561  003e 1f02          	ldw	(OFST-2,sp),x
1564  0040 2003          	jra	L176
1565  0042               L766:
1566                     ; 392     pendingbitstatus = RESET;
1568  0042 5f            	clrw	x
1569  0043 1f02          	ldw	(OFST-2,sp),x
1571  0045               L176:
1572                     ; 395   return  pendingbitstatus;
1574  0045 1e02          	ldw	x,(OFST-2,sp)
1577  0047 5b06          	addw	sp,#6
1578  0049 81            	ret
1623                     ; 412 void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
1623                     ; 413 {
1624                     .text:	section	.text,new
1625  0000               _SPI_ClearITPendingBit:
1627  0000 88            	push	a
1628       00000001      OFST:	set	1
1631                     ; 414   uint8_t itpos = 0;
1633                     ; 415   assert_param(IS_SPI_CLEAR_IT_OK(SPI_IT));
1635                     ; 420   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
1637  0001 9f            	ld	a,xl
1638  0002 a4f0          	and	a,#240
1639  0004 4e            	swap	a
1640  0005 a40f          	and	a,#15
1641  0007 5f            	clrw	x
1642  0008 97            	ld	xl,a
1643  0009 a601          	ld	a,#1
1644  000b 5d            	tnzw	x
1645  000c 2704          	jreq	L26
1646  000e               L46:
1647  000e 48            	sll	a
1648  000f 5a            	decw	x
1649  0010 26fc          	jrne	L46
1650  0012               L26:
1651  0012 6b01          	ld	(OFST+0,sp),a
1653                     ; 422   SPI->SR = (uint8_t)(~itpos);
1655  0014 7b01          	ld	a,(OFST+0,sp)
1656  0016 43            	cpl	a
1657  0017 c75203        	ld	20995,a
1658                     ; 424 }
1661  001a 84            	pop	a
1662  001b 81            	ret
1675                     	xdef	_SPI_ClearITPendingBit
1676                     	xdef	_SPI_GetITStatus
1677                     	xdef	_SPI_ClearFlag
1678                     	xdef	_SPI_GetFlagStatus
1679                     	xdef	_SPI_BiDirectionalLineConfig
1680                     	xdef	_SPI_GetCRCPolynomial
1681                     	xdef	_SPI_ResetCRC
1682                     	xdef	_SPI_GetCRC
1683                     	xdef	_SPI_CalculateCRCCmd
1684                     	xdef	_SPI_TransmitCRC
1685                     	xdef	_SPI_NSSInternalSoftwareCmd
1686                     	xdef	_SPI_ReceiveData
1687                     	xdef	_SPI_SendData
1688                     	xdef	_SPI_ITConfig
1689                     	xdef	_SPI_Cmd
1690                     	xdef	_SPI_Init
1691                     	xdef	_SPI_DeInit
1710                     	end
