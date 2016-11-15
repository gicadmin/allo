CREATE OR REPLACE PACKAGE phenix.STY_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  system_project_parameter_types%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_sty_name                       IN         system_project_parameter_types.sty_name%TYPE,
  p_sty_rec                        OUT NOCOPY system_project_parameter_types%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_sty_name                       IN         system_project_parameter_types.sty_name%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_sty_name                       IN         system_project_parameter_types.sty_name%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_sty_name                       IN         system_project_parameter_types.sty_name%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_sty_name                       IN         system_project_parameter_types.sty_name%TYPE)
RETURN NUMBER;

FUNCTION GET_FULL_FUNC(
  p_sty_id                         IN         system_project_parameter_types.sty_id%TYPE,
  p_sty_rec                        OUT NOCOPY system_project_parameter_types%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_sty_id                         IN         system_project_parameter_types.sty_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_sty_id                         IN         system_project_parameter_types.sty_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_sty_id                         IN         system_project_parameter_types.sty_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_sty_id                         IN         system_project_parameter_types.sty_id%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_sty_name             IN         system_project_parameter_types.sty_name%TYPE,
  p_sty_value_type       IN         system_project_parameter_types.sty_value_type%TYPE,
  p_sty_min_entry        IN         system_project_parameter_types.sty_min_entry%TYPE,
  p_sty_max_entry        IN         system_project_parameter_types.sty_max_entry%TYPE,
  p_sty_creation_date    IN         system_project_parameter_types.sty_creation_date%TYPE         DEFAULT NULL,
  p_sty_mod_date         IN         system_project_parameter_types.sty_mod_date%TYPE              DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY system_project_parameter_types%ROWTYPE)
RETURN NUMBER;

END STY_PACK;
/