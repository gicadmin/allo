CREATE OR REPLACE PACKAGE phenix.PWLM_OPERATION_PACK IS

--valide les champs NUMBER
PROCEDURE CHECK_IF_CHANGED_PROC(
	p_pwid_id 	  IN NUMBER,
	p_source			IN VARCHAR2,
	p_field_name	IN VARCHAR2,
	p_old_value 	IN NUMBER,
	p_new_value 	IN NUMBER,
	p_use_code		IN NUMBER DEFAULT 99999
);

--valide les champs VARCHAR
PROCEDURE CHECK_IF_CHANGED_PROC(
	p_pwid_id 	  IN NUMBER,
	p_source			IN VARCHAR2,
	p_field_name	IN VARCHAR2,
	p_old_value 	IN VARCHAR2,
	p_new_value 	IN VARCHAR2,
	p_use_code		IN NUMBER DEFAULT 99999
);

--valide les champs DATE
PROCEDURE CHECK_IF_CHANGED_PROC(
	p_pwid_id 	  IN NUMBER,
	p_source			IN VARCHAR2,
	p_field_name	IN VARCHAR2,
	p_old_value 	IN DATE,
	p_new_value 	IN DATE,
	p_use_code		IN NUMBER DEFAULT 99999
);

END PWLM_OPERATION_PACK;
/