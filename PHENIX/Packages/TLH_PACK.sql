CREATE OR REPLACE PACKAGE phenix.TLH_PACK IS

PROCEDURE INSERT_TLH_PROC(
	p_tlh_rou_code           	IN temporary_pick_list_headers.tlh_rou_code%TYPE,
	p_tlh_whs_delivery_code  	IN temporary_pick_list_headers.tlh_whs_delivery_code%TYPE,
	p_tlh_whs_picking_code   	IN temporary_pick_list_headers.tlh_whs_picking_code%TYPE,
	p_tlh_route_trk_code     	IN temporary_pick_list_headers.tlh_route_trk_code%TYPE DEFAULT NULL,
	p_tlh_use_code           	IN temporary_pick_list_headers.tlh_use_code%TYPE DEFAULT NULL,
	p_tlh_use_aide_code      	IN temporary_pick_list_headers.tlh_use_aide_code%TYPE DEFAULT NULL,
	p_tlh_route_loc_dock_code	IN temporary_pick_list_headers.tlh_route_loc_dock_code%TYPE DEFAULT NULL
);

FUNCTION DOES_TLH_EXISTS_FUNC(
	p_tlh_rou_code           	IN temporary_pick_list_headers.tlh_rou_code%TYPE,
	p_tlh_whs_delivery_code  	IN temporary_pick_list_headers.tlh_whs_delivery_code%TYPE,
	p_tlh_whs_picking_code   	IN temporary_pick_list_headers.tlh_whs_picking_code%TYPE
)
RETURN BOOLEAN;

END TLH_PACK;
/