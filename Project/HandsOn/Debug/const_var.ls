   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
 355                     	switch	.ubsct
 356  0000               _DataReady:
 357  0000 0000          	ds.b	2
 358                     	xdef	_DataReady
 359  0002               _Count_ms:
 360  0002 0000          	ds.b	2
 361                     	xdef	_Count_ms
 362  0004               _leitura_inicial:
 363  0004 000000000000  	ds.b	6
 364                     	xdef	_leitura_inicial
 365  000a               _leitura:
 366  000a 000000000000  	ds.b	6
 367                     	xdef	_leitura
 368  0010               _StatusAUXVar:
 369  0010 00            	ds.b	1
 370                     	xdef	_StatusAUXVar
 371  0011               _StatusRegVar:
 372  0011 00            	ds.b	1
 373                     	xdef	_StatusRegVar
 374  0012               _status_bit:
 375  0012 00            	ds.b	1
 376                     	xdef	_status_bit
 377  0013               _Int_counter:
 378  0013 00            	ds.b	1
 379                     	xdef	_Int_counter
 380  0014               _MEMS_data_ready:
 381  0014 00            	ds.b	1
 382                     	xdef	_MEMS_data_ready
 383  0015               _MEMS_OutZ_Ref:
 384  0015 0000          	ds.b	2
 385                     	xdef	_MEMS_OutZ_Ref
 386  0017               _MEMS_OutY_Ref:
 387  0017 0000          	ds.b	2
 388                     	xdef	_MEMS_OutY_Ref
 389  0019               _MEMS_OutX_Ref:
 390  0019 0000          	ds.b	2
 391                     	xdef	_MEMS_OutX_Ref
 392  001b               _MEMS_OutZ:
 393  001b 0000          	ds.b	2
 394                     	xdef	_MEMS_OutZ
 395  001d               _MEMS_OutY:
 396  001d 0000          	ds.b	2
 397                     	xdef	_MEMS_OutY
 398  001f               _MEMS_OutX:
 399  001f 0000          	ds.b	2
 400                     	xdef	_MEMS_OutX
 401  0021               _Int1_cfg:
 402  0021 00            	ds.b	1
 403                     	xdef	_Int1_cfg
 404  0022               _Int1_ths:
 405  0022 00            	ds.b	1
 406                     	xdef	_Int1_ths
 407  0023               _Int1_dur:
 408  0023 00            	ds.b	1
 409                     	xdef	_Int1_dur
 410  0024               _Ctrl_reg6:
 411  0024 00            	ds.b	1
 412                     	xdef	_Ctrl_reg6
 413  0025               _Ctrl_reg5:
 414  0025 00            	ds.b	1
 415                     	xdef	_Ctrl_reg5
 416  0026               _Ctrl_reg4:
 417  0026 00            	ds.b	1
 418                     	xdef	_Ctrl_reg4
 419  0027               _Ctrl_reg3:
 420  0027 00            	ds.b	1
 421                     	xdef	_Ctrl_reg3
 422  0028               _Ctrl_reg2:
 423  0028 00            	ds.b	1
 424                     	xdef	_Ctrl_reg2
 425  0029               _Ctrl_reg1:
 426  0029 00            	ds.b	1
 427                     	xdef	_Ctrl_reg1
 428  002a               _StatusReg:
 429  002a 00            	ds.b	1
 430                     	xdef	_StatusReg
 431  002b               _OutZH:
 432  002b 00            	ds.b	1
 433                     	xdef	_OutZH
 434  002c               _OutZL:
 435  002c 00            	ds.b	1
 436                     	xdef	_OutZL
 437  002d               _OutYH:
 438  002d 00            	ds.b	1
 439                     	xdef	_OutYH
 440  002e               _OutYL:
 441  002e 00            	ds.b	1
 442                     	xdef	_OutYL
 443  002f               _OutXH:
 444  002f 00            	ds.b	1
 445                     	xdef	_OutXH
 446  0030               _OutXL:
 447  0030 00            	ds.b	1
 448                     	xdef	_OutXL
 449  0031               _WhoAmI:
 450  0031 00            	ds.b	1
 451                     	xdef	_WhoAmI
 471                     	end
