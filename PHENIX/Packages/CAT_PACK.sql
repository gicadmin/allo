CREATE OR REPLACE PACKAGE phenix.CAT_PACK IS

PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  categories%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_cat_code                       IN         categories.cat_code%TYPE,
  p_cat_rec                        OUT NOCOPY categories%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_cat_code                       IN         categories.cat_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_cat_code                       IN         categories.cat_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_cat_code                       IN         categories.cat_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_cat_code                       IN         categories.cat_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_cat_code                       IN         categories.cat_code%TYPE);


PROCEDURE INSERT_PROC(
  p_cat_code             IN         categories.cat_code%TYPE,
  p_cat_description      IN         categories.cat_description%TYPE,
  p_cat_alt_description  IN         categories.cat_alt_description%TYPE       DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec  IN OUT NOCOPY categories%ROWTYPE);

FUNCTION FIND_CAT_DESCRIPTION_FUNC(
  p_cat_code IN NUMBER,
  p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

END CAT_PACK;
/