CREATE OR REPLACE PACKAGE phenix.RTD_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  receipt_transaction_details%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_rtd_id                         IN         receipt_transaction_details.rtd_id%TYPE,
  p_rtd_rec                        OUT NOCOPY receipt_transaction_details%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_rtd_id                         IN         receipt_transaction_details.rtd_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_rtd_id                         IN         receipt_transaction_details.rtd_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_rtd_id                         IN         receipt_transaction_details.rtd_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_rtd_id                         IN         receipt_transaction_details.rtd_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_rtd_id                         IN         receipt_transaction_details.rtd_id%TYPE);


FUNCTION INSERT_FUNC(
  p_rtd_rth_id                    IN         receipt_transaction_details.rtd_rth_id%TYPE,
  p_rtd_prf_prd_code              IN         receipt_transaction_details.rtd_prf_prd_code%TYPE,
  p_rtd_prf_fmt_code              IN         receipt_transaction_details.rtd_prf_fmt_code%TYPE,
  p_rtd_use_code                  IN         receipt_transaction_details.rtd_use_code%TYPE,
  p_rtd_start_date                IN         receipt_transaction_details.rtd_start_date%TYPE,
  p_rtd_damage_switch             IN         receipt_transaction_details.rtd_damage_switch%TYPE,
  p_rtd_lot_switch                IN         receipt_transaction_details.rtd_lot_switch%TYPE,
  p_rtd_trh_id                    IN         receipt_transaction_details.rtd_trh_id%TYPE                         DEFAULT NULL,
  p_rtd_original_quantity         IN         receipt_transaction_details.rtd_original_quantity%TYPE              DEFAULT NULL,
  p_rtd_received_quantity         IN         receipt_transaction_details.rtd_received_quantity%TYPE              DEFAULT NULL,
  p_rtd_received_to_date_quantit  IN         receipt_transaction_details.rtd_received_to_date_quantity%TYPE      DEFAULT NULL,
  p_rtd_original_weight           IN         receipt_transaction_details.rtd_original_weight%TYPE                DEFAULT NULL,
  p_rtd_received_weight           IN         receipt_transaction_details.rtd_received_weight%TYPE                DEFAULT NULL,
  p_rtd_received_to_date_weight   IN         receipt_transaction_details.rtd_received_to_date_weight%TYPE        DEFAULT NULL,
  p_rtd_loc_code                  IN         receipt_transaction_details.rtd_loc_code%TYPE                       DEFAULT NULL,
  p_rtd_end_date                  IN         receipt_transaction_details.rtd_end_date%TYPE                       DEFAULT NULL,
  p_rtd_expiry_date               IN         receipt_transaction_details.rtd_expiry_date%TYPE                    DEFAULT NULL,
  p_rtd_number_of_stickers        IN         receipt_transaction_details.rtd_number_of_stickers%TYPE             DEFAULT NULL,
  p_rtd_loc_quantity_on_hand      IN         receipt_transaction_details.rtd_loc_quantity_on_hand%TYPE           DEFAULT NULL,
  p_rtd_loc_weight_on_hand        IN         receipt_transaction_details.rtd_loc_weight_on_hand%TYPE             DEFAULT NULL,
  p_rtd_ide_id                    IN         receipt_transaction_details.rtd_ide_id%TYPE                         DEFAULT NULL,
  p_rtd_dmr_code                  IN         receipt_transaction_details.rtd_dmr_code%TYPE                       DEFAULT NULL,
  p_rtd_quantity_left             IN         receipt_transaction_details.rtd_quantity_left%TYPE                  DEFAULT NULL,
  p_rtd_weight_left               IN         receipt_transaction_details.rtd_weight_left%TYPE                    DEFAULT NULL,
  p_rtd_used_inventory_switch     IN         receipt_transaction_details.rtd_used_inventory_switch%TYPE          DEFAULT 0 )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY receipt_transaction_details%ROWTYPE)
RETURN NUMBER;

END RTD_PACK;
/