CREATE OR REPLACE PACKAGE phenix.SPA_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  system_parameters%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_spa_id                         IN         system_parameters.spa_id%TYPE,
  p_spa_rec                        OUT NOCOPY system_parameters%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_spa_id                         IN         system_parameters.spa_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_spa_id                         IN         system_parameters.spa_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_spa_id                         IN         system_parameters.spa_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_spa_id                         IN         system_parameters.spa_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_spa_id                         IN         system_parameters.spa_id%TYPE)
RETURN NUMBER;

FUNCTION GET_FULL_FUNC(
  p_spa_spj_id                     IN         system_parameters.spa_spj_id%TYPE,
  p_spa_key                        IN         system_parameters.spa_key%TYPE,
  p_spa_rec                        OUT NOCOPY system_parameters%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_spa_spj_id                     IN         system_parameters.spa_spj_id%TYPE,
  p_spa_key                        IN         system_parameters.spa_key%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_spa_spj_id                     IN         system_parameters.spa_spj_id%TYPE,
  p_spa_key                        IN         system_parameters.spa_key%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_spa_spj_id                     IN         system_parameters.spa_spj_id%TYPE,
  p_spa_key                        IN         system_parameters.spa_key%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_spa_spj_id                     IN         system_parameters.spa_spj_id%TYPE,
  p_spa_key                        IN         system_parameters.spa_key%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_spa_spj_id                     IN         system_parameters.spa_spj_id%TYPE,
  p_spa_key                        IN         system_parameters.spa_key%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_spa_spj_id           IN         system_parameters.spa_spj_id%TYPE,
  p_spa_sty_id           IN         system_parameters.spa_sty_id%TYPE,
  p_spa_key              IN         system_parameters.spa_key%TYPE,
  p_spa_value            IN         system_parameters.spa_value%TYPE,
  p_spa_description      IN         system_parameters.spa_description%TYPE,
  p_spa_alt_description  IN         system_parameters.spa_alt_description%TYPE,
  p_spa_max_length       IN         system_parameters.spa_max_length%TYPE,
  p_spa_display_seq      IN         system_parameters.spa_display_seq%TYPE,
  p_spa_creation_date    IN         system_parameters.spa_creation_date%TYPE         DEFAULT NULL,
  p_spa_mod_date         IN         system_parameters.spa_mod_date%TYPE              DEFAULT NULL,
  p_spa_editable_switch  IN         system_parameters.spa_editable_switch%TYPE       DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY system_parameters%ROWTYPE)
RETURN NUMBER;

END SPA_PACK;
/