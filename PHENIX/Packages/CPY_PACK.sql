CREATE OR REPLACE PACKAGE phenix.CPY_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  customer_promotion_types%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_cpy_id                         IN         customer_promotion_types.cpy_id%TYPE,
  p_cpy_rec                        OUT NOCOPY customer_promotion_types%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_cpy_id                         IN         customer_promotion_types.cpy_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_cpy_id                         IN         customer_promotion_types.cpy_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_cpy_id                         IN         customer_promotion_types.cpy_id%TYPE);


FUNCTION INSERT_FUNC(
  p_cpy_pty_code                   IN         customer_promotion_types.cpy_pty_code%TYPE,
  p_cpy_decline_method_switch      IN         customer_promotion_types.cpy_decline_method_switch%TYPE,
  p_cpy_cus_code                   IN         customer_promotion_types.cpy_cus_code%TYPE                        DEFAULT NULL,
  p_cpy_nac_code                   IN         customer_promotion_types.cpy_nac_code%TYPE                        DEFAULT NULL,
  p_cpy_qty_code                   IN         customer_promotion_types.cpy_qty_code%TYPE                        DEFAULT NULL,
  p_cpy_cgr_code                   IN         customer_promotion_types.cpy_cgr_code%TYPE                        DEFAULT NULL,
  p_cpy_promotion_as_credit_swit   IN         customer_promotion_types.cpy_promotion_as_credit_switch%TYPE      DEFAULT 0 )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY customer_promotion_types%ROWTYPE)
RETURN NUMBER;

END CPY_PACK;
/