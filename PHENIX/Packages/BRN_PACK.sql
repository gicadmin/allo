CREATE OR REPLACE PACKAGE phenix.BRN_PACK AS

PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  brand_names%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_brn_code                       IN         brand_names.brn_code%TYPE,
  p_brn_rec                        OUT NOCOPY brand_names%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_brn_code                       IN         brand_names.brn_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_brn_code                       IN         brand_names.brn_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_brn_code                       IN         brand_names.brn_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_brn_code                       IN         brand_names.brn_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_brn_code                       IN         brand_names.brn_code%TYPE);


PROCEDURE INSERT_PROC(
  p_brn_code             IN         brand_names.brn_code%TYPE,
  p_brn_description      IN         brand_names.brn_description%TYPE,
  p_brn_alt_description  IN         brand_names.brn_alt_description%TYPE       DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY brand_names%ROWTYPE);


FUNCTION FIND_BRN_DESCRIPTION_FUNC(
	p_brn_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;





END BRN_PACK;
/