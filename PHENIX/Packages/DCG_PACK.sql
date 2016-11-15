CREATE OR REPLACE PACKAGE phenix.DCG_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  delivery_charge_grids%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_dcg_code                       IN         delivery_charge_grids.dcg_code%TYPE,
  p_dcg_rec                        OUT NOCOPY delivery_charge_grids%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_dcg_code                       IN         delivery_charge_grids.dcg_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_dcg_code                       IN         delivery_charge_grids.dcg_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_dcg_code                       IN         delivery_charge_grids.dcg_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_dcg_code                       IN         delivery_charge_grids.dcg_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_dcg_code                       IN         delivery_charge_grids.dcg_code%TYPE);


PROCEDURE INSERT_PROC(
  p_dcg_code             IN         delivery_charge_grids.dcg_code%TYPE,
  p_dcg_description      IN         delivery_charge_grids.dcg_description%TYPE,
  p_dcg_alt_description  IN         delivery_charge_grids.dcg_alt_description%TYPE       DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY delivery_charge_grids%ROWTYPE);

END DCG_PACK;
/