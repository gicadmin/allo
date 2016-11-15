CREATE OR REPLACE PACKAGE phenix.ULM_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  user_log_modifs%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_ulm_id                         IN         user_log_modifs.ulm_id%TYPE,
  p_ulm_rec                        OUT NOCOPY user_log_modifs%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_ulm_id                         IN         user_log_modifs.ulm_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_ulm_id                         IN         user_log_modifs.ulm_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_ulm_id                         IN         user_log_modifs.ulm_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_ulm_id                         IN         user_log_modifs.ulm_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_ulm_id                         IN         user_log_modifs.ulm_id%TYPE);


FUNCTION INSERT_FUNC(
  p_ulm_modif_use_code      IN         user_log_modifs.ulm_modif_use_code%TYPE,
  p_ulm_use_code            IN         user_log_modifs.ulm_use_code%TYPE,
  p_ulm_name_field          IN         user_log_modifs.ulm_name_field%TYPE,
  p_ulm_modification_date   IN         user_log_modifs.ulm_modification_date%TYPE,
  p_ulm_modification_source IN         user_log_modifs.ulm_modification_source%TYPE,
  p_ulm_before_modif        IN         user_log_modifs.ulm_before_modif%TYPE             DEFAULT NULL,
  p_ulm_after_modif         IN         user_log_modifs.ulm_after_modif%TYPE              DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY user_log_modifs%ROWTYPE)
RETURN NUMBER;

END ULM_PACK;
/