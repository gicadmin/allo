CREATE OR REPLACE PACKAGE phenix.STG_PACK IS

FUNCTION FIND_STG_DESCRIPTION_FUNC(
	p_stg_code	IN VARCHAR2,
	p_language 	IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

END STG_PACK;
 
/