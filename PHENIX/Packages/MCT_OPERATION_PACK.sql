CREATE OR REPLACE PACKAGE phenix.MCT_OPERATION_PACK IS

FUNCTION FIND_GL_ACCOUNT_FUNC(
  p_mct_code  IN miscellaneous_charge_types.mct_code%TYPE,
  p_whs_code  IN warehouses.whs_code%TYPE
)
RETURN VARCHAR2;

END MCT_OPERATION_PACK;
/