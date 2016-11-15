CREATE OR REPLACE PACKAGE phenix.CRE_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  cash_registers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_cre_code                       IN         cash_registers.cre_code%TYPE,
  p_cre_rec                        OUT NOCOPY cash_registers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_cre_code                       IN         cash_registers.cre_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_cre_code                       IN         cash_registers.cre_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_cre_code                       IN         cash_registers.cre_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_cre_code                       IN         cash_registers.cre_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_cre_code                       IN         cash_registers.cre_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_cre_code                       IN         cash_registers.cre_code%TYPE);


PROCEDURE INSERT_PROC(
  p_cre_code              IN         cash_registers.cre_code%TYPE,
  p_cre_description       IN         cash_registers.cre_description%TYPE,
  p_cre_whs_code          IN         cash_registers.cre_whs_code%TYPE,
  p_cre_alt_description   IN         cash_registers.cre_alt_description%TYPE        DEFAULT NULL,
  p_cre_prn_id            IN         cash_registers.cre_prn_id%TYPE                 DEFAULT NULL,
  p_cre_drawer_prn_id     IN         cash_registers.cre_drawer_prn_id%TYPE          DEFAULT NULL,
  p_cre_latest_open_date  IN         cash_registers.cre_latest_open_date%TYPE       DEFAULT NULL,
  p_cre_latest_close_date IN         cash_registers.cre_latest_close_date%TYPE      DEFAULT NULL,
  p_cre_latest_use_code   IN         cash_registers.cre_latest_use_code%TYPE        DEFAULT NULL,
  p_cre_open_switch       IN         cash_registers.cre_open_switch%TYPE            DEFAULT 0 ,
  p_cre_actual_amount     IN         cash_registers.cre_actual_amount%TYPE          DEFAULT 0 ,
  p_cre_limit_amount_flag IN         cash_registers.cre_limit_amount_flag%TYPE      DEFAULT 'N' );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY cash_registers%ROWTYPE);

END CRE_PACK;
/