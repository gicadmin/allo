CREATE OR REPLACE PACKAGE phenix.TTH_PACK IS

PROCEDURE INSERT_TTH_PROC(
	p_tth_rou_code           	IN temporary_route_headers.tth_rou_code%TYPE,
	p_tth_whs_delivery_code  	IN temporary_route_headers.tth_whs_delivery_code%TYPE,
	p_tth_route_trk_code     	IN temporary_route_headers.tth_route_trk_code%TYPE DEFAULT NULL,
	p_tth_use_code           	IN temporary_route_headers.tth_use_code%TYPE DEFAULT NULL,
	p_tth_use_aide_code      	IN temporary_route_headers.tth_use_aide_code%TYPE DEFAULT NULL,
	p_tth_route_loc_dock_code	IN temporary_route_headers.tth_route_loc_dock_code%TYPE DEFAULT NULL
);

FUNCTION DOES_TTH_EXISTS_FUNC(
	p_tth_rou_code           	IN temporary_route_headers.tth_rou_code%TYPE,
	p_tth_whs_delivery_code  	IN temporary_route_headers.tth_whs_delivery_code%TYPE
)
RETURN BOOLEAN;

END TTH_PACK;
 
/