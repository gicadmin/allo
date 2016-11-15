CREATE OR REPLACE PACKAGE phenix.CUM_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  customer_messages%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_cum_id                         IN         customer_messages.cum_id%TYPE,
  p_cum_rec                        OUT NOCOPY customer_messages%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_cum_id                         IN         customer_messages.cum_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_cum_id                         IN         customer_messages.cum_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_cum_id                         IN         customer_messages.cum_id%TYPE);

FUNCTION GET_FULL_FUNC(
  p_cum_cus_code                   IN         customer_messages.cum_cus_code%TYPE,
  p_cum_stm_code                   IN         customer_messages.cum_stm_code%TYPE,
  p_cum_rec                        OUT NOCOPY customer_messages%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_cum_cus_code                   IN         customer_messages.cum_cus_code%TYPE,
  p_cum_stm_code                   IN         customer_messages.cum_stm_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_cum_cus_code                   IN         customer_messages.cum_cus_code%TYPE,
  p_cum_stm_code                   IN         customer_messages.cum_stm_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_cum_cus_code                   IN         customer_messages.cum_cus_code%TYPE,
  p_cum_stm_code                   IN         customer_messages.cum_stm_code%TYPE);


FUNCTION INSERT_FUNC(
  p_cum_cus_code         IN         customer_messages.cum_cus_code%TYPE,
  p_cum_stm_code         IN         customer_messages.cum_stm_code%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY customer_messages%ROWTYPE)
RETURN NUMBER;

END CUM_PACK;
/