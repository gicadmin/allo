CREATE OR REPLACE PACKAGE phenix.PUG_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  purchasing_groups%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pug_code                       IN         purchasing_groups.pug_code%TYPE,
  p_pug_rec                        OUT NOCOPY purchasing_groups%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pug_code                       IN         purchasing_groups.pug_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pug_code                       IN         purchasing_groups.pug_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_pug_code                       IN         purchasing_groups.pug_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pug_code                       IN         purchasing_groups.pug_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pug_code                       IN         purchasing_groups.pug_code%TYPE);


PROCEDURE INSERT_PROC(
  p_pug_code             IN         purchasing_groups.pug_code%TYPE,
  p_pug_description      IN         purchasing_groups.pug_description%TYPE,
  p_pug_alt_description  IN         purchasing_groups.pug_alt_description%TYPE       DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY purchasing_groups%ROWTYPE);

END PUG_PACK;
/