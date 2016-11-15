CREATE OR REPLACE PACKAGE phenix.VWD_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vendor_whs_delivery_days%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_vwd_ven_code                   IN         vendor_whs_delivery_days.vwd_ven_code%TYPE,
  p_vwd_whs_code                   IN         vendor_whs_delivery_days.vwd_whs_code%TYPE,
  p_vwd_day                        IN         vendor_whs_delivery_days.vwd_day%TYPE,
  p_vwd_rec                        OUT NOCOPY vendor_whs_delivery_days%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vwd_ven_code                   IN         vendor_whs_delivery_days.vwd_ven_code%TYPE,
  p_vwd_whs_code                   IN         vendor_whs_delivery_days.vwd_whs_code%TYPE,
  p_vwd_day                        IN         vendor_whs_delivery_days.vwd_day%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_vwd_ven_code                   IN         vendor_whs_delivery_days.vwd_ven_code%TYPE,
  p_vwd_whs_code                   IN         vendor_whs_delivery_days.vwd_whs_code%TYPE,
  p_vwd_day                        IN         vendor_whs_delivery_days.vwd_day%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_vwd_ven_code                   IN         vendor_whs_delivery_days.vwd_ven_code%TYPE,
  p_vwd_whs_code                   IN         vendor_whs_delivery_days.vwd_whs_code%TYPE,
  p_vwd_day                        IN         vendor_whs_delivery_days.vwd_day%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vwd_ven_code                   IN         vendor_whs_delivery_days.vwd_ven_code%TYPE,
  p_vwd_whs_code                   IN         vendor_whs_delivery_days.vwd_whs_code%TYPE,
  p_vwd_day                        IN         vendor_whs_delivery_days.vwd_day%TYPE);


PROCEDURE INSERT_PROC(
  p_vwd_ven_code         IN         vendor_whs_delivery_days.vwd_ven_code%TYPE,
  p_vwd_whs_code         IN         vendor_whs_delivery_days.vwd_whs_code%TYPE,
  p_vwd_day              IN         vendor_whs_delivery_days.vwd_day%TYPE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY vendor_whs_delivery_days%ROWTYPE);

END VWD_PACK;
/