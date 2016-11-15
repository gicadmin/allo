CREATE OR REPLACE PACKAGE phenix.ULA_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  user_login_attemps%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_ula_id                         IN         user_login_attemps.ula_id%TYPE,
  p_ula_rec                        OUT NOCOPY user_login_attemps%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_ula_id                         IN         user_login_attemps.ula_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_ula_id                         IN         user_login_attemps.ula_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_ula_id                         IN         user_login_attemps.ula_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_ula_id                         IN         user_login_attemps.ula_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_ula_id                         IN         user_login_attemps.ula_id%TYPE);


FUNCTION INSERT_FUNC(
  p_ula_host_name        IN         user_login_attemps.ula_host_name%TYPE,
  p_ula_user_name        IN         user_login_attemps.ula_user_name%TYPE,
  p_ula_ip_address       IN         user_login_attemps.ula_ip_address%TYPE,
  p_ula_use_code         IN         user_login_attemps.ula_use_code%TYPE              DEFAULT NULL,
  p_ula_station          IN         user_login_attemps.ula_station%TYPE               DEFAULT NULL,
  p_ula_login            IN         user_login_attemps.ula_login%TYPE                 DEFAULT NULL,
  p_ula_creation_date    IN         user_login_attemps.ula_creation_date%TYPE         DEFAULT SYSDATE ,
  p_ula_confirmed        IN         user_login_attemps.ula_confirmed%TYPE             DEFAULT 'N' )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY user_login_attemps%ROWTYPE)
RETURN NUMBER;

END ULA_PACK;
/