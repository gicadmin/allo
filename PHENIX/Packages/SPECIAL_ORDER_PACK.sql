CREATE OR REPLACE PACKAGE phenix.SPECIAL_ORDER_PACK IS

--CSC3775 Retourne l'inventaire non endommagé mais pas prèt à être cueilli pour un produit
FUNCTION GET_SP_ORD_OTHER_INVENT_FUNC(
	p_prd_code 					IN VARCHAR2,
	p_fmt_code 					IN VARCHAR2,
	p_whs_picking_code	IN VARCHAR2,	--ber1436
	p_prd_definition 		IN VARCHAR2 DEFAULT NULL	--si null.. on va chercher c'est quoi, sinon, ca sauve un select
)
RETURN NUMBER;

--CSC3775 Retourne l'inventaire prèt à être cueilli pour un produit
FUNCTION GET_SP_ORD_PICK_INVENT_FUNC(
	p_prd_code 					IN VARCHAR2,
	p_fmt_code 					IN VARCHAR2,
	p_whs_picking_code	IN VARCHAR2,	--ber1436
	p_prd_definition 		IN VARCHAR2 DEFAULT NULL	--si null.. on va chercher c'est quoi, sinon, ca sauve un select
)
RETURN NUMBER;

END SPECIAL_ORDER_PACK;
 
/