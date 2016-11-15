CREATE OR REPLACE PACKAGE phenix.BCC_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  barcode_components%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_bcc_code                       IN         barcode_components.bcc_code%TYPE,
  p_bcc_rec                        OUT NOCOPY barcode_components%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_bcc_code                       IN         barcode_components.bcc_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_bcc_code                       IN         barcode_components.bcc_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_bcc_code                       IN         barcode_components.bcc_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_bcc_code                       IN         barcode_components.bcc_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_bcc_code                       IN         barcode_components.bcc_code%TYPE);


PROCEDURE INSERT_PROC(
  p_bcc_code             IN         barcode_components.bcc_code%TYPE,
  p_bcc_description      IN         barcode_components.bcc_description%TYPE,
  p_bcc_alt_description  IN         barcode_components.bcc_alt_description%TYPE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY barcode_components%ROWTYPE);

END BCC_PACK;
/