CREATE OR REPLACE PACKAGE phenix.TOM_PACK IS

FUNCTION GET_TOM_ID_FUNC RETURN NUMBER;

PROCEDURE DELETE_TOM_PROC(
	p_tom_id IN temporary_outstanding_missions.tom_id%TYPE
);

FUNCTION DELETE_ALL_TOM_FOR_WHS_FUNC(
	p_whs_picking_code 	IN warehouses.whs_code%TYPE,
	p_language					IN VARCHAR2,
	p_error_message 		OUT VARCHAR2
) RETURN BOOLEAN;

PROCEDURE INSERT_TOM_PROC (
	p_tom_id                	IN temporary_outstanding_missions.tom_id%TYPE,
	p_tom_cus_code            IN temporary_outstanding_missions.tom_cus_code%TYPE,
	p_tom_cus_ranking					IN temporary_outstanding_missions.tom_cus_ranking%TYPE,
	p_tom_plh_id              IN temporary_outstanding_missions.tom_plh_id%TYPE,
	p_tom_pmh_id              IN temporary_outstanding_missions.tom_pmh_id%TYPE,
	p_tom_pmd_id              IN temporary_outstanding_missions.tom_pmd_id%TYPE,
	p_tom_rou_code            IN temporary_outstanding_missions.tom_rou_code%TYPE,
	p_tom_route_position      IN temporary_outstanding_missions.tom_route_position%TYPE,
	p_tom_route_date          IN temporary_outstanding_missions.tom_route_date%TYPE,
	p_tom_whs_picking_code    IN temporary_outstanding_missions.tom_whs_picking_code%TYPE,
	p_tom_whs_delivery_code   IN temporary_outstanding_missions.tom_whs_delivery_code%TYPE,
	p_tom_prf_prd_code        IN temporary_outstanding_missions.tom_prf_prd_code%TYPE,
	p_tom_prf_fmt_code        IN temporary_outstanding_missions.tom_prf_fmt_code%TYPE,
	p_tom_original_quantity   IN temporary_outstanding_missions.tom_original_quantity%TYPE,
	p_tom_original_weight     IN temporary_outstanding_missions.tom_original_weight%TYPE,
	p_tom_picked_quantity     IN temporary_outstanding_missions.tom_picked_quantity%TYPE,
	p_tom_picked_weight       IN temporary_outstanding_missions.tom_picked_weight%TYPE,
	p_tom_available_quantity  IN temporary_outstanding_missions.tom_available_quantity%TYPE DEFAULT NULL,
	p_tom_available_weight    IN temporary_outstanding_missions.tom_available_weight%TYPE 	DEFAULT NULL,
	p_tom_selected_switch     IN temporary_outstanding_missions.tom_selected_switch%TYPE 		DEFAULT 0
);

END TOM_PACK;
 
/