CREATE OR REPLACE PACKAGE phenix.WMS_GENERATE_REPLENISH_PACK IS

--fonction qui génère ce quil faut pour les réappro nécessaire à la cueillette dune route
FUNCTION GENERATE_REPLENISHMENTS_FUNC(
  p_osm_route_date  				IN  DATE,
  p_whs_picking_code				IN	VARCHAR2,		--BER1436
  p_whs_delivery_code				IN	VARCHAR2		--BER1436
)
RETURN PLS_INTEGER;

PROCEDURE CREATE_URGENCY_REP_PROC(
  p_infos_rec  IN REP_INFO_PACK.T_INFOS_FOR_REPLENISH,
  p_file_out   IN UTL_FILE.file_type
);

END WMS_GENERATE_REPLENISH_PACK;
/