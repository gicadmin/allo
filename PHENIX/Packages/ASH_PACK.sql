CREATE OR REPLACE PACKAGE phenix.ASH_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  account_statement_headers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_ash_id                         IN         account_statement_headers.ash_id%TYPE,
  p_ash_rec                        OUT NOCOPY account_statement_headers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_ash_id                         IN         account_statement_headers.ash_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_ash_id                         IN         account_statement_headers.ash_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_ash_id                         IN         account_statement_headers.ash_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_ash_id                         IN         account_statement_headers.ash_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_ash_id                         IN         account_statement_headers.ash_id%TYPE);

FUNCTION GET_FULL_FUNC(
  p_ash_accpac_id                  IN         account_statement_headers.ash_accpac_id%TYPE,
  p_ash_cus_code                   IN         account_statement_headers.ash_cus_code%TYPE,
  p_ash_rec                        OUT NOCOPY account_statement_headers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_ash_accpac_id                  IN         account_statement_headers.ash_accpac_id%TYPE,
  p_ash_cus_code                   IN         account_statement_headers.ash_cus_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_ash_accpac_id                  IN         account_statement_headers.ash_accpac_id%TYPE,
  p_ash_cus_code                   IN         account_statement_headers.ash_cus_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_ash_accpac_id                  IN         account_statement_headers.ash_accpac_id%TYPE,
  p_ash_cus_code                   IN         account_statement_headers.ash_cus_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_ash_accpac_id                  IN         account_statement_headers.ash_accpac_id%TYPE,
  p_ash_cus_code                   IN         account_statement_headers.ash_cus_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_ash_accpac_id                  IN         account_statement_headers.ash_accpac_id%TYPE,
  p_ash_cus_code                   IN         account_statement_headers.ash_cus_code%TYPE);


FUNCTION INSERT_FUNC(
  p_ash_accpac_id               IN         account_statement_headers.ash_accpac_id%TYPE,
  p_ash_cus_code                IN         account_statement_headers.ash_cus_code%TYPE,
  p_ash_generation_date         IN         account_statement_headers.ash_generation_date%TYPE,
  p_ash_current_amount          IN         account_statement_headers.ash_current_amount%TYPE,
  p_ash_past_due_8_14_amount    IN         account_statement_headers.ash_past_due_8_14_amount%TYPE,
  p_ash_past_due_15_21_amount   IN         account_statement_headers.ash_past_due_15_21_amount%TYPE,
  p_ash_past_due_over_21_amount IN         account_statement_headers.ash_past_due_over_21_amount%TYPE,
  p_ash_cus_term_description    IN         account_statement_headers.ash_cus_term_description%TYPE         DEFAULT NULL,
  p_ash_communication_date      IN         account_statement_headers.ash_communication_date%TYPE           DEFAULT NULL,
  p_ash_recipient_code          IN         account_statement_headers.ash_recipient_code%TYPE               DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY account_statement_headers%ROWTYPE)
RETURN NUMBER;

END ASH_PACK;
/