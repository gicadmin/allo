CREATE OR REPLACE PACKAGE phenix.PCT_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  product_counters%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pct_id                         IN         product_counters.pct_id%TYPE,
  p_pct_rec                        OUT NOCOPY product_counters%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_pct_id                         IN         product_counters.pct_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pct_id                         IN         product_counters.pct_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pct_id                         IN         product_counters.pct_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pct_id                         IN         product_counters.pct_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pct_id                         IN         product_counters.pct_id%TYPE);


FUNCTION INSERT_FUNC(
  p_pct_ctt_code         IN         product_counters.pct_ctt_code%TYPE,
  p_pct_fmt_code         IN         product_counters.pct_fmt_code%TYPE,
  p_pct_dollar_switch    IN         product_counters.pct_dollar_switch%TYPE,
  p_pct_end_date         IN         product_counters.pct_end_date%TYPE,
  p_pct_rebate_amount    IN         product_counters.pct_rebate_amount%TYPE,
  p_pct_start_date       IN         product_counters.pct_start_date%TYPE,
  p_pct_prd_code         IN         product_counters.pct_prd_code%TYPE              DEFAULT NULL,
  p_pct_pgr_code         IN         product_counters.pct_pgr_code%TYPE              DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY product_counters%ROWTYPE)
RETURN NUMBER;

END PCT_PACK;
/