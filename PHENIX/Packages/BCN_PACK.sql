CREATE OR REPLACE PACKAGE phenix.BCN_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  barcode_nomenclatures%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_bcn_id                         IN         barcode_nomenclatures.bcn_id%TYPE,
  p_bcn_rec                        OUT NOCOPY barcode_nomenclatures%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_bcn_id                         IN         barcode_nomenclatures.bcn_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_bcn_id                         IN         barcode_nomenclatures.bcn_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_bcn_id                         IN         barcode_nomenclatures.bcn_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_bcn_id                         IN         barcode_nomenclatures.bcn_id%TYPE);

FUNCTION GET_FULL_FUNC(
  p_bcn_bcc_code                   IN         barcode_nomenclatures.bcn_bcc_code%TYPE,
  p_bcn_bct_code                   IN         barcode_nomenclatures.bcn_bct_code%TYPE,
  p_bcn_rec                        OUT NOCOPY barcode_nomenclatures%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_bcn_bcc_code                   IN         barcode_nomenclatures.bcn_bcc_code%TYPE,
  p_bcn_bct_code                   IN         barcode_nomenclatures.bcn_bct_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_bcn_bcc_code                   IN         barcode_nomenclatures.bcn_bcc_code%TYPE,
  p_bcn_bct_code                   IN         barcode_nomenclatures.bcn_bct_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_bcn_bcc_code                   IN         barcode_nomenclatures.bcn_bcc_code%TYPE,
  p_bcn_bct_code                   IN         barcode_nomenclatures.bcn_bct_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_bcn_bcc_code                   IN         barcode_nomenclatures.bcn_bcc_code%TYPE,
  p_bcn_bct_code                   IN         barcode_nomenclatures.bcn_bct_code%TYPE);


FUNCTION INSERT_FUNC(
  p_bcn_bcc_code         IN         barcode_nomenclatures.bcn_bcc_code%TYPE,
  p_bcn_bct_code         IN         barcode_nomenclatures.bcn_bct_code%TYPE,
  p_bcn_start_position   IN         barcode_nomenclatures.bcn_start_position%TYPE,
  p_bcn_length           IN         barcode_nomenclatures.bcn_length%TYPE,
  p_bcn_ai               IN         barcode_nomenclatures.bcn_ai%TYPE                    DEFAULT NULL,
  p_bcn_nb_decimal       IN         barcode_nomenclatures.bcn_nb_decimal%TYPE            DEFAULT 0 )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY barcode_nomenclatures%ROWTYPE)
RETURN NUMBER;

END BCN_PACK;
/