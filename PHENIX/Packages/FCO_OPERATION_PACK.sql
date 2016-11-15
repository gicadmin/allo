CREATE OR REPLACE PACKAGE phenix.FCO_OPERATION_PACK AS

PROCEDURE INIT_PROC;

PROCEDURE SET_PARAMETER_NUMBER_FUNC(
  p_parameter_name                  IN         VARCHAR2,
  p_parameter_value                 IN         NUMBER);

PROCEDURE SET_PARAMETER_VARCHAR_FUNC(
  p_parameter_name                  IN         VARCHAR2,
  p_parameter_value                 IN         VARCHAR2);

PROCEDURE SET_PARAMETER_DATE_FUNC(
  p_parameter_name                  IN         VARCHAR2,
  p_parameter_value                 IN         DATE);

FUNCTION CALCULATE_FORMULA_FUNC(
  p_fco_id                         IN         formula_components.fco_id%TYPE)
RETURN NUMBER;

END FCO_OPERATION_PACK;
/