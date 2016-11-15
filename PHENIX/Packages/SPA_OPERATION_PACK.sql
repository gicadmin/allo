CREATE OR REPLACE PACKAGE phenix.SPA_OPERATION_PACK AS

FUNCTION GET_NUMBER_VALUE_FUNC(
  p_spj_name                       IN         system_projects.spj_name%TYPE,
  p_spj_context                    IN         system_projects.spj_context%TYPE,
  p_spa_key                        IN         system_parameters.spa_key%TYPE)
RETURN NUMBER;

FUNCTION GET_NUMBER_VALUE_FUNC(
  p_spj_name                       IN         system_projects.spj_name%TYPE,
  p_spj_context                    IN         system_projects.spj_context%TYPE,
  p_spa_key                        IN         system_parameters.spa_key%TYPE,
  p_default_value                  IN         NUMBER)
RETURN NUMBER;

FUNCTION GET_STRING_VALUE_FUNC(
  p_spj_name                       IN         system_projects.spj_name%TYPE,
  p_spj_context                    IN         system_projects.spj_context%TYPE,
  p_spa_key                        IN         system_parameters.spa_key%TYPE)
RETURN VARCHAR2;

FUNCTION GET_STRING_VALUE_FUNC(
  p_spj_name                       IN         system_projects.spj_name%TYPE,
  p_spj_context                    IN         system_projects.spj_context%TYPE,
  p_spa_key                        IN         system_parameters.spa_key%TYPE,
  p_default_value                  IN         VARCHAR2)
RETURN VARCHAR2;

FUNCTION GET_BOOLEAN_VALUE_FUNC(
  p_spj_name                       IN         system_projects.spj_name%TYPE,
  p_spj_context                    IN         system_projects.spj_context%TYPE,
  p_spa_key                        IN         system_parameters.spa_key%TYPE)
RETURN BOOLEAN;

FUNCTION GET_BOOLEAN_VALUE_FUNC(
  p_spj_name                       IN         system_projects.spj_name%TYPE,
  p_spj_context                    IN         system_projects.spj_context%TYPE,
  p_spa_key                        IN         system_parameters.spa_key%TYPE,
  p_default_value                  IN         BOOLEAN)
RETURN BOOLEAN;

END SPA_OPERATION_PACK;
/