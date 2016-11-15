CREATE OR REPLACE PACKAGE phenix.STR_PACK IS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  stores%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_str_code                       IN         stores.str_code%TYPE,
  p_str_rec                        OUT NOCOPY stores%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_str_code                       IN         stores.str_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_str_code                       IN         stores.str_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_str_code                       IN         stores.str_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_str_code                       IN         stores.str_code%TYPE);


PROCEDURE INSERT_PROC(
  p_str_code             IN         stores.str_code%TYPE,
  p_str_description      IN         stores.str_description%TYPE,
  p_str_alt_description  IN         stores.str_alt_description%TYPE       DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY stores%ROWTYPE);

END STR_PACK;
/