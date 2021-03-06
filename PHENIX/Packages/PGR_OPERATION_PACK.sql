CREATE OR REPLACE PACKAGE phenix.PGR_OPERATION_PACK AS

FUNCTION GET_LEVEL_NUMBER_COLUMN_FUNC(
  p_pgr_code      IN product_groups.pgr_code%TYPE,
  p_column_name   IN VARCHAR2,
  p_exclude_value IN NUMBER DEFAULT NULL
)
RETURN NUMBER;

END PGR_OPERATION_PACK;
/