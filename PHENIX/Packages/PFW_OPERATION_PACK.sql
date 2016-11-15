CREATE OR REPLACE PACKAGE phenix.PFW_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
  p_pfw_prf_prd_code IN product_format_warehouses.pfw_prf_prd_code%TYPE,
  p_pfw_prf_fmt_code IN product_format_warehouses.pfw_prf_fmt_code%TYPE
);

PROCEDURE ADD_ALL_WAREHOUSES_PROC(
  p_prf_prd_code         IN product_formats.prf_prd_code%TYPE,
  p_prf_fmt_code         IN product_formats.prf_fmt_code%TYPE,
  p_prd_default_whz_code IN products.prd_default_whz_code%TYPE
);

END PFW_OPERATION_PACK;
/