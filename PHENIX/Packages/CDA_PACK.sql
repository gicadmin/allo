CREATE OR REPLACE PACKAGE phenix.CDA_PACK IS

FUNCTION GET_CDA_ID_FUNC RETURN NUMBER;

FUNCTION GET_FULL_CDA_BY_ID_FUNC(
	p_cda_id 			IN customer_dock_assignments.cda_id%TYPE,
	p_cda_record	OUT customer_dock_assignments%ROWTYPE
)
RETURN BOOLEAN;

PROCEDURE INSERT_CDA_PROC(
	p_cda_id           						IN customer_dock_assignments.cda_id%TYPE,
	p_cda_loc_code                IN customer_dock_assignments.cda_loc_code%TYPE,
	p_cda_cus_code                IN customer_dock_assignments.cda_cus_code%TYPE,
	p_cda_ven_code                IN customer_dock_assignments.cda_ven_code%TYPE,
	p_cda_possession_hour         IN customer_dock_assignments.cda_possession_hour%TYPE,
	p_cda_possession_minute       IN customer_dock_assignments.cda_possession_minute%TYPE,
	p_cda_ready_to_load_switch		IN customer_dock_assignments.cda_ready_to_load_switch%TYPE,
	p_cda_car_code                IN customer_dock_assignments.cda_car_code%TYPE,
	p_cda_trk_code                IN customer_dock_assignments.cda_trk_code%TYPE
);

PROCEDURE DELETE_CDA_PROC(
	p_cda_id  IN customer_dock_assignments.cda_id%TYPE
);

FUNCTION LOCK_CDA_FUNC(
	p_cda_id  IN customer_dock_assignments.cda_id%TYPE
)
RETURN BOOLEAN;

END CDA_PACK;
 
/