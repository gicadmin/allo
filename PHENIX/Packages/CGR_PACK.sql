CREATE OR REPLACE PACKAGE phenix.CGR_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  customer_groups%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_cgr_code                       IN         customer_groups.cgr_code%TYPE,
  p_cgr_rec                        OUT NOCOPY customer_groups%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_cgr_code                       IN         customer_groups.cgr_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_cgr_code                       IN         customer_groups.cgr_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_cgr_code                       IN         customer_groups.cgr_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_cgr_code                       IN         customer_groups.cgr_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_cgr_code                       IN         customer_groups.cgr_code%TYPE);


PROCEDURE INSERT_PROC(
  p_cgr_code             IN         customer_groups.cgr_code%TYPE,
  p_cgr_description      IN         customer_groups.cgr_description%TYPE,
  p_cgr_alt_description  IN         customer_groups.cgr_alt_description%TYPE,
  p_cgr_cgr_code         IN         customer_groups.cgr_cgr_code%TYPE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY customer_groups%ROWTYPE);


FUNCTION FIND_CGR_DESCRIPTION_FUNC(
  p_cgr_code IN NUMBER,
  p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

FUNCTION DO_CGR_EXISTS_FUNC(
  p_cgr_code IN customer_groups.cgr_code%TYPE
)
RETURN BOOLEAN;


END CGR_PACK;
/