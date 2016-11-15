CREATE OR REPLACE PACKAGE phenix.TRDT_PACK IS

FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  transfer_details%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_trd_id                         IN         transfer_details.trd_id%TYPE,
  p_trdt_rec                       OUT NOCOPY transfer_details%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_trd_id                         IN         transfer_details.trd_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_trd_id                         IN         transfer_details.trd_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_trd_id                         IN         transfer_details.trd_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_trd_id                         IN         transfer_details.trd_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_trd_id                         IN         transfer_details.trd_id%TYPE);


FUNCTION INSERT_FUNC(
  p_trd_prf_prd_code           IN         transfer_details.trd_prf_prd_code%TYPE,
  p_trd_prf_fmt_code           IN         transfer_details.trd_prf_fmt_code%TYPE,
  p_trd_whs_from_code          IN         transfer_details.trd_whs_from_code%TYPE,
  p_trd_whs_to_code            IN         transfer_details.trd_whs_to_code%TYPE,
  p_trd_creation_source        IN         transfer_details.trd_creation_source%TYPE,
  p_trd_creation_date          IN         transfer_details.trd_creation_date%TYPE,
  p_trd_expected_shipping_date IN         transfer_details.trd_expected_shipping_date%TYPE,
  p_trd_trh_id                 IN         transfer_details.trd_trh_id%TYPE                      DEFAULT NULL,
  p_trd_line_number            IN         transfer_details.trd_line_number%TYPE                 DEFAULT NULL,
  p_trd_requested_quantity     IN         transfer_details.trd_requested_quantity%TYPE          DEFAULT NULL,
  p_trd_requested_weight       IN         transfer_details.trd_requested_weight%TYPE            DEFAULT NULL,
  p_trd_picked_quantity        IN         transfer_details.trd_picked_quantity%TYPE             DEFAULT NULL,
  p_trd_picked_weight          IN         transfer_details.trd_picked_weight%TYPE               DEFAULT NULL,
  p_trd_received_quantity      IN         transfer_details.trd_received_quantity%TYPE           DEFAULT NULL,
  p_trd_received_weight        IN         transfer_details.trd_received_weight%TYPE             DEFAULT NULL,
  p_trd_cost_price             IN         transfer_details.trd_cost_price%TYPE                  DEFAULT NULL,
  p_trd_authorized_quantity    IN         transfer_details.trd_authorized_quantity%TYPE         DEFAULT NULL,
  p_trd_authorized_weight      IN         transfer_details.trd_authorized_weight%TYPE           DEFAULT NULL,
  p_trd_use_picker_code        IN         transfer_details.trd_use_picker_code%TYPE             DEFAULT NULL,
  p_trd_use_reception_code     IN         transfer_details.trd_use_reception_code%TYPE          DEFAULT NULL,
  p_trd_poh_id                 IN         transfer_details.trd_poh_id%TYPE                      DEFAULT NULL,
  p_trd_loc_code               IN         transfer_details.trd_loc_code%TYPE                    DEFAULT NULL,
  p_trd_use_po_recept_code     IN         transfer_details.trd_use_po_recept_code%TYPE          DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY transfer_details%ROWTYPE)
RETURN NUMBER;

END TRDT_PACK;
/