CREATE OR REPLACE PACKAGE phenix.SAUD_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  security_audits%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_saud_id                        IN         security_audits.saud_id%TYPE,
  p_saud_rec                       OUT NOCOPY security_audits%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_saud_id                        IN         security_audits.saud_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_saud_id                        IN         security_audits.saud_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_saud_id                        IN         security_audits.saud_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_saud_id                        IN         security_audits.saud_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_saud_id                        IN         security_audits.saud_id%TYPE);


FUNCTION INSERT_FUNC(
  p_saud_ause_login      IN         security_audits.saud_ause_login%TYPE,
  p_saud_object_name     IN         security_audits.saud_object_name%TYPE,
  p_saud_column_name     IN         security_audits.saud_column_name%TYPE,
  p_saud_row_key         IN         security_audits.saud_row_key%TYPE,
  p_saud_action          IN         security_audits.saud_action%TYPE,
  p_saud_old_value       IN         security_audits.saud_old_value%TYPE            DEFAULT NULL,
  p_saud_new_value       IN         security_audits.saud_new_value%TYPE            DEFAULT NULL,
  p_saud_creation_date   IN         security_audits.saud_creation_date%TYPE        DEFAULT sysdate )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY security_audits%ROWTYPE)
RETURN NUMBER;

END SAUD_PACK;
/