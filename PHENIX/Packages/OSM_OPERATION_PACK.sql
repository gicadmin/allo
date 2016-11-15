CREATE OR REPLACE PACKAGE phenix.OSM_OPERATION_PACK IS

FUNCTION COUNT_WAIT_LINES_FOR_DOCK_FUNC(
  p_loc_code  IN locations.loc_code%TYPE,
  p_cus_code  IN customers.cus_code%TYPE,
  p_ven_code  IN vendors.ven_code%TYPE DEFAULT NULL
) RETURN NUMBER;

--fonction pour trouver le total de OSM au statut IRE pour un produit/format/entrepot (n'inclus pas les liquidations)
FUNCTION FIND_TOTAL_OSM_QTY_WGHT_FUNC(
  p_osm_prf_prd_code      IN outstanding_missions.osm_prf_prd_code%TYPE,
  p_osm_prf_fmt_code      IN outstanding_missions.osm_prf_fmt_code%TYPE,
  p_prd_definition        IN products.prd_definition%TYPE,
  p_osm_whs_picking_code  IN outstanding_missions.osm_whs_picking_code%TYPE
)
RETURN NUMBER;

END OSM_OPERATION_PACK;
/