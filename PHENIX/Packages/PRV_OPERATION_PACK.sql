CREATE OR REPLACE PACKAGE phenix.PRV_OPERATION_PACK IS

PROCEDURE GET_MAIN_INFO_PROC(
	p_prv_code 						IN provinces.prv_code%TYPE,
	p_prv_name 						OUT provinces.prv_name%TYPE,
	p_prv_provincial_tax 	OUT provinces.prv_provincial_tax%TYPE,
	p_prv_federal_tax 		OUT provinces.prv_federal_tax%TYPE,
	p_cun_description 		OUT countries.cun_description%TYPE
);

FUNCTION GET_POSTAL_CODE_MASK_FUNC(
	p_prv_code IN provinces.prv_code%TYPE
)
RETURN VARCHAR2;

FUNCTION VALIDATE_POSTAL_CODE_FUNC(
	p_postal_code 	IN VARCHAR2,
	p_prv_code 			IN provinces.prv_code%TYPE
)
RETURN NUMBER;

FUNCTION FORMAT_POSTAL_CODE_FUNC(
	p_postal_code 	IN VARCHAR2,
	p_prv_code 			IN provinces.prv_code%TYPE
)
RETURN VARCHAR2;

FUNCTION VALIDATE_FORMATE_POSTALC_FUNC(
	p_postal_code 	IN VARCHAR2,
	p_prv_code 			IN provinces.prv_code%TYPE,
	p_Mask_code_out 	  OUT VARCHAR2
)
RETURN NUMBER;

END PRV_OPERATION_PACK;
/