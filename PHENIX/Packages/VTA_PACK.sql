CREATE OR REPLACE PACKAGE phenix.VTA_PACK IS

--valide si le rct_code est utilisé dans la table VTA
FUNCTION RCT_IS_USED_ON_VTA_FUNC(
	p_rct_code IN retail_client_types.rct_code%TYPE
)
RETURN BOOLEAN;	--retourne TRUE si le code est utilisé..

END VTA_PACK;
 
/