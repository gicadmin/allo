CREATE OR REPLACE PACKAGE phenix.DPA_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  default_parameters%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_dpa_id                         IN         default_parameters.dpa_id%TYPE,
  p_dpa_rec                        OUT NOCOPY default_parameters%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_dpa_id                         IN         default_parameters.dpa_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_dpa_id                         IN         default_parameters.dpa_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_dpa_id                         IN         default_parameters.dpa_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_dpa_id                         IN         default_parameters.dpa_id%TYPE);

FUNCTION GET_FULL_FUNC(
  p_dpa_code                       IN         default_parameters.dpa_code%TYPE,
  p_dpa_pro_id                     IN         default_parameters.dpa_pro_id%TYPE,
  p_dpa_rec                        OUT NOCOPY default_parameters%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_dpa_code                       IN         default_parameters.dpa_code%TYPE,
  p_dpa_pro_id                     IN         default_parameters.dpa_pro_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_dpa_code                       IN         default_parameters.dpa_code%TYPE,
  p_dpa_pro_id                     IN         default_parameters.dpa_pro_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_dpa_code                       IN         default_parameters.dpa_code%TYPE,
  p_dpa_pro_id                     IN         default_parameters.dpa_pro_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_dpa_code                       IN         default_parameters.dpa_code%TYPE,
  p_dpa_pro_id                     IN         default_parameters.dpa_pro_id%TYPE);


FUNCTION INSERT_FUNC(
  p_dpa_parameter_type   IN         default_parameters.dpa_parameter_type%TYPE,
  p_dpa_code             IN         default_parameters.dpa_code%TYPE,
  p_dpa_display_sequence IN         default_parameters.dpa_display_sequence%TYPE,
  p_dpa_pro_id           IN         default_parameters.dpa_pro_id%TYPE,
  p_dpa_default_value    IN         default_parameters.dpa_default_value%TYPE         DEFAULT NULL,
  p_dpa_sql_lov          IN         default_parameters.dpa_sql_lov%TYPE               DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY default_parameters%ROWTYPE)
RETURN NUMBER;

END DPA_PACK;
/