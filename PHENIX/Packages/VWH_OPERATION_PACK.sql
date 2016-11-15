CREATE OR REPLACE PACKAGE phenix.VWH_OPERATION_PACK AS

FUNCTION FIND_VWH_DELIVERY_DATE_FUNC(
  p_vwh_ven_code IN vendor_warehouses.vwh_ven_code%TYPE,
  p_vwh_whs_code IN vendor_warehouses.vwh_whs_code%TYPE,
  p_date         IN DATE,
  p_days         IN NUMBER
)
RETURN DATE;

PROCEDURE ADD_ALL_WAREHOUSES_PROC(
  p_ven_code IN vendors.ven_code%TYPE
);

FUNCTION LOCK_VWH_FUNC(
  p_ven_code  IN vendor_warehouses.vwh_ven_code%TYPE,
  p_whs_code  IN vendor_warehouses.vwh_whs_code%TYPE
) RETURN BOOLEAN;

END VWH_OPERATION_PACK;
/