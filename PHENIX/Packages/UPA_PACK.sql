CREATE OR REPLACE PACKAGE phenix.UPA_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  user_parameters%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_upa_id                         IN         user_parameters.upa_id%TYPE,
  p_upa_rec                        OUT NOCOPY user_parameters%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_upa_id                         IN         user_parameters.upa_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_upa_id                         IN         user_parameters.upa_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_upa_id                         IN         user_parameters.upa_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_upa_id                         IN         user_parameters.upa_id%TYPE);


FUNCTION INSERT_FUNC(
  p_upa_dpa_id           IN         user_parameters.upa_dpa_id%TYPE,
  p_upa_jsc_id           IN         user_parameters.upa_jsc_id%TYPE,
  p_upa_user_value       IN         user_parameters.upa_user_value%TYPE            DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY user_parameters%ROWTYPE)
RETURN NUMBER;

END UPA_PACK;
/