CREATE OR REPLACE PACKAGE phenix.XRG_OPERATION_PACK IS

FUNCTION GET_XRG_CODE_FUNC(
  p_cus_code IN customers.cus_code%TYPE,
  p_qty_code IN quotation_types.qty_code%TYPE
)
RETURN VARCHAR2;

END XRG_OPERATION_PACK;
/