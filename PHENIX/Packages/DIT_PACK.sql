CREATE OR REPLACE PACKAGE phenix.DIT_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  discount_types%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_dit_code                       IN         discount_types.dit_code%TYPE,
  p_dit_rec                        OUT NOCOPY discount_types%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_dit_code                       IN         discount_types.dit_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_dit_code                       IN         discount_types.dit_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_dit_code                       IN         discount_types.dit_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_dit_code                       IN         discount_types.dit_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_dit_code                       IN         discount_types.dit_code%TYPE);


PROCEDURE INSERT_PROC(
  p_dit_code                IN         discount_types.dit_code%TYPE,
  p_dit_description         IN         discount_types.dit_description%TYPE,
  p_dit_federal_tax_flag    IN         discount_types.dit_federal_tax_flag%TYPE,
  p_dit_provincial_tax_flag IN         discount_types.dit_provincial_tax_flag%TYPE,
  p_dit_alt_description     IN         discount_types.dit_alt_description%TYPE          DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY discount_types%ROWTYPE);

END DIT_PACK;
/