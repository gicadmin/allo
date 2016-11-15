CREATE OR REPLACE PACKAGE phenix.FBI_PACK IS

-- valide si l'utilisateur peut avoir accès à l'item spécifié
FUNCTION IF_USER_ACCESS_ITEM_FUNC(
  p_use_login      IN VARCHAR2,
  p_mni_code       IN VARCHAR2,
  p_fbi_item_name  IN VARCHAR2,
  p_fbi_block_name IN VARCHAR2
)
RETURN BOOLEAN;

END FBI_PACK;
 
/