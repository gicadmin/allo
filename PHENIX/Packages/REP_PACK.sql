CREATE OR REPLACE PACKAGE phenix.REP_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  replenishments%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_rep_id                         IN         replenishments.rep_id%TYPE,
  p_rep_rec                        OUT NOCOPY replenishments%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_rep_id                         IN         replenishments.rep_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_rep_id                         IN         replenishments.rep_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_rep_id                         IN         replenishments.rep_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_rep_id                         IN         replenishments.rep_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_rep_id                         IN         replenishments.rep_id%TYPE);


FUNCTION INSERT_FUNC(
  p_rep_from_loc_code     IN         replenishments.rep_from_loc_code%TYPE,
  p_rep_prf_prd_code      IN         replenishments.rep_prf_prd_code%TYPE,
  p_rep_prf_fmt_code      IN         replenishments.rep_prf_fmt_code%TYPE,
  p_rep_priority          IN         replenishments.rep_priority%TYPE,
  p_rep_planned_switch    IN         replenishments.rep_planned_switch%TYPE,
  p_rep_status            IN         replenishments.rep_status%TYPE,
  p_rep_whs_code          IN         replenishments.rep_whs_code%TYPE,
  p_rep_quantity          IN         replenishments.rep_quantity%TYPE               DEFAULT NULL,
  p_rep_weight            IN         replenishments.rep_weight%TYPE                 DEFAULT NULL,
  p_rep_use_code          IN         replenishments.rep_use_code%TYPE               DEFAULT NULL,
  p_rep_creation_date     IN         replenishments.rep_creation_date%TYPE          DEFAULT NULL,
  p_rep_quantity_required IN         replenishments.rep_quantity_required%TYPE      DEFAULT NULL,
  p_rep_weight_required   IN         replenishments.rep_weight_required%TYPE        DEFAULT NULL,
  p_rep_taken_quantity    IN         replenishments.rep_taken_quantity%TYPE         DEFAULT NULL,
  p_rep_taken_weight      IN         replenishments.rep_taken_weight%TYPE           DEFAULT NULL,
  p_rep_selected_switch   IN         replenishments.rep_selected_switch%TYPE        DEFAULT 0 )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY replenishments%ROWTYPE)
RETURN NUMBER;

END REP_PACK;
/