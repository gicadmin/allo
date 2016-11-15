CREATE OR REPLACE PACKAGE phenix.RED_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  replenishment_details%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_red_id                         IN         replenishment_details.red_id%TYPE,
  p_red_rec                        OUT NOCOPY replenishment_details%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_red_id                         IN         replenishment_details.red_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_red_id                         IN         replenishment_details.red_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_red_id                         IN         replenishment_details.red_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_red_id                         IN         replenishment_details.red_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_red_id                         IN         replenishment_details.red_id%TYPE);


FUNCTION INSERT_FUNC(
  p_red_rep_id                     IN         replenishment_details.red_rep_id%TYPE,
  p_red_to_loc_code                IN         replenishment_details.red_to_loc_code%TYPE,
  p_red_prf_prd_code               IN         replenishment_details.red_prf_prd_code%TYPE,
  p_red_prf_fmt_code               IN         replenishment_details.red_prf_fmt_code%TYPE,
  p_red_status                     IN         replenishment_details.red_status%TYPE,
  p_red_conversion_to_source       IN         replenishment_details.red_conversion_to_source%TYPE,
  p_red_source_suggested_quantit   IN         replenishment_details.red_source_suggested_quantity%TYPE       DEFAULT NULL,
  p_red_source_suggested_weight    IN         replenishment_details.red_source_suggested_weight%TYPE         DEFAULT NULL,
  p_red_source_required_quantity   IN         replenishment_details.red_source_required_quantity%TYPE        DEFAULT NULL,
  p_red_source_required_weight     IN         replenishment_details.red_source_required_weight%TYPE          DEFAULT NULL,
  p_red_source_taken_quantity      IN         replenishment_details.red_source_taken_quantity%TYPE           DEFAULT NULL,
  p_red_source_taken_weight        IN         replenishment_details.red_source_taken_weight%TYPE             DEFAULT NULL,
  p_red_result_suggested_quantit   IN         replenishment_details.red_result_suggested_quantity%TYPE       DEFAULT NULL,
  p_red_result_suggested_weight    IN         replenishment_details.red_result_suggested_weight%TYPE         DEFAULT NULL,
  p_red_result_required_quantity   IN         replenishment_details.red_result_required_quantity%TYPE        DEFAULT NULL,
  p_red_result_required_weight     IN         replenishment_details.red_result_required_weight%TYPE          DEFAULT NULL,
  p_red_result_unassigned_quanti   IN         replenishment_details.red_result_unassigned_quantity%TYPE      DEFAULT NULL,
  p_red_result_unassigned_weight   IN         replenishment_details.red_result_unassigned_weight%TYPE        DEFAULT NULL,
  p_red_result_taken_quantity      IN         replenishment_details.red_result_taken_quantity%TYPE           DEFAULT NULL,
  p_red_result_taken_weight        IN         replenishment_details.red_result_taken_weight%TYPE             DEFAULT NULL,
  p_red_validate_inventory_switc   IN         replenishment_details.red_validate_inventory_switch%TYPE       DEFAULT 0 ,
  p_red_creation_date              IN         replenishment_details.red_creation_date%TYPE                   DEFAULT SYSDATE ,
  p_red_modification_date          IN         replenishment_details.red_modification_date%TYPE               DEFAULT SYSDATE )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY replenishment_details%ROWTYPE)
RETURN NUMBER;

END RED_PACK;
/