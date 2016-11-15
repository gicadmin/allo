CREATE OR REPLACE PACKAGE phenix.IAT_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  inventory_adjustment_types%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_iat_code                       IN         inventory_adjustment_types.iat_code%TYPE,
  p_iat_rec                        OUT NOCOPY inventory_adjustment_types%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_iat_code                       IN         inventory_adjustment_types.iat_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_iat_code                       IN         inventory_adjustment_types.iat_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_iat_code                       IN         inventory_adjustment_types.iat_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_iat_code                       IN         inventory_adjustment_types.iat_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_iat_code                       IN         inventory_adjustment_types.iat_code%TYPE);


PROCEDURE INSERT_PROC(
  p_iat_code             IN         inventory_adjustment_types.iat_code%TYPE,
  p_iat_description      IN         inventory_adjustment_types.iat_description%TYPE,
  p_iat_alt_description  IN         inventory_adjustment_types.iat_alt_description%TYPE       DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY inventory_adjustment_types%ROWTYPE);

END IAT_PACK;
/