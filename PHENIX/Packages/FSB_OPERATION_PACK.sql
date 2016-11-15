CREATE OR REPLACE PACKAGE phenix.FSB_OPERATION_PACK AS

PROCEDURE CHECK_VALID_BRACKETS_PROC(
  p_fsb_fsg_code                  IN fuel_surcharge_brackets.fsb_fsg_code%TYPE,
  p_fsb_lower_objective_bracket   IN fuel_surcharge_brackets.fsb_lower_objective_bracket%TYPE,
  p_fsb_upper_objective_bracket   IN fuel_surcharge_brackets.fsb_upper_objective_bracket%TYPE);

  END FSB_OPERATION_PACK;
/