CREATE OR REPLACE PACKAGE phenix.FSC_OPERATION_PACK AS

PROCEDURE INIT_PROC;

FUNCTION  GET_DESCRIPTION_FUNC(
  p_fsc_id                         IN         formula_sql_components.fsc_id%TYPE,
  p_language_code                  IN         MULTI_LANG_MESSAGES.MLM_LANG_CODE%TYPE)
RETURN MULTI_LANG_MESSAGES.MLM_MESSAGE%TYPE;

PROCEDURE SET_PARAMETER_NUMBER_FUNC(
  p_parameter_name                  IN         VARCHAR2,
  p_parameter_value                 IN         NUMBER);

PROCEDURE SET_PARAMETER_VARCHAR_FUNC(
  p_parameter_name                  IN         VARCHAR2,
  p_parameter_value                 IN         VARCHAR2);

PROCEDURE SET_PARAMETER_DATE_FUNC(
  p_parameter_name                  IN         VARCHAR2,
  p_parameter_value                 IN         DATE);

FUNCTION GET_RESULT_FUNC(
  p_fsc_id                         IN         formula_sql_components.fsc_id%TYPE,
  p_current_value                  IN         NUMBER)
RETURN NUMBER;

END FSC_OPERATION_PACK;
/