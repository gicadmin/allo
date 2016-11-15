CREATE OR REPLACE PACKAGE phenix.IDE_OPERATION_PACK IS

FUNCTION EXIST_PRD_LOC_FUNC(
  p_ide_prf_prd_code      IN identifiers.ide_prf_prd_code%TYPE,
  p_ide_prf_fmt_code      IN identifiers.ide_prf_fmt_code%TYPE,
  p_ide_actual_loc_code   IN identifiers.ide_actual_loc_code%TYPE
)RETURN BOOLEAN ;

FUNCTION FIND_IDE_FOR_MOVEMENT_FUNC(
  p_ide_loc_code  IN locations.loc_code%TYPE
) RETURN NUMBER;

FUNCTION GET_NOT_USED_CONTAINER_ID_FUNC
RETURN NUMBER;

FUNCTION DOES_CONTAINER_ID_EXISTS_FUNC(
  p_container_id  IN NUMBER
) RETURN BOOLEAN;

END IDE_OPERATION_PACK;
/