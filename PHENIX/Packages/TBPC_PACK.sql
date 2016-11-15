CREATE OR REPLACE PACKAGE phenix.TBPC_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  tobacco_product_categories%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_tbpc_code                      IN         tobacco_product_categories.tbpc_code%TYPE,
  p_tbpc_rec                       OUT NOCOPY tobacco_product_categories%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_tbpc_code                      IN         tobacco_product_categories.tbpc_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_tbpc_code                      IN         tobacco_product_categories.tbpc_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_tbpc_code                      IN         tobacco_product_categories.tbpc_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_tbpc_code                      IN         tobacco_product_categories.tbpc_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_tbpc_code                      IN         tobacco_product_categories.tbpc_code%TYPE);


PROCEDURE INSERT_PROC(
  p_tbpc_code            IN         tobacco_product_categories.tbpc_code%TYPE,
  p_tbpc_description     IN         tobacco_product_categories.tbpc_description%TYPE,
  p_tbpc_alt_description IN         tobacco_product_categories.tbpc_alt_description%TYPE      DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY tobacco_product_categories%ROWTYPE);

END TBPC_PACK;
/