(********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Library: runtime
 * File: runtime.typ
 * Author: B+R
 ********************************************************************
 * Data types of library runtime
 ********************************************************************)
                                                                      
TYPE
	SFCActionType : STRUCT			(*internal use*)
		x	: BOOL ;			
		_x	: BOOL ;			
		t	: TIME ;			
		_t	: TIME ;			
		AC	: SFCActionControl;	
	END_STRUCT;
	SFCActionType2 : STRUCT		(*internal use*)
		x	: BOOL ;
		_x	: BOOL ;
		AC	: SFCAC2 ;
	END_STRUCT;
	SFCActionCType : STRUCT		(*internal use*)
		x		: BOOL ;
		_x		: BOOL ;
		force	: BOOL ;
		_force	: BOOL ;
		active	: BOOL ;
		_active	: BOOL ;
		AC		: SFCActionControl ;
	END_STRUCT;
	SFCActionCType2 : STRUCT	(*internal use*)
		x		: BOOL ;
		_x		: BOOL ;
		force	: BOOL ;
		_force	: BOOL ;
		active	: BOOL ;
		_active	: BOOL ;
		AC		: SFCAC2 ;
	END_STRUCT;
	SFCStepType : STRUCT			(*internal use*)
		x	: BOOL ;			
		t	: TIME ;			
		_x	: BOOL ;			
		_t	: TIME ;			
	END_STRUCT;
	SFCStepCType : STRUCT		(*internal use*)
		t					: TIME ;
		_t					: TIME ;
		inactive_actions	: UDINT ;
		_inactive_actions	: UDINT ;
		x					: BOOL ;
		_x					: BOOL ;
		force				: BOOL ;
		_force				: BOOL ;
		active				: BOOL ;
		_active				: BOOL ;
		error				: BOOL ;
	END_STRUCT;
	SFCSimpleStepCType : STRUCT	(*internal use*)
		t		: TIME ;
		_t		: TIME ;
		x		: BOOL ;
		_x		: BOOL ;
		force	: BOOL ;
		_force	: BOOL ;
		active	: BOOL ;
		_active	: BOOL ;
		error	: BOOL ;
	END_STRUCT;
	SFCTransitionCType : STRUCT	(*internal use*)
		force	: BOOL ;
		_force	: BOOL ;
		active	: BOOL ;
		_active	: BOOL ;
	END_STRUCT;
END_TYPE