CREATE OR REPLACE PACKAGE phenix.MDP_PACK IS

FUNCTION GET_MDP_ID_FUNC RETURN NUMBER;

PROCEDURE INSERT_MDP_PROC(
	p_mdp_id                    IN mission_detail_picklists.mdp_id%TYPE,
	p_mdp_pmd_id              	IN mission_detail_picklists.mdp_pmd_id%TYPE,
	p_mdp_plh_id              	IN mission_detail_picklists.mdp_plh_id%TYPE,
	p_mdp_processed_switch      IN mission_detail_picklists.mdp_processed_switch%TYPE,
	p_mdp_vph_id              	IN mission_detail_picklists.mdp_vph_id%TYPE
);

FUNCTION EXISTS_FOR_PLH_FUNC(
    p_plh_id            in pick_list_headers.plh_id%TYPE)
RETURN BOOLEAN;

FUNCTION EXISTS_FOR_PLH_FUNC(
    p_plh_id                    in pick_list_headers.plh_id%TYPE,
    p_mdp_processed_switch      in mission_detail_picklists.mdp_processed_switch%TYPE)
RETURN BOOLEAN;

END MDP_PACK;
/