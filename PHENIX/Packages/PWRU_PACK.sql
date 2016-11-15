CREATE OR REPLACE PACKAGE phenix.PWRU_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  public_whse_receipt_users%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pwru_pwrh_id                   IN         public_whse_receipt_users.pwru_pwrh_id%TYPE,
  p_pwru_use_code                  IN         public_whse_receipt_users.pwru_use_code%TYPE,
  p_pwru_rec                       OUT NOCOPY public_whse_receipt_users%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pwru_pwrh_id                   IN         public_whse_receipt_users.pwru_pwrh_id%TYPE,
  p_pwru_use_code                  IN         public_whse_receipt_users.pwru_use_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_pwru_pwrh_id                   IN         public_whse_receipt_users.pwru_pwrh_id%TYPE,
  p_pwru_use_code                  IN         public_whse_receipt_users.pwru_use_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pwru_pwrh_id                   IN         public_whse_receipt_users.pwru_pwrh_id%TYPE,
  p_pwru_use_code                  IN         public_whse_receipt_users.pwru_use_code%TYPE);


PROCEDURE INSERT_PROC(
  p_pwru_pwrh_id         IN         public_whse_receipt_users.pwru_pwrh_id%TYPE,
  p_pwru_use_code        IN         public_whse_receipt_users.pwru_use_code%TYPE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY public_whse_receipt_users%ROWTYPE);

END PWRU_PACK;
/