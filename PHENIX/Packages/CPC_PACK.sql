CREATE OR REPLACE PACKAGE phenix.CPC_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  customer_product_counters%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_cpc_id                         IN         customer_product_counters.cpc_id%TYPE,
  p_cpc_rec                        OUT NOCOPY customer_product_counters%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_cpc_id                         IN         customer_product_counters.cpc_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_cpc_id                         IN         customer_product_counters.cpc_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_cpc_id                         IN         customer_product_counters.cpc_id%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_cpc_ctt_code             IN         customer_product_counters.cpc_ctt_code%TYPE,
  p_cpc_cus_code             IN         customer_product_counters.cpc_cus_code%TYPE,
  p_cpc_last_balance_date    IN         customer_product_counters.cpc_last_balance_date%TYPE,
  p_cpc_last_balance_dollars IN         customer_product_counters.cpc_last_balance_dollars%TYPE      DEFAULT NULL,
  p_cpc_last_balance_points  IN         customer_product_counters.cpc_last_balance_points%TYPE       DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY customer_product_counters%ROWTYPE)
RETURN NUMBER;

END CPC_PACK;
/