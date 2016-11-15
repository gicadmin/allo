CREATE OR REPLACE PACKAGE phenix.VWD_OPERATION_PACK AS

FUNCTION CHECK_OPERATION_DAYS_FUNC(
  p_vwd_ven_code IN vendor_whs_delivery_days.vwd_ven_code%TYPE,
  p_vwd_whs_code IN vendor_whs_delivery_days.vwd_whs_code%TYPE
) RETURN BOOLEAN;

FUNCTION IS_VALID_DAY_FUNC(
  p_vwd_ven_code IN vendor_whs_delivery_days.vwd_ven_code%TYPE,
  p_vwd_whs_code IN vendor_whs_delivery_days.vwd_whs_code%TYPE,
  p_vwd_day      IN vendor_whs_delivery_days.vwd_day%TYPE
) RETURN BOOLEAN;

PROCEDURE GET_WHS_DELIVERY_DAYS_PROC(
  p_vwd_ven_code     IN vendor_whs_delivery_days.vwd_ven_code%TYPE,
  p_vwd_whs_code     IN vendor_whs_delivery_days.vwd_whs_code%TYPE,
  p_monday_switch    OUT NUMBER,
  p_tuesday_switch   OUT NUMBER,
  p_wednesday_switch OUT NUMBER,
  p_thursday_switch  OUT NUMBER,
  p_friday_switch    OUT NUMBER,
  p_saturday_switch  OUT NUMBER,
  p_sunday_switch    OUT NUMBER
);

PROCEDURE INSERT_WHS_DELIVERY_DAYS_PROC(
  p_vwd_ven_code     IN vendor_whs_delivery_days.vwd_ven_code%TYPE,
  p_vwd_whs_code     IN vendor_whs_delivery_days.vwd_whs_code%TYPE,
  p_monday_switch    IN NUMBER,
  p_tuesday_switch   IN NUMBER,
  p_wednesday_switch IN NUMBER,
  p_thursday_switch  IN NUMBER,
  p_friday_switch    IN NUMBER,
  p_saturday_switch  IN NUMBER,
  p_sunday_switch    IN NUMBER
);

END VWD_OPERATION_PACK;
/