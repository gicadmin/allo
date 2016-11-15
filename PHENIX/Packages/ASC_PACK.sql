CREATE OR REPLACE PACKAGE phenix.ASC_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  account_statements%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_asc_id                         IN         account_statements.asc_id%TYPE,
  p_asc_rec                        OUT NOCOPY account_statements%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_asc_id                         IN         account_statements.asc_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_asc_id                         IN         account_statements.asc_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_asc_id                         IN         account_statements.asc_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_asc_id                         IN         account_statements.asc_id%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_asc_cus_code         IN         account_statements.asc_cus_code%TYPE,
  p_asc_from_date        IN         account_statements.asc_from_date%TYPE,
  p_asc_to_date          IN         account_statements.asc_to_date%TYPE,
  p_asc_whs_code         IN         account_statements.asc_whs_code%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY account_statements%ROWTYPE)
RETURN NUMBER;

END ASC_PACK;
/