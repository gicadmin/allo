CREATE OR REPLACE PACKAGE phenix.SGE_GENERAL_PACK AS

FUNCTION  GET_SCALE_WEIGHT_FUNC(
  p_sca_code IN scales.sca_code%TYPE
)
RETURN NUMBER;

PROCEDURE UPDATE_UPC_CODE_PROC(
  p_prf_prd_code  IN product_formats.prf_prd_code%TYPE,
  p_prf_fmt_code  IN product_formats.prf_fmt_code%TYPE,
  p_new_upc_code  IN product_formats.prf_upc_code%TYPE
);

END SGE_GENERAL_PACK;
/