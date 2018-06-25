(********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Programm: energy
 * Datei: energy.st
 * Autor: B&R
 * Erstellt: 16. Januar 2014
 ********************************************************************
 * Implementierung des Programms energy
 ********************************************************************)

PROGRAM _INIT


fubAP31x.pData := ADR(apData);
fubAP31x.pMapping := ADR(iomapping);
converterRatio := 50/5; 	(* tatsächlich verwendeter Stromwandler *)


END_PROGRAM


PROGRAM _CYCLIC

(*  ----------------------------------------------------------------------------------------
	Korrekturfaktor, da nicht alle Stromwandler- Übersetzungen im Modul konfigurierbar sind.
	Es wird dabei davon ausgegangen, dass alle Phasen den gleichen Übersetzungsfaktor haben.
	----------------------------------------------------------------------------------------
*)
currentCorrectionFactor := converterRatio / (UINT_TO_LREAL(apData.CfgAct.I_RatioA) / 10);

(* Daten aus dem X20AP- Modul abrufen *)
fubAP31x();

(*  ----------------------------------------------------------------------------------------
	Effektivwerte der Ströme und Spannungen.
	----------------------------------------------------------------------------------------
*)
(* Stromwerte werden vom Modul in 0,001 A geliefert *)
condMonData.Rms.IrmsA := UINT_TO_LREAL(apData.Rms.IrmsA) * currentCorrectionFactor / 1000.0;  
condMonData.Rms.IrmsB := UINT_TO_LREAL(apData.Rms.IrmsB) * currentCorrectionFactor / 1000.0;
condMonData.Rms.IrmsC := UINT_TO_LREAL(apData.Rms.IrmsC) * currentCorrectionFactor / 1000.0;
condMonData.Rms.IrmsN := UINT_TO_LREAL(apData.Rms.IrmsN0) * currentCorrectionFactor / 1000.0;
(* Spannungswerte werden vom Modul in 0,01 V geliefert *)
condMonData.Rms.UrmsA := UINT_TO_LREAL(apData.Rms.UrmsA) / 100.0;
condMonData.Rms.UrmsB := UINT_TO_LREAL(apData.Rms.UrmsB) / 100.0;
condMonData.Rms.UrmsC := UINT_TO_LREAL(apData.Rms.UrmsC) / 100.0;

(*  ----------------------------------------------------------------------------------------
	Leistung
	----------------------------------------------------------------------------------------
*)
(* Gesamt- Leistungswerte werden vom Modul in 4W- Schritten geliefert *)
condMonData.Power.SVmeanT := ( UINT_TO_LREAL(apData.Power.SVmeanT) + UINT_TO_LREAL(apData.Power.SVmeanTLSB)/65536 ) * 4.0 * currentCorrectionFactor;
condMonData.Power.PmeanT := INT_TO_LREAL(apData.Power.PmeanT) * 4.0 * currentCorrectionFactor;
condMonData.Power.QmeanT := INT_TO_LREAL(apData.Power.QmeanT) * 4.0 * currentCorrectionFactor;
(* Leistungsfaktor wird vom Modul in 0,001 - Einheiten geliefert *)
condMonData.Power.PFmeanT := INT_TO_LREAL(apData.Power.PFmeanT) / 1000.0;

(*  ----------------------------------------------------------------------------------------
	Arbeit
	----------------------------------------------------------------------------------------
*)
(* Energie wird in 0,1 oder 0,01 CF geliefert *)
IF apData.CfgAct.PLconst <> 0 THEN
	unitsPerkWh := 3600.0 * (1250000000.0 / apData.CfgAct.PLconst);
	IF apData.CfgAct.MeteringMode.3 THEN
		unitsPerkWh := unitsPerkWh * 10.0;
	END_IF
ELSE
	unitsPerkWh := 0;
END_IF
condMonData.Energy.SVenergyT := UDINT_TO_LREAL(apData.Energy.SVenergyT) / unitsPerkWh * currentCorrectionFactor;

(*  ----------------------------------------------------------------------------------------
	Netzüberwachung
	----------------------------------------------------------------------------------------
*)

condMonData.MainsStatus.TresholdWarning := UINT_TO_LREAL(apData.CfgAct.SagTh) / 100.0;
condMonData.MainsStatus.TresholdLoss := UINT_TO_LREAL(apData.CfgAct.PhaseLoseTh) / 100.0;
condMonData.MainsStatus.frequency := UINT_TO_LREAL(apData.ThdAngle.Freq) / 100.0;
condMonData.MainsStatus.MainsOK := NOT(condMonData.MainsStatus.LossPhaseA) AND NOT(condMonData.MainsStatus.LossPhaseB) AND NOT(condMonData.MainsStatus.LossPhaseC) AND
								   NOT(condMonData.MainsStatus.WarningPhaseA) AND NOT(condMonData.MainsStatus.WarningPhaseB) AND NOT(condMonData.MainsStatus.WarningPhaseC);

END_PROGRAM
