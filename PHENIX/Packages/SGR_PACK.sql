CREATE OR REPLACE PACKAGE phenix.SGR_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  security_groups%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_sgr_code                       IN         security_groups.sgr_code%TYPE,
  p_sgr_rec                        OUT NOCOPY security_groups%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_sgr_code                       IN         security_groups.sgr_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_sgr_code                       IN         security_groups.sgr_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_sgr_code                       IN         security_groups.sgr_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_sgr_code                       IN         security_groups.sgr_code%TYPE);


PROCEDURE INSERT_PROC(
  p_sgr_code             IN         security_groups.sgr_code%TYPE,
  p_sgr_description      IN         security_groups.sgr_description%TYPE,
  p_sgr_alt_description  IN         security_groups.sgr_alt_description%TYPE       DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY security_groups%ROWTYPE);

END SGR_PACK;
/