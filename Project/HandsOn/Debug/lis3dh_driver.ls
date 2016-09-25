   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  59                     ; 37 u8 MEMS_SendByte( u8 byte ){
  61                     .text:	section	.text,new
  62  0000               _MEMS_SendByte:
  64  0000 88            	push	a
  65       00000000      OFST:	set	0
  68  0001               L13:
  69                     ; 40  while( SPI_GetFlagStatus( SPI_FLAG_TXE ) == RESET );
  71  0001 ae0002        	ldw	x,#2
  72  0004 cd0000        	call	_SPI_GetFlagStatus
  74  0007 a30000        	cpw	x,#0
  75  000a 27f5          	jreq	L13
  76                     ; 42  SPI_SendData( byte );
  78  000c 7b01          	ld	a,(OFST+1,sp)
  79  000e cd0000        	call	_SPI_SendData
  82  0011               L73:
  83                     ; 44  while( SPI_GetFlagStatus( SPI_FLAG_RXNE ) == RESET );
  85  0011 ae0001        	ldw	x,#1
  86  0014 cd0000        	call	_SPI_GetFlagStatus
  88  0017 a30000        	cpw	x,#0
  89  001a 27f5          	jreq	L73
  90                     ; 46  return SPI_ReceiveData();
  92  001c cd0000        	call	_SPI_ReceiveData
  96  001f 5b01          	addw	sp,#1
  97  0021 81            	ret
 143                     ; 49 u8_t SPI_Mems_Read_Reg (u8_t Reg)
 143                     ; 50 {
 144                     .text:	section	.text,new
 145  0000               _SPI_Mems_Read_Reg:
 147  0000 88            	push	a
 148  0001 88            	push	a
 149       00000001      OFST:	set	1
 152                     ; 51 	u8 Temp = 0;
 154                     ; 53 	GPIO_WriteLow(CHIPSELECT);
 156  0002 ae0020        	ldw	x,#32
 157  0005 89            	pushw	x
 158  0006 ae5014        	ldw	x,#20500
 159  0009 cd0000        	call	_GPIO_WriteLow
 161  000c 85            	popw	x
 162                     ; 55 	GPIO_WriteHigh(CHIPSELECT);
 164  000d ae0020        	ldw	x,#32
 165  0010 89            	pushw	x
 166  0011 ae5014        	ldw	x,#20500
 167  0014 cd0000        	call	_GPIO_WriteHigh
 169  0017 85            	popw	x
 170                     ; 57 	GPIO_WriteLow(CHIPSELECT);
 172  0018 ae0020        	ldw	x,#32
 173  001b 89            	pushw	x
 174  001c ae5014        	ldw	x,#20500
 175  001f cd0000        	call	_GPIO_WriteLow
 177  0022 85            	popw	x
 178                     ; 59 	MEMS_SendByte( 0x80|Reg );
 180  0023 7b02          	ld	a,(OFST+1,sp)
 181  0025 aa80          	or	a,#128
 182  0027 cd0000        	call	_MEMS_SendByte
 184                     ; 61 	Temp = MEMS_SendByte( DUMMY_BYTE );
 186  002a a6a5          	ld	a,#165
 187  002c cd0000        	call	_MEMS_SendByte
 189  002f 6b01          	ld	(OFST+0,sp),a
 191                     ; 63 	GPIO_WriteHigh(CHIPSELECT);	
 193  0031 ae0020        	ldw	x,#32
 194  0034 89            	pushw	x
 195  0035 ae5014        	ldw	x,#20500
 196  0038 cd0000        	call	_GPIO_WriteHigh
 198  003b 85            	popw	x
 199                     ; 64 	return Temp;
 201  003c 7b01          	ld	a,(OFST+0,sp)
 204  003e 85            	popw	x
 205  003f 81            	ret
 251                     ; 67 void SPI_Mems_Write_Reg(u8_t WriteAddr, u8_t Data)
 251                     ; 68 {
 252                     .text:	section	.text,new
 253  0000               _SPI_Mems_Write_Reg:
 255  0000 89            	pushw	x
 256       00000000      OFST:	set	0
 259                     ; 69 	GPIO_WriteLow(CHIPSELECT);
 261  0001 ae0020        	ldw	x,#32
 262  0004 89            	pushw	x
 263  0005 ae5014        	ldw	x,#20500
 264  0008 cd0000        	call	_GPIO_WriteLow
 266  000b 85            	popw	x
 267                     ; 70 	MEMS_SendByte(WriteAddr);
 269  000c 7b01          	ld	a,(OFST+1,sp)
 270  000e cd0000        	call	_MEMS_SendByte
 272                     ; 71 	MEMS_SendByte(Data);
 274  0011 7b02          	ld	a,(OFST+2,sp)
 275  0013 cd0000        	call	_MEMS_SendByte
 277                     ; 72 	GPIO_WriteHigh(CHIPSELECT);
 279  0016 ae0020        	ldw	x,#32
 280  0019 89            	pushw	x
 281  001a ae5014        	ldw	x,#20500
 282  001d cd0000        	call	_GPIO_WriteHigh
 284  0020 85            	popw	x
 285                     ; 73 }
 288  0021 85            	popw	x
 289  0022 81            	ret
 334                     ; 83 u8_t LIS3DH_ReadReg(u8_t Reg, u8_t* Data) {
 335                     .text:	section	.text,new
 336  0000               _LIS3DH_ReadReg:
 338  0000 88            	push	a
 339       00000000      OFST:	set	0
 342                     ; 86   *Data = SPI_Mems_Read_Reg( Reg );  
 344  0001 cd0000        	call	_SPI_Mems_Read_Reg
 346  0004 1e04          	ldw	x,(OFST+4,sp)
 347  0006 f7            	ld	(x),a
 348                     ; 87   return 1;
 350  0007 a601          	ld	a,#1
 353  0009 5b01          	addw	sp,#1
 354  000b 81            	ret
 398                     ; 99 u8_t LIS3DH_WriteReg(u8_t WriteAddr, u8_t Data) {
 399                     .text:	section	.text,new
 400  0000               _LIS3DH_WriteReg:
 402  0000 89            	pushw	x
 403       00000000      OFST:	set	0
 406                     ; 102   SPI_Mems_Write_Reg(WriteAddr, Data);  
 408  0001 9f            	ld	a,xl
 409  0002 97            	ld	xl,a
 410  0003 7b01          	ld	a,(OFST+1,sp)
 411  0005 95            	ld	xh,a
 412  0006 cd0000        	call	_SPI_Mems_Write_Reg
 414                     ; 103   return 1;
 416  0009 a601          	ld	a,#1
 419  000b 85            	popw	x
 420  000c 81            	ret
 477                     ; 116 status_t LIS3DH_GetWHO_AM_I(u8_t* val){
 478                     .text:	section	.text,new
 479  0000               _LIS3DH_GetWHO_AM_I:
 483                     ; 118   if( !LIS3DH_ReadReg(LIS3DH_WHO_AM_I, val) )
 485  0000 89            	pushw	x
 486  0001 a60f          	ld	a,#15
 487  0003 cd0000        	call	_LIS3DH_ReadReg
 489  0006 85            	popw	x
 490  0007 4d            	tnz	a
 491  0008 2602          	jrne	L102
 492                     ; 119     return MEMS_ERROR;
 494  000a 5f            	clrw	x
 497  000b 81            	ret
 498  000c               L102:
 499                     ; 121   return MEMS_SUCCESS;
 501  000c ae0001        	ldw	x,#1
 504  000f 81            	ret
 542                     ; 132 status_t LIS3DH_GetStatusAUX(u8_t* val) {
 543                     .text:	section	.text,new
 544  0000               _LIS3DH_GetStatusAUX:
 548                     ; 134   if( !LIS3DH_ReadReg(LIS3DH_STATUS_AUX, val) )
 550  0000 89            	pushw	x
 551  0001 a607          	ld	a,#7
 552  0003 cd0000        	call	_LIS3DH_ReadReg
 554  0006 85            	popw	x
 555  0007 4d            	tnz	a
 556  0008 2602          	jrne	L122
 557                     ; 135     return MEMS_ERROR;
 559  000a 5f            	clrw	x
 562  000b 81            	ret
 563  000c               L122:
 564                     ; 137   return MEMS_SUCCESS;  
 566  000c ae0001        	ldw	x,#1
 569  000f 81            	ret
 625                     ; 150 status_t LIS3DH_GetStatusAUXBit(u8_t statusBIT, u8_t* val) {
 626                     .text:	section	.text,new
 627  0000               _LIS3DH_GetStatusAUXBit:
 629  0000 88            	push	a
 630  0001 88            	push	a
 631       00000001      OFST:	set	1
 634                     ; 153   if( !LIS3DH_ReadReg(LIS3DH_STATUS_AUX, &value) )
 636  0002 96            	ldw	x,sp
 637  0003 1c0001        	addw	x,#OFST+0
 638  0006 89            	pushw	x
 639  0007 a607          	ld	a,#7
 640  0009 cd0000        	call	_LIS3DH_ReadReg
 642  000c 85            	popw	x
 643  000d 4d            	tnz	a
 644  000e 2603          	jrne	L152
 645                     ; 154     return MEMS_ERROR;
 647  0010 5f            	clrw	x
 649  0011 2016          	jra	L42
 650  0013               L152:
 651                     ; 156   if(statusBIT == LIS3DH_STATUS_AUX_321OR){
 653  0013 7b02          	ld	a,(OFST+1,sp)
 654  0015 a180          	cp	a,#128
 655  0017 261b          	jrne	L352
 656                     ; 157     if(value &= LIS3DH_STATUS_AUX_321OR){     
 658  0019 7b01          	ld	a,(OFST+0,sp)
 659  001b a480          	and	a,#128
 660  001d 6b01          	ld	(OFST+0,sp),a
 662  001f 270b          	jreq	L552
 663                     ; 158       *val = MEMS_SET;
 665  0021 1e05          	ldw	x,(OFST+4,sp)
 666  0023 a601          	ld	a,#1
 667  0025 f7            	ld	(x),a
 668                     ; 159       return MEMS_SUCCESS;
 670  0026 ae0001        	ldw	x,#1
 672  0029               L42:
 674  0029 5b02          	addw	sp,#2
 675  002b 81            	ret
 676  002c               L552:
 677                     ; 162       *val = MEMS_RESET;
 679  002c 1e05          	ldw	x,(OFST+4,sp)
 680  002e 7f            	clr	(x)
 681                     ; 163       return MEMS_SUCCESS;
 683  002f ae0001        	ldw	x,#1
 685  0032 20f5          	jra	L42
 686  0034               L352:
 687                     ; 167   if(statusBIT == LIS3DH_STATUS_AUX_3OR){
 689  0034 7b02          	ld	a,(OFST+1,sp)
 690  0036 a140          	cp	a,#64
 691  0038 261a          	jrne	L162
 692                     ; 168     if(value &= LIS3DH_STATUS_AUX_3OR){     
 694  003a 7b01          	ld	a,(OFST+0,sp)
 695  003c a440          	and	a,#64
 696  003e 6b01          	ld	(OFST+0,sp),a
 698  0040 270a          	jreq	L362
 699                     ; 169       *val = MEMS_SET;
 701  0042 1e05          	ldw	x,(OFST+4,sp)
 702  0044 a601          	ld	a,#1
 703  0046 f7            	ld	(x),a
 704                     ; 170       return MEMS_SUCCESS;
 706  0047 ae0001        	ldw	x,#1
 708  004a 20dd          	jra	L42
 709  004c               L362:
 710                     ; 173       *val = MEMS_RESET;
 712  004c 1e05          	ldw	x,(OFST+4,sp)
 713  004e 7f            	clr	(x)
 714                     ; 174       return MEMS_SUCCESS;
 716  004f ae0001        	ldw	x,#1
 718  0052 20d5          	jra	L42
 719  0054               L162:
 720                     ; 178   if(statusBIT == LIS3DH_STATUS_AUX_2OR){
 722  0054 7b02          	ld	a,(OFST+1,sp)
 723  0056 a120          	cp	a,#32
 724  0058 261a          	jrne	L762
 725                     ; 179     if(value &= LIS3DH_STATUS_AUX_2OR){     
 727  005a 7b01          	ld	a,(OFST+0,sp)
 728  005c a420          	and	a,#32
 729  005e 6b01          	ld	(OFST+0,sp),a
 731  0060 270a          	jreq	L172
 732                     ; 180       *val = MEMS_SET;
 734  0062 1e05          	ldw	x,(OFST+4,sp)
 735  0064 a601          	ld	a,#1
 736  0066 f7            	ld	(x),a
 737                     ; 181       return MEMS_SUCCESS;
 739  0067 ae0001        	ldw	x,#1
 741  006a 20bd          	jra	L42
 742  006c               L172:
 743                     ; 184       *val = MEMS_RESET;
 745  006c 1e05          	ldw	x,(OFST+4,sp)
 746  006e 7f            	clr	(x)
 747                     ; 185       return MEMS_SUCCESS;
 749  006f ae0001        	ldw	x,#1
 751  0072 20b5          	jra	L42
 752  0074               L762:
 753                     ; 189   if(statusBIT == LIS3DH_STATUS_AUX_1OR){
 755  0074 7b02          	ld	a,(OFST+1,sp)
 756  0076 a110          	cp	a,#16
 757  0078 261a          	jrne	L572
 758                     ; 190     if(value &= LIS3DH_STATUS_AUX_1OR){     
 760  007a 7b01          	ld	a,(OFST+0,sp)
 761  007c a410          	and	a,#16
 762  007e 6b01          	ld	(OFST+0,sp),a
 764  0080 270a          	jreq	L772
 765                     ; 191       *val = MEMS_SET;
 767  0082 1e05          	ldw	x,(OFST+4,sp)
 768  0084 a601          	ld	a,#1
 769  0086 f7            	ld	(x),a
 770                     ; 192       return MEMS_SUCCESS;
 772  0087 ae0001        	ldw	x,#1
 774  008a 209d          	jra	L42
 775  008c               L772:
 776                     ; 195       *val = MEMS_RESET;
 778  008c 1e05          	ldw	x,(OFST+4,sp)
 779  008e 7f            	clr	(x)
 780                     ; 196       return MEMS_SUCCESS;
 782  008f ae0001        	ldw	x,#1
 784  0092 2016          	jra	L62
 785  0094               L572:
 786                     ; 200   if(statusBIT == LIS3DH_STATUS_AUX_321DA){
 788  0094 7b02          	ld	a,(OFST+1,sp)
 789  0096 a108          	cp	a,#8
 790  0098 261b          	jrne	L303
 791                     ; 201     if(value &= LIS3DH_STATUS_AUX_321DA) {     
 793  009a 7b01          	ld	a,(OFST+0,sp)
 794  009c a408          	and	a,#8
 795  009e 6b01          	ld	(OFST+0,sp),a
 797  00a0 270b          	jreq	L503
 798                     ; 202       *val = MEMS_SET;
 800  00a2 1e05          	ldw	x,(OFST+4,sp)
 801  00a4 a601          	ld	a,#1
 802  00a6 f7            	ld	(x),a
 803                     ; 203       return MEMS_SUCCESS;
 805  00a7 ae0001        	ldw	x,#1
 807  00aa               L62:
 809  00aa 5b02          	addw	sp,#2
 810  00ac 81            	ret
 811  00ad               L503:
 812                     ; 206       *val = MEMS_RESET;
 814  00ad 1e05          	ldw	x,(OFST+4,sp)
 815  00af 7f            	clr	(x)
 816                     ; 207       return MEMS_SUCCESS;
 818  00b0 ae0001        	ldw	x,#1
 820  00b3 20f5          	jra	L62
 821  00b5               L303:
 822                     ; 211   if(statusBIT == LIS3DH_STATUS_AUX_3DA){
 824  00b5 7b02          	ld	a,(OFST+1,sp)
 825  00b7 a104          	cp	a,#4
 826  00b9 261a          	jrne	L113
 827                     ; 212     if(value &= LIS3DH_STATUS_AUX_3DA){     
 829  00bb 7b01          	ld	a,(OFST+0,sp)
 830  00bd a404          	and	a,#4
 831  00bf 6b01          	ld	(OFST+0,sp),a
 833  00c1 270a          	jreq	L313
 834                     ; 213       *val = MEMS_SET;
 836  00c3 1e05          	ldw	x,(OFST+4,sp)
 837  00c5 a601          	ld	a,#1
 838  00c7 f7            	ld	(x),a
 839                     ; 214       return MEMS_SUCCESS;
 841  00c8 ae0001        	ldw	x,#1
 843  00cb 20dd          	jra	L62
 844  00cd               L313:
 845                     ; 217       *val = MEMS_RESET;
 847  00cd 1e05          	ldw	x,(OFST+4,sp)
 848  00cf 7f            	clr	(x)
 849                     ; 218       return MEMS_SUCCESS;
 851  00d0 ae0001        	ldw	x,#1
 853  00d3 20d5          	jra	L62
 854  00d5               L113:
 855                     ; 222   if(statusBIT == LIS3DH_STATUS_AUX_2DA){
 857  00d5 7b02          	ld	a,(OFST+1,sp)
 858  00d7 a102          	cp	a,#2
 859  00d9 261a          	jrne	L713
 860                     ; 223     if(value &= LIS3DH_STATUS_AUX_2DA){     
 862  00db 7b01          	ld	a,(OFST+0,sp)
 863  00dd a402          	and	a,#2
 864  00df 6b01          	ld	(OFST+0,sp),a
 866  00e1 270a          	jreq	L123
 867                     ; 224       *val = MEMS_SET;
 869  00e3 1e05          	ldw	x,(OFST+4,sp)
 870  00e5 a601          	ld	a,#1
 871  00e7 f7            	ld	(x),a
 872                     ; 225       return MEMS_SUCCESS;
 874  00e8 ae0001        	ldw	x,#1
 876  00eb 20bd          	jra	L62
 877  00ed               L123:
 878                     ; 228       *val = MEMS_RESET;
 880  00ed 1e05          	ldw	x,(OFST+4,sp)
 881  00ef 7f            	clr	(x)
 882                     ; 229       return MEMS_SUCCESS;
 884  00f0 ae0001        	ldw	x,#1
 886  00f3 20b5          	jra	L62
 887  00f5               L713:
 888                     ; 233   if(statusBIT == LIS3DH_STATUS_AUX_1DA){
 890  00f5 7b02          	ld	a,(OFST+1,sp)
 891  00f7 a101          	cp	a,#1
 892  00f9 261a          	jrne	L523
 893                     ; 234     if(value &= LIS3DH_STATUS_AUX_1DA){     
 895  00fb 7b01          	ld	a,(OFST+0,sp)
 896  00fd a401          	and	a,#1
 897  00ff 6b01          	ld	(OFST+0,sp),a
 899  0101 270a          	jreq	L723
 900                     ; 235       *val = MEMS_SET;
 902  0103 1e05          	ldw	x,(OFST+4,sp)
 903  0105 a601          	ld	a,#1
 904  0107 f7            	ld	(x),a
 905                     ; 236       return MEMS_SUCCESS;
 907  0108 ae0001        	ldw	x,#1
 909  010b 209d          	jra	L62
 910  010d               L723:
 911                     ; 239       *val = MEMS_RESET;
 913  010d 1e05          	ldw	x,(OFST+4,sp)
 914  010f 7f            	clr	(x)
 915                     ; 240       return MEMS_SUCCESS;
 917  0110 ae0001        	ldw	x,#1
 919  0113 2001          	jra	L03
 920  0115               L523:
 921                     ; 243   return MEMS_ERROR;
 923  0115 5f            	clrw	x
 925  0116               L03:
 927  0116 5b02          	addw	sp,#2
 928  0118 81            	ret
1046                     ; 254 status_t LIS3DH_SetODR(LIS3DH_ODR_t ov){
1047                     .text:	section	.text,new
1048  0000               _LIS3DH_SetODR:
1050  0000 89            	pushw	x
1051  0001 88            	push	a
1052       00000001      OFST:	set	1
1055                     ; 257   if( !LIS3DH_ReadReg(LIS3DH_CTRL_REG1, &value) )
1057  0002 96            	ldw	x,sp
1058  0003 1c0001        	addw	x,#OFST+0
1059  0006 89            	pushw	x
1060  0007 a620          	ld	a,#32
1061  0009 cd0000        	call	_LIS3DH_ReadReg
1063  000c 85            	popw	x
1064  000d 4d            	tnz	a
1065  000e 2603          	jrne	L304
1066                     ; 258     return MEMS_ERROR;
1068  0010 5f            	clrw	x
1070  0011 201c          	jra	L43
1071  0013               L304:
1072                     ; 260   value &= 0x0f;
1074  0013 7b01          	ld	a,(OFST+0,sp)
1075  0015 a40f          	and	a,#15
1076  0017 6b01          	ld	(OFST+0,sp),a
1078                     ; 261   value |= ov<<LIS3DH_ODR_BIT;
1080  0019 7b03          	ld	a,(OFST+2,sp)
1081  001b 4e            	swap	a
1082  001c a4f0          	and	a,#240
1083  001e 1a01          	or	a,(OFST+0,sp)
1084  0020 6b01          	ld	(OFST+0,sp),a
1086                     ; 263   if( !LIS3DH_WriteReg(LIS3DH_CTRL_REG1, value) )
1088  0022 7b01          	ld	a,(OFST+0,sp)
1089  0024 ae2000        	ldw	x,#8192
1090  0027 97            	ld	xl,a
1091  0028 cd0000        	call	_LIS3DH_WriteReg
1093  002b 4d            	tnz	a
1094  002c 2604          	jrne	L504
1095                     ; 264     return MEMS_ERROR;
1097  002e 5f            	clrw	x
1099  002f               L43:
1101  002f 5b03          	addw	sp,#3
1102  0031 81            	ret
1103  0032               L504:
1104                     ; 266   return MEMS_SUCCESS;
1106  0032 ae0001        	ldw	x,#1
1108  0035 20f8          	jra	L43
1176                     ; 279 status_t LIS3DH_SetTemperature(State_t state){
1177                     .text:	section	.text,new
1178  0000               _LIS3DH_SetTemperature:
1180  0000 89            	pushw	x
1181  0001 88            	push	a
1182       00000001      OFST:	set	1
1185                     ; 282   if( !LIS3DH_ReadReg(LIS3DH_TEMP_CFG_REG, &value) )
1187  0002 96            	ldw	x,sp
1188  0003 1c0001        	addw	x,#OFST+0
1189  0006 89            	pushw	x
1190  0007 a61f          	ld	a,#31
1191  0009 cd0000        	call	_LIS3DH_ReadReg
1193  000c 85            	popw	x
1194  000d 4d            	tnz	a
1195  000e 2603          	jrne	L144
1196                     ; 283     return MEMS_ERROR;
1198  0010 5f            	clrw	x
1200  0011 201e          	jra	L04
1201  0013               L144:
1202                     ; 285   value &= 0xBF;
1204  0013 7b01          	ld	a,(OFST+0,sp)
1205  0015 a4bf          	and	a,#191
1206  0017 6b01          	ld	(OFST+0,sp),a
1208                     ; 286   value |= state<<LIS3DH_TEMP_EN;
1210  0019 7b03          	ld	a,(OFST+2,sp)
1211  001b 4e            	swap	a
1212  001c 48            	sll	a
1213  001d 48            	sll	a
1214  001e a4c0          	and	a,#192
1215  0020 1a01          	or	a,(OFST+0,sp)
1216  0022 6b01          	ld	(OFST+0,sp),a
1218                     ; 288   if( !LIS3DH_WriteReg(LIS3DH_TEMP_CFG_REG, value) )
1220  0024 7b01          	ld	a,(OFST+0,sp)
1221  0026 ae1f00        	ldw	x,#7936
1222  0029 97            	ld	xl,a
1223  002a cd0000        	call	_LIS3DH_WriteReg
1225  002d 4d            	tnz	a
1226  002e 2604          	jrne	L344
1227                     ; 289     return MEMS_ERROR;
1229  0030 5f            	clrw	x
1231  0031               L04:
1233  0031 5b03          	addw	sp,#3
1234  0033 81            	ret
1235  0034               L344:
1236                     ; 291   return MEMS_SUCCESS;
1238  0034 ae0001        	ldw	x,#1
1240  0037 20f8          	jra	L04
1287                     ; 302 status_t LIS3DH_SetADCAux(State_t state){
1288                     .text:	section	.text,new
1289  0000               _LIS3DH_SetADCAux:
1291  0000 89            	pushw	x
1292  0001 88            	push	a
1293       00000001      OFST:	set	1
1296                     ; 305   if( !LIS3DH_ReadReg(LIS3DH_TEMP_CFG_REG, &value) )
1298  0002 96            	ldw	x,sp
1299  0003 1c0001        	addw	x,#OFST+0
1300  0006 89            	pushw	x
1301  0007 a61f          	ld	a,#31
1302  0009 cd0000        	call	_LIS3DH_ReadReg
1304  000c 85            	popw	x
1305  000d 4d            	tnz	a
1306  000e 2603          	jrne	L764
1307                     ; 306     return MEMS_ERROR;
1309  0010 5f            	clrw	x
1311  0011 201c          	jra	L44
1312  0013               L764:
1313                     ; 308   value &= 0x7F;
1315  0013 7b01          	ld	a,(OFST+0,sp)
1316  0015 a47f          	and	a,#127
1317  0017 6b01          	ld	(OFST+0,sp),a
1319                     ; 309   value |= state<<LIS3DH_ADC_PD;
1321  0019 7b03          	ld	a,(OFST+2,sp)
1322  001b 46            	rrc	a
1323  001c 4f            	clr	a
1324  001d 46            	rrc	a
1325  001e 1a01          	or	a,(OFST+0,sp)
1326  0020 6b01          	ld	(OFST+0,sp),a
1328                     ; 311   if( !LIS3DH_WriteReg(LIS3DH_TEMP_CFG_REG, value) )
1330  0022 7b01          	ld	a,(OFST+0,sp)
1331  0024 ae1f00        	ldw	x,#7936
1332  0027 97            	ld	xl,a
1333  0028 cd0000        	call	_LIS3DH_WriteReg
1335  002b 4d            	tnz	a
1336  002c 2604          	jrne	L174
1337                     ; 312     return MEMS_ERROR;
1339  002e 5f            	clrw	x
1341  002f               L44:
1343  002f 5b03          	addw	sp,#3
1344  0031 81            	ret
1345  0032               L174:
1346                     ; 314   return MEMS_SUCCESS;
1348  0032 ae0001        	ldw	x,#1
1350  0035 20f8          	jra	L44
1435                     ; 325 status_t LIS3DH_GetAuxRaw(LIS3DH_Aux123Raw_t* buff) {
1436                     .text:	section	.text,new
1437  0000               _LIS3DH_GetAuxRaw:
1439  0000 89            	pushw	x
1440  0001 89            	pushw	x
1441       00000002      OFST:	set	2
1444                     ; 329   if( !LIS3DH_ReadReg(LIS3DH_OUT_1_L, &valueL) )
1446  0002 96            	ldw	x,sp
1447  0003 1c0001        	addw	x,#OFST-1
1448  0006 89            	pushw	x
1449  0007 a608          	ld	a,#8
1450  0009 cd0000        	call	_LIS3DH_ReadReg
1452  000c 85            	popw	x
1453  000d 4d            	tnz	a
1454  000e 2603          	jrne	L535
1455                     ; 330     return MEMS_ERROR;
1457  0010 5f            	clrw	x
1459  0011 200f          	jra	L05
1460  0013               L535:
1461                     ; 332   if( !LIS3DH_ReadReg(LIS3DH_OUT_1_H, &valueH) )
1463  0013 96            	ldw	x,sp
1464  0014 1c0002        	addw	x,#OFST+0
1465  0017 89            	pushw	x
1466  0018 a609          	ld	a,#9
1467  001a cd0000        	call	_LIS3DH_ReadReg
1469  001d 85            	popw	x
1470  001e 4d            	tnz	a
1471  001f 2604          	jrne	L735
1472                     ; 333     return MEMS_ERROR;
1474  0021 5f            	clrw	x
1476  0022               L05:
1478  0022 5b04          	addw	sp,#4
1479  0024 81            	ret
1480  0025               L735:
1481                     ; 335   buff->AUX_1 = (u16_t)( (valueH << 8) | valueL )/16;
1483  0025 7b02          	ld	a,(OFST+0,sp)
1484  0027 5f            	clrw	x
1485  0028 97            	ld	xl,a
1486  0029 7b01          	ld	a,(OFST-1,sp)
1487  002b 02            	rlwa	x,a
1488  002c 54            	srlw	x
1489  002d 54            	srlw	x
1490  002e 54            	srlw	x
1491  002f 54            	srlw	x
1492  0030 1603          	ldw	y,(OFST+1,sp)
1493  0032 90ff          	ldw	(y),x
1494                     ; 337   if( !LIS3DH_ReadReg(LIS3DH_OUT_2_L, &valueL) )
1496  0034 96            	ldw	x,sp
1497  0035 1c0001        	addw	x,#OFST-1
1498  0038 89            	pushw	x
1499  0039 a60a          	ld	a,#10
1500  003b cd0000        	call	_LIS3DH_ReadReg
1502  003e 85            	popw	x
1503  003f 4d            	tnz	a
1504  0040 2603          	jrne	L145
1505                     ; 338     return MEMS_ERROR;
1507  0042 5f            	clrw	x
1509  0043 20dd          	jra	L05
1510  0045               L145:
1511                     ; 340   if( !LIS3DH_ReadReg(LIS3DH_OUT_2_H, &valueH) )
1513  0045 96            	ldw	x,sp
1514  0046 1c0002        	addw	x,#OFST+0
1515  0049 89            	pushw	x
1516  004a a60b          	ld	a,#11
1517  004c cd0000        	call	_LIS3DH_ReadReg
1519  004f 85            	popw	x
1520  0050 4d            	tnz	a
1521  0051 2603          	jrne	L345
1522                     ; 341     return MEMS_ERROR;
1524  0053 5f            	clrw	x
1526  0054 20cc          	jra	L05
1527  0056               L345:
1528                     ; 343   buff->AUX_2 = (u16_t)( (valueH << 8) | valueL )/16;
1530  0056 7b02          	ld	a,(OFST+0,sp)
1531  0058 5f            	clrw	x
1532  0059 97            	ld	xl,a
1533  005a 7b01          	ld	a,(OFST-1,sp)
1534  005c 02            	rlwa	x,a
1535  005d 54            	srlw	x
1536  005e 54            	srlw	x
1537  005f 54            	srlw	x
1538  0060 54            	srlw	x
1539  0061 1603          	ldw	y,(OFST+1,sp)
1540  0063 90ef02        	ldw	(2,y),x
1541                     ; 345   if( !LIS3DH_ReadReg(LIS3DH_OUT_3_L, &valueL) )
1543  0066 96            	ldw	x,sp
1544  0067 1c0001        	addw	x,#OFST-1
1545  006a 89            	pushw	x
1546  006b a60c          	ld	a,#12
1547  006d cd0000        	call	_LIS3DH_ReadReg
1549  0070 85            	popw	x
1550  0071 4d            	tnz	a
1551  0072 2603          	jrne	L545
1552                     ; 346     return MEMS_ERROR;
1554  0074 5f            	clrw	x
1556  0075 20ab          	jra	L05
1557  0077               L545:
1558                     ; 348   if( !LIS3DH_ReadReg(LIS3DH_OUT_3_H, &valueH) )
1560  0077 96            	ldw	x,sp
1561  0078 1c0002        	addw	x,#OFST+0
1562  007b 89            	pushw	x
1563  007c a60d          	ld	a,#13
1564  007e cd0000        	call	_LIS3DH_ReadReg
1566  0081 85            	popw	x
1567  0082 4d            	tnz	a
1568  0083 2603          	jrne	L745
1569                     ; 349     return MEMS_ERROR;
1571  0085 5f            	clrw	x
1573  0086 209a          	jra	L05
1574  0088               L745:
1575                     ; 351   buff->AUX_3 = (u16_t)( (valueH << 8) | valueL )/16;
1577  0088 7b02          	ld	a,(OFST+0,sp)
1578  008a 5f            	clrw	x
1579  008b 97            	ld	xl,a
1580  008c 7b01          	ld	a,(OFST-1,sp)
1581  008e 02            	rlwa	x,a
1582  008f 54            	srlw	x
1583  0090 54            	srlw	x
1584  0091 54            	srlw	x
1585  0092 54            	srlw	x
1586  0093 1603          	ldw	y,(OFST+1,sp)
1587  0095 90ef04        	ldw	(4,y),x
1588                     ; 353   return MEMS_SUCCESS;  
1590  0098 ae0001        	ldw	x,#1
1592  009b 2085          	jra	L05
1647                     ; 364 status_t LIS3DH_GetTempRaw(i8_t* buff) {
1648                     .text:	section	.text,new
1649  0000               _LIS3DH_GetTempRaw:
1651  0000 89            	pushw	x
1652  0001 89            	pushw	x
1653       00000002      OFST:	set	2
1656                     ; 368   if( !LIS3DH_ReadReg(LIS3DH_OUT_3_L, &valueL) )
1658  0002 96            	ldw	x,sp
1659  0003 1c0001        	addw	x,#OFST-1
1660  0006 89            	pushw	x
1661  0007 a60c          	ld	a,#12
1662  0009 cd0000        	call	_LIS3DH_ReadReg
1664  000c 85            	popw	x
1665  000d 4d            	tnz	a
1666  000e 2603          	jrne	L775
1667                     ; 369     return MEMS_ERROR;
1669  0010 5f            	clrw	x
1671  0011 200f          	jra	L45
1672  0013               L775:
1673                     ; 371   if( !LIS3DH_ReadReg(LIS3DH_OUT_3_H, &valueH) )
1675  0013 96            	ldw	x,sp
1676  0014 1c0002        	addw	x,#OFST+0
1677  0017 89            	pushw	x
1678  0018 a60d          	ld	a,#13
1679  001a cd0000        	call	_LIS3DH_ReadReg
1681  001d 85            	popw	x
1682  001e 4d            	tnz	a
1683  001f 2604          	jrne	L106
1684                     ; 372     return MEMS_ERROR;
1686  0021 5f            	clrw	x
1688  0022               L45:
1690  0022 5b04          	addw	sp,#4
1691  0024 81            	ret
1692  0025               L106:
1693                     ; 374   *buff = (i8_t)( valueH );
1695  0025 7b02          	ld	a,(OFST+0,sp)
1696  0027 1e03          	ldw	x,(OFST+1,sp)
1697  0029 f7            	ld	(x),a
1698                     ; 376   return MEMS_SUCCESS;  
1700  002a ae0001        	ldw	x,#1
1702  002d 20f3          	jra	L45
1705                     	switch	.ubsct
1706  0000               L306_ODR_old_value:
1707  0000 00            	ds.b	1
1797                     ; 387 status_t LIS3DH_SetMode(LIS3DH_Mode_t md) {
1798                     .text:	section	.text,new
1799  0000               _LIS3DH_SetMode:
1801  0000 89            	pushw	x
1802  0001 89            	pushw	x
1803       00000002      OFST:	set	2
1806                     ; 392   if( !LIS3DH_ReadReg(LIS3DH_CTRL_REG1, &value) )
1808  0002 96            	ldw	x,sp
1809  0003 1c0002        	addw	x,#OFST+0
1810  0006 89            	pushw	x
1811  0007 a620          	ld	a,#32
1812  0009 cd0000        	call	_LIS3DH_ReadReg
1814  000c 85            	popw	x
1815  000d 4d            	tnz	a
1816  000e 2603          	jrne	L166
1817                     ; 393     return MEMS_ERROR;
1819  0010 5f            	clrw	x
1821  0011 200f          	jra	L06
1822  0013               L166:
1823                     ; 395   if( !LIS3DH_ReadReg(LIS3DH_CTRL_REG4, &value2) )
1825  0013 96            	ldw	x,sp
1826  0014 1c0001        	addw	x,#OFST-1
1827  0017 89            	pushw	x
1828  0018 a623          	ld	a,#35
1829  001a cd0000        	call	_LIS3DH_ReadReg
1831  001d 85            	popw	x
1832  001e 4d            	tnz	a
1833  001f 2604          	jrne	L366
1834                     ; 396     return MEMS_ERROR;
1836  0021 5f            	clrw	x
1838  0022               L06:
1840  0022 5b04          	addw	sp,#4
1841  0024 81            	ret
1842  0025               L366:
1843                     ; 398   if((value & 0xF0)==0) 
1845  0025 7b02          	ld	a,(OFST+0,sp)
1846  0027 a5f0          	bcp	a,#240
1847  0029 2608          	jrne	L566
1848                     ; 399     value = value | (ODR_old_value & 0xF0); //if it comes from POWERDOWN  
1850  002b b600          	ld	a,L306_ODR_old_value
1851  002d a4f0          	and	a,#240
1852  002f 1a02          	or	a,(OFST+0,sp)
1853  0031 6b02          	ld	(OFST+0,sp),a
1855  0033               L566:
1856                     ; 401   switch(md) {
1858  0033 1e03          	ldw	x,(OFST+1,sp)
1860                     ; 422   default:
1860                     ; 423     return MEMS_ERROR;
1861  0035 5d            	tnzw	x
1862  0036 2709          	jreq	L506
1863  0038 5a            	decw	x
1864  0039 2726          	jreq	L116
1865  003b 5a            	decw	x
1866  003c 270f          	jreq	L706
1867  003e               L316:
1870  003e 5f            	clrw	x
1872  003f 20e1          	jra	L06
1873  0041               L506:
1874                     ; 403   case LIS3DH_POWER_DOWN:
1874                     ; 404     ODR_old_value = value;
1876  0041 7b02          	ld	a,(OFST+0,sp)
1877  0043 b700          	ld	L306_ODR_old_value,a
1878                     ; 405     value &= 0x0F;
1880  0045 7b02          	ld	a,(OFST+0,sp)
1881  0047 a40f          	and	a,#15
1882  0049 6b02          	ld	(OFST+0,sp),a
1884                     ; 406     break;
1886  004b 2026          	jra	L176
1887  004d               L706:
1888                     ; 408   case LIS3DH_NORMAL:
1888                     ; 409     value &= 0xF7;
1890  004d 7b02          	ld	a,(OFST+0,sp)
1891  004f a4f7          	and	a,#247
1892  0051 6b02          	ld	(OFST+0,sp),a
1894                     ; 410     value |= (MEMS_RESET<<LIS3DH_LPEN);
1896                     ; 411     value2 &= 0xF7;
1898  0053 7b01          	ld	a,(OFST-1,sp)
1899  0055 a4f7          	and	a,#247
1900  0057 6b01          	ld	(OFST-1,sp),a
1902                     ; 412     value2 |= (MEMS_SET<<LIS3DH_HR);   //set HighResolution_BIT
1904  0059 7b01          	ld	a,(OFST-1,sp)
1905  005b aa08          	or	a,#8
1906  005d 6b01          	ld	(OFST-1,sp),a
1908                     ; 413     break;
1910  005f 2012          	jra	L176
1911  0061               L116:
1912                     ; 415   case LIS3DH_LOW_POWER:		
1912                     ; 416     value &= 0xF7;
1914  0061 7b02          	ld	a,(OFST+0,sp)
1915  0063 a4f7          	and	a,#247
1916  0065 6b02          	ld	(OFST+0,sp),a
1918                     ; 417     value |=  (MEMS_SET<<LIS3DH_LPEN);
1920  0067 7b02          	ld	a,(OFST+0,sp)
1921  0069 aa08          	or	a,#8
1922  006b 6b02          	ld	(OFST+0,sp),a
1924                     ; 418     value2 &= 0xF7;
1926  006d 7b01          	ld	a,(OFST-1,sp)
1927  006f a4f7          	and	a,#247
1928  0071 6b01          	ld	(OFST-1,sp),a
1930                     ; 419     value2 |= (MEMS_RESET<<LIS3DH_HR); //reset HighResolution_BIT
1932                     ; 420     break;
1934  0073               L176:
1935                     ; 426   if( !LIS3DH_WriteReg(LIS3DH_CTRL_REG1, value) )
1937  0073 7b02          	ld	a,(OFST+0,sp)
1938  0075 ae2000        	ldw	x,#8192
1939  0078 97            	ld	xl,a
1940  0079 cd0000        	call	_LIS3DH_WriteReg
1942  007c 4d            	tnz	a
1943  007d 2603          	jrne	L376
1944                     ; 427     return MEMS_ERROR;
1946  007f 5f            	clrw	x
1948  0080 20a0          	jra	L06
1949  0082               L376:
1950                     ; 429   if( !LIS3DH_WriteReg(LIS3DH_CTRL_REG4, value2) )
1952  0082 7b01          	ld	a,(OFST-1,sp)
1953  0084 ae2300        	ldw	x,#8960
1954  0087 97            	ld	xl,a
1955  0088 cd0000        	call	_LIS3DH_WriteReg
1957  008b 4d            	tnz	a
1958  008c 2603          	jrne	L576
1959                     ; 430     return MEMS_ERROR;  
1961  008e 5f            	clrw	x
1963  008f 2091          	jra	L06
1964  0091               L576:
1965                     ; 432   return MEMS_SUCCESS;
1967  0091 ae0001        	ldw	x,#1
1969  0094 208c          	jra	L06
2015                     ; 444 status_t LIS3DH_SetAxis(LIS3DH_Axis_t axis) {
2016                     .text:	section	.text,new
2017  0000               _LIS3DH_SetAxis:
2019  0000 88            	push	a
2020  0001 88            	push	a
2021       00000001      OFST:	set	1
2024                     ; 447   if( !LIS3DH_ReadReg(LIS3DH_CTRL_REG1, &value) )
2026  0002 96            	ldw	x,sp
2027  0003 1c0001        	addw	x,#OFST+0
2028  0006 89            	pushw	x
2029  0007 a620          	ld	a,#32
2030  0009 cd0000        	call	_LIS3DH_ReadReg
2032  000c 85            	popw	x
2033  000d 4d            	tnz	a
2034  000e 2603          	jrne	L127
2035                     ; 448     return MEMS_ERROR;
2037  0010 5f            	clrw	x
2039  0011 201b          	jra	L46
2040  0013               L127:
2041                     ; 449   value &= 0xF8;
2043  0013 7b01          	ld	a,(OFST+0,sp)
2044  0015 a4f8          	and	a,#248
2045  0017 6b01          	ld	(OFST+0,sp),a
2047                     ; 450   value |= (0x07 & axis);
2049  0019 7b02          	ld	a,(OFST+1,sp)
2050  001b a407          	and	a,#7
2051  001d 1a01          	or	a,(OFST+0,sp)
2052  001f 6b01          	ld	(OFST+0,sp),a
2054                     ; 452   if( !LIS3DH_WriteReg(LIS3DH_CTRL_REG1, value) )
2056  0021 7b01          	ld	a,(OFST+0,sp)
2057  0023 ae2000        	ldw	x,#8192
2058  0026 97            	ld	xl,a
2059  0027 cd0000        	call	_LIS3DH_WriteReg
2061  002a 4d            	tnz	a
2062  002b 2604          	jrne	L327
2063                     ; 453     return MEMS_ERROR;   
2065  002d 5f            	clrw	x
2067  002e               L46:
2069  002e 5b02          	addw	sp,#2
2070  0030 81            	ret
2071  0031               L327:
2072                     ; 455   return MEMS_SUCCESS;
2074  0031 ae0001        	ldw	x,#1
2076  0034 20f8          	jra	L46
2159                     ; 466 status_t LIS3DH_SetFullScale(LIS3DH_Fullscale_t fs) {
2160                     .text:	section	.text,new
2161  0000               _LIS3DH_SetFullScale:
2163  0000 89            	pushw	x
2164  0001 88            	push	a
2165       00000001      OFST:	set	1
2168                     ; 469   if( !LIS3DH_ReadReg(LIS3DH_CTRL_REG4, &value) )
2170  0002 96            	ldw	x,sp
2171  0003 1c0001        	addw	x,#OFST+0
2172  0006 89            	pushw	x
2173  0007 a623          	ld	a,#35
2174  0009 cd0000        	call	_LIS3DH_ReadReg
2176  000c 85            	popw	x
2177  000d 4d            	tnz	a
2178  000e 2603          	jrne	L367
2179                     ; 470     return MEMS_ERROR;
2181  0010 5f            	clrw	x
2183  0011 201c          	jra	L07
2184  0013               L367:
2185                     ; 472   value &= 0xCF;	
2187  0013 7b01          	ld	a,(OFST+0,sp)
2188  0015 a4cf          	and	a,#207
2189  0017 6b01          	ld	(OFST+0,sp),a
2191                     ; 473   value |= (fs<<LIS3DH_FS);
2193  0019 7b03          	ld	a,(OFST+2,sp)
2194  001b 4e            	swap	a
2195  001c a4f0          	and	a,#240
2196  001e 1a01          	or	a,(OFST+0,sp)
2197  0020 6b01          	ld	(OFST+0,sp),a
2199                     ; 475   if( !LIS3DH_WriteReg(LIS3DH_CTRL_REG4, value) )
2201  0022 7b01          	ld	a,(OFST+0,sp)
2202  0024 ae2300        	ldw	x,#8960
2203  0027 97            	ld	xl,a
2204  0028 cd0000        	call	_LIS3DH_WriteReg
2206  002b 4d            	tnz	a
2207  002c 2604          	jrne	L567
2208                     ; 476     return MEMS_ERROR;
2210  002e 5f            	clrw	x
2212  002f               L07:
2214  002f 5b03          	addw	sp,#3
2215  0031 81            	ret
2216  0032               L567:
2217                     ; 478   return MEMS_SUCCESS;
2219  0032 ae0001        	ldw	x,#1
2221  0035 20f8          	jra	L07
2268                     ; 489 status_t LIS3DH_SetBDU(State_t bdu) {
2269                     .text:	section	.text,new
2270  0000               _LIS3DH_SetBDU:
2272  0000 89            	pushw	x
2273  0001 88            	push	a
2274       00000001      OFST:	set	1
2277                     ; 492   if( !LIS3DH_ReadReg(LIS3DH_CTRL_REG4, &value) )
2279  0002 96            	ldw	x,sp
2280  0003 1c0001        	addw	x,#OFST+0
2281  0006 89            	pushw	x
2282  0007 a623          	ld	a,#35
2283  0009 cd0000        	call	_LIS3DH_ReadReg
2285  000c 85            	popw	x
2286  000d 4d            	tnz	a
2287  000e 2603          	jrne	L1101
2288                     ; 493     return MEMS_ERROR;
2290  0010 5f            	clrw	x
2292  0011 201c          	jra	L47
2293  0013               L1101:
2294                     ; 495   value &= 0x7F;
2296  0013 7b01          	ld	a,(OFST+0,sp)
2297  0015 a47f          	and	a,#127
2298  0017 6b01          	ld	(OFST+0,sp),a
2300                     ; 496   value |= (bdu<<LIS3DH_BDU);
2302  0019 7b03          	ld	a,(OFST+2,sp)
2303  001b 46            	rrc	a
2304  001c 4f            	clr	a
2305  001d 46            	rrc	a
2306  001e 1a01          	or	a,(OFST+0,sp)
2307  0020 6b01          	ld	(OFST+0,sp),a
2309                     ; 498   if( !LIS3DH_WriteReg(LIS3DH_CTRL_REG4, value) )
2311  0022 7b01          	ld	a,(OFST+0,sp)
2312  0024 ae2300        	ldw	x,#8960
2313  0027 97            	ld	xl,a
2314  0028 cd0000        	call	_LIS3DH_WriteReg
2316  002b 4d            	tnz	a
2317  002c 2604          	jrne	L3101
2318                     ; 499     return MEMS_ERROR;
2320  002e 5f            	clrw	x
2322  002f               L47:
2324  002f 5b03          	addw	sp,#3
2325  0031 81            	ret
2326  0032               L3101:
2327                     ; 501   return MEMS_SUCCESS;
2329  0032 ae0001        	ldw	x,#1
2331  0035 20f8          	jra	L47
2398                     ; 512 status_t LIS3DH_SetBLE(LIS3DH_Endianess_t ble) {
2399                     .text:	section	.text,new
2400  0000               _LIS3DH_SetBLE:
2402  0000 89            	pushw	x
2403  0001 88            	push	a
2404       00000001      OFST:	set	1
2407                     ; 515   if( !LIS3DH_ReadReg(LIS3DH_CTRL_REG4, &value) )
2409  0002 96            	ldw	x,sp
2410  0003 1c0001        	addw	x,#OFST+0
2411  0006 89            	pushw	x
2412  0007 a623          	ld	a,#35
2413  0009 cd0000        	call	_LIS3DH_ReadReg
2415  000c 85            	popw	x
2416  000d 4d            	tnz	a
2417  000e 2603          	jrne	L7401
2418                     ; 516     return MEMS_ERROR;
2420  0010 5f            	clrw	x
2422  0011 201e          	jra	L001
2423  0013               L7401:
2424                     ; 518   value &= 0xBF;	
2426  0013 7b01          	ld	a,(OFST+0,sp)
2427  0015 a4bf          	and	a,#191
2428  0017 6b01          	ld	(OFST+0,sp),a
2430                     ; 519   value |= (ble<<LIS3DH_BLE);
2432  0019 7b03          	ld	a,(OFST+2,sp)
2433  001b 4e            	swap	a
2434  001c 48            	sll	a
2435  001d 48            	sll	a
2436  001e a4c0          	and	a,#192
2437  0020 1a01          	or	a,(OFST+0,sp)
2438  0022 6b01          	ld	(OFST+0,sp),a
2440                     ; 521   if( !LIS3DH_WriteReg(LIS3DH_CTRL_REG4, value) )
2442  0024 7b01          	ld	a,(OFST+0,sp)
2443  0026 ae2300        	ldw	x,#8960
2444  0029 97            	ld	xl,a
2445  002a cd0000        	call	_LIS3DH_WriteReg
2447  002d 4d            	tnz	a
2448  002e 2604          	jrne	L1501
2449                     ; 522     return MEMS_ERROR;
2451  0030 5f            	clrw	x
2453  0031               L001:
2455  0031 5b03          	addw	sp,#3
2456  0033 81            	ret
2457  0034               L1501:
2458                     ; 524   return MEMS_SUCCESS;
2460  0034 ae0001        	ldw	x,#1
2462  0037 20f8          	jra	L001
2537                     ; 535 status_t LIS3DH_SetSelfTest(LIS3DH_SelfTest_t st) {
2538                     .text:	section	.text,new
2539  0000               _LIS3DH_SetSelfTest:
2541  0000 89            	pushw	x
2542  0001 88            	push	a
2543       00000001      OFST:	set	1
2546                     ; 538   if( !LIS3DH_ReadReg(LIS3DH_CTRL_REG4, &value) )
2548  0002 96            	ldw	x,sp
2549  0003 1c0001        	addw	x,#OFST+0
2550  0006 89            	pushw	x
2551  0007 a623          	ld	a,#35
2552  0009 cd0000        	call	_LIS3DH_ReadReg
2554  000c 85            	popw	x
2555  000d 4d            	tnz	a
2556  000e 2603          	jrne	L7011
2557                     ; 539     return MEMS_ERROR;
2559  0010 5f            	clrw	x
2561  0011 201a          	jra	L401
2562  0013               L7011:
2563                     ; 541   value &= 0xF9;
2565  0013 7b01          	ld	a,(OFST+0,sp)
2566  0015 a4f9          	and	a,#249
2567  0017 6b01          	ld	(OFST+0,sp),a
2569                     ; 542   value |= (st<<LIS3DH_ST);
2571  0019 7b03          	ld	a,(OFST+2,sp)
2572  001b 48            	sll	a
2573  001c 1a01          	or	a,(OFST+0,sp)
2574  001e 6b01          	ld	(OFST+0,sp),a
2576                     ; 544   if( !LIS3DH_WriteReg(LIS3DH_CTRL_REG4, value) )
2578  0020 7b01          	ld	a,(OFST+0,sp)
2579  0022 ae2300        	ldw	x,#8960
2580  0025 97            	ld	xl,a
2581  0026 cd0000        	call	_LIS3DH_WriteReg
2583  0029 4d            	tnz	a
2584  002a 2604          	jrne	L1111
2585                     ; 545     return MEMS_ERROR;
2587  002c 5f            	clrw	x
2589  002d               L401:
2591  002d 5b03          	addw	sp,#3
2592  002f 81            	ret
2593  0030               L1111:
2594                     ; 547   return MEMS_SUCCESS;
2596  0030 ae0001        	ldw	x,#1
2598  0033 20f8          	jra	L401
2646                     ; 558 status_t LIS3DH_HPFClickEnable(State_t hpfe) {
2647                     .text:	section	.text,new
2648  0000               _LIS3DH_HPFClickEnable:
2650  0000 89            	pushw	x
2651  0001 88            	push	a
2652       00000001      OFST:	set	1
2655                     ; 561   if( !LIS3DH_ReadReg(LIS3DH_CTRL_REG2, &value) )
2657  0002 96            	ldw	x,sp
2658  0003 1c0001        	addw	x,#OFST+0
2659  0006 89            	pushw	x
2660  0007 a621          	ld	a,#33
2661  0009 cd0000        	call	_LIS3DH_ReadReg
2663  000c 85            	popw	x
2664  000d 4d            	tnz	a
2665  000e 2603          	jrne	L5311
2666                     ; 562     return MEMS_ERROR;
2668  0010 5f            	clrw	x
2670  0011 201b          	jra	L011
2671  0013               L5311:
2672                     ; 564   value &= 0xFB;
2674  0013 7b01          	ld	a,(OFST+0,sp)
2675  0015 a4fb          	and	a,#251
2676  0017 6b01          	ld	(OFST+0,sp),a
2678                     ; 565   value |= (hpfe<<LIS3DH_HPCLICK);
2680  0019 7b03          	ld	a,(OFST+2,sp)
2681  001b 48            	sll	a
2682  001c 48            	sll	a
2683  001d 1a01          	or	a,(OFST+0,sp)
2684  001f 6b01          	ld	(OFST+0,sp),a
2686                     ; 567   if( !LIS3DH_WriteReg(LIS3DH_CTRL_REG2, value) )
2688  0021 7b01          	ld	a,(OFST+0,sp)
2689  0023 ae2100        	ldw	x,#8448
2690  0026 97            	ld	xl,a
2691  0027 cd0000        	call	_LIS3DH_WriteReg
2693  002a 4d            	tnz	a
2694  002b 2604          	jrne	L7311
2695                     ; 568     return MEMS_ERROR;
2697  002d 5f            	clrw	x
2699  002e               L011:
2701  002e 5b03          	addw	sp,#3
2702  0030 81            	ret
2703  0031               L7311:
2704                     ; 570   return MEMS_SUCCESS;
2706  0031 ae0001        	ldw	x,#1
2708  0034 20f8          	jra	L011
2756                     ; 581 status_t LIS3DH_HPFAOI1Enable(State_t hpfe) {
2757                     .text:	section	.text,new
2758  0000               _LIS3DH_HPFAOI1Enable:
2760  0000 89            	pushw	x
2761  0001 88            	push	a
2762       00000001      OFST:	set	1
2765                     ; 584   if( !LIS3DH_ReadReg(LIS3DH_CTRL_REG2, &value) )
2767  0002 96            	ldw	x,sp
2768  0003 1c0001        	addw	x,#OFST+0
2769  0006 89            	pushw	x
2770  0007 a621          	ld	a,#33
2771  0009 cd0000        	call	_LIS3DH_ReadReg
2773  000c 85            	popw	x
2774  000d 4d            	tnz	a
2775  000e 2603          	jrne	L3611
2776                     ; 585     return MEMS_ERROR;
2778  0010 5f            	clrw	x
2780  0011 2019          	jra	L411
2781  0013               L3611:
2782                     ; 587   value &= 0xFE;
2784  0013 7b01          	ld	a,(OFST+0,sp)
2785  0015 a4fe          	and	a,#254
2786  0017 6b01          	ld	(OFST+0,sp),a
2788                     ; 588   value |= (hpfe<<LIS3DH_HPIS1);
2790  0019 7b01          	ld	a,(OFST+0,sp)
2791  001b 1a03          	or	a,(OFST+2,sp)
2792  001d 6b01          	ld	(OFST+0,sp),a
2794                     ; 590   if( !LIS3DH_WriteReg(LIS3DH_CTRL_REG2, value) )
2796  001f 7b01          	ld	a,(OFST+0,sp)
2797  0021 ae2100        	ldw	x,#8448
2798  0024 97            	ld	xl,a
2799  0025 cd0000        	call	_LIS3DH_WriteReg
2801  0028 4d            	tnz	a
2802  0029 2604          	jrne	L5611
2803                     ; 591     return MEMS_ERROR;
2805  002b 5f            	clrw	x
2807  002c               L411:
2809  002c 5b03          	addw	sp,#3
2810  002e 81            	ret
2811  002f               L5611:
2812                     ; 593   return MEMS_SUCCESS;
2814  002f ae0001        	ldw	x,#1
2816  0032 20f8          	jra	L411
2864                     ; 604 status_t LIS3DH_HPFAOI2Enable(State_t hpfe) {
2865                     .text:	section	.text,new
2866  0000               _LIS3DH_HPFAOI2Enable:
2868  0000 89            	pushw	x
2869  0001 88            	push	a
2870       00000001      OFST:	set	1
2873                     ; 607   if( !LIS3DH_ReadReg(LIS3DH_CTRL_REG2, &value) )
2875  0002 96            	ldw	x,sp
2876  0003 1c0001        	addw	x,#OFST+0
2877  0006 89            	pushw	x
2878  0007 a621          	ld	a,#33
2879  0009 cd0000        	call	_LIS3DH_ReadReg
2881  000c 85            	popw	x
2882  000d 4d            	tnz	a
2883  000e 2603          	jrne	L1121
2884                     ; 608     return MEMS_ERROR;
2886  0010 5f            	clrw	x
2888  0011 201a          	jra	L021
2889  0013               L1121:
2890                     ; 610   value &= 0xFD;
2892  0013 7b01          	ld	a,(OFST+0,sp)
2893  0015 a4fd          	and	a,#253
2894  0017 6b01          	ld	(OFST+0,sp),a
2896                     ; 611   value |= (hpfe<<LIS3DH_HPIS2);
2898  0019 7b03          	ld	a,(OFST+2,sp)
2899  001b 48            	sll	a
2900  001c 1a01          	or	a,(OFST+0,sp)
2901  001e 6b01          	ld	(OFST+0,sp),a
2903                     ; 613   if( !LIS3DH_WriteReg(LIS3DH_CTRL_REG2, value) )
2905  0020 7b01          	ld	a,(OFST+0,sp)
2906  0022 ae2100        	ldw	x,#8448
2907  0025 97            	ld	xl,a
2908  0026 cd0000        	call	_LIS3DH_WriteReg
2910  0029 4d            	tnz	a
2911  002a 2604          	jrne	L3121
2912                     ; 614     return MEMS_ERROR;
2914  002c 5f            	clrw	x
2916  002d               L021:
2918  002d 5b03          	addw	sp,#3
2919  002f 81            	ret
2920  0030               L3121:
2921                     ; 616   return MEMS_SUCCESS;
2923  0030 ae0001        	ldw	x,#1
2925  0033 20f8          	jra	L021
3010                     ; 628 status_t LIS3DH_SetHPFMode(LIS3DH_HPFMode_t hpm) {
3011                     .text:	section	.text,new
3012  0000               _LIS3DH_SetHPFMode:
3014  0000 89            	pushw	x
3015  0001 88            	push	a
3016       00000001      OFST:	set	1
3019                     ; 631   if( !LIS3DH_ReadReg(LIS3DH_CTRL_REG2, &value) )
3021  0002 96            	ldw	x,sp
3022  0003 1c0001        	addw	x,#OFST+0
3023  0006 89            	pushw	x
3024  0007 a621          	ld	a,#33
3025  0009 cd0000        	call	_LIS3DH_ReadReg
3027  000c 85            	popw	x
3028  000d 4d            	tnz	a
3029  000e 2603          	jrne	L3521
3030                     ; 632     return MEMS_ERROR;
3032  0010 5f            	clrw	x
3034  0011 201e          	jra	L421
3035  0013               L3521:
3036                     ; 634   value &= 0x3F;
3038  0013 7b01          	ld	a,(OFST+0,sp)
3039  0015 a43f          	and	a,#63
3040  0017 6b01          	ld	(OFST+0,sp),a
3042                     ; 635   value |= (hpm<<LIS3DH_HPM);
3044  0019 7b03          	ld	a,(OFST+2,sp)
3045  001b 4e            	swap	a
3046  001c 48            	sll	a
3047  001d 48            	sll	a
3048  001e a4c0          	and	a,#192
3049  0020 1a01          	or	a,(OFST+0,sp)
3050  0022 6b01          	ld	(OFST+0,sp),a
3052                     ; 637   if( !LIS3DH_WriteReg(LIS3DH_CTRL_REG2, value) )
3054  0024 7b01          	ld	a,(OFST+0,sp)
3055  0026 ae2100        	ldw	x,#8448
3056  0029 97            	ld	xl,a
3057  002a cd0000        	call	_LIS3DH_WriteReg
3059  002d 4d            	tnz	a
3060  002e 2604          	jrne	L5521
3061                     ; 638     return MEMS_ERROR;
3063  0030 5f            	clrw	x
3065  0031               L421:
3067  0031 5b03          	addw	sp,#3
3068  0033 81            	ret
3069  0034               L5521:
3070                     ; 640   return MEMS_SUCCESS;
3072  0034 ae0001        	ldw	x,#1
3074  0037 20f8          	jra	L421
3156                     ; 651 status_t LIS3DH_SetHPFCutOFF(LIS3DH_HPFCutOffFreq_t hpf) {
3157                     .text:	section	.text,new
3158  0000               _LIS3DH_SetHPFCutOFF:
3160  0000 89            	pushw	x
3161  0001 88            	push	a
3162       00000001      OFST:	set	1
3165                     ; 654   if (hpf > 3)
3167  0002 9c            	rvf
3168  0003 a30004        	cpw	x,#4
3169  0006 2f03          	jrslt	L5131
3170                     ; 655     return MEMS_ERROR;
3172  0008 5f            	clrw	x
3174  0009 200f          	jra	L031
3175  000b               L5131:
3176                     ; 657   if( !LIS3DH_ReadReg(LIS3DH_CTRL_REG2, &value) )
3178  000b 96            	ldw	x,sp
3179  000c 1c0001        	addw	x,#OFST+0
3180  000f 89            	pushw	x
3181  0010 a621          	ld	a,#33
3182  0012 cd0000        	call	_LIS3DH_ReadReg
3184  0015 85            	popw	x
3185  0016 4d            	tnz	a
3186  0017 2604          	jrne	L7131
3187                     ; 658     return MEMS_ERROR;
3189  0019 5f            	clrw	x
3191  001a               L031:
3193  001a 5b03          	addw	sp,#3
3194  001c 81            	ret
3195  001d               L7131:
3196                     ; 660   value &= 0xCF;
3198  001d 7b01          	ld	a,(OFST+0,sp)
3199  001f a4cf          	and	a,#207
3200  0021 6b01          	ld	(OFST+0,sp),a
3202                     ; 661   value |= (hpf<<LIS3DH_HPCF);
3204  0023 7b03          	ld	a,(OFST+2,sp)
3205  0025 4e            	swap	a
3206  0026 a4f0          	and	a,#240
3207  0028 1a01          	or	a,(OFST+0,sp)
3208  002a 6b01          	ld	(OFST+0,sp),a
3210                     ; 663   if( !LIS3DH_WriteReg(LIS3DH_CTRL_REG2, value) )
3212  002c 7b01          	ld	a,(OFST+0,sp)
3213  002e ae2100        	ldw	x,#8448
3214  0031 97            	ld	xl,a
3215  0032 cd0000        	call	_LIS3DH_WriteReg
3217  0035 4d            	tnz	a
3218  0036 2603          	jrne	L1231
3219                     ; 664     return MEMS_ERROR;
3221  0038 5f            	clrw	x
3223  0039 20df          	jra	L031
3224  003b               L1231:
3225                     ; 666   return MEMS_SUCCESS;
3227  003b ae0001        	ldw	x,#1
3229  003e 20da          	jra	L031
3277                     ; 678 status_t LIS3DH_SetFilterDataSel(State_t state) {
3278                     .text:	section	.text,new
3279  0000               _LIS3DH_SetFilterDataSel:
3281  0000 89            	pushw	x
3282  0001 88            	push	a
3283       00000001      OFST:	set	1
3286                     ; 681   if( !LIS3DH_ReadReg(LIS3DH_CTRL_REG2, &value) )
3288  0002 96            	ldw	x,sp
3289  0003 1c0001        	addw	x,#OFST+0
3290  0006 89            	pushw	x
3291  0007 a621          	ld	a,#33
3292  0009 cd0000        	call	_LIS3DH_ReadReg
3294  000c 85            	popw	x
3295  000d 4d            	tnz	a
3296  000e 2603          	jrne	L5431
3297                     ; 682     return MEMS_ERROR;
3299  0010 5f            	clrw	x
3301  0011 201c          	jra	L431
3302  0013               L5431:
3303                     ; 684   value &= 0xF7;
3305  0013 7b01          	ld	a,(OFST+0,sp)
3306  0015 a4f7          	and	a,#247
3307  0017 6b01          	ld	(OFST+0,sp),a
3309                     ; 685   value |= (state<<LIS3DH_FDS);
3311  0019 7b03          	ld	a,(OFST+2,sp)
3312  001b 48            	sll	a
3313  001c 48            	sll	a
3314  001d 48            	sll	a
3315  001e 1a01          	or	a,(OFST+0,sp)
3316  0020 6b01          	ld	(OFST+0,sp),a
3318                     ; 687   if( !LIS3DH_WriteReg(LIS3DH_CTRL_REG2, value) )
3320  0022 7b01          	ld	a,(OFST+0,sp)
3321  0024 ae2100        	ldw	x,#8448
3322  0027 97            	ld	xl,a
3323  0028 cd0000        	call	_LIS3DH_WriteReg
3325  002b 4d            	tnz	a
3326  002c 2604          	jrne	L7431
3327                     ; 688     return MEMS_ERROR;
3329  002e 5f            	clrw	x
3331  002f               L431:
3333  002f 5b03          	addw	sp,#3
3334  0031 81            	ret
3335  0032               L7431:
3336                     ; 690   return MEMS_SUCCESS;
3338  0032 ae0001        	ldw	x,#1
3340  0035 20f8          	jra	L431
3386                     ; 709 status_t LIS3DH_SetInt1Pin(LIS3DH_IntPinConf_t pinConf) {
3387                     .text:	section	.text,new
3388  0000               _LIS3DH_SetInt1Pin:
3390  0000 88            	push	a
3391  0001 88            	push	a
3392       00000001      OFST:	set	1
3395                     ; 712   if( !LIS3DH_ReadReg(LIS3DH_CTRL_REG3, &value) )
3397  0002 96            	ldw	x,sp
3398  0003 1c0001        	addw	x,#OFST+0
3399  0006 89            	pushw	x
3400  0007 a622          	ld	a,#34
3401  0009 cd0000        	call	_LIS3DH_ReadReg
3403  000c 85            	popw	x
3404  000d 4d            	tnz	a
3405  000e 2603          	jrne	L3731
3406                     ; 713     return MEMS_ERROR;
3408  0010 5f            	clrw	x
3410  0011 2015          	jra	L041
3411  0013               L3731:
3412                     ; 715   value &= 0x00;
3414  0013 0f01          	clr	(OFST+0,sp)
3416                     ; 716   value |= pinConf;
3418  0015 7b01          	ld	a,(OFST+0,sp)
3419  0017 1a02          	or	a,(OFST+1,sp)
3420  0019 6b01          	ld	(OFST+0,sp),a
3422                     ; 718   if( !LIS3DH_WriteReg(LIS3DH_CTRL_REG3, value) )
3424  001b 7b01          	ld	a,(OFST+0,sp)
3425  001d ae2200        	ldw	x,#8704
3426  0020 97            	ld	xl,a
3427  0021 cd0000        	call	_LIS3DH_WriteReg
3429  0024 4d            	tnz	a
3430  0025 2604          	jrne	L5731
3431                     ; 719     return MEMS_ERROR;
3433  0027 5f            	clrw	x
3435  0028               L041:
3437  0028 5b02          	addw	sp,#2
3438  002a 81            	ret
3439  002b               L5731:
3440                     ; 721   return MEMS_SUCCESS;
3442  002b ae0001        	ldw	x,#1
3444  002e 20f8          	jra	L041
3490                     ; 738 status_t LIS3DH_SetInt2Pin(LIS3DH_IntPinConf_t pinConf) {
3491                     .text:	section	.text,new
3492  0000               _LIS3DH_SetInt2Pin:
3494  0000 88            	push	a
3495  0001 88            	push	a
3496       00000001      OFST:	set	1
3499                     ; 741   if( !LIS3DH_ReadReg(LIS3DH_CTRL_REG6, &value) )
3501  0002 96            	ldw	x,sp
3502  0003 1c0001        	addw	x,#OFST+0
3503  0006 89            	pushw	x
3504  0007 a625          	ld	a,#37
3505  0009 cd0000        	call	_LIS3DH_ReadReg
3507  000c 85            	popw	x
3508  000d 4d            	tnz	a
3509  000e 2603          	jrne	L1241
3510                     ; 742     return MEMS_ERROR;
3512  0010 5f            	clrw	x
3514  0011 2015          	jra	L441
3515  0013               L1241:
3516                     ; 744   value &= 0x00;
3518  0013 0f01          	clr	(OFST+0,sp)
3520                     ; 745   value |= pinConf;
3522  0015 7b01          	ld	a,(OFST+0,sp)
3523  0017 1a02          	or	a,(OFST+1,sp)
3524  0019 6b01          	ld	(OFST+0,sp),a
3526                     ; 747   if( !LIS3DH_WriteReg(LIS3DH_CTRL_REG6, value) )
3528  001b 7b01          	ld	a,(OFST+0,sp)
3529  001d ae2500        	ldw	x,#9472
3530  0020 97            	ld	xl,a
3531  0021 cd0000        	call	_LIS3DH_WriteReg
3533  0024 4d            	tnz	a
3534  0025 2604          	jrne	L3241
3535                     ; 748     return MEMS_ERROR;
3537  0027 5f            	clrw	x
3539  0028               L441:
3541  0028 5b02          	addw	sp,#2
3542  002a 81            	ret
3543  002b               L3241:
3544                     ; 750   return MEMS_SUCCESS;
3546  002b ae0001        	ldw	x,#1
3548  002e 20f8          	jra	L441
3594                     ; 765 status_t LIS3DH_SetClickCFG(u8_t status) {
3595                     .text:	section	.text,new
3596  0000               _LIS3DH_SetClickCFG:
3598  0000 88            	push	a
3599  0001 88            	push	a
3600       00000001      OFST:	set	1
3603                     ; 768   if( !LIS3DH_ReadReg(LIS3DH_CLICK_CFG, &value) )
3605  0002 96            	ldw	x,sp
3606  0003 1c0001        	addw	x,#OFST+0
3607  0006 89            	pushw	x
3608  0007 a638          	ld	a,#56
3609  0009 cd0000        	call	_LIS3DH_ReadReg
3611  000c 85            	popw	x
3612  000d 4d            	tnz	a
3613  000e 2603          	jrne	L7441
3614                     ; 769     return MEMS_ERROR;
3616  0010 5f            	clrw	x
3618  0011 2019          	jra	L051
3619  0013               L7441:
3620                     ; 771   value &= 0xC0;
3622  0013 7b01          	ld	a,(OFST+0,sp)
3623  0015 a4c0          	and	a,#192
3624  0017 6b01          	ld	(OFST+0,sp),a
3626                     ; 772   value |= status;
3628  0019 7b01          	ld	a,(OFST+0,sp)
3629  001b 1a02          	or	a,(OFST+1,sp)
3630  001d 6b01          	ld	(OFST+0,sp),a
3632                     ; 774   if( !LIS3DH_WriteReg(LIS3DH_CLICK_CFG, value) )
3634  001f 7b01          	ld	a,(OFST+0,sp)
3635  0021 ae3800        	ldw	x,#14336
3636  0024 97            	ld	xl,a
3637  0025 cd0000        	call	_LIS3DH_WriteReg
3639  0028 4d            	tnz	a
3640  0029 2604          	jrne	L1541
3641                     ; 775     return MEMS_ERROR;
3643  002b 5f            	clrw	x
3645  002c               L051:
3647  002c 5b02          	addw	sp,#2
3648  002e 81            	ret
3649  002f               L1541:
3650                     ; 777   return MEMS_SUCCESS;
3652  002f ae0001        	ldw	x,#1
3654  0032 20f8          	jra	L051
3690                     ; 788 status_t LIS3DH_SetClickTHS(u8_t ths) {
3691                     .text:	section	.text,new
3692  0000               _LIS3DH_SetClickTHS:
3694  0000 88            	push	a
3695       00000000      OFST:	set	0
3698                     ; 790   if(ths>127)     
3700  0001 a180          	cp	a,#128
3701  0003 2503          	jrult	L1741
3702                     ; 791     return MEMS_ERROR;
3704  0005 5f            	clrw	x
3707  0006 84            	pop	a
3708  0007 81            	ret
3709  0008               L1741:
3710                     ; 793   if( !LIS3DH_WriteReg(LIS3DH_CLICK_THS, ths) )
3712  0008 7b01          	ld	a,(OFST+1,sp)
3713  000a ae3a00        	ldw	x,#14848
3714  000d 97            	ld	xl,a
3715  000e cd0000        	call	_LIS3DH_WriteReg
3717  0011 4d            	tnz	a
3718  0012 2603          	jrne	L3741
3719                     ; 794     return MEMS_ERROR;
3721  0014 5f            	clrw	x
3724  0015 84            	pop	a
3725  0016 81            	ret
3726  0017               L3741:
3727                     ; 796   return MEMS_SUCCESS;
3729  0017 ae0001        	ldw	x,#1
3732  001a 84            	pop	a
3733  001b 81            	ret
3770                     ; 807 status_t LIS3DH_SetClickLIMIT(u8_t t_limit) {
3771                     .text:	section	.text,new
3772  0000               _LIS3DH_SetClickLIMIT:
3774  0000 88            	push	a
3775       00000000      OFST:	set	0
3778                     ; 809   if(t_limit>127)     
3780  0001 a180          	cp	a,#128
3781  0003 2503          	jrult	L3151
3782                     ; 810     return MEMS_ERROR;
3784  0005 5f            	clrw	x
3787  0006 84            	pop	a
3788  0007 81            	ret
3789  0008               L3151:
3790                     ; 812   if( !LIS3DH_WriteReg(LIS3DH_TIME_LIMIT, t_limit) )
3792  0008 7b01          	ld	a,(OFST+1,sp)
3793  000a ae3b00        	ldw	x,#15104
3794  000d 97            	ld	xl,a
3795  000e cd0000        	call	_LIS3DH_WriteReg
3797  0011 4d            	tnz	a
3798  0012 2603          	jrne	L5151
3799                     ; 813     return MEMS_ERROR;
3801  0014 5f            	clrw	x
3804  0015 84            	pop	a
3805  0016 81            	ret
3806  0017               L5151:
3807                     ; 815   return MEMS_SUCCESS;
3809  0017 ae0001        	ldw	x,#1
3812  001a 84            	pop	a
3813  001b 81            	ret
3850                     ; 826 status_t LIS3DH_SetClickLATENCY(u8_t t_latency) {
3851                     .text:	section	.text,new
3852  0000               _LIS3DH_SetClickLATENCY:
3856                     ; 828   if( !LIS3DH_WriteReg(LIS3DH_TIME_LATENCY, t_latency) )
3858  0000 ae3c00        	ldw	x,#15360
3859  0003 97            	ld	xl,a
3860  0004 cd0000        	call	_LIS3DH_WriteReg
3862  0007 4d            	tnz	a
3863  0008 2602          	jrne	L5351
3864                     ; 829     return MEMS_ERROR;
3866  000a 5f            	clrw	x
3869  000b 81            	ret
3870  000c               L5351:
3871                     ; 831   return MEMS_SUCCESS;
3873  000c ae0001        	ldw	x,#1
3876  000f 81            	ret
3913                     ; 842 status_t LIS3DH_SetClickWINDOW(u8_t t_window) {
3914                     .text:	section	.text,new
3915  0000               _LIS3DH_SetClickWINDOW:
3919                     ; 844   if( !LIS3DH_WriteReg(LIS3DH_TIME_WINDOW, t_window) )
3921  0000 ae3d00        	ldw	x,#15616
3922  0003 97            	ld	xl,a
3923  0004 cd0000        	call	_LIS3DH_WriteReg
3925  0007 4d            	tnz	a
3926  0008 2602          	jrne	L5551
3927                     ; 845     return MEMS_ERROR;
3929  000a 5f            	clrw	x
3932  000b 81            	ret
3933  000c               L5551:
3934                     ; 847   return MEMS_SUCCESS;
3936  000c ae0001        	ldw	x,#1
3939  000f 81            	ret
3986                     ; 858 status_t LIS3DH_GetClickResponse(u8_t* res) {
3987                     .text:	section	.text,new
3988  0000               _LIS3DH_GetClickResponse:
3990  0000 89            	pushw	x
3991  0001 88            	push	a
3992       00000001      OFST:	set	1
3995                     ; 861   if( !LIS3DH_ReadReg(LIS3DH_CLICK_SRC, &value) ) 
3997  0002 96            	ldw	x,sp
3998  0003 1c0001        	addw	x,#OFST+0
3999  0006 89            	pushw	x
4000  0007 a639          	ld	a,#57
4001  0009 cd0000        	call	_LIS3DH_ReadReg
4003  000c 85            	popw	x
4004  000d 4d            	tnz	a
4005  000e 2603          	jrne	L1061
4006                     ; 862     return MEMS_ERROR;
4008  0010 5f            	clrw	x
4010  0011 2012          	jra	L461
4011  0013               L1061:
4012                     ; 864   value &= 0x7F;
4014  0013 7b01          	ld	a,(OFST+0,sp)
4015  0015 a47f          	and	a,#127
4016  0017 6b01          	ld	(OFST+0,sp),a
4018                     ; 866   if((value & LIS3DH_IA)==0) {        
4020  0019 7b01          	ld	a,(OFST+0,sp)
4021  001b a540          	bcp	a,#64
4022  001d 2609          	jrne	L3061
4023                     ; 867     *res = LIS3DH_NO_CLICK;     
4025  001f 1e02          	ldw	x,(OFST+1,sp)
4026  0021 7f            	clr	(x)
4027                     ; 868     return MEMS_SUCCESS;
4029  0022 ae0001        	ldw	x,#1
4031  0025               L461:
4033  0025 5b03          	addw	sp,#3
4034  0027 81            	ret
4035  0028               L3061:
4036                     ; 871     if (value & LIS3DH_DCLICK){
4038  0028 7b01          	ld	a,(OFST+0,sp)
4039  002a a520          	bcp	a,#32
4040  002c 2769          	jreq	L7061
4041                     ; 872       if (value & LIS3DH_CLICK_SIGN){
4043  002e 7b01          	ld	a,(OFST+0,sp)
4044  0030 a508          	bcp	a,#8
4045  0032 2733          	jreq	L1161
4046                     ; 873         if (value & LIS3DH_CLICK_Z) {
4048  0034 7b01          	ld	a,(OFST+0,sp)
4049  0036 a504          	bcp	a,#4
4050  0038 270a          	jreq	L3161
4051                     ; 874           *res = LIS3DH_DCLICK_Z_N;   
4053  003a 1e02          	ldw	x,(OFST+1,sp)
4054  003c a62c          	ld	a,#44
4055  003e f7            	ld	(x),a
4056                     ; 875           return MEMS_SUCCESS;
4058  003f ae0001        	ldw	x,#1
4060  0042 20e1          	jra	L461
4061  0044               L3161:
4062                     ; 877         if (value & LIS3DH_CLICK_Y) {
4064  0044 7b01          	ld	a,(OFST+0,sp)
4065  0046 a502          	bcp	a,#2
4066  0048 270a          	jreq	L5161
4067                     ; 878           *res = LIS3DH_DCLICK_Y_N;   
4069  004a 1e02          	ldw	x,(OFST+1,sp)
4070  004c a62a          	ld	a,#42
4071  004e f7            	ld	(x),a
4072                     ; 879           return MEMS_SUCCESS;
4074  004f ae0001        	ldw	x,#1
4076  0052 20d1          	jra	L461
4077  0054               L5161:
4078                     ; 881         if (value & LIS3DH_CLICK_X) {
4080  0054 7b01          	ld	a,(OFST+0,sp)
4081  0056 a501          	bcp	a,#1
4082  0058 2603          	jrne	L661
4083  005a cc0109        	jp	L5061
4084  005d               L661:
4085                     ; 882           *res = LIS3DH_DCLICK_X_N;   
4087  005d 1e02          	ldw	x,(OFST+1,sp)
4088  005f a629          	ld	a,#41
4089  0061 f7            	ld	(x),a
4090                     ; 883           return MEMS_SUCCESS;
4092  0062 ae0001        	ldw	x,#1
4094  0065 20be          	jra	L461
4095  0067               L1161:
4096                     ; 887         if (value & LIS3DH_CLICK_Z) {
4098  0067 7b01          	ld	a,(OFST+0,sp)
4099  0069 a504          	bcp	a,#4
4100  006b 270a          	jreq	L3261
4101                     ; 888           *res = LIS3DH_DCLICK_Z_P;   
4103  006d 1e02          	ldw	x,(OFST+1,sp)
4104  006f a624          	ld	a,#36
4105  0071 f7            	ld	(x),a
4106                     ; 889           return MEMS_SUCCESS;
4108  0072 ae0001        	ldw	x,#1
4110  0075 20ae          	jra	L461
4111  0077               L3261:
4112                     ; 891         if (value & LIS3DH_CLICK_Y) {
4114  0077 7b01          	ld	a,(OFST+0,sp)
4115  0079 a502          	bcp	a,#2
4116  007b 270a          	jreq	L5261
4117                     ; 892           *res = LIS3DH_DCLICK_Y_P;   
4119  007d 1e02          	ldw	x,(OFST+1,sp)
4120  007f a622          	ld	a,#34
4121  0081 f7            	ld	(x),a
4122                     ; 893           return MEMS_SUCCESS;
4124  0082 ae0001        	ldw	x,#1
4126  0085 209e          	jra	L461
4127  0087               L5261:
4128                     ; 895         if (value & LIS3DH_CLICK_X) {
4130  0087 7b01          	ld	a,(OFST+0,sp)
4131  0089 a501          	bcp	a,#1
4132  008b 277c          	jreq	L5061
4133                     ; 896           *res = LIS3DH_DCLICK_X_P;   
4135  008d 1e02          	ldw	x,(OFST+1,sp)
4136  008f a621          	ld	a,#33
4137  0091 f7            	ld	(x),a
4138                     ; 897           return MEMS_SUCCESS;
4140  0092 ae0001        	ldw	x,#1
4142  0095 208e          	jra	L461
4143  0097               L7061:
4144                     ; 902       if (value & LIS3DH_CLICK_SIGN){
4146  0097 7b01          	ld	a,(OFST+0,sp)
4147  0099 a508          	bcp	a,#8
4148  009b 2736          	jreq	L3361
4149                     ; 903         if (value & LIS3DH_CLICK_Z) {
4151  009d 7b01          	ld	a,(OFST+0,sp)
4152  009f a504          	bcp	a,#4
4153  00a1 270c          	jreq	L5361
4154                     ; 904           *res = LIS3DH_SCLICK_Z_N;   
4156  00a3 1e02          	ldw	x,(OFST+1,sp)
4157  00a5 a61c          	ld	a,#28
4158  00a7 f7            	ld	(x),a
4159                     ; 905           return MEMS_SUCCESS;
4161  00a8 ae0001        	ldw	x,#1
4163  00ab ac250025      	jpf	L461
4164  00af               L5361:
4165                     ; 907         if (value & LIS3DH_CLICK_Y) {
4167  00af 7b01          	ld	a,(OFST+0,sp)
4168  00b1 a502          	bcp	a,#2
4169  00b3 270c          	jreq	L7361
4170                     ; 908           *res = LIS3DH_SCLICK_Y_N;   
4172  00b5 1e02          	ldw	x,(OFST+1,sp)
4173  00b7 a61a          	ld	a,#26
4174  00b9 f7            	ld	(x),a
4175                     ; 909           return MEMS_SUCCESS;
4177  00ba ae0001        	ldw	x,#1
4179  00bd ac250025      	jpf	L461
4180  00c1               L7361:
4181                     ; 911         if (value & LIS3DH_CLICK_X) {
4183  00c1 7b01          	ld	a,(OFST+0,sp)
4184  00c3 a501          	bcp	a,#1
4185  00c5 2742          	jreq	L5061
4186                     ; 912           *res = LIS3DH_SCLICK_X_N;   
4188  00c7 1e02          	ldw	x,(OFST+1,sp)
4189  00c9 a619          	ld	a,#25
4190  00cb f7            	ld	(x),a
4191                     ; 913           return MEMS_SUCCESS;
4193  00cc ae0001        	ldw	x,#1
4195  00cf ac250025      	jpf	L461
4196  00d3               L3361:
4197                     ; 917         if (value & LIS3DH_CLICK_Z) {
4199  00d3 7b01          	ld	a,(OFST+0,sp)
4200  00d5 a504          	bcp	a,#4
4201  00d7 270c          	jreq	L5461
4202                     ; 918           *res = LIS3DH_SCLICK_Z_P;   
4204  00d9 1e02          	ldw	x,(OFST+1,sp)
4205  00db a614          	ld	a,#20
4206  00dd f7            	ld	(x),a
4207                     ; 919           return MEMS_SUCCESS;
4209  00de ae0001        	ldw	x,#1
4211  00e1 ac250025      	jpf	L461
4212  00e5               L5461:
4213                     ; 921         if (value & LIS3DH_CLICK_Y) {
4215  00e5 7b01          	ld	a,(OFST+0,sp)
4216  00e7 a502          	bcp	a,#2
4217  00e9 270c          	jreq	L7461
4218                     ; 922           *res = LIS3DH_SCLICK_Y_P;   
4220  00eb 1e02          	ldw	x,(OFST+1,sp)
4221  00ed a612          	ld	a,#18
4222  00ef f7            	ld	(x),a
4223                     ; 923           return MEMS_SUCCESS;
4225  00f0 ae0001        	ldw	x,#1
4227  00f3 ac250025      	jpf	L461
4228  00f7               L7461:
4229                     ; 925         if (value & LIS3DH_CLICK_X) {
4231  00f7 7b01          	ld	a,(OFST+0,sp)
4232  00f9 a501          	bcp	a,#1
4233  00fb 270c          	jreq	L5061
4234                     ; 926           *res = LIS3DH_SCLICK_X_P;   
4236  00fd 1e02          	ldw	x,(OFST+1,sp)
4237  00ff a611          	ld	a,#17
4238  0101 f7            	ld	(x),a
4239                     ; 927           return MEMS_SUCCESS;
4241  0102 ae0001        	ldw	x,#1
4243  0105 ac250025      	jpf	L461
4244  0109               L5061:
4245                     ; 932   return MEMS_ERROR;
4247  0109 5f            	clrw	x
4249  010a ac250025      	jpf	L461
4297                     ; 943 status_t LIS3DH_Int1LatchEnable(State_t latch) {
4298                     .text:	section	.text,new
4299  0000               _LIS3DH_Int1LatchEnable:
4301  0000 89            	pushw	x
4302  0001 88            	push	a
4303       00000001      OFST:	set	1
4306                     ; 946   if( !LIS3DH_ReadReg(LIS3DH_CTRL_REG5, &value) )
4308  0002 96            	ldw	x,sp
4309  0003 1c0001        	addw	x,#OFST+0
4310  0006 89            	pushw	x
4311  0007 a624          	ld	a,#36
4312  0009 cd0000        	call	_LIS3DH_ReadReg
4314  000c 85            	popw	x
4315  000d 4d            	tnz	a
4316  000e 2603          	jrne	L5761
4317                     ; 947     return MEMS_ERROR;
4319  0010 5f            	clrw	x
4321  0011 201c          	jra	L271
4322  0013               L5761:
4323                     ; 949   value &= 0xF7;
4325  0013 7b01          	ld	a,(OFST+0,sp)
4326  0015 a4f7          	and	a,#247
4327  0017 6b01          	ld	(OFST+0,sp),a
4329                     ; 950   value |= latch<<LIS3DH_LIR_INT1;
4331  0019 7b03          	ld	a,(OFST+2,sp)
4332  001b 48            	sll	a
4333  001c 48            	sll	a
4334  001d 48            	sll	a
4335  001e 1a01          	or	a,(OFST+0,sp)
4336  0020 6b01          	ld	(OFST+0,sp),a
4338                     ; 952   if( !LIS3DH_WriteReg(LIS3DH_CTRL_REG5, value) )
4340  0022 7b01          	ld	a,(OFST+0,sp)
4341  0024 ae2400        	ldw	x,#9216
4342  0027 97            	ld	xl,a
4343  0028 cd0000        	call	_LIS3DH_WriteReg
4345  002b 4d            	tnz	a
4346  002c 2604          	jrne	L7761
4347                     ; 953     return MEMS_ERROR;
4349  002e 5f            	clrw	x
4351  002f               L271:
4353  002f 5b03          	addw	sp,#3
4354  0031 81            	ret
4355  0032               L7761:
4356                     ; 955   return MEMS_SUCCESS;
4358  0032 ae0001        	ldw	x,#1
4360  0035 20f8          	jra	L271
4397                     ; 966 status_t LIS3DH_ResetInt1Latch(void) {
4398                     .text:	section	.text,new
4399  0000               _LIS3DH_ResetInt1Latch:
4401  0000 88            	push	a
4402       00000001      OFST:	set	1
4405                     ; 969   if( !LIS3DH_ReadReg(LIS3DH_INT1_SRC, &value) )
4407  0001 96            	ldw	x,sp
4408  0002 1c0001        	addw	x,#OFST+0
4409  0005 89            	pushw	x
4410  0006 a631          	ld	a,#49
4411  0008 cd0000        	call	_LIS3DH_ReadReg
4413  000b 85            	popw	x
4414  000c 4d            	tnz	a
4415  000d 2603          	jrne	L7171
4416                     ; 970     return MEMS_ERROR;
4418  000f 5f            	clrw	x
4421  0010 84            	pop	a
4422  0011 81            	ret
4423  0012               L7171:
4424                     ; 972   return MEMS_SUCCESS;
4426  0012 ae0001        	ldw	x,#1
4429  0015 84            	pop	a
4430  0016 81            	ret
4467                     ; 982 status_t LIS3DH_ResetInt2Latch(void) {
4468                     .text:	section	.text,new
4469  0000               _LIS3DH_ResetInt2Latch:
4471  0000 88            	push	a
4472       00000001      OFST:	set	1
4475                     ; 985   if( !LIS3DH_ReadReg(LIS3DH_INT2_SRC, &value) )
4477  0001 96            	ldw	x,sp
4478  0002 1c0001        	addw	x,#OFST+0
4479  0005 89            	pushw	x
4480  0006 a635          	ld	a,#53
4481  0008 cd0000        	call	_LIS3DH_ReadReg
4483  000b 85            	popw	x
4484  000c 4d            	tnz	a
4485  000d 2603          	jrne	L7371
4486                     ; 986     return MEMS_ERROR;
4488  000f 5f            	clrw	x
4491  0010 84            	pop	a
4492  0011 81            	ret
4493  0012               L7371:
4494                     ; 988   return MEMS_SUCCESS;
4496  0012 ae0001        	ldw	x,#1
4499  0015 84            	pop	a
4500  0016 81            	ret
4547                     ; 998 status_t LIS3DH_SetIntConfiguration(LIS3DH_Int1Conf_t ic) {
4548                     .text:	section	.text,new
4549  0000               _LIS3DH_SetIntConfiguration:
4551  0000 88            	push	a
4552  0001 88            	push	a
4553       00000001      OFST:	set	1
4556                     ; 1001   if( !LIS3DH_ReadReg(LIS3DH_INT1_CFG, &value) )
4558  0002 96            	ldw	x,sp
4559  0003 1c0001        	addw	x,#OFST+0
4560  0006 89            	pushw	x
4561  0007 a630          	ld	a,#48
4562  0009 cd0000        	call	_LIS3DH_ReadReg
4564  000c 85            	popw	x
4565  000d 4d            	tnz	a
4566  000e 2603          	jrne	L3671
4567                     ; 1002     return MEMS_ERROR;
4569  0010 5f            	clrw	x
4571  0011 2019          	jra	L202
4572  0013               L3671:
4573                     ; 1004   value &= 0x40; 
4575  0013 7b01          	ld	a,(OFST+0,sp)
4576  0015 a440          	and	a,#64
4577  0017 6b01          	ld	(OFST+0,sp),a
4579                     ; 1005   value |= ic;
4581  0019 7b01          	ld	a,(OFST+0,sp)
4582  001b 1a02          	or	a,(OFST+1,sp)
4583  001d 6b01          	ld	(OFST+0,sp),a
4585                     ; 1007   if( !LIS3DH_WriteReg(LIS3DH_INT1_CFG, value) )
4587  001f 7b01          	ld	a,(OFST+0,sp)
4588  0021 ae3000        	ldw	x,#12288
4589  0024 97            	ld	xl,a
4590  0025 cd0000        	call	_LIS3DH_WriteReg
4592  0028 4d            	tnz	a
4593  0029 2604          	jrne	L5671
4594                     ; 1008     return MEMS_ERROR;
4596  002b 5f            	clrw	x
4598  002c               L202:
4600  002c 5b02          	addw	sp,#2
4601  002e 81            	ret
4602  002f               L5671:
4603                     ; 1010   return MEMS_SUCCESS;
4605  002f ae0001        	ldw	x,#1
4607  0032 20f8          	jra	L202
4691                     ; 1022 status_t LIS3DH_SetIntMode(LIS3DH_Int1Mode_t int_mode) {
4692                     .text:	section	.text,new
4693  0000               _LIS3DH_SetIntMode:
4695  0000 89            	pushw	x
4696  0001 88            	push	a
4697       00000001      OFST:	set	1
4700                     ; 1025   if( !LIS3DH_ReadReg(LIS3DH_INT1_CFG, &value) )
4702  0002 96            	ldw	x,sp
4703  0003 1c0001        	addw	x,#OFST+0
4704  0006 89            	pushw	x
4705  0007 a630          	ld	a,#48
4706  0009 cd0000        	call	_LIS3DH_ReadReg
4708  000c 85            	popw	x
4709  000d 4d            	tnz	a
4710  000e 2603          	jrne	L5202
4711                     ; 1026     return MEMS_ERROR;
4713  0010 5f            	clrw	x
4715  0011 201e          	jra	L602
4716  0013               L5202:
4717                     ; 1028   value &= 0x3F; 
4719  0013 7b01          	ld	a,(OFST+0,sp)
4720  0015 a43f          	and	a,#63
4721  0017 6b01          	ld	(OFST+0,sp),a
4723                     ; 1029   value |= (int_mode<<LIS3DH_INT_6D);
4725  0019 7b03          	ld	a,(OFST+2,sp)
4726  001b 4e            	swap	a
4727  001c 48            	sll	a
4728  001d 48            	sll	a
4729  001e a4c0          	and	a,#192
4730  0020 1a01          	or	a,(OFST+0,sp)
4731  0022 6b01          	ld	(OFST+0,sp),a
4733                     ; 1031   if( !LIS3DH_WriteReg(LIS3DH_INT1_CFG, value) )
4735  0024 7b01          	ld	a,(OFST+0,sp)
4736  0026 ae3000        	ldw	x,#12288
4737  0029 97            	ld	xl,a
4738  002a cd0000        	call	_LIS3DH_WriteReg
4740  002d 4d            	tnz	a
4741  002e 2604          	jrne	L7202
4742                     ; 1032     return MEMS_ERROR;
4744  0030 5f            	clrw	x
4746  0031               L602:
4748  0031 5b03          	addw	sp,#3
4749  0033 81            	ret
4750  0034               L7202:
4751                     ; 1034   return MEMS_SUCCESS;
4753  0034 ae0001        	ldw	x,#1
4755  0037 20f8          	jra	L602
4842                     ; 1045 status_t LIS3DH_SetInt6D4DConfiguration(LIS3DH_INT_6D_4D_t ic) {
4843                     .text:	section	.text,new
4844  0000               _LIS3DH_SetInt6D4DConfiguration:
4846  0000 89            	pushw	x
4847  0001 89            	pushw	x
4848       00000002      OFST:	set	2
4851                     ; 1049   if( !LIS3DH_ReadReg(LIS3DH_INT1_CFG, &value) )
4853  0002 96            	ldw	x,sp
4854  0003 1c0001        	addw	x,#OFST-1
4855  0006 89            	pushw	x
4856  0007 a630          	ld	a,#48
4857  0009 cd0000        	call	_LIS3DH_ReadReg
4859  000c 85            	popw	x
4860  000d 4d            	tnz	a
4861  000e 2603          	jrne	L1702
4862                     ; 1050     return MEMS_ERROR;
4864  0010 5f            	clrw	x
4866  0011 200f          	jra	L212
4867  0013               L1702:
4868                     ; 1051   if( !LIS3DH_ReadReg(LIS3DH_CTRL_REG5, &value2) )
4870  0013 96            	ldw	x,sp
4871  0014 1c0002        	addw	x,#OFST+0
4872  0017 89            	pushw	x
4873  0018 a624          	ld	a,#36
4874  001a cd0000        	call	_LIS3DH_ReadReg
4876  001d 85            	popw	x
4877  001e 4d            	tnz	a
4878  001f 2604          	jrne	L3702
4879                     ; 1052     return MEMS_ERROR;
4881  0021 5f            	clrw	x
4883  0022               L212:
4885  0022 5b04          	addw	sp,#4
4886  0024 81            	ret
4887  0025               L3702:
4888                     ; 1054   if(ic == LIS3DH_INT1_6D_ENABLE){
4890  0025 1e03          	ldw	x,(OFST+1,sp)
4891  0027 a30001        	cpw	x,#1
4892  002a 2612          	jrne	L5702
4893                     ; 1055     value &= 0xBF; 
4895  002c 7b01          	ld	a,(OFST-1,sp)
4896  002e a4bf          	and	a,#191
4897  0030 6b01          	ld	(OFST-1,sp),a
4899                     ; 1056     value |= (MEMS_ENABLE<<LIS3DH_INT_6D);
4901  0032 7b01          	ld	a,(OFST-1,sp)
4902  0034 aa40          	or	a,#64
4903  0036 6b01          	ld	(OFST-1,sp),a
4905                     ; 1057     value2 &= 0xFB; 
4907  0038 7b02          	ld	a,(OFST+0,sp)
4908  003a a4fb          	and	a,#251
4909  003c 6b02          	ld	(OFST+0,sp),a
4911                     ; 1058     value2 |= (MEMS_DISABLE<<LIS3DH_D4D_INT1);
4913  003e               L5702:
4914                     ; 1061   if(ic == LIS3DH_INT1_4D_ENABLE){
4916  003e 1e03          	ldw	x,(OFST+1,sp)
4917  0040 a30002        	cpw	x,#2
4918  0043 2618          	jrne	L7702
4919                     ; 1062     value &= 0xBF; 
4921  0045 7b01          	ld	a,(OFST-1,sp)
4922  0047 a4bf          	and	a,#191
4923  0049 6b01          	ld	(OFST-1,sp),a
4925                     ; 1063     value |= (MEMS_ENABLE<<LIS3DH_INT_6D);
4927  004b 7b01          	ld	a,(OFST-1,sp)
4928  004d aa40          	or	a,#64
4929  004f 6b01          	ld	(OFST-1,sp),a
4931                     ; 1064     value2 &= 0xFB; 
4933  0051 7b02          	ld	a,(OFST+0,sp)
4934  0053 a4fb          	and	a,#251
4935  0055 6b02          	ld	(OFST+0,sp),a
4937                     ; 1065     value2 |= (MEMS_ENABLE<<LIS3DH_D4D_INT1);
4939  0057 7b02          	ld	a,(OFST+0,sp)
4940  0059 aa04          	or	a,#4
4941  005b 6b02          	ld	(OFST+0,sp),a
4943  005d               L7702:
4944                     ; 1068   if(ic == LIS3DH_INT1_6D_4D_DISABLE){
4946  005d 1e03          	ldw	x,(OFST+1,sp)
4947  005f 260c          	jrne	L1012
4948                     ; 1069     value &= 0xBF; 
4950  0061 7b01          	ld	a,(OFST-1,sp)
4951  0063 a4bf          	and	a,#191
4952  0065 6b01          	ld	(OFST-1,sp),a
4954                     ; 1070     value |= (MEMS_DISABLE<<LIS3DH_INT_6D);
4956                     ; 1071     value2 &= 0xFB; 
4958  0067 7b02          	ld	a,(OFST+0,sp)
4959  0069 a4fb          	and	a,#251
4960  006b 6b02          	ld	(OFST+0,sp),a
4962                     ; 1072     value2 |= (MEMS_DISABLE<<LIS3DH_D4D_INT1);
4964  006d               L1012:
4965                     ; 1075   if( !LIS3DH_WriteReg(LIS3DH_INT1_CFG, value) )
4967  006d 7b01          	ld	a,(OFST-1,sp)
4968  006f ae3000        	ldw	x,#12288
4969  0072 97            	ld	xl,a
4970  0073 cd0000        	call	_LIS3DH_WriteReg
4972  0076 4d            	tnz	a
4973  0077 2603          	jrne	L3012
4974                     ; 1076     return MEMS_ERROR;
4976  0079 5f            	clrw	x
4978  007a 20a6          	jra	L212
4979  007c               L3012:
4980                     ; 1077   if( !LIS3DH_WriteReg(LIS3DH_CTRL_REG5, value2) )
4982  007c 7b02          	ld	a,(OFST+0,sp)
4983  007e ae2400        	ldw	x,#9216
4984  0081 97            	ld	xl,a
4985  0082 cd0000        	call	_LIS3DH_WriteReg
4987  0085 4d            	tnz	a
4988  0086 2603          	jrne	L5012
4989                     ; 1078     return MEMS_ERROR;
4991  0088 5f            	clrw	x
4993  0089 2097          	jra	L212
4994  008b               L5012:
4995                     ; 1080   return MEMS_SUCCESS;
4997  008b ae0001        	ldw	x,#1
4999  008e 2092          	jra	L212
5046                     ; 1091 status_t LIS3DH_Get6DPosition(u8_t* val){
5047                     .text:	section	.text,new
5048  0000               _LIS3DH_Get6DPosition:
5050  0000 89            	pushw	x
5051  0001 88            	push	a
5052       00000001      OFST:	set	1
5055                     ; 1094   if( !LIS3DH_ReadReg(LIS3DH_INT1_SRC, &value) )
5057  0002 96            	ldw	x,sp
5058  0003 1c0001        	addw	x,#OFST+0
5059  0006 89            	pushw	x
5060  0007 a631          	ld	a,#49
5061  0009 cd0000        	call	_LIS3DH_ReadReg
5063  000c 85            	popw	x
5064  000d 4d            	tnz	a
5065  000e 2603          	jrne	L5412
5066                     ; 1095     return MEMS_ERROR;
5068  0010 5f            	clrw	x
5070  0011 204c          	jra	L612
5071  0013               L5412:
5072                     ; 1097   value &= 0x7F;
5074  0013 7b01          	ld	a,(OFST+0,sp)
5075  0015 a47f          	and	a,#127
5076  0017 6b01          	ld	(OFST+0,sp),a
5078                     ; 1099   switch (value){
5080  0019 7b01          	ld	a,(OFST+0,sp)
5082                     ; 1117     break;
5083  001b a041          	sub	a,#65
5084  001d 2723          	jreq	L3112
5085  001f 4a            	dec	a
5086  0020 2719          	jreq	L1112
5087  0022 a002          	sub	a,#2
5088  0024 270e          	jreq	L7012
5089  0026 a004          	sub	a,#4
5090  0028 271f          	jreq	L5112
5091  002a a008          	sub	a,#8
5092  002c 2729          	jreq	L1212
5093  002e a010          	sub	a,#16
5094  0030 271e          	jreq	L7112
5095  0032 2028          	jra	L1512
5096  0034               L7012:
5097                     ; 1100   case LIS3DH_UP_SX:   
5097                     ; 1101     *val = LIS3DH_UP_SX;    
5099  0034 1e02          	ldw	x,(OFST+1,sp)
5100  0036 a644          	ld	a,#68
5101  0038 f7            	ld	(x),a
5102                     ; 1102     break;
5104  0039 2021          	jra	L1512
5105  003b               L1112:
5106                     ; 1103   case LIS3DH_UP_DX:   
5106                     ; 1104     *val = LIS3DH_UP_DX;    
5108  003b 1e02          	ldw	x,(OFST+1,sp)
5109  003d a642          	ld	a,#66
5110  003f f7            	ld	(x),a
5111                     ; 1105     break;
5113  0040 201a          	jra	L1512
5114  0042               L3112:
5115                     ; 1106   case LIS3DH_DW_SX:   
5115                     ; 1107     *val = LIS3DH_DW_SX;    
5117  0042 1e02          	ldw	x,(OFST+1,sp)
5118  0044 a641          	ld	a,#65
5119  0046 f7            	ld	(x),a
5120                     ; 1108     break;
5122  0047 2013          	jra	L1512
5123  0049               L5112:
5124                     ; 1109   case LIS3DH_DW_DX:   
5124                     ; 1110     *val = LIS3DH_DW_DX;    
5126  0049 1e02          	ldw	x,(OFST+1,sp)
5127  004b a648          	ld	a,#72
5128  004d f7            	ld	(x),a
5129                     ; 1111     break;
5131  004e 200c          	jra	L1512
5132  0050               L7112:
5133                     ; 1112   case LIS3DH_TOP:     
5133                     ; 1113     *val = LIS3DH_TOP;      
5135  0050 1e02          	ldw	x,(OFST+1,sp)
5136  0052 a660          	ld	a,#96
5137  0054 f7            	ld	(x),a
5138                     ; 1114     break;
5140  0055 2005          	jra	L1512
5141  0057               L1212:
5142                     ; 1115   case LIS3DH_BOTTOM:  
5142                     ; 1116     *val = LIS3DH_BOTTOM;   
5144  0057 1e02          	ldw	x,(OFST+1,sp)
5145  0059 a650          	ld	a,#80
5146  005b f7            	ld	(x),a
5147                     ; 1117     break;
5149  005c               L1512:
5150                     ; 1120   return MEMS_SUCCESS;  
5152  005c ae0001        	ldw	x,#1
5154  005f               L612:
5156  005f 5b03          	addw	sp,#3
5157  0061 81            	ret
5194                     ; 1131 status_t LIS3DH_SetInt1Threshold(u8_t ths) {
5195                     .text:	section	.text,new
5196  0000               _LIS3DH_SetInt1Threshold:
5198  0000 88            	push	a
5199       00000000      OFST:	set	0
5202                     ; 1132   if (ths > 127)
5204  0001 a180          	cp	a,#128
5205  0003 2503          	jrult	L1712
5206                     ; 1133     return MEMS_ERROR;
5208  0005 5f            	clrw	x
5211  0006 84            	pop	a
5212  0007 81            	ret
5213  0008               L1712:
5214                     ; 1135   if( !LIS3DH_WriteReg(LIS3DH_INT1_THS, ths) )
5216  0008 7b01          	ld	a,(OFST+1,sp)
5217  000a ae3200        	ldw	x,#12800
5218  000d 97            	ld	xl,a
5219  000e cd0000        	call	_LIS3DH_WriteReg
5221  0011 4d            	tnz	a
5222  0012 2603          	jrne	L3712
5223                     ; 1136     return MEMS_ERROR;    
5225  0014 5f            	clrw	x
5228  0015 84            	pop	a
5229  0016 81            	ret
5230  0017               L3712:
5231                     ; 1138   return MEMS_SUCCESS;
5233  0017 ae0001        	ldw	x,#1
5236  001a 84            	pop	a
5237  001b 81            	ret
5274                     ; 1149 status_t LIS3DH_SetInt1Duration(LIS3DH_Int1Conf_t id) {
5275                     .text:	section	.text,new
5276  0000               _LIS3DH_SetInt1Duration:
5278  0000 88            	push	a
5279       00000000      OFST:	set	0
5282                     ; 1151   if (id > 127)
5284  0001 a180          	cp	a,#128
5285  0003 2503          	jrult	L3122
5286                     ; 1152     return MEMS_ERROR;
5288  0005 5f            	clrw	x
5291  0006 84            	pop	a
5292  0007 81            	ret
5293  0008               L3122:
5294                     ; 1154   if( !LIS3DH_WriteReg(LIS3DH_INT1_DURATION, id) )
5296  0008 7b01          	ld	a,(OFST+1,sp)
5297  000a ae3300        	ldw	x,#13056
5298  000d 97            	ld	xl,a
5299  000e cd0000        	call	_LIS3DH_WriteReg
5301  0011 4d            	tnz	a
5302  0012 2603          	jrne	L5122
5303                     ; 1155     return MEMS_ERROR;
5305  0014 5f            	clrw	x
5308  0015 84            	pop	a
5309  0016 81            	ret
5310  0017               L5122:
5311                     ; 1157   return MEMS_SUCCESS;
5313  0017 ae0001        	ldw	x,#1
5316  001a 84            	pop	a
5317  001b 81            	ret
5410                     ; 1169 status_t LIS3DH_FIFOModeEnable(LIS3DH_FifoMode_t fm) {
5411                     .text:	section	.text,new
5412  0000               _LIS3DH_FIFOModeEnable:
5414  0000 89            	pushw	x
5415  0001 88            	push	a
5416       00000001      OFST:	set	1
5419                     ; 1172   if(fm == LIS3DH_FIFO_DISABLE) { 
5421  0002 a30004        	cpw	x,#4
5422  0005 264d          	jrne	L7522
5423                     ; 1173     if( !LIS3DH_ReadReg(LIS3DH_FIFO_CTRL_REG, &value) )
5425  0007 96            	ldw	x,sp
5426  0008 1c0001        	addw	x,#OFST+0
5427  000b 89            	pushw	x
5428  000c a62e          	ld	a,#46
5429  000e cd0000        	call	_LIS3DH_ReadReg
5431  0011 85            	popw	x
5432  0012 4d            	tnz	a
5433  0013 2603          	jrne	L1622
5434                     ; 1174       return MEMS_ERROR;
5436  0015 5f            	clrw	x
5438  0016 2013          	jra	L622
5439  0018               L1622:
5440                     ; 1176     value &= 0x1F;
5442  0018 7b01          	ld	a,(OFST+0,sp)
5443  001a a41f          	and	a,#31
5444  001c 6b01          	ld	(OFST+0,sp),a
5446                     ; 1177     value |= (LIS3DH_FIFO_BYPASS_MODE<<LIS3DH_FM);                     
5448                     ; 1179     if( !LIS3DH_WriteReg(LIS3DH_FIFO_CTRL_REG, value) )           //fifo mode bypass
5450  001e 7b01          	ld	a,(OFST+0,sp)
5451  0020 ae2e00        	ldw	x,#11776
5452  0023 97            	ld	xl,a
5453  0024 cd0000        	call	_LIS3DH_WriteReg
5455  0027 4d            	tnz	a
5456  0028 2604          	jrne	L3622
5457                     ; 1180       return MEMS_ERROR;   
5459  002a 5f            	clrw	x
5461  002b               L622:
5463  002b 5b03          	addw	sp,#3
5464  002d 81            	ret
5465  002e               L3622:
5466                     ; 1181     if( !LIS3DH_ReadReg(LIS3DH_CTRL_REG5, &value) )
5468  002e 96            	ldw	x,sp
5469  002f 1c0001        	addw	x,#OFST+0
5470  0032 89            	pushw	x
5471  0033 a624          	ld	a,#36
5472  0035 cd0000        	call	_LIS3DH_ReadReg
5474  0038 85            	popw	x
5475  0039 4d            	tnz	a
5476  003a 2603          	jrne	L5622
5477                     ; 1182       return MEMS_ERROR;
5479  003c 5f            	clrw	x
5481  003d 20ec          	jra	L622
5482  003f               L5622:
5483                     ; 1184     value &= 0xBF;    
5485  003f 7b01          	ld	a,(OFST+0,sp)
5486  0041 a4bf          	and	a,#191
5487  0043 6b01          	ld	(OFST+0,sp),a
5489                     ; 1186     if( !LIS3DH_WriteReg(LIS3DH_CTRL_REG5, value) )               //fifo disable
5491  0045 7b01          	ld	a,(OFST+0,sp)
5492  0047 ae2400        	ldw	x,#9216
5493  004a 97            	ld	xl,a
5494  004b cd0000        	call	_LIS3DH_WriteReg
5496  004e 4d            	tnz	a
5497  004f 2603          	jrne	L7522
5498                     ; 1187       return MEMS_ERROR;   
5500  0051 5f            	clrw	x
5502  0052 20d7          	jra	L622
5503  0054               L7522:
5504                     ; 1190   if(fm == LIS3DH_FIFO_BYPASS_MODE)   {  
5506  0054 1e02          	ldw	x,(OFST+1,sp)
5507  0056 265f          	jrne	L1722
5508                     ; 1191     if( !LIS3DH_ReadReg(LIS3DH_CTRL_REG5, &value) )
5510  0058 96            	ldw	x,sp
5511  0059 1c0001        	addw	x,#OFST+0
5512  005c 89            	pushw	x
5513  005d a624          	ld	a,#36
5514  005f cd0000        	call	_LIS3DH_ReadReg
5516  0062 85            	popw	x
5517  0063 4d            	tnz	a
5518  0064 2603          	jrne	L3722
5519                     ; 1192       return MEMS_ERROR;
5521  0066 5f            	clrw	x
5523  0067 20c2          	jra	L622
5524  0069               L3722:
5525                     ; 1194     value &= 0xBF;
5527  0069 7b01          	ld	a,(OFST+0,sp)
5528  006b a4bf          	and	a,#191
5529  006d 6b01          	ld	(OFST+0,sp),a
5531                     ; 1195     value |= MEMS_SET<<LIS3DH_FIFO_EN;
5533  006f 7b01          	ld	a,(OFST+0,sp)
5534  0071 aa40          	or	a,#64
5535  0073 6b01          	ld	(OFST+0,sp),a
5537                     ; 1197     if( !LIS3DH_WriteReg(LIS3DH_CTRL_REG5, value) )               //fifo enable
5539  0075 7b01          	ld	a,(OFST+0,sp)
5540  0077 ae2400        	ldw	x,#9216
5541  007a 97            	ld	xl,a
5542  007b cd0000        	call	_LIS3DH_WriteReg
5544  007e 4d            	tnz	a
5545  007f 2603          	jrne	L5722
5546                     ; 1198       return MEMS_ERROR;  
5548  0081 5f            	clrw	x
5550  0082 20a7          	jra	L622
5551  0084               L5722:
5552                     ; 1199     if( !LIS3DH_ReadReg(LIS3DH_FIFO_CTRL_REG, &value) )
5554  0084 96            	ldw	x,sp
5555  0085 1c0001        	addw	x,#OFST+0
5556  0088 89            	pushw	x
5557  0089 a62e          	ld	a,#46
5558  008b cd0000        	call	_LIS3DH_ReadReg
5560  008e 85            	popw	x
5561  008f 4d            	tnz	a
5562  0090 2603          	jrne	L7722
5563                     ; 1200       return MEMS_ERROR;
5565  0092 5f            	clrw	x
5567  0093 2096          	jra	L622
5568  0095               L7722:
5569                     ; 1202     value &= 0x1f;
5571  0095 7b01          	ld	a,(OFST+0,sp)
5572  0097 a41f          	and	a,#31
5573  0099 6b01          	ld	(OFST+0,sp),a
5575                     ; 1203     value |= (fm<<LIS3DH_FM);                     //fifo mode configuration
5577  009b 7b03          	ld	a,(OFST+2,sp)
5578  009d 4e            	swap	a
5579  009e 48            	sll	a
5580  009f 48            	sll	a
5581  00a0 a4c0          	and	a,#192
5582  00a2 1a01          	or	a,(OFST+0,sp)
5583  00a4 6b01          	ld	(OFST+0,sp),a
5585                     ; 1205     if( !LIS3DH_WriteReg(LIS3DH_FIFO_CTRL_REG, value) )
5587  00a6 7b01          	ld	a,(OFST+0,sp)
5588  00a8 ae2e00        	ldw	x,#11776
5589  00ab 97            	ld	xl,a
5590  00ac cd0000        	call	_LIS3DH_WriteReg
5592  00af 4d            	tnz	a
5593  00b0 2605          	jrne	L1722
5594                     ; 1206       return MEMS_ERROR;
5596  00b2 5f            	clrw	x
5598  00b3 ac2b002b      	jpf	L622
5599  00b7               L1722:
5600                     ; 1209   if(fm == LIS3DH_FIFO_MODE)   {
5602  00b7 1e02          	ldw	x,(OFST+1,sp)
5603  00b9 a30001        	cpw	x,#1
5604  00bc 2665          	jrne	L3032
5605                     ; 1210     if( !LIS3DH_ReadReg(LIS3DH_CTRL_REG5, &value) )
5607  00be 96            	ldw	x,sp
5608  00bf 1c0001        	addw	x,#OFST+0
5609  00c2 89            	pushw	x
5610  00c3 a624          	ld	a,#36
5611  00c5 cd0000        	call	_LIS3DH_ReadReg
5613  00c8 85            	popw	x
5614  00c9 4d            	tnz	a
5615  00ca 2605          	jrne	L5032
5616                     ; 1211       return MEMS_ERROR;
5618  00cc 5f            	clrw	x
5620  00cd ac2b002b      	jpf	L622
5621  00d1               L5032:
5622                     ; 1213     value &= 0xBF;
5624  00d1 7b01          	ld	a,(OFST+0,sp)
5625  00d3 a4bf          	and	a,#191
5626  00d5 6b01          	ld	(OFST+0,sp),a
5628                     ; 1214     value |= MEMS_SET<<LIS3DH_FIFO_EN;
5630  00d7 7b01          	ld	a,(OFST+0,sp)
5631  00d9 aa40          	or	a,#64
5632  00db 6b01          	ld	(OFST+0,sp),a
5634                     ; 1216     if( !LIS3DH_WriteReg(LIS3DH_CTRL_REG5, value) )               //fifo enable
5636  00dd 7b01          	ld	a,(OFST+0,sp)
5637  00df ae2400        	ldw	x,#9216
5638  00e2 97            	ld	xl,a
5639  00e3 cd0000        	call	_LIS3DH_WriteReg
5641  00e6 4d            	tnz	a
5642  00e7 2605          	jrne	L7032
5643                     ; 1217       return MEMS_ERROR;  
5645  00e9 5f            	clrw	x
5647  00ea ac2b002b      	jpf	L622
5648  00ee               L7032:
5649                     ; 1218     if( !LIS3DH_ReadReg(LIS3DH_FIFO_CTRL_REG, &value) )
5651  00ee 96            	ldw	x,sp
5652  00ef 1c0001        	addw	x,#OFST+0
5653  00f2 89            	pushw	x
5654  00f3 a62e          	ld	a,#46
5655  00f5 cd0000        	call	_LIS3DH_ReadReg
5657  00f8 85            	popw	x
5658  00f9 4d            	tnz	a
5659  00fa 2605          	jrne	L1132
5660                     ; 1219       return MEMS_ERROR;
5662  00fc 5f            	clrw	x
5664  00fd ac2b002b      	jpf	L622
5665  0101               L1132:
5666                     ; 1221     value &= 0x1f;
5668  0101 7b01          	ld	a,(OFST+0,sp)
5669  0103 a41f          	and	a,#31
5670  0105 6b01          	ld	(OFST+0,sp),a
5672                     ; 1222     value |= (fm<<LIS3DH_FM);                      //fifo mode configuration
5674  0107 7b03          	ld	a,(OFST+2,sp)
5675  0109 4e            	swap	a
5676  010a 48            	sll	a
5677  010b 48            	sll	a
5678  010c a4c0          	and	a,#192
5679  010e 1a01          	or	a,(OFST+0,sp)
5680  0110 6b01          	ld	(OFST+0,sp),a
5682                     ; 1224     if( !LIS3DH_WriteReg(LIS3DH_FIFO_CTRL_REG, value) )
5684  0112 7b01          	ld	a,(OFST+0,sp)
5685  0114 ae2e00        	ldw	x,#11776
5686  0117 97            	ld	xl,a
5687  0118 cd0000        	call	_LIS3DH_WriteReg
5689  011b 4d            	tnz	a
5690  011c 2605          	jrne	L3032
5691                     ; 1225       return MEMS_ERROR;
5693  011e 5f            	clrw	x
5695  011f ac2b002b      	jpf	L622
5696  0123               L3032:
5697                     ; 1228   if(fm == LIS3DH_FIFO_STREAM_MODE)   {  
5699  0123 1e02          	ldw	x,(OFST+1,sp)
5700  0125 a30002        	cpw	x,#2
5701  0128 2665          	jrne	L5132
5702                     ; 1229     if( !LIS3DH_ReadReg(LIS3DH_CTRL_REG5, &value) )
5704  012a 96            	ldw	x,sp
5705  012b 1c0001        	addw	x,#OFST+0
5706  012e 89            	pushw	x
5707  012f a624          	ld	a,#36
5708  0131 cd0000        	call	_LIS3DH_ReadReg
5710  0134 85            	popw	x
5711  0135 4d            	tnz	a
5712  0136 2605          	jrne	L7132
5713                     ; 1230       return MEMS_ERROR;
5715  0138 5f            	clrw	x
5717  0139 ac2b002b      	jpf	L622
5718  013d               L7132:
5719                     ; 1232     value &= 0xBF;
5721  013d 7b01          	ld	a,(OFST+0,sp)
5722  013f a4bf          	and	a,#191
5723  0141 6b01          	ld	(OFST+0,sp),a
5725                     ; 1233     value |= MEMS_SET<<LIS3DH_FIFO_EN;
5727  0143 7b01          	ld	a,(OFST+0,sp)
5728  0145 aa40          	or	a,#64
5729  0147 6b01          	ld	(OFST+0,sp),a
5731                     ; 1235     if( !LIS3DH_WriteReg(LIS3DH_CTRL_REG5, value) )               //fifo enable
5733  0149 7b01          	ld	a,(OFST+0,sp)
5734  014b ae2400        	ldw	x,#9216
5735  014e 97            	ld	xl,a
5736  014f cd0000        	call	_LIS3DH_WriteReg
5738  0152 4d            	tnz	a
5739  0153 2605          	jrne	L1232
5740                     ; 1236       return MEMS_ERROR;   
5742  0155 5f            	clrw	x
5744  0156 ac2b002b      	jpf	L622
5745  015a               L1232:
5746                     ; 1237     if( !LIS3DH_ReadReg(LIS3DH_FIFO_CTRL_REG, &value) )
5748  015a 96            	ldw	x,sp
5749  015b 1c0001        	addw	x,#OFST+0
5750  015e 89            	pushw	x
5751  015f a62e          	ld	a,#46
5752  0161 cd0000        	call	_LIS3DH_ReadReg
5754  0164 85            	popw	x
5755  0165 4d            	tnz	a
5756  0166 2605          	jrne	L3232
5757                     ; 1238       return MEMS_ERROR;
5759  0168 5f            	clrw	x
5761  0169 ac2b002b      	jpf	L622
5762  016d               L3232:
5763                     ; 1240     value &= 0x1f;
5765  016d 7b01          	ld	a,(OFST+0,sp)
5766  016f a41f          	and	a,#31
5767  0171 6b01          	ld	(OFST+0,sp),a
5769                     ; 1241     value |= (fm<<LIS3DH_FM);                      //fifo mode configuration
5771  0173 7b03          	ld	a,(OFST+2,sp)
5772  0175 4e            	swap	a
5773  0176 48            	sll	a
5774  0177 48            	sll	a
5775  0178 a4c0          	and	a,#192
5776  017a 1a01          	or	a,(OFST+0,sp)
5777  017c 6b01          	ld	(OFST+0,sp),a
5779                     ; 1243     if( !LIS3DH_WriteReg(LIS3DH_FIFO_CTRL_REG, value) )
5781  017e 7b01          	ld	a,(OFST+0,sp)
5782  0180 ae2e00        	ldw	x,#11776
5783  0183 97            	ld	xl,a
5784  0184 cd0000        	call	_LIS3DH_WriteReg
5786  0187 4d            	tnz	a
5787  0188 2605          	jrne	L5132
5788                     ; 1244       return MEMS_ERROR;
5790  018a 5f            	clrw	x
5792  018b ac2b002b      	jpf	L622
5793  018f               L5132:
5794                     ; 1247   if(fm == LIS3DH_FIFO_TRIGGER_MODE)   {  
5796  018f 1e02          	ldw	x,(OFST+1,sp)
5797  0191 a30003        	cpw	x,#3
5798  0194 2665          	jrne	L7232
5799                     ; 1248     if( !LIS3DH_ReadReg(LIS3DH_CTRL_REG5, &value) )
5801  0196 96            	ldw	x,sp
5802  0197 1c0001        	addw	x,#OFST+0
5803  019a 89            	pushw	x
5804  019b a624          	ld	a,#36
5805  019d cd0000        	call	_LIS3DH_ReadReg
5807  01a0 85            	popw	x
5808  01a1 4d            	tnz	a
5809  01a2 2605          	jrne	L1332
5810                     ; 1249       return MEMS_ERROR;
5812  01a4 5f            	clrw	x
5814  01a5 ac2b002b      	jpf	L622
5815  01a9               L1332:
5816                     ; 1251     value &= 0xBF;
5818  01a9 7b01          	ld	a,(OFST+0,sp)
5819  01ab a4bf          	and	a,#191
5820  01ad 6b01          	ld	(OFST+0,sp),a
5822                     ; 1252     value |= MEMS_SET<<LIS3DH_FIFO_EN;
5824  01af 7b01          	ld	a,(OFST+0,sp)
5825  01b1 aa40          	or	a,#64
5826  01b3 6b01          	ld	(OFST+0,sp),a
5828                     ; 1254     if( !LIS3DH_WriteReg(LIS3DH_CTRL_REG5, value) )               //fifo enable
5830  01b5 7b01          	ld	a,(OFST+0,sp)
5831  01b7 ae2400        	ldw	x,#9216
5832  01ba 97            	ld	xl,a
5833  01bb cd0000        	call	_LIS3DH_WriteReg
5835  01be 4d            	tnz	a
5836  01bf 2605          	jrne	L3332
5837                     ; 1255       return MEMS_ERROR;    
5839  01c1 5f            	clrw	x
5841  01c2 ac2b002b      	jpf	L622
5842  01c6               L3332:
5843                     ; 1256     if( !LIS3DH_ReadReg(LIS3DH_FIFO_CTRL_REG, &value) )
5845  01c6 96            	ldw	x,sp
5846  01c7 1c0001        	addw	x,#OFST+0
5847  01ca 89            	pushw	x
5848  01cb a62e          	ld	a,#46
5849  01cd cd0000        	call	_LIS3DH_ReadReg
5851  01d0 85            	popw	x
5852  01d1 4d            	tnz	a
5853  01d2 2605          	jrne	L5332
5854                     ; 1257       return MEMS_ERROR;
5856  01d4 5f            	clrw	x
5858  01d5 ac2b002b      	jpf	L622
5859  01d9               L5332:
5860                     ; 1259     value &= 0x1f;
5862  01d9 7b01          	ld	a,(OFST+0,sp)
5863  01db a41f          	and	a,#31
5864  01dd 6b01          	ld	(OFST+0,sp),a
5866                     ; 1260     value |= (fm<<LIS3DH_FM);                      //fifo mode configuration
5868  01df 7b03          	ld	a,(OFST+2,sp)
5869  01e1 4e            	swap	a
5870  01e2 48            	sll	a
5871  01e3 48            	sll	a
5872  01e4 a4c0          	and	a,#192
5873  01e6 1a01          	or	a,(OFST+0,sp)
5874  01e8 6b01          	ld	(OFST+0,sp),a
5876                     ; 1262     if( !LIS3DH_WriteReg(LIS3DH_FIFO_CTRL_REG, value) )
5878  01ea 7b01          	ld	a,(OFST+0,sp)
5879  01ec ae2e00        	ldw	x,#11776
5880  01ef 97            	ld	xl,a
5881  01f0 cd0000        	call	_LIS3DH_WriteReg
5883  01f3 4d            	tnz	a
5884  01f4 2605          	jrne	L7232
5885                     ; 1263       return MEMS_ERROR;
5887  01f6 5f            	clrw	x
5889  01f7 ac2b002b      	jpf	L622
5890  01fb               L7232:
5891                     ; 1266   return MEMS_SUCCESS;
5893  01fb ae0001        	ldw	x,#1
5895  01fe ac2b002b      	jpf	L622
5963                     ; 1277 status_t LIS3DH_SetTriggerInt(LIS3DH_TrigInt_t tr) {
5964                     .text:	section	.text,new
5965  0000               _LIS3DH_SetTriggerInt:
5967  0000 89            	pushw	x
5968  0001 88            	push	a
5969       00000001      OFST:	set	1
5972                     ; 1280   if( !LIS3DH_ReadReg(LIS3DH_FIFO_CTRL_REG, &value) )
5974  0002 96            	ldw	x,sp
5975  0003 1c0001        	addw	x,#OFST+0
5976  0006 89            	pushw	x
5977  0007 a62e          	ld	a,#46
5978  0009 cd0000        	call	_LIS3DH_ReadReg
5980  000c 85            	popw	x
5981  000d 4d            	tnz	a
5982  000e 2603          	jrne	L3732
5983                     ; 1281     return MEMS_ERROR;
5985  0010 5f            	clrw	x
5987  0011 201d          	jra	L232
5988  0013               L3732:
5989                     ; 1283   value &= 0xDF;
5991  0013 7b01          	ld	a,(OFST+0,sp)
5992  0015 a4df          	and	a,#223
5993  0017 6b01          	ld	(OFST+0,sp),a
5995                     ; 1284   value |= (tr<<LIS3DH_TR); 
5997  0019 7b03          	ld	a,(OFST+2,sp)
5998  001b 4e            	swap	a
5999  001c 48            	sll	a
6000  001d a4e0          	and	a,#224
6001  001f 1a01          	or	a,(OFST+0,sp)
6002  0021 6b01          	ld	(OFST+0,sp),a
6004                     ; 1286   if( !LIS3DH_WriteReg(LIS3DH_FIFO_CTRL_REG, value) )
6006  0023 7b01          	ld	a,(OFST+0,sp)
6007  0025 ae2e00        	ldw	x,#11776
6008  0028 97            	ld	xl,a
6009  0029 cd0000        	call	_LIS3DH_WriteReg
6011  002c 4d            	tnz	a
6012  002d 2604          	jrne	L5732
6013                     ; 1287     return MEMS_ERROR;
6015  002f 5f            	clrw	x
6017  0030               L232:
6019  0030 5b03          	addw	sp,#3
6020  0032 81            	ret
6021  0033               L5732:
6022                     ; 1289   return MEMS_SUCCESS;
6024  0033 ae0001        	ldw	x,#1
6026  0036 20f8          	jra	L232
6073                     ; 1300 status_t LIS3DH_SetWaterMark(u8_t wtm) {
6074                     .text:	section	.text,new
6075  0000               _LIS3DH_SetWaterMark:
6077  0000 88            	push	a
6078  0001 88            	push	a
6079       00000001      OFST:	set	1
6082                     ; 1303   if(wtm > 31)
6084  0002 a120          	cp	a,#32
6085  0004 2503          	jrult	L1242
6086                     ; 1304     return MEMS_ERROR;  
6088  0006 5f            	clrw	x
6090  0007 200f          	jra	L632
6091  0009               L1242:
6092                     ; 1306   if( !LIS3DH_ReadReg(LIS3DH_FIFO_CTRL_REG, &value) )
6094  0009 96            	ldw	x,sp
6095  000a 1c0001        	addw	x,#OFST+0
6096  000d 89            	pushw	x
6097  000e a62e          	ld	a,#46
6098  0010 cd0000        	call	_LIS3DH_ReadReg
6100  0013 85            	popw	x
6101  0014 4d            	tnz	a
6102  0015 2604          	jrne	L3242
6103                     ; 1307     return MEMS_ERROR;
6105  0017 5f            	clrw	x
6107  0018               L632:
6109  0018 5b02          	addw	sp,#2
6110  001a 81            	ret
6111  001b               L3242:
6112                     ; 1309   value &= 0xE0;
6114  001b 7b01          	ld	a,(OFST+0,sp)
6115  001d a4e0          	and	a,#224
6116  001f 6b01          	ld	(OFST+0,sp),a
6118                     ; 1310   value |= wtm; 
6120  0021 7b01          	ld	a,(OFST+0,sp)
6121  0023 1a02          	or	a,(OFST+1,sp)
6122  0025 6b01          	ld	(OFST+0,sp),a
6124                     ; 1312   if( !LIS3DH_WriteReg(LIS3DH_FIFO_CTRL_REG, value) )
6126  0027 7b01          	ld	a,(OFST+0,sp)
6127  0029 ae2e00        	ldw	x,#11776
6128  002c 97            	ld	xl,a
6129  002d cd0000        	call	_LIS3DH_WriteReg
6131  0030 4d            	tnz	a
6132  0031 2603          	jrne	L5242
6133                     ; 1313     return MEMS_ERROR;
6135  0033 5f            	clrw	x
6137  0034 20e2          	jra	L632
6138  0036               L5242:
6139                     ; 1315   return MEMS_SUCCESS;
6141  0036 ae0001        	ldw	x,#1
6143  0039 20dd          	jra	L632
6181                     ; 1326 status_t LIS3DH_GetStatusReg(u8_t* val) {
6182                     .text:	section	.text,new
6183  0000               _LIS3DH_GetStatusReg:
6187                     ; 1327   if( !LIS3DH_ReadReg(LIS3DH_STATUS_REG, val) )
6189  0000 89            	pushw	x
6190  0001 a627          	ld	a,#39
6191  0003 cd0000        	call	_LIS3DH_ReadReg
6193  0006 85            	popw	x
6194  0007 4d            	tnz	a
6195  0008 2602          	jrne	L5442
6196                     ; 1328     return MEMS_ERROR;
6198  000a 5f            	clrw	x
6201  000b 81            	ret
6202  000c               L5442:
6203                     ; 1330   return MEMS_SUCCESS;  
6205  000c ae0001        	ldw	x,#1
6208  000f 81            	ret
6264                     ; 1344 status_t LIS3DH_GetStatusBit(u8_t statusBIT, u8_t* val) {
6265                     .text:	section	.text,new
6266  0000               _LIS3DH_GetStatusBit:
6268  0000 88            	push	a
6269  0001 88            	push	a
6270       00000001      OFST:	set	1
6273                     ; 1347   if( !LIS3DH_ReadReg(LIS3DH_STATUS_REG, &value) )
6275  0002 96            	ldw	x,sp
6276  0003 1c0001        	addw	x,#OFST+0
6277  0006 89            	pushw	x
6278  0007 a627          	ld	a,#39
6279  0009 cd0000        	call	_LIS3DH_ReadReg
6281  000c 85            	popw	x
6282  000d 4d            	tnz	a
6283  000e 2603          	jrne	L5152
6284                     ; 1348     return MEMS_ERROR;
6286  0010 5f            	clrw	x
6288  0011 203e          	jra	L642
6289  0013               L5152:
6290                     ; 1350   switch (statusBIT){
6292  0013 7b02          	ld	a,(OFST+1,sp)
6294                     ; 1421       return MEMS_SUCCESS;
6295  0015 4a            	dec	a
6296  0016 2603          	jrne	L252
6297  0018 cc00f9        	jp	L5642
6298  001b               L252:
6299  001b 4a            	dec	a
6300  001c 2603          	jrne	L452
6301  001e cc00df        	jp	L3642
6302  0021               L452:
6303  0021 a002          	sub	a,#2
6304  0023 2603          	jrne	L652
6305  0025 cc00c4        	jp	L1642
6306  0028               L652:
6307  0028 a004          	sub	a,#4
6308  002a 2602          	jrne	L062
6309  002c 207c          	jp	L7542
6310  002e               L062:
6311  002e a008          	sub	a,#8
6312  0030 275e          	jreq	L5542
6313  0032 a010          	sub	a,#16
6314  0034 2740          	jreq	L3542
6315  0036 a020          	sub	a,#32
6316  0038 2722          	jreq	L1542
6317  003a a040          	sub	a,#64
6318  003c 2703          	jreq	L262
6319  003e cc0113        	jp	L1252
6320  0041               L262:
6321                     ; 1351   case LIS3DH_STATUS_REG_ZYXOR:     
6321                     ; 1352     if(value &= LIS3DH_STATUS_REG_ZYXOR){     
6323  0041 7b01          	ld	a,(OFST+0,sp)
6324  0043 a480          	and	a,#128
6325  0045 6b01          	ld	(OFST+0,sp),a
6327  0047 270b          	jreq	L3252
6328                     ; 1353       *val = MEMS_SET;
6330  0049 1e05          	ldw	x,(OFST+4,sp)
6331  004b a601          	ld	a,#1
6332  004d f7            	ld	(x),a
6333                     ; 1354       return MEMS_SUCCESS;
6335  004e ae0001        	ldw	x,#1
6337  0051               L642:
6339  0051 5b02          	addw	sp,#2
6340  0053 81            	ret
6341  0054               L3252:
6342                     ; 1357       *val = MEMS_RESET;
6344  0054 1e05          	ldw	x,(OFST+4,sp)
6345  0056 7f            	clr	(x)
6346                     ; 1358       return MEMS_SUCCESS;
6348  0057 ae0001        	ldw	x,#1
6350  005a 20f5          	jra	L642
6351  005c               L1542:
6352                     ; 1360   case LIS3DH_STATUS_REG_ZOR:       
6352                     ; 1361     if(value &= LIS3DH_STATUS_REG_ZOR){     
6354  005c 7b01          	ld	a,(OFST+0,sp)
6355  005e a440          	and	a,#64
6356  0060 6b01          	ld	(OFST+0,sp),a
6358  0062 270a          	jreq	L7252
6359                     ; 1362       *val = MEMS_SET;
6361  0064 1e05          	ldw	x,(OFST+4,sp)
6362  0066 a601          	ld	a,#1
6363  0068 f7            	ld	(x),a
6364                     ; 1363       return MEMS_SUCCESS;
6366  0069 ae0001        	ldw	x,#1
6368  006c 20e3          	jra	L642
6369  006e               L7252:
6370                     ; 1366       *val = MEMS_RESET;
6372  006e 1e05          	ldw	x,(OFST+4,sp)
6373  0070 7f            	clr	(x)
6374                     ; 1367       return MEMS_SUCCESS;
6376  0071 ae0001        	ldw	x,#1
6378  0074 20db          	jra	L642
6379  0076               L3542:
6380                     ; 1369   case LIS3DH_STATUS_REG_YOR:       
6380                     ; 1370     if(value &= LIS3DH_STATUS_REG_YOR){     
6382  0076 7b01          	ld	a,(OFST+0,sp)
6383  0078 a420          	and	a,#32
6384  007a 6b01          	ld	(OFST+0,sp),a
6386  007c 270a          	jreq	L3352
6387                     ; 1371       *val = MEMS_SET;
6389  007e 1e05          	ldw	x,(OFST+4,sp)
6390  0080 a601          	ld	a,#1
6391  0082 f7            	ld	(x),a
6392                     ; 1372       return MEMS_SUCCESS;
6394  0083 ae0001        	ldw	x,#1
6396  0086 20c9          	jra	L642
6397  0088               L3352:
6398                     ; 1375       *val = MEMS_RESET;
6400  0088 1e05          	ldw	x,(OFST+4,sp)
6401  008a 7f            	clr	(x)
6402                     ; 1376       return MEMS_SUCCESS;
6404  008b ae0001        	ldw	x,#1
6406  008e 20c1          	jra	L642
6407  0090               L5542:
6408                     ; 1378   case LIS3DH_STATUS_REG_XOR:       
6408                     ; 1379     if(value &= LIS3DH_STATUS_REG_XOR){     
6410  0090 7b01          	ld	a,(OFST+0,sp)
6411  0092 a410          	and	a,#16
6412  0094 6b01          	ld	(OFST+0,sp),a
6414  0096 270a          	jreq	L7352
6415                     ; 1380       *val = MEMS_SET;
6417  0098 1e05          	ldw	x,(OFST+4,sp)
6418  009a a601          	ld	a,#1
6419  009c f7            	ld	(x),a
6420                     ; 1381       return MEMS_SUCCESS;
6422  009d ae0001        	ldw	x,#1
6424  00a0 20af          	jra	L642
6425  00a2               L7352:
6426                     ; 1384       *val = MEMS_RESET;
6428  00a2 1e05          	ldw	x,(OFST+4,sp)
6429  00a4 7f            	clr	(x)
6430                     ; 1385       return MEMS_SUCCESS;
6432  00a5 ae0001        	ldw	x,#1
6434  00a8 20a7          	jra	L642
6435  00aa               L7542:
6436                     ; 1387   case LIS3DH_STATUS_REG_ZYXDA:     
6436                     ; 1388     if(value &= LIS3DH_STATUS_REG_ZYXDA){     
6438  00aa 7b01          	ld	a,(OFST+0,sp)
6439  00ac a408          	and	a,#8
6440  00ae 6b01          	ld	(OFST+0,sp),a
6442  00b0 270a          	jreq	L3452
6443                     ; 1389       *val = MEMS_SET;
6445  00b2 1e05          	ldw	x,(OFST+4,sp)
6446  00b4 a601          	ld	a,#1
6447  00b6 f7            	ld	(x),a
6448                     ; 1390       return MEMS_SUCCESS;
6450  00b7 ae0001        	ldw	x,#1
6452  00ba 2095          	jra	L642
6453  00bc               L3452:
6454                     ; 1393       *val = MEMS_RESET;
6456  00bc 1e05          	ldw	x,(OFST+4,sp)
6457  00be 7f            	clr	(x)
6458                     ; 1394       return MEMS_SUCCESS;
6460  00bf ae0001        	ldw	x,#1
6462  00c2 2010          	jra	L052
6463  00c4               L1642:
6464                     ; 1396   case LIS3DH_STATUS_REG_ZDA:       
6464                     ; 1397     if(value &= LIS3DH_STATUS_REG_ZDA){     
6466  00c4 7b01          	ld	a,(OFST+0,sp)
6467  00c6 a404          	and	a,#4
6468  00c8 6b01          	ld	(OFST+0,sp),a
6470  00ca 270b          	jreq	L7452
6471                     ; 1398       *val = MEMS_SET;
6473  00cc 1e05          	ldw	x,(OFST+4,sp)
6474  00ce a601          	ld	a,#1
6475  00d0 f7            	ld	(x),a
6476                     ; 1399       return MEMS_SUCCESS;
6478  00d1 ae0001        	ldw	x,#1
6480  00d4               L052:
6482  00d4 5b02          	addw	sp,#2
6483  00d6 81            	ret
6484  00d7               L7452:
6485                     ; 1402       *val = MEMS_RESET;
6487  00d7 1e05          	ldw	x,(OFST+4,sp)
6488  00d9 7f            	clr	(x)
6489                     ; 1403       return MEMS_SUCCESS;
6491  00da ae0001        	ldw	x,#1
6493  00dd 20f5          	jra	L052
6494  00df               L3642:
6495                     ; 1405   case LIS3DH_STATUS_REG_YDA:       
6495                     ; 1406     if(value &= LIS3DH_STATUS_REG_YDA){     
6497  00df 7b01          	ld	a,(OFST+0,sp)
6498  00e1 a402          	and	a,#2
6499  00e3 6b01          	ld	(OFST+0,sp),a
6501  00e5 270a          	jreq	L3552
6502                     ; 1407       *val = MEMS_SET;
6504  00e7 1e05          	ldw	x,(OFST+4,sp)
6505  00e9 a601          	ld	a,#1
6506  00eb f7            	ld	(x),a
6507                     ; 1408       return MEMS_SUCCESS;
6509  00ec ae0001        	ldw	x,#1
6511  00ef 20e3          	jra	L052
6512  00f1               L3552:
6513                     ; 1411       *val = MEMS_RESET;
6515  00f1 1e05          	ldw	x,(OFST+4,sp)
6516  00f3 7f            	clr	(x)
6517                     ; 1412       return MEMS_SUCCESS;
6519  00f4 ae0001        	ldw	x,#1
6521  00f7 20db          	jra	L052
6522  00f9               L5642:
6523                     ; 1414   case LIS3DH_STATUS_REG_XDA:       
6523                     ; 1415     if(value &= LIS3DH_STATUS_REG_XDA){     
6525  00f9 7b01          	ld	a,(OFST+0,sp)
6526  00fb a401          	and	a,#1
6527  00fd 6b01          	ld	(OFST+0,sp),a
6529  00ff 270a          	jreq	L7552
6530                     ; 1416       *val = MEMS_SET;
6532  0101 1e05          	ldw	x,(OFST+4,sp)
6533  0103 a601          	ld	a,#1
6534  0105 f7            	ld	(x),a
6535                     ; 1417       return MEMS_SUCCESS;
6537  0106 ae0001        	ldw	x,#1
6539  0109 20c9          	jra	L052
6540  010b               L7552:
6541                     ; 1420       *val = MEMS_RESET;
6543  010b 1e05          	ldw	x,(OFST+4,sp)
6544  010d 7f            	clr	(x)
6545                     ; 1421       return MEMS_SUCCESS;
6547  010e ae0001        	ldw	x,#1
6549  0111 20c1          	jra	L052
6550  0113               L1252:
6551                     ; 1425   return MEMS_ERROR;
6553  0113 5f            	clrw	x
6555  0114 20be          	jra	L052
6650                     ; 1436 status_t LIS3DH_GetAccAxesRaw(AxesRaw_t* buff) {
6651                     .text:	section	.text,new
6652  0000               _LIS3DH_GetAccAxesRaw:
6654  0000 89            	pushw	x
6655  0001 5204          	subw	sp,#4
6656       00000004      OFST:	set	4
6659                     ; 1439   u8_t valueL = 0;
6661  0003 0f03          	clr	(OFST-1,sp)
6663                     ; 1440   u8_t valueH = 0;
6665  0005 0f04          	clr	(OFST+0,sp)
6667                     ; 1442   if( !LIS3DH_ReadReg(LIS3DH_OUT_X_L, &valueL) )
6669  0007 96            	ldw	x,sp
6670  0008 1c0003        	addw	x,#OFST-1
6671  000b 89            	pushw	x
6672  000c a628          	ld	a,#40
6673  000e cd0000        	call	_LIS3DH_ReadReg
6675  0011 85            	popw	x
6676  0012 4d            	tnz	a
6677  0013 2603          	jrne	L1362
6678                     ; 1443     return MEMS_ERROR;
6680  0015 5f            	clrw	x
6682  0016 200f          	jra	L472
6683  0018               L1362:
6684                     ; 1445   if( !LIS3DH_ReadReg(LIS3DH_OUT_X_H, &valueH) )
6686  0018 96            	ldw	x,sp
6687  0019 1c0004        	addw	x,#OFST+0
6688  001c 89            	pushw	x
6689  001d a629          	ld	a,#41
6690  001f cd0000        	call	_LIS3DH_ReadReg
6692  0022 85            	popw	x
6693  0023 4d            	tnz	a
6694  0024 2604          	jrne	L3362
6695                     ; 1446     return MEMS_ERROR;
6697  0026 5f            	clrw	x
6699  0027               L472:
6701  0027 5b06          	addw	sp,#6
6702  0029 81            	ret
6703  002a               L3362:
6704                     ; 1447   value = (s16)(valueL + ( valueH << 8 ));
6706  002a 7b04          	ld	a,(OFST+0,sp)
6707  002c 5f            	clrw	x
6708  002d 97            	ld	xl,a
6709  002e 4f            	clr	a
6710  002f 02            	rlwa	x,a
6711  0030 01            	rrwa	x,a
6712  0031 1b03          	add	a,(OFST-1,sp)
6713  0033 2401          	jrnc	L662
6714  0035 5c            	incw	x
6715  0036               L662:
6716  0036 02            	rlwa	x,a
6717  0037 1f01          	ldw	(OFST-3,sp),x
6718  0039 01            	rrwa	x,a
6720                     ; 1448   buff->AXIS_X = value>>4;
6722  003a 1e01          	ldw	x,(OFST-3,sp)
6723  003c 57            	sraw	x
6724  003d 57            	sraw	x
6725  003e 57            	sraw	x
6726  003f 57            	sraw	x
6727  0040 1605          	ldw	y,(OFST+1,sp)
6728  0042 90ff          	ldw	(y),x
6729                     ; 1450   if( !LIS3DH_ReadReg(LIS3DH_OUT_Y_L, &valueL) )
6731  0044 96            	ldw	x,sp
6732  0045 1c0003        	addw	x,#OFST-1
6733  0048 89            	pushw	x
6734  0049 a62a          	ld	a,#42
6735  004b cd0000        	call	_LIS3DH_ReadReg
6737  004e 85            	popw	x
6738  004f 4d            	tnz	a
6739  0050 2603          	jrne	L5362
6740                     ; 1451     return MEMS_ERROR;
6742  0052 5f            	clrw	x
6744  0053 20d2          	jra	L472
6745  0055               L5362:
6746                     ; 1453   if( !LIS3DH_ReadReg(LIS3DH_OUT_Y_H, &valueH) )
6748  0055 96            	ldw	x,sp
6749  0056 1c0004        	addw	x,#OFST+0
6750  0059 89            	pushw	x
6751  005a a62b          	ld	a,#43
6752  005c cd0000        	call	_LIS3DH_ReadReg
6754  005f 85            	popw	x
6755  0060 4d            	tnz	a
6756  0061 2603          	jrne	L7362
6757                     ; 1454     return MEMS_ERROR;
6759  0063 5f            	clrw	x
6761  0064 20c1          	jra	L472
6762  0066               L7362:
6763                     ; 1455   value = (s16)(valueL + ( valueH << 8 ));
6765  0066 7b04          	ld	a,(OFST+0,sp)
6766  0068 5f            	clrw	x
6767  0069 97            	ld	xl,a
6768  006a 4f            	clr	a
6769  006b 02            	rlwa	x,a
6770  006c 01            	rrwa	x,a
6771  006d 1b03          	add	a,(OFST-1,sp)
6772  006f 2401          	jrnc	L072
6773  0071 5c            	incw	x
6774  0072               L072:
6775  0072 02            	rlwa	x,a
6776  0073 1f01          	ldw	(OFST-3,sp),x
6777  0075 01            	rrwa	x,a
6779                     ; 1456   buff->AXIS_Y = value>>4;
6781  0076 1e01          	ldw	x,(OFST-3,sp)
6782  0078 57            	sraw	x
6783  0079 57            	sraw	x
6784  007a 57            	sraw	x
6785  007b 57            	sraw	x
6786  007c 1605          	ldw	y,(OFST+1,sp)
6787  007e 90ef02        	ldw	(2,y),x
6788                     ; 1458   if( !LIS3DH_ReadReg(LIS3DH_OUT_Z_L, &valueL) )
6790  0081 96            	ldw	x,sp
6791  0082 1c0003        	addw	x,#OFST-1
6792  0085 89            	pushw	x
6793  0086 a62c          	ld	a,#44
6794  0088 cd0000        	call	_LIS3DH_ReadReg
6796  008b 85            	popw	x
6797  008c 4d            	tnz	a
6798  008d 2603          	jrne	L1462
6799                     ; 1459     return MEMS_ERROR;
6801  008f 5f            	clrw	x
6803  0090 2095          	jra	L472
6804  0092               L1462:
6805                     ; 1461   if( !LIS3DH_ReadReg(LIS3DH_OUT_Z_H, &valueH) )
6807  0092 96            	ldw	x,sp
6808  0093 1c0004        	addw	x,#OFST+0
6809  0096 89            	pushw	x
6810  0097 a62d          	ld	a,#45
6811  0099 cd0000        	call	_LIS3DH_ReadReg
6813  009c 85            	popw	x
6814  009d 4d            	tnz	a
6815  009e 2603          	jrne	L3462
6816                     ; 1462     return MEMS_ERROR;
6818  00a0 5f            	clrw	x
6820  00a1 2084          	jra	L472
6821  00a3               L3462:
6822                     ; 1463   value = (s16)(valueL + ( valueH << 8 ));
6824  00a3 7b04          	ld	a,(OFST+0,sp)
6825  00a5 5f            	clrw	x
6826  00a6 97            	ld	xl,a
6827  00a7 4f            	clr	a
6828  00a8 02            	rlwa	x,a
6829  00a9 01            	rrwa	x,a
6830  00aa 1b03          	add	a,(OFST-1,sp)
6831  00ac 2401          	jrnc	L272
6832  00ae 5c            	incw	x
6833  00af               L272:
6834  00af 02            	rlwa	x,a
6835  00b0 1f01          	ldw	(OFST-3,sp),x
6836  00b2 01            	rrwa	x,a
6838                     ; 1464   buff->AXIS_Z = value>>4;
6840  00b3 1e01          	ldw	x,(OFST-3,sp)
6841  00b5 57            	sraw	x
6842  00b6 57            	sraw	x
6843  00b7 57            	sraw	x
6844  00b8 57            	sraw	x
6845  00b9 1605          	ldw	y,(OFST+1,sp)
6846  00bb 90ef04        	ldw	(4,y),x
6847                     ; 1466   return MEMS_SUCCESS; 
6849  00be ae0001        	ldw	x,#1
6851  00c1 ac270027      	jpf	L472
6888                     ; 1477 status_t LIS3DH_GetInt1Src(u8_t* val) {
6889                     .text:	section	.text,new
6890  0000               _LIS3DH_GetInt1Src:
6894                     ; 1479   if( !LIS3DH_ReadReg(LIS3DH_INT1_SRC, val) )
6896  0000 89            	pushw	x
6897  0001 a631          	ld	a,#49
6898  0003 cd0000        	call	_LIS3DH_ReadReg
6900  0006 85            	popw	x
6901  0007 4d            	tnz	a
6902  0008 2602          	jrne	L3662
6903                     ; 1480     return MEMS_ERROR;
6905  000a 5f            	clrw	x
6908  000b 81            	ret
6909  000c               L3662:
6910                     ; 1482   return MEMS_SUCCESS;
6912  000c ae0001        	ldw	x,#1
6915  000f 81            	ret
6971                     ; 1494 status_t LIS3DH_GetInt1SrcBit(u8_t statusBIT, u8_t* val) {
6972                     .text:	section	.text,new
6973  0000               _LIS3DH_GetInt1SrcBit:
6975  0000 88            	push	a
6976  0001 88            	push	a
6977       00000001      OFST:	set	1
6980                     ; 1497   if( !LIS3DH_ReadReg(LIS3DH_INT1_SRC, &value) )
6982  0002 96            	ldw	x,sp
6983  0003 1c0001        	addw	x,#OFST+0
6984  0006 89            	pushw	x
6985  0007 a631          	ld	a,#49
6986  0009 cd0000        	call	_LIS3DH_ReadReg
6988  000c 85            	popw	x
6989  000d 4d            	tnz	a
6990  000e 2603          	jrne	L3172
6991                     ; 1498       return MEMS_ERROR;
6993  0010 5f            	clrw	x
6995  0011 2016          	jra	L203
6996  0013               L3172:
6997                     ; 1500   if(statusBIT == LIS3DH_INT1_SRC_IA){
6999  0013 7b02          	ld	a,(OFST+1,sp)
7000  0015 a140          	cp	a,#64
7001  0017 261b          	jrne	L5172
7002                     ; 1501     if(value &= LIS3DH_INT1_SRC_IA){     
7004  0019 7b01          	ld	a,(OFST+0,sp)
7005  001b a440          	and	a,#64
7006  001d 6b01          	ld	(OFST+0,sp),a
7008  001f 270b          	jreq	L7172
7009                     ; 1502       *val = MEMS_SET;
7011  0021 1e05          	ldw	x,(OFST+4,sp)
7012  0023 a601          	ld	a,#1
7013  0025 f7            	ld	(x),a
7014                     ; 1503       return MEMS_SUCCESS;
7016  0026 ae0001        	ldw	x,#1
7018  0029               L203:
7020  0029 5b02          	addw	sp,#2
7021  002b 81            	ret
7022  002c               L7172:
7023                     ; 1506       *val = MEMS_RESET;
7025  002c 1e05          	ldw	x,(OFST+4,sp)
7026  002e 7f            	clr	(x)
7027                     ; 1507       return MEMS_SUCCESS;
7029  002f ae0001        	ldw	x,#1
7031  0032 20f5          	jra	L203
7032  0034               L5172:
7033                     ; 1511   if(statusBIT == LIS3DH_INT1_SRC_ZH){
7035  0034 7b02          	ld	a,(OFST+1,sp)
7036  0036 a120          	cp	a,#32
7037  0038 261a          	jrne	L3272
7038                     ; 1512     if(value &= LIS3DH_INT1_SRC_ZH){     
7040  003a 7b01          	ld	a,(OFST+0,sp)
7041  003c a420          	and	a,#32
7042  003e 6b01          	ld	(OFST+0,sp),a
7044  0040 270a          	jreq	L5272
7045                     ; 1513       *val = MEMS_SET;
7047  0042 1e05          	ldw	x,(OFST+4,sp)
7048  0044 a601          	ld	a,#1
7049  0046 f7            	ld	(x),a
7050                     ; 1514       return MEMS_SUCCESS;
7052  0047 ae0001        	ldw	x,#1
7054  004a 20dd          	jra	L203
7055  004c               L5272:
7056                     ; 1517       *val = MEMS_RESET;
7058  004c 1e05          	ldw	x,(OFST+4,sp)
7059  004e 7f            	clr	(x)
7060                     ; 1518       return MEMS_SUCCESS;
7062  004f ae0001        	ldw	x,#1
7064  0052 20d5          	jra	L203
7065  0054               L3272:
7066                     ; 1522   if(statusBIT == LIS3DH_INT1_SRC_ZL){
7068  0054 7b02          	ld	a,(OFST+1,sp)
7069  0056 a110          	cp	a,#16
7070  0058 261a          	jrne	L1372
7071                     ; 1523     if(value &= LIS3DH_INT1_SRC_ZL){     
7073  005a 7b01          	ld	a,(OFST+0,sp)
7074  005c a410          	and	a,#16
7075  005e 6b01          	ld	(OFST+0,sp),a
7077  0060 270a          	jreq	L3372
7078                     ; 1524       *val = MEMS_SET;
7080  0062 1e05          	ldw	x,(OFST+4,sp)
7081  0064 a601          	ld	a,#1
7082  0066 f7            	ld	(x),a
7083                     ; 1525       return MEMS_SUCCESS;
7085  0067 ae0001        	ldw	x,#1
7087  006a 20bd          	jra	L203
7088  006c               L3372:
7089                     ; 1528       *val = MEMS_RESET;
7091  006c 1e05          	ldw	x,(OFST+4,sp)
7092  006e 7f            	clr	(x)
7093                     ; 1529       return MEMS_SUCCESS;
7095  006f ae0001        	ldw	x,#1
7097  0072 20b5          	jra	L203
7098  0074               L1372:
7099                     ; 1533   if(statusBIT == LIS3DH_INT1_SRC_YH){
7101  0074 7b02          	ld	a,(OFST+1,sp)
7102  0076 a108          	cp	a,#8
7103  0078 261a          	jrne	L7372
7104                     ; 1534     if(value &= LIS3DH_INT1_SRC_YH){     
7106  007a 7b01          	ld	a,(OFST+0,sp)
7107  007c a408          	and	a,#8
7108  007e 6b01          	ld	(OFST+0,sp),a
7110  0080 270a          	jreq	L1472
7111                     ; 1535       *val = MEMS_SET;
7113  0082 1e05          	ldw	x,(OFST+4,sp)
7114  0084 a601          	ld	a,#1
7115  0086 f7            	ld	(x),a
7116                     ; 1536       return MEMS_SUCCESS;
7118  0087 ae0001        	ldw	x,#1
7120  008a 209d          	jra	L203
7121  008c               L1472:
7122                     ; 1539       *val = MEMS_RESET;
7124  008c 1e05          	ldw	x,(OFST+4,sp)
7125  008e 7f            	clr	(x)
7126                     ; 1540       return MEMS_SUCCESS;
7128  008f ae0001        	ldw	x,#1
7130  0092 2016          	jra	L403
7131  0094               L7372:
7132                     ; 1544   if(statusBIT == LIS3DH_INT1_SRC_YL){
7134  0094 7b02          	ld	a,(OFST+1,sp)
7135  0096 a104          	cp	a,#4
7136  0098 261b          	jrne	L5472
7137                     ; 1545     if(value &= LIS3DH_INT1_SRC_YL){     
7139  009a 7b01          	ld	a,(OFST+0,sp)
7140  009c a404          	and	a,#4
7141  009e 6b01          	ld	(OFST+0,sp),a
7143  00a0 270b          	jreq	L7472
7144                     ; 1546       *val = MEMS_SET;
7146  00a2 1e05          	ldw	x,(OFST+4,sp)
7147  00a4 a601          	ld	a,#1
7148  00a6 f7            	ld	(x),a
7149                     ; 1547       return MEMS_SUCCESS;
7151  00a7 ae0001        	ldw	x,#1
7153  00aa               L403:
7155  00aa 5b02          	addw	sp,#2
7156  00ac 81            	ret
7157  00ad               L7472:
7158                     ; 1550       *val = MEMS_RESET;
7160  00ad 1e05          	ldw	x,(OFST+4,sp)
7161  00af 7f            	clr	(x)
7162                     ; 1551       return MEMS_SUCCESS;
7164  00b0 ae0001        	ldw	x,#1
7166  00b3 20f5          	jra	L403
7167  00b5               L5472:
7168                     ; 1554   if(statusBIT == LIS3DH_INT1_SRC_XH){
7170  00b5 7b02          	ld	a,(OFST+1,sp)
7171  00b7 a102          	cp	a,#2
7172  00b9 261a          	jrne	L3572
7173                     ; 1555     if(value &= LIS3DH_INT1_SRC_XH){     
7175  00bb 7b01          	ld	a,(OFST+0,sp)
7176  00bd a402          	and	a,#2
7177  00bf 6b01          	ld	(OFST+0,sp),a
7179  00c1 270a          	jreq	L5572
7180                     ; 1556       *val = MEMS_SET;
7182  00c3 1e05          	ldw	x,(OFST+4,sp)
7183  00c5 a601          	ld	a,#1
7184  00c7 f7            	ld	(x),a
7185                     ; 1557       return MEMS_SUCCESS;
7187  00c8 ae0001        	ldw	x,#1
7189  00cb 20dd          	jra	L403
7190  00cd               L5572:
7191                     ; 1560       *val = MEMS_RESET;
7193  00cd 1e05          	ldw	x,(OFST+4,sp)
7194  00cf 7f            	clr	(x)
7195                     ; 1561       return MEMS_SUCCESS;
7197  00d0 ae0001        	ldw	x,#1
7199  00d3 20d5          	jra	L403
7200  00d5               L3572:
7201                     ; 1565   if(statusBIT == LIS3DH_INT1_SRC_XL){
7203  00d5 7b02          	ld	a,(OFST+1,sp)
7204  00d7 a101          	cp	a,#1
7205  00d9 261a          	jrne	L1672
7206                     ; 1566     if(value &= LIS3DH_INT1_SRC_XL){     
7208  00db 7b01          	ld	a,(OFST+0,sp)
7209  00dd a401          	and	a,#1
7210  00df 6b01          	ld	(OFST+0,sp),a
7212  00e1 270a          	jreq	L3672
7213                     ; 1567       *val = MEMS_SET;
7215  00e3 1e05          	ldw	x,(OFST+4,sp)
7216  00e5 a601          	ld	a,#1
7217  00e7 f7            	ld	(x),a
7218                     ; 1568       return MEMS_SUCCESS;
7220  00e8 ae0001        	ldw	x,#1
7222  00eb 20bd          	jra	L403
7223  00ed               L3672:
7224                     ; 1571       *val = MEMS_RESET;
7226  00ed 1e05          	ldw	x,(OFST+4,sp)
7227  00ef 7f            	clr	(x)
7228                     ; 1572       return MEMS_SUCCESS;
7230  00f0 ae0001        	ldw	x,#1
7232  00f3 20b5          	jra	L403
7233  00f5               L1672:
7234                     ; 1575   return MEMS_ERROR;
7236  00f5 5f            	clrw	x
7238  00f6 20b2          	jra	L403
7276                     ; 1586 status_t LIS3DH_GetFifoSourceReg(u8_t* val) {
7277                     .text:	section	.text,new
7278  0000               _LIS3DH_GetFifoSourceReg:
7282                     ; 1588   if( !LIS3DH_ReadReg(LIS3DH_FIFO_SRC_REG, val) )
7284  0000 89            	pushw	x
7285  0001 a62f          	ld	a,#47
7286  0003 cd0000        	call	_LIS3DH_ReadReg
7288  0006 85            	popw	x
7289  0007 4d            	tnz	a
7290  0008 2602          	jrne	L5003
7291                     ; 1589     return MEMS_ERROR;
7293  000a 5f            	clrw	x
7296  000b 81            	ret
7297  000c               L5003:
7298                     ; 1591   return MEMS_SUCCESS;
7300  000c ae0001        	ldw	x,#1
7303  000f 81            	ret
7359                     ; 1603 status_t LIS3DH_GetFifoSourceBit(u8_t statusBIT,  u8_t* val){
7360                     .text:	section	.text,new
7361  0000               _LIS3DH_GetFifoSourceBit:
7363  0000 88            	push	a
7364  0001 88            	push	a
7365       00000001      OFST:	set	1
7368                     ; 1606   if( !LIS3DH_ReadReg(LIS3DH_FIFO_SRC_REG, &value) )
7370  0002 96            	ldw	x,sp
7371  0003 1c0001        	addw	x,#OFST+0
7372  0006 89            	pushw	x
7373  0007 a62f          	ld	a,#47
7374  0009 cd0000        	call	_LIS3DH_ReadReg
7376  000c 85            	popw	x
7377  000d 4d            	tnz	a
7378  000e 2603          	jrne	L5303
7379                     ; 1607     return MEMS_ERROR;
7381  0010 5f            	clrw	x
7383  0011 2016          	jra	L613
7384  0013               L5303:
7385                     ; 1610   if(statusBIT == LIS3DH_FIFO_SRC_WTM){
7387  0013 7b02          	ld	a,(OFST+1,sp)
7388  0015 a180          	cp	a,#128
7389  0017 261b          	jrne	L7303
7390                     ; 1611     if(value &= LIS3DH_FIFO_SRC_WTM){     
7392  0019 7b01          	ld	a,(OFST+0,sp)
7393  001b a480          	and	a,#128
7394  001d 6b01          	ld	(OFST+0,sp),a
7396  001f 270b          	jreq	L1403
7397                     ; 1612       *val = MEMS_SET;
7399  0021 1e05          	ldw	x,(OFST+4,sp)
7400  0023 a601          	ld	a,#1
7401  0025 f7            	ld	(x),a
7402                     ; 1613       return MEMS_SUCCESS;
7404  0026 ae0001        	ldw	x,#1
7406  0029               L613:
7408  0029 5b02          	addw	sp,#2
7409  002b 81            	ret
7410  002c               L1403:
7411                     ; 1616       *val = MEMS_RESET;
7413  002c 1e05          	ldw	x,(OFST+4,sp)
7414  002e 7f            	clr	(x)
7415                     ; 1617       return MEMS_SUCCESS;
7417  002f ae0001        	ldw	x,#1
7419  0032 20f5          	jra	L613
7420  0034               L7303:
7421                     ; 1621   if(statusBIT == LIS3DH_FIFO_SRC_OVRUN){
7423  0034 7b02          	ld	a,(OFST+1,sp)
7424  0036 a140          	cp	a,#64
7425  0038 261a          	jrne	L5403
7426                     ; 1622     if(value &= LIS3DH_FIFO_SRC_OVRUN){     
7428  003a 7b01          	ld	a,(OFST+0,sp)
7429  003c a440          	and	a,#64
7430  003e 6b01          	ld	(OFST+0,sp),a
7432  0040 270a          	jreq	L7403
7433                     ; 1623       *val = MEMS_SET;
7435  0042 1e05          	ldw	x,(OFST+4,sp)
7436  0044 a601          	ld	a,#1
7437  0046 f7            	ld	(x),a
7438                     ; 1624       return MEMS_SUCCESS;
7440  0047 ae0001        	ldw	x,#1
7442  004a 20dd          	jra	L613
7443  004c               L7403:
7444                     ; 1627       *val = MEMS_RESET;
7446  004c 1e05          	ldw	x,(OFST+4,sp)
7447  004e 7f            	clr	(x)
7448                     ; 1628       return MEMS_SUCCESS;
7450  004f ae0001        	ldw	x,#1
7452  0052 20d5          	jra	L613
7453  0054               L5403:
7454                     ; 1631   if(statusBIT == LIS3DH_FIFO_SRC_EMPTY){
7456  0054 7b02          	ld	a,(OFST+1,sp)
7457  0056 a120          	cp	a,#32
7458  0058 2623          	jrne	L3503
7459                     ; 1632     if(value &= statusBIT == LIS3DH_FIFO_SRC_EMPTY){     
7461  005a 7b02          	ld	a,(OFST+1,sp)
7462  005c a120          	cp	a,#32
7463  005e 2604          	jrne	L213
7464  0060 a601          	ld	a,#1
7465  0062 2001          	jra	L413
7466  0064               L213:
7467  0064 4f            	clr	a
7468  0065               L413:
7469  0065 1401          	and	a,(OFST+0,sp)
7470  0067 6b01          	ld	(OFST+0,sp),a
7472  0069 270a          	jreq	L5503
7473                     ; 1633       *val = MEMS_SET;
7475  006b 1e05          	ldw	x,(OFST+4,sp)
7476  006d a601          	ld	a,#1
7477  006f f7            	ld	(x),a
7478                     ; 1634       return MEMS_SUCCESS;
7480  0070 ae0001        	ldw	x,#1
7482  0073 20b4          	jra	L613
7483  0075               L5503:
7484                     ; 1637       *val = MEMS_RESET;
7486  0075 1e05          	ldw	x,(OFST+4,sp)
7487  0077 7f            	clr	(x)
7488                     ; 1638       return MEMS_SUCCESS;
7490  0078 ae0001        	ldw	x,#1
7492  007b 20ac          	jra	L613
7493  007d               L3503:
7494                     ; 1641   return MEMS_ERROR;
7496  007d 5f            	clrw	x
7498  007e 20a9          	jra	L613
7545                     ; 1652 status_t LIS3DH_GetFifoSourceFSS(u8_t* val){
7546                     .text:	section	.text,new
7547  0000               _LIS3DH_GetFifoSourceFSS:
7549  0000 89            	pushw	x
7550  0001 88            	push	a
7551       00000001      OFST:	set	1
7554                     ; 1655   if( !LIS3DH_ReadReg(LIS3DH_FIFO_SRC_REG, &value) )
7556  0002 96            	ldw	x,sp
7557  0003 1c0001        	addw	x,#OFST+0
7558  0006 89            	pushw	x
7559  0007 a62f          	ld	a,#47
7560  0009 cd0000        	call	_LIS3DH_ReadReg
7562  000c 85            	popw	x
7563  000d 4d            	tnz	a
7564  000e 2603          	jrne	L3013
7565                     ; 1656     return MEMS_ERROR;
7567  0010 5f            	clrw	x
7569  0011 200e          	jra	L223
7570  0013               L3013:
7571                     ; 1658   value &= 0x1F;
7573  0013 7b01          	ld	a,(OFST+0,sp)
7574  0015 a41f          	and	a,#31
7575  0017 6b01          	ld	(OFST+0,sp),a
7577                     ; 1660   *val = value;
7579  0019 7b01          	ld	a,(OFST+0,sp)
7580  001b 1e02          	ldw	x,(OFST+1,sp)
7581  001d f7            	ld	(x),a
7582                     ; 1662   return MEMS_SUCCESS;
7584  001e ae0001        	ldw	x,#1
7586  0021               L223:
7588  0021 5b03          	addw	sp,#3
7589  0023 81            	ret
7657                     ; 1673 status_t LIS3DH_SetSPIInterface(LIS3DH_SPIMode_t spi) {
7658                     .text:	section	.text,new
7659  0000               _LIS3DH_SetSPIInterface:
7661  0000 89            	pushw	x
7662  0001 88            	push	a
7663       00000001      OFST:	set	1
7666                     ; 1676   if( !LIS3DH_ReadReg(LIS3DH_CTRL_REG4, &value) )
7668  0002 96            	ldw	x,sp
7669  0003 1c0001        	addw	x,#OFST+0
7670  0006 89            	pushw	x
7671  0007 a623          	ld	a,#35
7672  0009 cd0000        	call	_LIS3DH_ReadReg
7674  000c 85            	popw	x
7675  000d 4d            	tnz	a
7676  000e 2603          	jrne	L7313
7677                     ; 1677     return MEMS_ERROR;
7679  0010 5f            	clrw	x
7681  0011 2019          	jra	L623
7682  0013               L7313:
7683                     ; 1679   value &= 0xFE;
7685  0013 7b01          	ld	a,(OFST+0,sp)
7686  0015 a4fe          	and	a,#254
7687  0017 6b01          	ld	(OFST+0,sp),a
7689                     ; 1680   value |= spi<<LIS3DH_SIM;
7691  0019 7b01          	ld	a,(OFST+0,sp)
7692  001b 1a03          	or	a,(OFST+2,sp)
7693  001d 6b01          	ld	(OFST+0,sp),a
7695                     ; 1682   if( !LIS3DH_WriteReg(LIS3DH_CTRL_REG4, value) )
7697  001f 7b01          	ld	a,(OFST+0,sp)
7698  0021 ae2300        	ldw	x,#8960
7699  0024 97            	ld	xl,a
7700  0025 cd0000        	call	_LIS3DH_WriteReg
7702  0028 4d            	tnz	a
7703  0029 2604          	jrne	L1413
7704                     ; 1683     return MEMS_ERROR;
7706  002b 5f            	clrw	x
7708  002c               L623:
7710  002c 5b03          	addw	sp,#3
7711  002e 81            	ret
7712  002f               L1413:
7713                     ; 1685   return MEMS_SUCCESS;
7715  002f ae0001        	ldw	x,#1
7717  0032 20f8          	jra	L623
7730                     	xdef	_LIS3DH_SetSPIInterface
7731                     	xdef	_LIS3DH_SetClickWINDOW
7732                     	xdef	_LIS3DH_SetClickLATENCY
7733                     	xdef	_LIS3DH_SetClickLIMIT
7734                     	xdef	_LIS3DH_SetClickTHS
7735                     	xdef	_MEMS_SendByte
7736                     	xref	_SPI_GetFlagStatus
7737                     	xref	_SPI_ReceiveData
7738                     	xref	_SPI_SendData
7739                     	xref	_GPIO_WriteLow
7740                     	xref	_GPIO_WriteHigh
7741                     	xdef	_LIS3DH_WriteReg
7742                     	xdef	_LIS3DH_ReadReg
7743                     	xdef	_LIS3DH_Get6DPosition
7744                     	xdef	_LIS3DH_GetWHO_AM_I
7745                     	xdef	_LIS3DH_GetTempRaw
7746                     	xdef	_LIS3DH_GetClickResponse
7747                     	xdef	_LIS3DH_GetAuxRaw
7748                     	xdef	_LIS3DH_GetAccAxesRaw
7749                     	xdef	_LIS3DH_GetStatusAUX
7750                     	xdef	_LIS3DH_GetStatusAUXBit
7751                     	xdef	_LIS3DH_GetStatusBit
7752                     	xdef	_LIS3DH_GetStatusReg
7753                     	xdef	_LIS3DH_GetFifoSourceFSS
7754                     	xdef	_LIS3DH_GetFifoSourceBit
7755                     	xdef	_LIS3DH_GetFifoSourceReg
7756                     	xdef	_LIS3DH_SetTriggerInt
7757                     	xdef	_LIS3DH_SetWaterMark
7758                     	xdef	_LIS3DH_FIFOModeEnable
7759                     	xdef	_LIS3DH_GetInt1SrcBit
7760                     	xdef	_LIS3DH_GetInt1Src
7761                     	xdef	_LIS3DH_SetInt6D4DConfiguration
7762                     	xdef	_LIS3DH_SetClickCFG
7763                     	xdef	_LIS3DH_SetIntMode
7764                     	xdef	_LIS3DH_SetInt1Duration
7765                     	xdef	_LIS3DH_SetInt1Threshold
7766                     	xdef	_LIS3DH_SetIntConfiguration
7767                     	xdef	_LIS3DH_ResetInt2Latch
7768                     	xdef	_LIS3DH_ResetInt1Latch
7769                     	xdef	_LIS3DH_Int1LatchEnable
7770                     	xdef	_LIS3DH_SetInt2Pin
7771                     	xdef	_LIS3DH_SetInt1Pin
7772                     	xdef	_LIS3DH_SetFilterDataSel
7773                     	xdef	_LIS3DH_SetHPFCutOFF
7774                     	xdef	_LIS3DH_SetHPFMode
7775                     	xdef	_LIS3DH_HPFAOI2Enable
7776                     	xdef	_LIS3DH_HPFAOI1Enable
7777                     	xdef	_LIS3DH_HPFClickEnable
7778                     	xdef	_LIS3DH_SetADCAux
7779                     	xdef	_LIS3DH_SetTemperature
7780                     	xdef	_LIS3DH_SetSelfTest
7781                     	xdef	_LIS3DH_SetBLE
7782                     	xdef	_LIS3DH_SetBDU
7783                     	xdef	_LIS3DH_SetFullScale
7784                     	xdef	_LIS3DH_SetAxis
7785                     	xdef	_LIS3DH_SetMode
7786                     	xdef	_LIS3DH_SetODR
7787                     	xdef	_SPI_Mems_Read_Reg
7788                     	xdef	_SPI_Mems_Write_Reg
7807                     	end
