CREATE OR REPLACE PACKAGE phenix.DGT_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  discount_grid_types%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_dgt_code                       IN         discount_grid_types.dgt_code%TYPE,
  p_dgt_rec                        OUT NOCOPY discount_grid_types%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_dgt_code                       IN         discount_grid_types.dgt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_dgt_code                       IN         discount_grid_types.dgt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_dgt_code                       IN         discount_grid_types.dgt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_dgt_code                       IN         discount_grid_types.dgt_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_dgt_code                       IN         discount_grid_types.dgt_code%TYPE);


PROCEDURE INSERT_PROC(
  p_dgt_code             IN         discount_grid_types.dgt_code%TYPE,
  p_dgt_description      IN         discount_grid_types.dgt_description%TYPE,
  p_dgt_whs_code         IN         discount_grid_types.dgt_whs_code%TYPE,
  p_dgt_alt_description  IN         discount_grid_types.dgt_alt_description%TYPE       DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY discount_grid_types%ROWTYPE);

END DGT_PACK;
/