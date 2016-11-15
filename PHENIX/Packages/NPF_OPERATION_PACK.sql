CREATE OR REPLACE PACKAGE phenix.NPF_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
  p_npf_prf_prd_code IN nac_product_formats.npf_prf_prd_code%TYPE,
  p_npf_prf_fmt_code IN nac_product_formats.npf_prf_fmt_code%TYPE
);

END NPF_OPERATION_PACK;
/