(********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Library: Asflt
 * File: Asflt.typ
 * Author: B+R
 ********************************************************************
 * Data types of library Asflt
 ********************************************************************)
                                                                      
TYPE		
	fltRx_t  : STRUCT				(*internal use*)
		pMtu			:UDINT;	
		mtuSize			:INT;
		recvBuf			:fltRxBuf_t;	
		conn			:INT;
		segSize			:INT;
		segFlgs			:INT;
		sequOut			:SINT;
		cnt				:USINT;
		flgs			:UDINT;
		usrBufOffs		:UDINT;
		usrBufPointer	:UDINT;	
	END_STRUCT;	
	
	fltTx_t   : STRUCT				(*internal use*)
		mtuSize			:INT;
		pSequIn			:UDINT;
		readSequ		:USINT;
		pMtu			:UDINT;	
		conn			:INT;
		sequ			:SINT;				
		lastSequ		:SINT;			
		lastAcknSequ	:SINT;	 	
		ctrl			:USINT;				
		lock			:USINT;		
		runs			:USINT;
		sync			:fltSync_t;	
		requ			:fltTxRequ_t;
		forwMtu			:ARRAY[0..7] OF fltTxMtuData_t;
		flgs			:UDINT;		
	END_STRUCT;	
	
	fltRxBuf_t : STRUCT				(*internal use*)
		bufContent		:ARRAY[0..63] OF USINT;	
		buf				:ARRAY[0..127] OF USINT;
		top				:USINT;
		end				:USINT;
		hidden			:USINT;
		frames			:USINT;
	END_STRUCT;
	
	fltTxMtuData_t  : STRUCT			(*internal use*)
		usedSize		:INT;
		rawData			:INT;
		sequ			:SINT;
		mtu				:ARRAY[0..26] OF USINT;	
	END_STRUCT;
	
	fltTxRequ_t  : STRUCT				(*internal use*)
		doneBytes		:UDINT;	
		pendBytes		:UDINT;	
		pBuf			:UDINT;				
		bufSize			:UDINT;
	END_STRUCT;
	
		fltSync_t : 					
	(
		fltSYNC_INC_DONE,	
		fltSYNC_ACT_MTU_WRITTEN,
		fltSYNC_INC_NEXT_CYC
	);
END_TYPE