CREATE OR REPLACE PACKAGE phenix.CTA_PACK IS

--valide si le rct_code est utilisé dans la table CTA
FUNCTION RCT_IS_USED_ON_CTA_FUNC(
	p_rct_code IN retail_client_types.rct_code%TYPE
)
RETURN BOOLEAN;	--retourne TRUE si le code est utilisé..

--valide si le rcl_id est utilisé dans la table CTA
FUNCTION RCL_IS_USED_ON_CTA_FUNC(
	p_rcl_id IN retail_clients.rcl_id%TYPE
)
RETURN BOOLEAN;	--retourne TRUE si le code est utilisé..

END CTA_PACK;
 
/