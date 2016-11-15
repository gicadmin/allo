CREATE OR REPLACE PACKAGE phenix.PFL_PACK IS

PROCEDURE GET_PFL_SWITCH_LOC_PROC(
	p_loc_code                 IN  positioning_family_locations.pfl_loc_code%TYPE,
  p_pfl_empty_loc_switch     OUT positioning_family_locations.pfl_empty_loc_switch%TYPE,
	p_pfl_hold_loc_switch      OUT positioning_family_locations.pfl_hold_loc_switch%TYPE,
	p_pfl_position_skip_switch OUT positioning_family_locations.pfl_position_skip_switch%TYPE
);

PROCEDURE FIND_MIN_MAX_LOC_VOLUME_PROC(
	p_pof_code   IN  NUMBER,
	p_whs_code   IN  VARCHAR2,
	p_rac_code   IN  NUMBER,
	p_min_max    IN  VARCHAR2,
	p_loc_code   OUT VARCHAR2,
	p_loc_height OUT NUMBER,
	p_loc_width  OUT NUMBER,
	p_loc_depth  OUT NUMBER
);

END PFL_PACK;
 
/