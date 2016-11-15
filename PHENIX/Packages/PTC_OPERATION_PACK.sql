CREATE OR REPLACE PACKAGE phenix.PTC_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
  p_ptc_prf_prd_code IN product_formats.prf_prd_code%TYPE,
  p_ptc_prf_fmt_code IN product_formats.prf_fmt_code%TYPE
);

END PTC_OPERATION_PACK;
/