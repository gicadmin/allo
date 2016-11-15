CREATE OR REPLACE PACKAGE phenix.WOD_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  warehouse_operation_days%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_wod_whs_code                   IN         warehouse_operation_days.wod_whs_code%TYPE,
  p_wod_day                        IN         warehouse_operation_days.wod_day%TYPE,
  p_wod_operation                  IN         warehouse_operation_days.wod_operation%TYPE,
  p_wod_rec                        OUT NOCOPY warehouse_operation_days%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_wod_whs_code                   IN         warehouse_operation_days.wod_whs_code%TYPE,
  p_wod_day                        IN         warehouse_operation_days.wod_day%TYPE,
  p_wod_operation                  IN         warehouse_operation_days.wod_operation%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_wod_whs_code                   IN         warehouse_operation_days.wod_whs_code%TYPE,
  p_wod_day                        IN         warehouse_operation_days.wod_day%TYPE,
  p_wod_operation                  IN         warehouse_operation_days.wod_operation%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_wod_whs_code                   IN         warehouse_operation_days.wod_whs_code%TYPE,
  p_wod_day                        IN         warehouse_operation_days.wod_day%TYPE,
  p_wod_operation                  IN         warehouse_operation_days.wod_operation%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_wod_whs_code                   IN         warehouse_operation_days.wod_whs_code%TYPE,
  p_wod_day                        IN         warehouse_operation_days.wod_day%TYPE,
  p_wod_operation                  IN         warehouse_operation_days.wod_operation%TYPE);


PROCEDURE INSERT_PROC(
  p_wod_whs_code         IN         warehouse_operation_days.wod_whs_code%TYPE,
  p_wod_day              IN         warehouse_operation_days.wod_day%TYPE,
  p_wod_operation        IN         warehouse_operation_days.wod_operation%TYPE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY warehouse_operation_days%ROWTYPE);

END WOD_PACK;
/