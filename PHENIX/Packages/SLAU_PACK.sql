CREATE OR REPLACE PACKAGE phenix.SLAU_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  security_login_audits%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_slau_id                        IN         security_login_audits.slau_id%TYPE,
  p_slau_rec                       OUT NOCOPY security_login_audits%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_slau_id                        IN         security_login_audits.slau_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_slau_id                        IN         security_login_audits.slau_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_slau_id                        IN         security_login_audits.slau_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_slau_id                        IN         security_login_audits.slau_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_slau_id                        IN         security_login_audits.slau_id%TYPE);


FUNCTION INSERT_FUNC(
  p_slau_status                 IN         security_login_audits.slau_status%TYPE,
  p_slau_ause_login             IN         security_login_audits.slau_ause_login%TYPE                  DEFAULT NULL,
  p_slau_connection_information IN         security_login_audits.slau_connection_information%TYPE      DEFAULT NULL,
  p_slau_creation_date          IN         security_login_audits.slau_creation_date%TYPE               DEFAULT sysdate )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY security_login_audits%ROWTYPE)
RETURN NUMBER;

END SLAU_PACK;
/