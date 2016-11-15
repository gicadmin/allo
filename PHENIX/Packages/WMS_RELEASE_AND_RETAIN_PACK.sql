CREATE OR REPLACE PACKAGE phenix.WMS_RELEASE_AND_RETAIN_PACK IS

FUNCTION RETAIN_PRODUCT_FUNC (
  p_rra_loc_code   IN   release_and_retain_audits.rra_loc_code%TYPE,
  p_rra_use_code   IN   release_and_retain_audits.rra_use_code%TYPE,
  p_from_screen    IN   VARCHAR2 DEFAULT 'N'     --si appel à partir de WMS_DEFINE_LOCATIONS alors 'Y'
)
RETURN PLS_INTEGER;

FUNCTION RELEASE_PRODUCT_FUNC (
  p_rra_loc_code   IN   VARCHAR2,
  p_rra_use_code   IN   NUMBER,
  p_FROM_screen    IN   VARCHAR2 DEFAULT 'N'     --si appel à partir de WMS_DEFINE_LOCATIONS alors 'Y'
)
RETURN PLS_INTEGER;

FUNCTION RELEASE_RETAIN_PRODUCT_FUNC (
  p_rra_loc_code        IN   VARCHAR2,
  p_rra_use_code        IN   NUMBER,
  p_rra_retain_switch   IN   NUMBER,
  p_FROM_screen         IN   VARCHAR2 DEFAULT 'N'     --si appel à partir de WMS_DEFINE_LOCATIONS alors 'Y'
)
RETURN PLS_INTEGER;

---------------------------------------------------------------------------------------------------------------------------------------------
-- Procédure qui va mettre en retenue toute les localisations qui ne respectent pas le temps d'entreposage
PROCEDURE AUTO_RETAIN_LOCATION_PROC(
  p_jsc_id  IN  NUMBER
);

END WMS_RELEASE_AND_RETAIN_PACK;
/