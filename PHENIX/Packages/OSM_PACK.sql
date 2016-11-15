CREATE OR REPLACE PACKAGE phenix.OSM_PACK IS

FUNCTION GET_OSM_ID_FUNC RETURN NUMBER;

PROCEDURE DELETE_OSM_ID_PROC(
	p_osm_id IN outstanding_missions.osm_id%TYPE
);

PROCEDURE UPDATE_OSM_SHORTED_PROC(
	p_osm_id IN outstanding_missions.osm_id%TYPE
);

PROCEDURE INSERT_OSM_PROC(
	p_osm_id                   IN outstanding_missions.osm_id%TYPE,
	p_osm_whs_picking_code     IN outstanding_missions.osm_whs_picking_code%TYPE,
	p_osm_whs_delivery_code    IN outstanding_missions.osm_whs_delivery_code%TYPE,
	p_osm_status               IN outstanding_missions.osm_status%TYPE,
	p_osm_type                 IN outstanding_missions.osm_type%TYPE,
	p_osm_ven_code             IN outstanding_missions.osm_ven_code%TYPE,
	p_osm_cus_code             IN outstanding_missions.osm_cus_code%TYPE,
	p_osm_rou_code             IN outstanding_missions.osm_rou_code%TYPE,
	p_osm_route_position       IN outstanding_missions.osm_route_position%TYPE,
	p_osm_route_date           IN outstanding_missions.osm_route_date%TYPE,
	p_osm_prf_prd_code         IN outstanding_missions.osm_prf_prd_code%TYPE,
	p_osm_prf_fmt_code         IN outstanding_missions.osm_prf_fmt_code%TYPE,
	p_osm_original_quantity    IN outstanding_missions.osm_original_quantity%TYPE,
	p_osm_original_weight      IN outstanding_missions.osm_original_weight%TYPE,
	p_osm_leftover_quantity    IN outstanding_missions.osm_leftover_quantity%TYPE,
	p_osm_leftover_weight      IN outstanding_missions.osm_leftover_weight%TYPE,
	p_osm_counter_switch       IN outstanding_missions.osm_counter_switch%TYPE				DEFAULT 0,
	p_osm_to_be_shorted_switch IN outstanding_missions.osm_to_be_shorted_switch%TYPE 	DEFAULT 0
);

END OSM_PACK;
 
/