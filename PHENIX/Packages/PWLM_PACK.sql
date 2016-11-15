CREATE OR REPLACE PACKAGE phenix.PWLM_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  public_whse_log_modifs%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pwlm_id                        IN         public_whse_log_modifs.pwlm_id%TYPE,
  p_pwlm_rec                       OUT NOCOPY public_whse_log_modifs%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_pwlm_id                        IN         public_whse_log_modifs.pwlm_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pwlm_id                        IN         public_whse_log_modifs.pwlm_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pwlm_id                        IN         public_whse_log_modifs.pwlm_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pwlm_id                        IN         public_whse_log_modifs.pwlm_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pwlm_id                        IN         public_whse_log_modifs.pwlm_id%TYPE);


FUNCTION INSERT_FUNC(
  p_pwlm_use_code            IN         public_whse_log_modifs.pwlm_use_code%TYPE,
  p_pwlm_pwid_id             IN         public_whse_log_modifs.pwlm_pwid_id%TYPE,
  p_pwlm_name_field          IN         public_whse_log_modifs.pwlm_name_field%TYPE,
  p_pwlm_modification_date   IN         public_whse_log_modifs.pwlm_modification_date%TYPE,
  p_pwlm_modification_source IN         public_whse_log_modifs.pwlm_modification_source%TYPE,
  p_pwlm_befr_modif          IN         public_whse_log_modifs.pwlm_befr_modif%TYPE               DEFAULT NULL,
  p_pwlm_after_modif         IN         public_whse_log_modifs.pwlm_after_modif%TYPE              DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY public_whse_log_modifs%ROWTYPE)
RETURN NUMBER;

END PWLM_PACK;
/