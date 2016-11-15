CREATE OR REPLACE PACKAGE phenix.AUSE_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  application_users%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_ause_id                        IN         application_users.ause_id%TYPE,
  p_ause_rec                       OUT NOCOPY application_users%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_ause_id                        IN         application_users.ause_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_ause_id                        IN         application_users.ause_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_ause_id                        IN         application_users.ause_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_ause_id                        IN         application_users.ause_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_ause_id                        IN         application_users.ause_id%TYPE);

FUNCTION GET_FULL_FUNC(
  p_ause_login                     IN         application_users.ause_login%TYPE,
  p_ause_rec                       OUT NOCOPY application_users%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_ause_login                     IN         application_users.ause_login%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_ause_login                     IN         application_users.ause_login%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_ause_login                     IN         application_users.ause_login%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_ause_login                     IN         application_users.ause_login%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_ause_login                     IN         application_users.ause_login%TYPE);

FUNCTION GET_FULL_FUNC(
  p_ause_email                     IN         application_users.ause_email%TYPE,
  p_ause_rec                       OUT NOCOPY application_users%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_ause_email                     IN         application_users.ause_email%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_ause_email                     IN         application_users.ause_email%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_ause_email                     IN         application_users.ause_email%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_ause_email                     IN         application_users.ause_email%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_ause_email                     IN         application_users.ause_email%TYPE);


FUNCTION INSERT_FUNC(
  p_ause_login             IN         application_users.ause_login%TYPE,
  p_ause_first_name        IN         application_users.ause_first_name%TYPE,
  p_ause_last_name         IN         application_users.ause_last_name%TYPE,
  p_ause_email             IN         application_users.ause_email%TYPE,
  p_ause_password          IN         application_users.ause_password%TYPE,
  p_ause_salt              IN         application_users.ause_salt%TYPE,
  p_ause_status            IN         application_users.ause_status%TYPE                 DEFAULT 'ACTIVE' ,
  p_ause_login_attemps     IN         application_users.ause_login_attemps%TYPE          DEFAULT 0 ,
  p_ause_creation_date     IN         application_users.ause_creation_date%TYPE          DEFAULT sysdate ,
  p_ause_modification_date IN         application_users.ause_modification_date%TYPE      DEFAULT sysdate )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY application_users%ROWTYPE)
RETURN NUMBER;

END AUSE_PACK;
/