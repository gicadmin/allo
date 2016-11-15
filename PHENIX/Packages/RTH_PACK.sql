CREATE OR REPLACE PACKAGE phenix.RTH_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  receipt_transaction_headers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_rth_id                         IN         receipt_transaction_headers.rth_id%TYPE,
  p_rth_rec                        OUT NOCOPY receipt_transaction_headers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_rth_id                         IN         receipt_transaction_headers.rth_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_rth_id                         IN         receipt_transaction_headers.rth_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_rth_id                         IN         receipt_transaction_headers.rth_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_rth_id                         IN         receipt_transaction_headers.rth_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_rth_id                         IN         receipt_transaction_headers.rth_id%TYPE);


FUNCTION INSERT_FUNC(
  p_rth_type              IN         receipt_transaction_headers.rth_type%TYPE,
  p_rth_whs_code          IN         receipt_transaction_headers.rth_whs_code%TYPE,
  p_rth_date              IN         receipt_transaction_headers.rth_date%TYPE                   DEFAULT NULL,
  p_rth_truck_temperature IN         receipt_transaction_headers.rth_truck_temperature%TYPE      DEFAULT NULL,
  p_rth_tkc_code          IN         receipt_transaction_headers.rth_tkc_code%TYPE               DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY receipt_transaction_headers%ROWTYPE)
RETURN NUMBER;

END RTH_PACK;
/