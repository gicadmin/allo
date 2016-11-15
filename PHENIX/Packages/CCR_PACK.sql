CREATE OR REPLACE PACKAGE phenix.CCR_PACK IS

PROCEDURE INSERT_CCR_PROC(
	p_ccr_code 				IN error_codes.ccr_code%TYPE,
	p_ccr_message 		IN error_codes.ccr_message%TYPE,
	p_ccr_alt_message IN error_codes.ccr_alt_message%TYPE
);

PROCEDURE UPDATE_CCR_MESSAGE_PROC(
	p_ccr_code 						IN error_codes.ccr_code%TYPE,
	p_new_ccr_message 		IN error_codes.ccr_message%TYPE,
	p_new_ccr_alt_message IN error_codes.ccr_alt_message%TYPE
);

FUNCTION FIND_CCR_MESSAGE_FUNC(
	p_ccr_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

FUNCTION FIND_CCR_MESSAGE_VALUES_FUNC(
  p_ccr_code IN NUMBER,
  p_language IN VARCHAR2 DEFAULT 'F',
  p_value_1  IN VARCHAR2 DEFAULT NULL,
  p_value_2  IN VARCHAR2 DEFAULT NULL,
  p_value_3  IN VARCHAR2 DEFAULT NULL,
  p_value_4  IN VARCHAR2 DEFAULT NULL
)
RETURN VARCHAR2;

END CCR_PACK;
/