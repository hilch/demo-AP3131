(********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Library: AsFltGen
 * File: AsFltGen.fun
 * Author: B+R
 ********************************************************************
 * Functions and function blocks of library AsFltGen
 ********************************************************************)
 
FUNCTION_BLOCK fltRead 	(*receive data by using the flat stream mode*)
	VAR_INPUT
		enable 		: BOOL; 				 (*enables execution*)
		cfg 		: UDINT; 				 (*configures the FltGen interface*)
		pBuf 		: UDINT; 				 (*pointer to the receive buffer*)
		bufLen		: UINT; 				 (*size of receive buffer*)
		pRxBytes 	: UDINT;  				 (*pointer to array for MTU receive bytes connection*)
	    rxBytesLen	: USINT;				 (*size of receive MTU array*)				
	END_VAR
	VAR_OUTPUT
		status 		: UINT; 				 (*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
		validBytes 	: UINT; 				 (*valid bytes in the read buffer*)
		pendBytes 	: UINT; 				 (*size of the next pending buffer*)
		readSequ	: USINT; 				 (*sequence have to be written to module by using a AsFltGen write fub*)
	END_VAR
	VAR
		_cache		: fltRx_t;			 	(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fltWrite (*write data by using the flat stream mode*)
	VAR_INPUT
		enable 		: BOOL; 				 (*enables execution*)
		cfg 		: UDINT; 				 (*configures the FltGen interface*)
		pBuf 		: UDINT; 				 (*pointer to the send buffer*)
		bufLen		: UINT; 				 (*size of send buffer*)
		readSequ	: USINT; 				 (*sequence have to be written to module from a AsFltGen read fub*)
		pTxBytes 	: UDINT;  				 (*pointer to array for MTU send bytes connection*)
	    txBytesLen	: USINT;				 (*size of send MTU array*)		
		pSequ		: UDINT;				 (*input sequence from module*)
	END_VAR
	VAR_OUTPUT
		status 		: UINT; 				 (*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
	VAR
		_cache		: fltTx_t;			 	(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

