CREATE OR REPLACE PACKAGE phenix.TPA_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  temporary_pallets%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_tpa_id                         IN         temporary_pallets.tpa_id%TYPE,
  p_tpa_rec                        OUT NOCOPY temporary_pallets%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_tpa_id                         IN         temporary_pallets.tpa_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_tpa_id                         IN         temporary_pallets.tpa_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_tpa_id                         IN         temporary_pallets.tpa_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_tpa_id                         IN         temporary_pallets.tpa_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_tpa_id                         IN         temporary_pallets.tpa_id%TYPE);


FUNCTION INSERT_FUNC(
  p_tpa_pmh_id            IN         temporary_pallets.tpa_pmh_id%TYPE,
  p_tpa_whz_code          IN         temporary_pallets.tpa_whz_code%TYPE,
  p_tpa_cus_code          IN         temporary_pallets.tpa_cus_code%TYPE,
  p_tpa_route_date        IN         temporary_pallets.tpa_route_date%TYPE,
  p_tpa_rou_code          IN         temporary_pallets.tpa_rou_code%TYPE,
  p_tpa_route_position    IN         temporary_pallets.tpa_route_position%TYPE,
  p_tpa_whs_delivery_code IN         temporary_pallets.tpa_whs_delivery_code%TYPE,
  p_tpa_whs_picking_code  IN         temporary_pallets.tpa_whs_picking_code%TYPE,
  p_tpa_overstock_switch  IN         temporary_pallets.tpa_overstock_switch%TYPE,
  p_tpa_expected_volume   IN         temporary_pallets.tpa_expected_volume%TYPE,
  p_tpa_sid_id            IN         temporary_pallets.tpa_sid_id%TYPE,
  p_tpa_cgr_code          IN         temporary_pallets.tpa_cgr_code%TYPE               DEFAULT NULL,
  p_tpa_pty_code          IN         temporary_pallets.tpa_pty_code%TYPE               DEFAULT NULL,
  p_tpa_temp_pallet_id    IN         temporary_pallets.tpa_temp_pallet_id%TYPE         DEFAULT NULL,
  p_tpa_from_seq          IN         temporary_pallets.tpa_from_seq%TYPE               DEFAULT NULL,
  p_tpa_prw_whz_code      IN         temporary_pallets.tpa_prw_whz_code%TYPE           DEFAULT NULL,
  p_tpa_manual_switch     IN         temporary_pallets.tpa_manual_switch%TYPE          DEFAULT 0 ,
  p_tpa_selected_switch   IN         temporary_pallets.tpa_selected_switch%TYPE        DEFAULT 0 )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY temporary_pallets%ROWTYPE)
RETURN NUMBER;

END TPA_PACK;
/