CREATE OR REPLACE PACKAGE phenix.WHS_OPERATION_PACK IS


FUNCTION FIND_WHS_FROM_MEMBER_ID_FUNC(
  p_whs_member_id       IN NUMBER,
  p_too_many_whs_switch OUT NUMBER
)
RETURN VARCHAR2;

FUNCTION CHECK_OPERATION_DAYS_FUNC(
  p_whs_code  OUT warehouses.whs_code%TYPE,
  p_operation OUT warehouse_operation_days.wod_operation%TYPE
)
RETURN BOOLEAN;

FUNCTION LOCK_WHS_FUNC(
  p_whs_code  IN warehouses.whs_code%TYPE
)
RETURN BOOLEAN;

FUNCTION HAS_VCT_DEFAULT_PRICE_FUNC(
  p_vct_code  vendor_credit_types.vct_code%TYPE
)
RETURN BOOLEAN;

FUNCTION HAS_VCT_DEFAULT_QTY_FUNC(
  p_vct_code  vendor_credit_types.vct_code%TYPE
)
RETURN BOOLEAN;

END WHS_OPERATION_PACK;
/