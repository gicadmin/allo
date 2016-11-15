CREATE OR REPLACE PACKAGE phenix.IDE_PACK AS

FUNCTION GET_KEY_FUNC
RETURN NUMBER;

PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  identifiers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_ide_id                         IN         identifiers.ide_id%TYPE,
  p_ide_rec                        OUT NOCOPY identifiers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_ide_id                         IN         identifiers.ide_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_ide_id                         IN         identifiers.ide_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_ide_id                         IN         identifiers.ide_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_ide_id                         IN         identifiers.ide_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_ide_id                         IN         identifiers.ide_id%TYPE);


FUNCTION INSERT_FUNC(
  p_ide_prf_prd_code         IN         identifiers.ide_prf_prd_code%TYPE              DEFAULT NULL,
  p_ide_prf_fmt_code         IN         identifiers.ide_prf_fmt_code%TYPE              DEFAULT NULL,
  p_ide_quantity             IN         identifiers.ide_quantity%TYPE                  DEFAULT NULL,
  p_ide_actual_loc_code      IN         identifiers.ide_actual_loc_code%TYPE           DEFAULT NULL,
  p_ide_destination_loc_code IN         identifiers.ide_destination_loc_code%TYPE      DEFAULT NULL,
  p_ide_weight               IN         identifiers.ide_weight%TYPE                    DEFAULT NULL,
  p_ide_expiry_date          IN         identifiers.ide_expiry_date%TYPE               DEFAULT NULL,
  p_ide_fifo_date            IN         identifiers.ide_fifo_date%TYPE                 DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY identifiers%ROWTYPE)
RETURN NUMBER;

END IDE_PACK;
/