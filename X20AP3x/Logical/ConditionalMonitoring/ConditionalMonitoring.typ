
TYPE
	CondMonEnergy : 	STRUCT 
		SVenergyT : LREAL; (* (Vector Sum) Total Apparent Energy [kWh]*)
	END_STRUCT;
	CondMonPower : 	STRUCT 
		SVmeanT : LREAL; (*  (Vector Sum) Total Apparent Power [W]*)
		PmeanT : LREAL; (* Total Active Power [W]*)
		QmeanT : LREAL; (*  Total Reactive Power [W]*)
		PFmeanT : LREAL; (*  Total power factor [1]*)
	END_STRUCT;
	CondMonMainsStatus : 	STRUCT 
		frequency : LREAL; (*Netzfrequenz*)
		TresholdWarning : LREAL; (*Spannungsschwelle für Warnung*)
		WarningPhaseA : BOOL;
		WarningPhaseB : BOOL;
		WarningPhaseC : BOOL;
		TresholdLoss : LREAL; (*Spannungsschwelle für Ausfall*)
		LossPhaseA : BOOL;
		LossPhaseB : BOOL;
		LossPhaseC : BOOL;
		MainsOK : BOOL;
	END_STRUCT;
	CondMonRMS : 	STRUCT 
		UrmsA : LREAL; (* phase A voltage RMS [V]*)
		UrmsB : LREAL; (* phase B voltage RMS [V]*)
		UrmsC : LREAL; (* phase C voltage RMS [V]*)
		IrmsN : LREAL; (* N Line calculated current RMS [A]*)
		IrmsA : LREAL; (* phase A voltage RMS [A]*)
		IrmsB : LREAL; (* phase B voltage RMS [A]*)
		IrmsC : LREAL; (* phase C voltage RMS [A]*)
	END_STRUCT;
	CondMonData : 	STRUCT 
		Rms : CondMonRMS; (*elektrische Effektivwerte*)
		Power : CondMonPower; (*elektrische Leistung*)
		Energy : CondMonEnergy; (*elektrische Arbeit*)
		MainsStatus : CondMonMainsStatus; (*Status des Versorgungsnetzes*)
	END_STRUCT;
END_TYPE
