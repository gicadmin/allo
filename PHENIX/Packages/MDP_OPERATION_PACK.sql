CREATE OR REPLACE PACKAGE phenix.MDP_OPERATION_PACK IS

FUNCTION CREATE_FROM_OMP_FUNC(
  p_pmd_id                     IN               NUMBER,
  p_osm_id                     IN               NUMBER)
RETURN NUMBER;

PROCEDURE UNFLAG_AS_TO_COLLECT_PROC(
  p_mdp_plh_id IN mission_detail_picklists.mdp_plh_id%TYPE
);

END MDP_OPERATION_PACK;
/