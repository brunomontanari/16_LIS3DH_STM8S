   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  45                     ; 49 void TIM4_DeInit(void)
  45                     ; 50 {
  47                     .text:	section	.text,new
  48  0000               _TIM4_DeInit:
  52                     ; 51   TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  54  0000 725f5340      	clr	21312
  55                     ; 52   TIM4->IER = TIM4_IER_RESET_VALUE;
  57  0004 725f5343      	clr	21315
  58                     ; 53   TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  60  0008 725f5346      	clr	21318
  61                     ; 54   TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  63  000c 725f5347      	clr	21319
  64                     ; 55   TIM4->ARR = TIM4_ARR_RESET_VALUE;
  66  0010 35ff5348      	mov	21320,#255
  67                     ; 56   TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  69  0014 725f5344      	clr	21316
  70                     ; 57 }
  73  0018 81            	ret
 179                     ; 65 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
 179                     ; 66 {
 180                     .text:	section	.text,new
 181  0000               _TIM4_TimeBaseInit:
 183  0000 89            	pushw	x
 184       00000000      OFST:	set	0
 187                     ; 68   assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 189                     ; 70   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 191  0001 9f            	ld	a,xl
 192  0002 c75347        	ld	21319,a
 193                     ; 72   TIM4->ARR = (uint8_t)(TIM4_Period);
 195  0005 7b05          	ld	a,(OFST+5,sp)
 196  0007 c75348        	ld	21320,a
 197                     ; 73 }
 200  000a 85            	popw	x
 201  000b 81            	ret
 256                     ; 81 void TIM4_Cmd(FunctionalState NewState)
 256                     ; 82 {
 257                     .text:	section	.text,new
 258  0000               _TIM4_Cmd:
 262                     ; 84   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 264                     ; 87   if (NewState != DISABLE)
 266  0000 a30000        	cpw	x,#0
 267  0003 2706          	jreq	L511
 268                     ; 89     TIM4->CR1 |= TIM4_CR1_CEN;
 270  0005 72105340      	bset	21312,#0
 272  0009 2004          	jra	L711
 273  000b               L511:
 274                     ; 93     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 276  000b 72115340      	bres	21312,#0
 277  000f               L711:
 278                     ; 95 }
 281  000f 81            	ret
 339                     ; 107 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 339                     ; 108 {
 340                     .text:	section	.text,new
 341  0000               _TIM4_ITConfig:
 343  0000 89            	pushw	x
 344       00000000      OFST:	set	0
 347                     ; 110   assert_param(IS_TIM4_IT_OK(TIM4_IT));
 349                     ; 111   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 351                     ; 113   if (NewState != DISABLE)
 353  0001 1e05          	ldw	x,(OFST+5,sp)
 354  0003 270a          	jreq	L151
 355                     ; 116     TIM4->IER |= (uint8_t)TIM4_IT;
 357  0005 c65343        	ld	a,21315
 358  0008 1a02          	or	a,(OFST+2,sp)
 359  000a c75343        	ld	21315,a
 361  000d 2009          	jra	L351
 362  000f               L151:
 363                     ; 121     TIM4->IER &= (uint8_t)(~TIM4_IT);
 365  000f 7b02          	ld	a,(OFST+2,sp)
 366  0011 43            	cpl	a
 367  0012 c45343        	and	a,21315
 368  0015 c75343        	ld	21315,a
 369  0018               L351:
 370                     ; 123 }
 373  0018 85            	popw	x
 374  0019 81            	ret
 410                     ; 131 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 410                     ; 132 {
 411                     .text:	section	.text,new
 412  0000               _TIM4_UpdateDisableConfig:
 416                     ; 134   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 418                     ; 137   if (NewState != DISABLE)
 420  0000 a30000        	cpw	x,#0
 421  0003 2706          	jreq	L371
 422                     ; 139     TIM4->CR1 |= TIM4_CR1_UDIS;
 424  0005 72125340      	bset	21312,#1
 426  0009 2004          	jra	L571
 427  000b               L371:
 428                     ; 143     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 430  000b 72135340      	bres	21312,#1
 431  000f               L571:
 432                     ; 145 }
 435  000f 81            	ret
 493                     ; 155 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 493                     ; 156 {
 494                     .text:	section	.text,new
 495  0000               _TIM4_UpdateRequestConfig:
 499                     ; 158   assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 501                     ; 161   if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 503  0000 a30000        	cpw	x,#0
 504  0003 2706          	jreq	L522
 505                     ; 163     TIM4->CR1 |= TIM4_CR1_URS;
 507  0005 72145340      	bset	21312,#2
 509  0009 2004          	jra	L722
 510  000b               L522:
 511                     ; 167     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 513  000b 72155340      	bres	21312,#2
 514  000f               L722:
 515                     ; 169 }
 518  000f 81            	ret
 575                     ; 179 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 575                     ; 180 {
 576                     .text:	section	.text,new
 577  0000               _TIM4_SelectOnePulseMode:
 581                     ; 182   assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 583                     ; 185   if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 585  0000 a30000        	cpw	x,#0
 586  0003 2706          	jreq	L752
 587                     ; 187     TIM4->CR1 |= TIM4_CR1_OPM;
 589  0005 72165340      	bset	21312,#3
 591  0009 2004          	jra	L162
 592  000b               L752:
 593                     ; 191     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 595  000b 72175340      	bres	21312,#3
 596  000f               L162:
 597                     ; 193 }
 600  000f 81            	ret
 668                     ; 215 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 668                     ; 216 {
 669                     .text:	section	.text,new
 670  0000               _TIM4_PrescalerConfig:
 672  0000 89            	pushw	x
 673       00000000      OFST:	set	0
 676                     ; 218   assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 678                     ; 219   assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 680                     ; 222   TIM4->PSCR = (uint8_t)Prescaler;
 682  0001 9f            	ld	a,xl
 683  0002 c75347        	ld	21319,a
 684                     ; 225   TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 686  0005 7b06          	ld	a,(OFST+6,sp)
 687  0007 c75345        	ld	21317,a
 688                     ; 226 }
 691  000a 85            	popw	x
 692  000b 81            	ret
 728                     ; 234 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 728                     ; 235 {
 729                     .text:	section	.text,new
 730  0000               _TIM4_ARRPreloadConfig:
 734                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 736                     ; 240   if (NewState != DISABLE)
 738  0000 a30000        	cpw	x,#0
 739  0003 2706          	jreq	L333
 740                     ; 242     TIM4->CR1 |= TIM4_CR1_ARPE;
 742  0005 721e5340      	bset	21312,#7
 744  0009 2004          	jra	L533
 745  000b               L333:
 746                     ; 246     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 748  000b 721f5340      	bres	21312,#7
 749  000f               L533:
 750                     ; 248 }
 753  000f 81            	ret
 802                     ; 257 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
 802                     ; 258 {
 803                     .text:	section	.text,new
 804  0000               _TIM4_GenerateEvent:
 808                     ; 260   assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
 810                     ; 263   TIM4->EGR = (uint8_t)(TIM4_EventSource);
 812  0000 9f            	ld	a,xl
 813  0001 c75345        	ld	21317,a
 814                     ; 264 }
 817  0004 81            	ret
 851                     ; 272 void TIM4_SetCounter(uint8_t Counter)
 851                     ; 273 {
 852                     .text:	section	.text,new
 853  0000               _TIM4_SetCounter:
 857                     ; 275   TIM4->CNTR = (uint8_t)(Counter);
 859  0000 c75346        	ld	21318,a
 860                     ; 276 }
 863  0003 81            	ret
 897                     ; 284 void TIM4_SetAutoreload(uint8_t Autoreload)
 897                     ; 285 {
 898                     .text:	section	.text,new
 899  0000               _TIM4_SetAutoreload:
 903                     ; 287   TIM4->ARR = (uint8_t)(Autoreload);
 905  0000 c75348        	ld	21320,a
 906                     ; 288 }
 909  0003 81            	ret
 932                     ; 295 uint8_t TIM4_GetCounter(void)
 932                     ; 296 {
 933                     .text:	section	.text,new
 934  0000               _TIM4_GetCounter:
 938                     ; 298   return (uint8_t)(TIM4->CNTR);
 940  0000 c65346        	ld	a,21318
 943  0003 81            	ret
 967                     ; 306 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 967                     ; 307 {
 968                     .text:	section	.text,new
 969  0000               _TIM4_GetPrescaler:
 973                     ; 309   return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
 975  0000 c65347        	ld	a,21319
 976  0003 5f            	clrw	x
 977  0004 97            	ld	xl,a
 980  0005 81            	ret
1059                     ; 319 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1059                     ; 320 {
1060                     .text:	section	.text,new
1061  0000               _TIM4_GetFlagStatus:
1063  0000 89            	pushw	x
1064       00000002      OFST:	set	2
1067                     ; 321   FlagStatus bitstatus = RESET;
1069                     ; 324   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1071                     ; 326   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1073  0001 9f            	ld	a,xl
1074  0002 c45344        	and	a,21316
1075  0005 2707          	jreq	L774
1076                     ; 328     bitstatus = SET;
1078  0007 ae0001        	ldw	x,#1
1079  000a 1f01          	ldw	(OFST-1,sp),x
1082  000c 2003          	jra	L105
1083  000e               L774:
1084                     ; 332     bitstatus = RESET;
1086  000e 5f            	clrw	x
1087  000f 1f01          	ldw	(OFST-1,sp),x
1089  0011               L105:
1090                     ; 334   return ((FlagStatus)bitstatus);
1092  0011 1e01          	ldw	x,(OFST-1,sp)
1095  0013 5b02          	addw	sp,#2
1096  0015 81            	ret
1131                     ; 344 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1131                     ; 345 {
1132                     .text:	section	.text,new
1133  0000               _TIM4_ClearFlag:
1137                     ; 347   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1139                     ; 350   TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
1141  0000 9f            	ld	a,xl
1142  0001 43            	cpl	a
1143  0002 c75344        	ld	21316,a
1144                     ; 351 }
1147  0005 81            	ret
1211                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1211                     ; 361 {
1212                     .text:	section	.text,new
1213  0000               _TIM4_GetITStatus:
1215  0000 89            	pushw	x
1216  0001 5204          	subw	sp,#4
1217       00000004      OFST:	set	4
1220                     ; 362   ITStatus bitstatus = RESET;
1222                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
1226                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1228                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1230  0003 9f            	ld	a,xl
1231  0004 c45344        	and	a,21316
1232  0007 6b01          	ld	(OFST-3,sp),a
1234                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1236  0009 c65343        	ld	a,21315
1237  000c 1406          	and	a,(OFST+2,sp)
1238  000e 6b02          	ld	(OFST-2,sp),a
1240                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
1242  0010 0d01          	tnz	(OFST-3,sp)
1243  0012 270b          	jreq	L355
1245  0014 0d02          	tnz	(OFST-2,sp)
1246  0016 2707          	jreq	L355
1247                     ; 375     bitstatus = (ITStatus)SET;
1249  0018 ae0001        	ldw	x,#1
1250  001b 1f03          	ldw	(OFST-1,sp),x
1253  001d 2003          	jra	L555
1254  001f               L355:
1255                     ; 379     bitstatus = (ITStatus)RESET;
1257  001f 5f            	clrw	x
1258  0020 1f03          	ldw	(OFST-1,sp),x
1260  0022               L555:
1261                     ; 381   return ((ITStatus)bitstatus);
1263  0022 1e03          	ldw	x,(OFST-1,sp)
1266  0024 5b06          	addw	sp,#6
1267  0026 81            	ret
1303                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1303                     ; 392 {
1304                     .text:	section	.text,new
1305  0000               _TIM4_ClearITPendingBit:
1309                     ; 394   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1311                     ; 397   TIM4->SR1 = (uint8_t)(~TIM4_IT);
1313  0000 9f            	ld	a,xl
1314  0001 43            	cpl	a
1315  0002 c75344        	ld	21316,a
1316                     ; 398 }
1319  0005 81            	ret
1332                     	xdef	_TIM4_ClearITPendingBit
1333                     	xdef	_TIM4_GetITStatus
1334                     	xdef	_TIM4_ClearFlag
1335                     	xdef	_TIM4_GetFlagStatus
1336                     	xdef	_TIM4_GetPrescaler
1337                     	xdef	_TIM4_GetCounter
1338                     	xdef	_TIM4_SetAutoreload
1339                     	xdef	_TIM4_SetCounter
1340                     	xdef	_TIM4_GenerateEvent
1341                     	xdef	_TIM4_ARRPreloadConfig
1342                     	xdef	_TIM4_PrescalerConfig
1343                     	xdef	_TIM4_SelectOnePulseMode
1344                     	xdef	_TIM4_UpdateRequestConfig
1345                     	xdef	_TIM4_UpdateDisableConfig
1346                     	xdef	_TIM4_ITConfig
1347                     	xdef	_TIM4_Cmd
1348                     	xdef	_TIM4_TimeBaseInit
1349                     	xdef	_TIM4_DeInit
1368                     	end
