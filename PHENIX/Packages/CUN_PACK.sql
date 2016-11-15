CREATE OR REPLACE PACKAGE phenix.CUN_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  countries%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_cun_code                       IN         countries.cun_code%TYPE,
  p_cun_rec                        OUT NOCOPY countries%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_cun_code                       IN         countries.cun_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_cun_code                       IN         countries.cun_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_cun_code                       IN         countries.cun_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_cun_code                       IN         countries.cun_code%TYPE);


PROCEDURE INSERT_PROC(
  p_cun_code             IN         countries.cun_code%TYPE,
  p_cun_description      IN         countries.cun_description%TYPE,
  p_cun_postal_code_mask IN         countries.cun_postal_code_mask%TYPE,
  p_cun_alt_description  IN         countries.cun_alt_description%TYPE       DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY countries%ROWTYPE);

END CUN_PACK;
/