CREATE OR REPLACE PACKAGE phenix.PMW_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  pick_mission_weights%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pmw_id                         IN         pick_mission_weights.pmw_id%TYPE,
  p_pmw_rec                        OUT NOCOPY pick_mission_weights%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pmw_id                         IN         pick_mission_weights.pmw_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_pmw_id                         IN         pick_mission_weights.pmw_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pmw_id                         IN         pick_mission_weights.pmw_id%TYPE);


FUNCTION INSERT_FUNC(
  p_pmw_pmd_id             IN         pick_mission_weights.pmw_pmd_id%TYPE,
  p_pmw_weight             IN         pick_mission_weights.pmw_weight%TYPE,
  p_pmw_weight_distributed IN         pick_mission_weights.pmw_weight_distributed%TYPE,
  p_pmw_weight_to_ship     IN         pick_mission_weights.pmw_weight_to_ship%TYPE          DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY pick_mission_weights%ROWTYPE)
RETURN NUMBER;

END PMW_PACK;
/