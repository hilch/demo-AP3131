/********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Library: X20AP31x
 * Datei: X20AP31X_Register.c
 * Autor: B&R
 * Erstellt: 10. Januar 2014
 ********************************************************************
 * Implementierung der Library X20AP31x
 ********************************************************************/


#include <bur/plctypes.h>
#ifdef __cplusplus
	extern "C"
	{
#endif

	#include "X20AP31x.h"

#ifdef __cplusplus
	};
#endif


/* Read X20AP3X1 - Register */
void X20AP31X_Register(struct X20AP31X_Register* inst)
{

	
		inst->pMapping->out.EnabEnergy = 1;

		// cyclically trigger generation of Energy and DFT values on AP31x1
		if (  inst->pMapping->in.RBTrigDFT == inst->pMapping->out.TrigDFT )
		{
			inst->pMapping->out.TrigDFT ^= 1;
		}


		// copy Inputs to Read Buffer //
		inst->fltMTURead[0] = inst->pMapping->in.InputSequence;
		inst->fltMTURead[1] = inst->pMapping->in.RxByte1;	
		inst->fltMTURead[2] = inst->pMapping->in.RxByte2;	
		inst->fltMTURead[3] = inst->pMapping->in.RxByte3;	
		inst->fltMTURead[4] = inst->pMapping->in.RxByte4;	
		inst->fltMTURead[5] = inst->pMapping->in.RxByte5;	
		inst->fltMTURead[6] = inst->pMapping->in.RxByte6;	
		inst->fltMTURead[7] = inst->pMapping->in.RxByte7;	
	
		// Flat Stream Handling

		
	
		inst->read.enable	 		= 1;
		inst->read.cfg		 	= fltMODE_FRAME;
		inst->read.pBuf			= (UDINT)&inst->tmpBuf;
		inst->read.bufLen			= sizeof(inst->tmpBuf);
		inst->read.pRxBytes	 	= (UDINT)&inst->fltMTURead[0];
		inst->read.rxBytesLen 	= sizeof(inst->fltMTURead);
		fltRead(&inst->read);
		if (inst->read.status == fltERR_FRAME_FINISHED)
		{
			int len;

			if ((len = inst->read.validBytes) != 0)
			{
	
				inst->blockReceived = inst->tmpBuf[0];
				len	= sizeof(X20AP31X);
	
				if (len > inst->read.validBytes)
					len = inst->read.validBytes;
	
				brsmemcpy ( (UDINT) inst->pData, (UDINT) &inst->tmpBuf[1], len);
			}
		}
	
		
	
		inst->write.enable	 	= 1;
		inst->write.cfg			= 	(fltMODE_SYNCHRON + (1 << 4) + (1 << 1));
		inst->write.readSequ 		= inst->read.readSequ;
		inst->write.pBuf			= (UDINT)&inst->blockNumber;
		inst->write.bufLen		= 0;
		inst->write.pTxBytes		= (UDINT)&inst->fltMTUWrite[0];
		inst->write.txBytesLen	= sizeof(inst->fltMTUWrite);
		inst->write.pSequ	 		= (UDINT)&inst->fltMTURead[0];
		fltWrite(&inst->write);
		if (inst->write.status == 0)
		{
	
		}


		/* copy write buffer to outputs */
		inst->pMapping->out.OutputSequence = inst->fltMTUWrite[0];
		

}



