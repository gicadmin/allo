CREATE OR REPLACE PACKAGE phenix.FSG_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  fuel_surcharge_grids%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_fsg_code                       IN         fuel_surcharge_grids.fsg_code%TYPE,
  p_fsg_rec                        OUT NOCOPY fuel_surcharge_grids%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_fsg_code                       IN         fuel_surcharge_grids.fsg_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_fsg_code                       IN         fuel_surcharge_grids.fsg_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_fsg_code                       IN         fuel_surcharge_grids.fsg_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_fsg_code                       IN         fuel_surcharge_grids.fsg_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_fsg_code                       IN         fuel_surcharge_grids.fsg_code%TYPE);


PROCEDURE INSERT_PROC(
  p_fsg_code             IN         fuel_surcharge_grids.fsg_code%TYPE,
  p_fsg_description      IN         fuel_surcharge_grids.fsg_description%TYPE,
  p_fsg_alt_description  IN         fuel_surcharge_grids.fsg_alt_description%TYPE       DEFAULT NULL,
  p_fsg_surcharge_method IN         fuel_surcharge_grids.fsg_surcharge_method%TYPE      DEFAULT 'D' );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY fuel_surcharge_grids%ROWTYPE);

END FSG_PACK;
/