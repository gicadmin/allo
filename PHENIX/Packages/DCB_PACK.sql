CREATE OR REPLACE PACKAGE phenix.DCB_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  delivery_charge_brackets%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_dcb_id                         IN         delivery_charge_brackets.dcb_id%TYPE,
  p_dcb_rec                        OUT NOCOPY delivery_charge_brackets%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_dcb_id                         IN         delivery_charge_brackets.dcb_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_dcb_id                         IN         delivery_charge_brackets.dcb_id%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_dcb_dcg_code                IN         delivery_charge_brackets.dcb_dcg_code%TYPE,
  p_dcb_lower_objective_bracket IN         delivery_charge_brackets.dcb_lower_objective_bracket%TYPE,
  p_dcb_upper_objective_bracket IN         delivery_charge_brackets.dcb_upper_objective_bracket%TYPE,
  p_dcb_base_delivery_charge    IN         delivery_charge_brackets.dcb_base_delivery_charge%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY delivery_charge_brackets%ROWTYPE)
RETURN NUMBER;

END DCB_PACK;
/