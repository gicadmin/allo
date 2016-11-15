CREATE OR REPLACE PACKAGE phenix.EBC_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  establishment_barcodes%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_ebc_id                         IN         establishment_barcodes.ebc_id%TYPE,
  p_ebc_rec                        OUT NOCOPY establishment_barcodes%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_ebc_id                         IN         establishment_barcodes.ebc_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_ebc_id                         IN         establishment_barcodes.ebc_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_ebc_id                         IN         establishment_barcodes.ebc_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_ebc_id                         IN         establishment_barcodes.ebc_id%TYPE);

FUNCTION GET_FULL_FUNC(
  p_ebc_est_code                   IN         establishment_barcodes.ebc_est_code%TYPE,
  p_ebc_bct_code                   IN         establishment_barcodes.ebc_bct_code%TYPE,
  p_ebc_rec                        OUT NOCOPY establishment_barcodes%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_ebc_est_code                   IN         establishment_barcodes.ebc_est_code%TYPE,
  p_ebc_bct_code                   IN         establishment_barcodes.ebc_bct_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_ebc_est_code                   IN         establishment_barcodes.ebc_est_code%TYPE,
  p_ebc_bct_code                   IN         establishment_barcodes.ebc_bct_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_ebc_est_code                   IN         establishment_barcodes.ebc_est_code%TYPE,
  p_ebc_bct_code                   IN         establishment_barcodes.ebc_bct_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_ebc_est_code                   IN         establishment_barcodes.ebc_est_code%TYPE,
  p_ebc_bct_code                   IN         establishment_barcodes.ebc_bct_code%TYPE);


FUNCTION INSERT_FUNC(
  p_ebc_est_code         IN         establishment_barcodes.ebc_est_code%TYPE,
  p_ebc_bct_code         IN         establishment_barcodes.ebc_bct_code%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY establishment_barcodes%ROWTYPE)
RETURN NUMBER;

END EBC_PACK;
/