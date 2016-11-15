CREATE OR REPLACE PACKAGE phenix.PIP_OPERATION_PACK AS

FUNCTION LOCK_PIP_FUNC(
  p_whs_code IN warehouses.whs_code%TYPE ,
  p_prd_code IN products.prd_code%TYPE ,
  p_fmt_code IN formats.fmt_code%TYPE
)RETURN BOOLEAN;

END PIP_OPERATION_PACK;
/