CREATE OR REPLACE PACKAGE phenix.ACCPAC_RCL_PACK IS

--csc2074 création initiale de la procédure pour le partenariat
FUNCTION GEN_PARTNERSHIP_REBATE_FUNC(
	P_RCT_CODE 		IN NUMBER,
	P_FROM_DATE 	IN DATE,
	P_TO_DATE 		IN DATE,
	P_CUS_CODE 		IN NUMBER,
	P_VEN_CODE 		IN NUMBER,
	P_USE_CODE		IN NUMBER,
	P_INH_MESSAGE	IN VARCHAR2,
	P_SQLERRM 		OUT VARCHAR2	--au cas ou on retourne FALSE car la procédure à planté, pour pouvoir informer l'utilisateur de l'erreur exacte
) RETURN BOOLEAN;

--csc2074 création initiale de la procédure pour le partenariat
PROCEDURE AP_RCL_INVOICING_PROC(
	p_inh_id in number,
	p_log_id in number default null
);

END ACCPAC_RCL_PACK;
/