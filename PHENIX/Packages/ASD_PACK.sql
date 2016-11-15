CREATE OR REPLACE PACKAGE phenix.ASD_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  account_statement_details%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_asd_id                         IN         account_statement_details.asd_id%TYPE,
  p_asd_rec                        OUT NOCOPY account_statement_details%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_asd_id                         IN         account_statement_details.asd_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_asd_id                         IN         account_statement_details.asd_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_asd_id                         IN         account_statement_details.asd_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_asd_id                         IN         account_statement_details.asd_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_asd_id                         IN         account_statement_details.asd_id%TYPE);


FUNCTION INSERT_FUNC(
  p_asd_ash_id                 IN         account_statement_details.asd_ash_id%TYPE,
  p_asd_invoice_number         IN         account_statement_details.asd_invoice_number%TYPE,
  p_asd_invoice_date           IN         account_statement_details.asd_invoice_date%TYPE,
  p_asd_invoice_type           IN         account_statement_details.asd_invoice_type%TYPE,
  p_asd_balance_due_amount     IN         account_statement_details.asd_balance_due_amount%TYPE,
  p_asd_federal_tax_amount     IN         account_statement_details.asd_federal_tax_amount%TYPE,
  p_asd_provincial_tax_amount  IN         account_statement_details.asd_provincial_tax_amount%TYPE,
  p_asd_due_date               IN         account_statement_details.asd_due_date%TYPE,
  p_asd_partial_payment_switch IN         account_statement_details.asd_partial_payment_switch%TYPE      DEFAULT 0 )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY account_statement_details%ROWTYPE)
RETURN NUMBER;

END ASD_PACK;
/