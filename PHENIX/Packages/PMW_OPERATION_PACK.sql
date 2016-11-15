CREATE OR REPLACE PACKAGE phenix.PMW_OPERATION_PACK IS


PROCEDURE INSERT_PICKED_WEIGHT_PROC(
  p_pmd_id         IN  pick_mission_weights.pmw_pmd_id%TYPE,
  p_weight_picked  IN  pick_mission_weights.pmw_weight%TYPE
);

PROCEDURE DELETE_PICKED_WEIGHTS_PROC(
  p_pmd_id IN pick_mission_weights.pmw_pmd_id%TYPE
);

END PMW_OPERATION_PACK;
/