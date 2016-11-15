CREATE OR REPLACE PACKAGE phenix.ROD_PACK IS

PROCEDURE INSERT_ROD_PROC(
	p_rod_rdh_route_date          IN route_dates.rod_rdh_route_date%TYPE,
	p_rod_rdh_rou_code            IN route_dates.rod_rdh_rou_code%TYPE,
	p_rod_cus_code                IN route_dates.rod_cus_code%TYPE,
	p_rod_position                IN route_dates.rod_position%TYPE,
	p_rod_transport_only_switch   IN route_dates.rod_transport_only_switch%TYPE DEFAULT 0
);

FUNCTION FIND_MAX_ROD_POSITION_FUNC(
	p_rod_rdh_route_date              IN route_dates.rod_rdh_route_date%TYPE,
	p_rod_rdh_rou_code                IN route_dates.rod_rdh_rou_code%TYPE
)
RETURN NUMBER;

--trouver la position d'un client spécifique sur la route
FUNCTION FIND_ROD_POSITION_FUNC(
	p_rod_rdh_route_date  IN route_dates.rod_rdh_route_date%TYPE,
	p_rod_rdh_rou_code    IN route_dates.rod_rdh_rou_code%TYPE,
	p_rod_cus_code				IN route_dates.rod_cus_code%TYPE
)
RETURN NUMBER;

--BER3036 trouver la position d'un client spécifique sur la route
FUNCTION DOES_ROD_EXISTS_FOR_CUS_FUNC(
	p_rod_rdh_route_date  IN route_dates.rod_rdh_route_date%TYPE,
	p_rod_cus_code				IN route_dates.rod_cus_code%TYPE,
	p_rou_type						IN VARCHAR2,
	p_rod_rdh_rou_code		OUT route_dates.rod_rdh_rou_code%TYPE,
	p_rod_position				OUT route_dates.rod_position%TYPE
)
RETURN BOOLEAN;

END ROD_PACK;
 
/