CREATE OR REPLACE PACKAGE phenix.VMT_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vendor_email_transactions%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_vmt_id                         IN         vendor_email_transactions.vmt_id%TYPE,
  p_vmt_rec                        OUT NOCOPY vendor_email_transactions%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vmt_id                         IN         vendor_email_transactions.vmt_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_vmt_id                         IN         vendor_email_transactions.vmt_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_vmt_id                         IN         vendor_email_transactions.vmt_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vmt_id                         IN         vendor_email_transactions.vmt_id%TYPE);


FUNCTION INSERT_FUNC(
  p_vmt_ven_code         IN         vendor_email_transactions.vmt_ven_code%TYPE,
  p_vmt_report_type      IN         vendor_email_transactions.vmt_report_type%TYPE,
  p_vmt_email            IN         vendor_email_transactions.vmt_email%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY vendor_email_transactions%ROWTYPE)
RETURN NUMBER;

END VMT_PACK;
/