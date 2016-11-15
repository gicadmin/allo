CREATE OR REPLACE PACKAGE phenix.DCB_OPERATION_PACK AS

PROCEDURE CHECK_VALID_LOWER_BRACKET_PROC(
  p_dcb_dcg_code                 IN  delivery_charge_brackets.dcb_dcg_code%TYPE,
  p_dcb_lower_objective_bracket  IN  delivery_charge_brackets.dcb_lower_objective_bracket%TYPE,
  p_dcb_lower_objective_brack    OUT delivery_charge_brackets.dcb_lower_objective_bracket%TYPE,
  p_dcb_upper_objective_brack    OUT delivery_charge_brackets.dcb_upper_objective_bracket%TYPE
);

PROCEDURE CHECK_VALID_UPPER_BRACKET_PROC(
  P_dcb_dcg_code                    IN delivery_charge_brackets.dcb_dcg_code%TYPE,
  p_dcb_upper_objective_bracket     IN delivery_charge_brackets.dcb_upper_objective_bracket%TYPE,
  p_dcb_lower_objective_brack       OUT delivery_charge_brackets.dcb_lower_objective_bracket%TYPE,
  p_dcb_upper_objective_brack       OUT delivery_charge_brackets.dcb_upper_objective_bracket%TYPE
);

PROCEDURE CHECK_VALID_TWO_BRACKET_PROC(
  P_dcb_dcg_code                  IN  delivery_charge_brackets.dcb_dcg_code%TYPE,
  p_dcb_lower_objective_bracket   IN  delivery_charge_brackets.dcb_lower_objective_bracket%TYPE,
  p_dcb_upper_objective_bracket   IN  delivery_charge_brackets.dcb_upper_objective_bracket%TYPE,
  p_dcb_lower_objective_brack     OUT delivery_charge_brackets.dcb_lower_objective_bracket%TYPE,
  p_dcb_upper_objective_brack     OUT delivery_charge_brackets.dcb_upper_objective_bracket%TYPE
);

END DCB_OPERATION_PACK;
/