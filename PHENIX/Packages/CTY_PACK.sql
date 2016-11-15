CREATE OR REPLACE PACKAGE phenix.CTY_PACK IS

PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  contact_types%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_cty_code                       IN         contact_types.cty_code%TYPE,
  p_tcy_rec                        OUT NOCOPY contact_types%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_cty_code                       IN         contact_types.cty_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_cty_code                       IN         contact_types.cty_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_cty_code                       IN         contact_types.cty_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_cty_code                       IN         contact_types.cty_code%TYPE);


PROCEDURE INSERT_PROC(
  p_cty_code             IN         contact_types.cty_code%TYPE,
  p_cty_description      IN         contact_types.cty_description%TYPE,
  p_cty_alt_description  IN         contact_types.cty_alt_description%TYPE       DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY contact_types%ROWTYPE);

END CTY_PACK;
/