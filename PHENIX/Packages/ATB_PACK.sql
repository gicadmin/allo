CREATE OR REPLACE PACKAGE phenix.ATB_PACK IS

PROCEDURE ANALYSE_TABLE_JOB_PROC ( --CVI488
	p_jsc_id IN NUMBER
);

PROCEDURE ANALYSE_TABLE_PROC(
	p_called_from_forms_switch	IN NUMBER DEFAULT 0
);

PROCEDURE EXECUTE_ANALYSE_PROC(
	p_log_id 										IN NUMBER,
	p_called_from_forms_switch	IN NUMBER DEFAULT 0
);

PROCEDURE SET_NEED_ANALYSE_PROC(
	p_atb_table_name	IN analyse_tables.atb_table_name%TYPE
);

END ATB_PACK;
 
/