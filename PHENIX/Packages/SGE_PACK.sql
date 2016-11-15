CREATE OR REPLACE PACKAGE phenix.SGE_PACK IS

FUNCTION RETAIN_PRODUCT_FUNC (
  p_rra_loc_code  IN  release_and_retain_audits.rra_loc_code%TYPE,
  p_rra_use_code  IN  release_and_retain_audits.rra_use_code%TYPE
)
RETURN PLS_INTEGER;

FUNCTION FIND_IDE_FOR_MOVEMENT_FUNC(
  p_ide_loc_code IN locations.loc_code%TYPE
) RETURN NUMBER;

FUNCTION GET_NEXT_ALLEY_LEVEL_LOC_FUNC(
  p_loc_code    IN locations.loc_code%TYPE,
  p_language    IN  VARCHAR2,
  p_ccr_code    OUT error_codes.ccr_code%TYPE,
  p_ccr_message OUT error_codes.ccr_message%TYPE
) RETURN locations.loc_code%TYPE;

FUNCTION GET_NOT_USED_CONTAINER_ID_FUNC
RETURN NUMBER;

END SGE_PACK;
/