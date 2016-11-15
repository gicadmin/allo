CREATE OR REPLACE PACKAGE phenix.VPH_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vendor_pick_headers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_vph_id                         IN         vendor_pick_headers.vph_id%TYPE,
  p_vph_rec                        OUT NOCOPY vendor_pick_headers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_vph_id                         IN         vendor_pick_headers.vph_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vph_id                         IN         vendor_pick_headers.vph_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_vph_id                         IN         vendor_pick_headers.vph_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_vph_id                         IN         vendor_pick_headers.vph_id%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_vph_ven_code               IN         vendor_pick_headers.vph_ven_code%TYPE,
  p_vph_date_generated         IN         vendor_pick_headers.vph_date_generated%TYPE,
  p_vph_date_confirmed         IN         vendor_pick_headers.vph_date_confirmed%TYPE,
  p_vph_number_of_packages     IN         vendor_pick_headers.vph_number_of_packages%TYPE,
  p_vph_loc_shipping_dock_code IN         vendor_pick_headers.vph_loc_shipping_dock_code%TYPE,
  p_vph_whs_picking_code       IN         vendor_pick_headers.vph_whs_picking_code%TYPE,
  p_vph_whs_delivery_code      IN         vendor_pick_headers.vph_whs_delivery_code%TYPE,
  p_vph_status                 IN         vendor_pick_headers.vph_status%TYPE                      DEFAULT NULL,
  p_vph_creation_date          IN         vendor_pick_headers.vph_creation_date%TYPE               DEFAULT NULL,
  p_vph_selected_switch        IN         vendor_pick_headers.vph_selected_switch%TYPE             DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY vendor_pick_headers%ROWTYPE)
RETURN NUMBER;

END VPH_PACK;
/