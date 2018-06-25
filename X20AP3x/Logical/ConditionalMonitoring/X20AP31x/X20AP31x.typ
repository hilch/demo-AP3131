(********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Library: X20AP31x
 * Datei: X20AP31x.typ
 * Autor: B&R
 * Erstellt: 10. Januar 2014
 ********************************************************************
 * Datentypen der Library X20AP31x
 ********************************************************************)

TYPE
	X20AP31X_OUTPUT_MAPPING : 	STRUCT 
		OutputSequence : USINT;
		TrigDFT : BOOL;
		EnabEnergy : BOOL;
	END_STRUCT;
	X20AP31X_INPUT_MAPPING : 	STRUCT 
		InputSequence : USINT;
		RxByte1 : USINT;
		RxByte2 : USINT;
		RxByte3 : USINT;
		RxByte4 : USINT;
		RxByte5 : USINT;
		RxByte6 : USINT;
		RxByte7 : USINT;
		RBTrigDFT : BOOL;
	END_STRUCT;
	X20AP31X_MAPPING : 	STRUCT 
		out : X20AP31X_OUTPUT_MAPPING;
		in : X20AP31X_INPUT_MAPPING;
	END_STRUCT;
	X20AP31X_ADC_REG_STATUS : 	STRUCT 
		SysStatus0 : UINT; (*System Status 0*)
		SysStatus1 : UINT; (*System Status 1*)
		EnStatus0 : UINT; (*Metering Status 0*)
		EnStatus1 : UINT; (*Metering Status 1*)
	END_STRUCT;
	X20AP31X_ADC_REG_RMS : 	STRUCT 
		IrmsN1 : UINT; (* N Line Sampled current RMS *)
		UrmsA : UINT; (* phase A voltage RMS *)
		UrmsB : UINT; (* phase B voltage RMS *)
		UrmsC : UINT; (* phase C voltage RMS *)
		IrmsN0 : UINT; (* N Line calculated current RMS *)
		IrmsA : UINT; (* phase A current RMS *)
		IrmsB : UINT; (* phase B current RMS *)
		IrmsC : UINT; (* phase C current RMS *)
	END_STRUCT;
	X20AP31X_ADC_REG_THD_ANGLE : 	STRUCT  (* THD+N, Frequency, Angle and Temperature Registers *)
		THDNUA : UINT; (* phase A voltage THD+N *)
		THDNUB : UINT; (*  phase B voltage THD+N *)
		THDNUC : UINT; (* phase C voltage THD+N *)
		THDNIA : UINT; (* phase A current THD+N *)
		THDNIB : UINT; (* phase B current THD+N *)
		THDNIC : UINT; (* phase C current THD+N *)
		Freq : UINT; (* Frequency *)
		PAngleA : INT; (* phase A mean phase angle *)
		PAngleB : INT; (* phase B mean phase angle *)
		PAngleC : INT; (* phase C mean phase angle *)
		Temp : INT; (* Measured temperature *)
		UangleA : INT; (* phase A voltage phase angle *)
		UangleB : INT; (* phase B voltage phase angle *)
		UangleC : INT; (* phase C voltage phase angle *)
	END_STRUCT;
	X20AP31X_ADC_REG_POWER : 	STRUCT  (* Power and Power Factor/ Fundamental/ Harmonic Power and Voltage/ Current RMS Registers
SVmeanTLSB: UINT;	(* LSB of (Vector Sum) Total Apparent Power *)
		SVmeanTLSB : UINT; (*LSB of (Vector Sum) Total Apparent Power

*)
		SVmeanT : UINT; (*  (Vector Sum) Total Apparent Power *)
		PmeanT : INT; (* Total Active Power *)
		PmeanA : INT; (* Phase A Active Power *)
		PmeanB : INT; (* Phase B Active Power *)
		PmeanC : INT; (* Phase C Active Power *)
		QmeanT : INT; (*  Total Reactive Power *)
		QmeanA : INT; (*  Phase A Reactive Power *)
		QmeanB : INT; (*  Phase B Reactive Power *)
		QmeanC : INT; (*  Phase C Reactive Power *)
		SAmeanT : INT; (*  (Arithmetic Sum) Total apparent power *)
		SmeanA : INT; (*  phase A apparent power *)
		SmeanB : INT; (*  phase B apparent power *)
		SmeanC : INT; (*  phase C apparent power *)
		PFmeanT : INT; (*  Total power factor *)
		PFmeanA : INT; (*  phase A power factor *)
		PFmeanB : INT; (*  phase A power factor *)
		PFmeanC : INT; (*  phase A power factor *)
		PmeanTF : INT; (*  Total active fundamental power *)
		PmeanAF : INT; (*  phase A active fundamental power *)
		PmeanBF : INT; (*  phase B active fundamental power *)
		PmeanCF : INT; (*  phase C active fundamental power *)
		PmeanTH : INT; (*  Total active harmonic power *)
		PmeanAH : INT; (* phase A active harmonic power *)
		PmeanBH : INT; (*  phase B active harmonic power *)
		PmeanCH : INT; (*  phase C active harmonic power *)
	END_STRUCT;
	X20AP31X_ADC_REG_ENERGY : 	STRUCT 
		APenergyT : UDINT; (* Total Forward Active Energy *)
		APenergyA : UDINT; (*Phase A Forward Active Energy *)
		APenergyB : UDINT; (*Phase B Forward Active Energy *)
		APenergyC : UDINT; (*Phase C Forward Active Energy *)
		ANenergyT : UDINT; (*Total Reverse Active Energy *)
		ANenergyA : UDINT; (*Phase A Reverse Active Energy *)
		ANenergyB : UDINT; (*Phase B Reverse Active Energy *)
		ANenergyC : UDINT; (*Phase C Reverse Active Energy *)
		RPenergyT : UDINT; (*Total Forward Reactive Energy *)
		RPenergyA : UDINT; (*Phase A Forward Reactive Energy *)
		RPenergyB : UDINT; (*Phase B Forward Reactive Energy *)
		RPenergyC : UDINT; (*Phase C Forward Reactive Energy *)
		RNenergyT : UDINT; (*Total Reverse Reactive Energy *)
		RNenergyA : UDINT; (*Phase A Reverse Reactive Energy *)
		RNenergyB : UDINT; (*Phase B Reverse Reactive Energy *)
		RNenergyC : UDINT; (*Phase C Reverse Reactive Energy *)
		SAenergyT : UDINT; (* (Arithmetic Sum) Total Apparent Energy *)
		SenergyA : UDINT; (* Phase A Apparent Energy *)
		SenergyB : UDINT; (* Phase B Apparent Energy *)
		SenergyC : UDINT; (* Phase C Apparent Energy *)
		SVenergyT : UDINT; (* (Vector Sum) Total Apparent Energy *)
		APenergyTF : UDINT; (* Total Forward Active Fundamental Energy *)
		APenergyAF : UDINT; (* Phase A Forward Active Fundamental Energy *)
		APenergyBF : UDINT; (* Phase B Forward Active Fundamental Energy *)
		APenergyCF : UDINT; (* Phase C Forward Active Fundamental Energy *)
		ANenergyTF : UDINT; (* Total Reverse Active Fundamental Energy *)
		ANenergyAF : UDINT; (* Phase A Reverse Active Fundamental Energy *)
		ANenergyBF : UDINT; (* Phase B Reverse Active Fundamental Energy *)
		ANenergyCF : UDINT; (* Phase C Reverse Active Fundamental Energy *)
		APenergyTH : UDINT; (* Total Forward Active Harmonic Energy *)
		APenergyAH : UDINT; (* Phase A Forward Active Harmonic Energy *)
		APenergyBH : UDINT; (* Phase B Forward Active Harmonic Energy *)
		APenergyCH : UDINT; (* Phase C Forward Active Harmonic Energy *)
		ANenergyTH : UDINT; (* Total Reverse Active Harmonic Energy *)
		ANenergyAH : UDINT; (* Phase A Reverse Active Harmonic Energy *)
		ANenergyBH : UDINT; (* Phase B Reverse Active Harmonic Energy *)
		ANenergyCH : UDINT; (* Phase C Reverse Active Harmonic Energy *)
		AEnergyT : DINT; (* Total Active Energy *)
		REnergyT : DINT; (* Total Reactive Energy *)
	END_STRUCT;
	X20AP31X_ADC_REG_DFT : 	STRUCT  (*  (* Arithmetic ratio, 2 bits integer and 14 bits fractional;	That is:	Harmonic Ratio (%) = Register Value / 163.84 *)
		DftAI : ARRAY[0..31]OF UINT; (* phase A, Current, Harmonic Ratio for 2-th TO 32-th order component and Total Harmonic Distortion	Ratio *)
		DftBI : ARRAY[0..31]OF UINT; (*  phase B, Current, Harmonic Ratio for 2-th to 32-th order component and Total Harmonic Distortion	Ratio *)
		DftCI : ARRAY[0..31]OF UINT; (*  phase C, Current, Harmonic Ratio for 2-th to 32-th order component and Total Harmonic Distortion	Ratio *)
		DftAV : ARRAY[0..31]OF UINT; (*  phase A, Voltage, Harmonic Ratio for 2-th to 32-th order component and Total Harmonic Distortion	Ratio *)
		DftBV : ARRAY[0..31]OF UINT; (*  phase B, Voltage, Harmonic Ratio for 2-th to 32-th order component and Total Harmonic Distortion	Ratio *)
		DftCV : ARRAY[0..31]OF UINT; (*  phase C, Voltage, Harmonic Ratio for 2-th to 32-th order component and Total Harmonic Distortion	Ratio *) (*
		Format: Need special scaling/conversion.	The register value * 147.62 = full-scale input signal RMS.
		Current, Fundamental component value = Register Value * 209 * 65.535 / 8388608
		Voltage, Fundamental component value = Register Value * 209 * 655.35 / 8388608

	*)
		DftAI_Fund : UINT;
		DftAV_Fund : UINT;
		DftBI_Fund : UINT;
		DftBV_Fund : UINT;
		DftCI_Fund : UINT;
		DftCV_Fund : UINT;
	END_STRUCT;
	X20AP31X_ADC_REG_CFGACT : 	STRUCT  (*  Excerpt of configuration registers used by APROL, readable only by FS-IF
and with register numbers of registers with the same names. *)
		ChanControl : UINT;
		IDispTh : UINT;
		I_RatioA : UINT;
		I_RatioB : UINT;
		I_RatioC : UINT;
		I_RatioN : UINT;
		ZXConfig : UINT; (*1090*)
		SagTh : UINT; (*1094*)
		PhaseLoseTh : UINT; (*1098*)
		INWarnTh0 : UINT; (*1102*)
		INWarnTh1 : UINT; (*1106*)
		THDNUTh : UINT; (*1110*)
		THDNITh : UINT; (*1114*)
		MeteringMode : UINT; (*MeteringMode 1162*)
		PLconst : UDINT; (*Powerline Constant*)
	END_STRUCT;
	X20AP31X_ENV_STATUS : 	STRUCT  (* Environment Variables *)
		ulUpTime : UDINT;
		ulUpCnt : UDINT;
		ssMinTemp : INT;
		ssMaxTemp : INT;
		ulRes : ARRAY[0..12]OF UDINT;
	END_STRUCT;
	X20AP31X : 	STRUCT 
		NetTimeReg : UDINT; (* TIME OF Section copy TO Buffer *)
		Status : X20AP31X_ADC_REG_STATUS; (* Status registers *)
		Rms : X20AP31X_ADC_REG_RMS; (* RMS Registers *)
		Power : X20AP31X_ADC_REG_POWER; (* Power Registers *)
		ThdAngle : X20AP31X_ADC_REG_THD_ANGLE; (* THD + Angel Registers *)
		NetTimeEnergy : UDINT; (* TIME OF Section copy TO Buffer *)
		Energy : X20AP31X_ADC_REG_ENERGY; (* Energy Registers *)
		NetTimeDft : UDINT; (* TIME OF Section copy TO Buffer *)
		Dft : X20AP31X_ADC_REG_DFT; (* DFT Registers *)
		CfgAct : X20AP31X_ADC_REG_CFGACT; (* Config read back *)
		EnvReg : X20AP31X_ENV_STATUS; (* Read Back Environment Registers *)
	END_STRUCT;
END_TYPE
