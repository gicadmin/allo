CREATE OR REPLACE PACKAGE phenix.RCT_PACK IS

FUNCTION FIND_RCT_DESCRIPTION_FUNC(
	p_rct_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

PROCEDURE FIND_RCT_DESC_AND_PARTNER_PROC(
	p_rct_code 								IN NUMBER,
	p_rct_description					OUT VARCHAR2,
	p_rct_partnership_switch	OUT NUMBER,
	p_language 								IN VARCHAR2 DEFAULT 'F'
);

FUNCTION ASSOCIATION_KNOWN_TO_ACC_FUNC(
	p_rcl_id 		IN retail_clients.rcl_id%TYPE,
	p_rct_code	IN retail_client_types.rct_code%TYPE DEFAULT NULL
)
RETURN BOOLEAN;

END RCT_PACK;
 
/