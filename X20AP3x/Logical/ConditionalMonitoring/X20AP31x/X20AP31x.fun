
FUNCTION_BLOCK X20AP31X_Register (*Read X20AP3X1 - Register*)
	VAR_INPUT
		pMapping : REFERENCE TO X20AP31X_MAPPING; (*Pointer to IO-Mapping- Datetype*)
		pData : REFERENCE TO X20AP31X; (*Pointer to Module Data*)
	END_VAR
	VAR
		read : fltRead;
		write : fltWrite;
		fltMTUWrite : ARRAY[0..3] OF USINT;
		fltMTURead : ARRAY[0..7] OF USINT;
		blockNumber : USINT;
		blockReceived : USINT;
		tmpBuf : ARRAY[0..799] OF SINT;
	END_VAR
END_FUNCTION_BLOCK
