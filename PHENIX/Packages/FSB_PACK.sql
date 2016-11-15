CREATE OR REPLACE PACKAGE phenix.FSB_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  fuel_surcharge_brackets%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_fsb_id                         IN         fuel_surcharge_brackets.fsb_id%TYPE,
  p_fsb_rec                        OUT NOCOPY fuel_surcharge_brackets%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_fsb_id                         IN         fuel_surcharge_brackets.fsb_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_fsb_id                         IN         fuel_surcharge_brackets.fsb_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_fsb_id                         IN         fuel_surcharge_brackets.fsb_id%TYPE);


FUNCTION INSERT_FUNC(
  p_fsb_fsg_code                IN         fuel_surcharge_brackets.fsb_fsg_code%TYPE,
  p_fsb_lower_objective_bracket IN         fuel_surcharge_brackets.fsb_lower_objective_bracket%TYPE,
  p_fsb_upper_objective_bracket IN         fuel_surcharge_brackets.fsb_upper_objective_bracket%TYPE,
  p_fsb_fuel_surcharge          IN         fuel_surcharge_brackets.fsb_fuel_surcharge%TYPE               DEFAULT NULL,
  p_fsb_fuel_surcharge_percent  IN         fuel_surcharge_brackets.fsb_fuel_surcharge_percent%TYPE       DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY fuel_surcharge_brackets%ROWTYPE)
RETURN NUMBER;

END FSB_PACK;
/