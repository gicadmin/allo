CREATE OR REPLACE PACKAGE phenix.ULP_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  user_last_passwords%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_ulp_id                         IN         user_last_passwords.ulp_id%TYPE,
  p_ulp_rec                        OUT NOCOPY user_last_passwords%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_ulp_id                         IN         user_last_passwords.ulp_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_ulp_id                         IN         user_last_passwords.ulp_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_ulp_id                         IN         user_last_passwords.ulp_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_ulp_id                         IN         user_last_passwords.ulp_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_ulp_id                         IN         user_last_passwords.ulp_id%TYPE);


FUNCTION INSERT_FUNC(
  p_ulp_use_code         IN         user_last_passwords.ulp_use_code%TYPE,
  p_ulp_use_password     IN         user_last_passwords.ulp_use_password%TYPE,
  p_ulp_changed_date     IN         user_last_passwords.ulp_changed_date%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY user_last_passwords%ROWTYPE)
RETURN NUMBER;

END ULP_PACK;
/