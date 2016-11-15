CREATE OR REPLACE PACKAGE phenix.VWG_PACK IS

PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vendor_warehouse_groups%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_vwg_vwh_ven_code               IN         vendor_warehouse_groups.vwg_vwh_ven_code%TYPE,
  p_vwg_vwh_whs_code               IN         vendor_warehouse_groups.vwg_vwh_whs_code%TYPE,
  p_vwg_pgr_code                   IN         vendor_warehouse_groups.vwg_pgr_code%TYPE,
  p_vwg_rec                        OUT NOCOPY vendor_warehouse_groups%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vwg_vwh_ven_code               IN         vendor_warehouse_groups.vwg_vwh_ven_code%TYPE,
  p_vwg_vwh_whs_code               IN         vendor_warehouse_groups.vwg_vwh_whs_code%TYPE,
  p_vwg_pgr_code                   IN         vendor_warehouse_groups.vwg_pgr_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_vwg_vwh_ven_code               IN         vendor_warehouse_groups.vwg_vwh_ven_code%TYPE,
  p_vwg_vwh_whs_code               IN         vendor_warehouse_groups.vwg_vwh_whs_code%TYPE,
  p_vwg_pgr_code                   IN         vendor_warehouse_groups.vwg_pgr_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_vwg_vwh_ven_code               IN         vendor_warehouse_groups.vwg_vwh_ven_code%TYPE,
  p_vwg_vwh_whs_code               IN         vendor_warehouse_groups.vwg_vwh_whs_code%TYPE,
  p_vwg_pgr_code                   IN         vendor_warehouse_groups.vwg_pgr_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vwg_vwh_ven_code               IN         vendor_warehouse_groups.vwg_vwh_ven_code%TYPE,
  p_vwg_vwh_whs_code               IN         vendor_warehouse_groups.vwg_vwh_whs_code%TYPE,
  p_vwg_pgr_code                   IN         vendor_warehouse_groups.vwg_pgr_code%TYPE);


PROCEDURE INSERT_PROC(
  p_vwg_vwh_ven_code     IN         vendor_warehouse_groups.vwg_vwh_ven_code%TYPE,
  p_vwg_vwh_whs_code     IN         vendor_warehouse_groups.vwg_vwh_whs_code%TYPE,
  p_vwg_pgr_code         IN         vendor_warehouse_groups.vwg_pgr_code%TYPE,
  p_vwg_cutoff_time      IN         vendor_warehouse_groups.vwg_cutoff_time%TYPE           DEFAULT NULL,
  p_vwg_delivery_gap     IN         vendor_warehouse_groups.vwg_delivery_gap%TYPE          DEFAULT NULL,
  p_vwg_percent_extra    IN         vendor_warehouse_groups.vwg_percent_extra%TYPE         DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY vendor_warehouse_groups%ROWTYPE);

END VWG_PACK;
/