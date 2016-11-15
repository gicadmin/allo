CREATE OR REPLACE PACKAGE phenix.BCT_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  barcode_types%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_bct_code                       IN         barcode_types.bct_code%TYPE,
  p_bct_rec                        OUT NOCOPY barcode_types%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_bct_code                       IN         barcode_types.bct_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_bct_code                       IN         barcode_types.bct_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_bct_code                       IN         barcode_types.bct_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_bct_code                       IN         barcode_types.bct_code%TYPE);


PROCEDURE INSERT_PROC(
  p_bct_code             IN         barcode_types.bct_code%TYPE,
  p_bct_name             IN         barcode_types.bct_name%TYPE,
  p_bct_format           IN         barcode_types.bct_format%TYPE                DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY barcode_types%ROWTYPE);

END BCT_PACK;
/