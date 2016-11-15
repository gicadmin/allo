CREATE OR REPLACE PACKAGE phenix.ICT_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  inventory_count_transactions%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_ict_id                         IN         inventory_count_transactions.ict_id%TYPE,
  p_ict_rec                        OUT NOCOPY inventory_count_transactions%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_ict_id                         IN         inventory_count_transactions.ict_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_ict_id                         IN         inventory_count_transactions.ict_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_ict_id                         IN         inventory_count_transactions.ict_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_ict_id                         IN         inventory_count_transactions.ict_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_ict_id                         IN         inventory_count_transactions.ict_id%TYPE);


FUNCTION INSERT_FUNC(
  p_ict_prf_prd_code          IN         inventory_count_transactions.ict_prf_prd_code%TYPE,
  p_ict_prf_fmt_code          IN         inventory_count_transactions.ict_prf_fmt_code%TYPE,
  p_ict_use_code              IN         inventory_count_transactions.ict_use_code%TYPE,
  p_ict_loc_code              IN         inventory_count_transactions.ict_loc_code%TYPE,
  p_ict_start_date            IN         inventory_count_transactions.ict_start_date%TYPE,
  p_ict_end_date              IN         inventory_count_transactions.ict_end_date%TYPE,
  p_ict_whs_code              IN         inventory_count_transactions.ict_whs_code%TYPE,
  p_ict_original_quantity     IN         inventory_count_transactions.ict_original_quantity%TYPE          DEFAULT NULL,
  p_ict_count_quantity        IN         inventory_count_transactions.ict_count_quantity%TYPE             DEFAULT NULL,
  p_ict_original_weight       IN         inventory_count_transactions.ict_original_weight%TYPE            DEFAULT NULL,
  p_ict_count_weight          IN         inventory_count_transactions.ict_count_weight%TYPE               DEFAULT NULL,
  p_ict_expiry_date           IN         inventory_count_transactions.ict_expiry_date%TYPE                DEFAULT NULL,
  p_ict_cah_id                IN         inventory_count_transactions.ict_cah_id%TYPE                     DEFAULT NULL,
  p_ict_type                  IN         inventory_count_transactions.ict_type%TYPE                       DEFAULT NULL,
  p_ict_iat_code              IN         inventory_count_transactions.ict_iat_code%TYPE                   DEFAULT NULL,
  p_ict_adj_comment           IN         inventory_count_transactions.ict_adj_comment%TYPE                DEFAULT NULL,
  p_ict_ide_id                IN         inventory_count_transactions.ict_ide_id%TYPE                     DEFAULT NULL,
  p_ict_dmr_code              IN         inventory_count_transactions.ict_dmr_code%TYPE                   DEFAULT NULL,
  p_ict_trh_id                IN         inventory_count_transactions.ict_trh_id%TYPE                     DEFAULT NULL,
  p_ict_fifo_date             IN         inventory_count_transactions.ict_fifo_date%TYPE                  DEFAULT NULL,
  p_ict_quantity_left         IN         inventory_count_transactions.ict_quantity_left%TYPE              DEFAULT NULL,
  p_ict_weight_left           IN         inventory_count_transactions.ict_weight_left%TYPE                DEFAULT NULL,
  p_ict_used_inventory_switch IN         inventory_count_transactions.ict_used_inventory_switch%TYPE      DEFAULT 0 )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY inventory_count_transactions%ROWTYPE)
RETURN NUMBER;

END ICT_PACK;
/