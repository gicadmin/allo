CREATE OR REPLACE PACKAGE phenix.WOD_OPERATION_PACK AS

FUNCTION IS_VALID_DAY_FUNC(
  p_wod_whs_code  IN warehouse_operation_days.wod_whs_code%TYPE,
  p_wod_operation IN warehouse_operation_days.wod_operation%TYPE,
  p_wod_day       IN warehouse_operation_days.wod_day%TYPE
)
RETURN BOOLEAN;

FUNCTION COUNT_OPERATION_DAYS_FUNC(
  p_wod_whs_code  IN warehouse_operation_days.wod_whs_code%TYPE,
  p_wod_operation IN warehouse_operation_days.wod_operation%TYPE
)
RETURN NUMBER;

FUNCTION CHECK_OPERATION_DAYS_FUNC(
  p_wod_whs_code  IN warehouse_operation_days.wod_whs_code%TYPE,
  p_wod_operation IN warehouse_operation_days.wod_operation%TYPE
) RETURN BOOLEAN;

FUNCTION COUNT_OPERATION_DAYS_FUNC(
  p_wod_whs_code  IN warehouse_operation_days.wod_whs_code%TYPE,
  p_wod_operation IN warehouse_operation_days.wod_operation%TYPE,
  p_from_date     IN DATE,
  p_to_date       IN DATE
) RETURN NUMBER;

FUNCTION FIND_NEXT_OPERATION_DATE_FUNC(
  p_wod_whs_code  IN warehouse_operation_days.wod_whs_code%TYPE,
  p_wod_operation IN warehouse_operation_days.wod_operation%TYPE,
  p_date          IN DATE,
  p_days          IN NUMBER
) RETURN DATE;

FUNCTION CALC_OPERATION_DAYS_FUNC(
  p_wod_whs_code  IN warehouse_operation_days.wod_whs_code%TYPE,
  p_wod_operation IN warehouse_operation_days.wod_operation%TYPE
) RETURN NUMBER;

PROCEDURE GET_WHS_OPERATION_DAYS_PROC(
  p_wod_whs_code     IN warehouse_operation_days.wod_whs_code%TYPE,
  p_wod_operation    IN warehouse_operation_days.wod_operation%TYPE,
  p_monday_switch    OUT NUMBER,
  p_tuesday_switch   OUT NUMBER,
  p_wednesday_switch OUT NUMBER,
  p_thursday_switch  OUT NUMBER,
  p_friday_switch    OUT NUMBER,
  p_saturday_switch  OUT NUMBER,
  p_sunday_switch    OUT NUMBER
);

PROCEDURE INSERT_WHS_OPERATION_DAYS_PROC(
  p_wod_whs_code     IN warehouse_operation_days.wod_whs_code%TYPE,
  p_wod_operation    IN warehouse_operation_days.wod_operation%TYPE,
  p_monday_switch    IN NUMBER,
  p_tuesday_switch   IN NUMBER,
  p_wednesday_switch IN NUMBER,
  p_thursday_switch  IN NUMBER,
  p_friday_switch    IN NUMBER,
  p_saturday_switch  IN NUMBER,
  p_sunday_switch    IN NUMBER
);

END WOD_OPERATION_PACK;
/