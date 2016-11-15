CREATE OR REPLACE PACKAGE phenix.CMT_PACK IS

FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  customer_email_transactions%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_cmt_id                         IN         customer_email_transactions.cmt_id%TYPE,
  p_cmt_rec                        OUT NOCOPY customer_email_transactions%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_cmt_id                         IN         customer_email_transactions.cmt_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_cmt_id                         IN         customer_email_transactions.cmt_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_cmt_id                         IN         customer_email_transactions.cmt_id%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_cmt_cus_code         IN         customer_email_transactions.cmt_cus_code%TYPE,
  p_cmt_report_type      IN         customer_email_transactions.cmt_report_type%TYPE,
  p_cmt_email            IN         customer_email_transactions.cmt_email%TYPE,
  p_cmt_fax_number       IN         customer_email_transactions.cmt_fax_number%TYPE,
  p_cmt_transmit_method  IN         customer_email_transactions.cmt_transmit_method%TYPE       DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY customer_email_transactions%ROWTYPE)
RETURN NUMBER;

END CMT_PACK;
/