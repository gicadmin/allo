CREATE OR REPLACE PACKAGE phenix.WMS_GENERATE_OSM_PACK IS

--fonction servant à générer les outstanding mission (regroupement des même produits pour un client - reconstruction des formats et qté pour être plus efficace)
FUNCTION GEN_OUTSTANDING_MISSION_FUNC(
  p_osm_route_date 					IN 	DATE,
	p_whs_picking_code				IN	VARCHAR2,			--BER1436
	p_whs_delivery_code				IN	VARCHAR2			--BER1436
)
RETURN PLS_INTEGER;

FUNCTION GEN_OS_COUNTER_MISSION_FUNC(
  p_plh_id  						IN  NUMBER,
  p_whs_picking_code		IN	VARCHAR2,
  p_whs_delivery_code		IN	VARCHAR2
)
RETURN PLS_INTEGER;

END WMS_GENERATE_OSM_PACK;
/