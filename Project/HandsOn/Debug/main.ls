   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  57                     ; 19 void Delay_ms (u16 tempo)
  57                     ; 20 {
  59                     .text:	section	.text,new
  60  0000               _Delay_ms:
  64                     ; 21 	Count_ms = tempo;
  66  0000 bf00          	ldw	_Count_ms,x
  68  0002               L33:
  69                     ; 22 	while(Count_ms);
  71  0002 be00          	ldw	x,_Count_ms
  72  0004 26fc          	jrne	L33
  73                     ; 23 }
  76  0006 81            	ret
 110                     ; 27 main()
 110                     ; 28 {
 111                     .text:	section	.text,new
 112  0000               _main:
 116                     ; 30 	CLK->CKDIVR = 0x00; // Master clock at 16MHz
 118  0000 725f50c6      	clr	20678
 119                     ; 32 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
 121  0004 ae0001        	ldw	x,#1
 122  0007 89            	pushw	x
 123  0008 ae0004        	ldw	x,#4
 124  000b cd0000        	call	_CLK_PeripheralClockConfig
 126  000e 85            	popw	x
 127                     ; 35 	TIM4_TimeBaseInit(TIM4_PRESCALER_128, 124);
 129  000f 4b7c          	push	#124
 130  0011 ae0007        	ldw	x,#7
 131  0014 cd0000        	call	_TIM4_TimeBaseInit
 133  0017 84            	pop	a
 134                     ; 36 	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
 136  0018 ae0001        	ldw	x,#1
 137  001b 89            	pushw	x
 138  001c ae0001        	ldw	x,#1
 139  001f cd0000        	call	_TIM4_ITConfig
 141  0022 85            	popw	x
 142                     ; 37   TIM4_Cmd(ENABLE);
 144  0023 ae0001        	ldw	x,#1
 145  0026 cd0000        	call	_TIM4_Cmd
 147                     ; 38 	Buttons_Init();
 149  0029 cd0000        	call	_Buttons_Init
 151                     ; 39 	LIS3DH_Init();
 153  002c cd0000        	call	_LIS3DH_Init
 155                     ; 40 	enableInterrupts();
 158  002f 9a            rim
 160  0030               L74:
 161                     ; 44 		if(DataReady)
 163  0030 be00          	ldw	x,_DataReady
 164  0032 27fc          	jreq	L74
 165                     ; 46 			DataReady = 0;
 167  0034 5f            	clrw	x
 168  0035 bf00          	ldw	_DataReady,x
 169                     ; 47 			Angulo = GetAngle(leitura.AXIS_X,leitura.AXIS_Y,leitura.AXIS_Z,0,0,GRAVIDADE);
 171  0037 ae0fff        	ldw	x,#4095
 172  003a 89            	pushw	x
 173  003b 5f            	clrw	x
 174  003c 89            	pushw	x
 175  003d 5f            	clrw	x
 176  003e 89            	pushw	x
 177  003f be04          	ldw	x,_leitura+4
 178  0041 89            	pushw	x
 179  0042 be02          	ldw	x,_leitura+2
 180  0044 89            	pushw	x
 181  0045 be00          	ldw	x,_leitura
 182  0047 cd0000        	call	_GetAngle
 184  004a 5b0a          	addw	sp,#10
 185  004c ae0000        	ldw	x,#_Angulo
 186  004f cd0000        	call	c_rtol
 188  0052 20dc          	jra	L74
 201                     	xdef	_main
 202                     	xref.b	_Angulo
 203                     	xref.b	_leitura
 204                     	xref	_GetAngle
 205                     	xref	_Buttons_Init
 206                     	xdef	_Delay_ms
 207                     	xref	_LIS3DH_Init
 208                     	xref.b	_DataReady
 209                     	xref.b	_Count_ms
 210                     	xref	_TIM4_ITConfig
 211                     	xref	_TIM4_Cmd
 212                     	xref	_TIM4_TimeBaseInit
 213                     	xref	_CLK_PeripheralClockConfig
 232                     	xref	c_rtol
 233                     	end
