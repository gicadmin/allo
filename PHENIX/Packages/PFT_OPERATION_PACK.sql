CREATE OR REPLACE PACKAGE phenix.PFT_OPERATION_PACK IS

FUNCTION DO_RESULT_AUTO_PRF_EXISTS_FUNC(
	p_prf_prd_code              IN product_format_transformations.pft_resulting_prf_prd_code%TYPE,
	p_prf_fmt_code              IN product_format_transformations.pft_resulting_prf_fmt_code%TYPE,
	p_pft_replenishment_switch  IN product_format_transformations.pft_replenishment_switch%TYPE
)
RETURN BOOLEAN;

FUNCTION FIND_PFT_CONV_FACTOR_FUNC(
  p_source_prd_code       IN products.prd_code%TYPE,
  p_source_fmt_code       IN formats.fmt_code%TYPE,
  p_result_prd_code       IN products.prd_code%TYPE,
  p_result_fmt_code       IN formats.fmt_code%TYPE
) RETURN NUMBER;

PROCEDURE TRANSFORM_FOR_PLANNED_PROC(
  p_prd_code                      IN VARCHAR2,    --produit a réapprovisionner
  p_prf_fmt_code                  IN VARCHAR2,    --format à réapprovisionner
  p_loc_code                      IN VARCHAR2,    --loc à réapprovisionner
  p_whs_code                      IN VARCHAR2,    --entrepot concerné
  p_prd_result_definition         IN VARCHAR2,  --definition du produit à réapprovisionner
  p_rep_status                    IN VARCHAR2 DEFAULT 'C',
  p_validate_inventory_switch     IN NUMBER DEFAULT 0,  --switch a mettre à jour sur les nouveaux RED créés...
  p_qty_wgt_still_missing         IN OUT NUMBER,  --qté/poids restant à trouver (au format de destination)..
  p_nbr_replenishment             IN OUT NUMBER   --retourner le nouveau nombre si on a inséré..
);

PROCEDURE PURGE_PROC(
  p_pft_prf_prd_code IN product_formats.prf_prd_code%TYPE,
  p_pft_prf_fmt_code IN product_formats.prf_fmt_code%TYPE
);

--BER6613 nouvelle fonction pour trouver le facteur déjà existant sur la ligne de transformation
FUNCTION FIND_EXISTING_CONV_FACTOR_FUNC(
  p_source_prd_code       IN products.prd_code%TYPE,
  p_source_fmt_code       IN formats.fmt_code%TYPE,
  p_result_prd_code       IN products.prd_code%TYPE,
  p_result_fmt_code       IN formats.fmt_code%TYPE
) RETURN NUMBER;

END PFT_OPERATION_PACK;
/