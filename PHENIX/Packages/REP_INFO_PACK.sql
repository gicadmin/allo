CREATE OR REPLACE PACKAGE phenix.REP_INFO_PACK IS

  TYPE t_ids_rec IS TABLE OF NUMBER;

  TYPE t_infos_for_replenish IS RECORD(
    whs_picking_code          warehouses.whs_code%TYPE,
    prf_prd_code              product_formats.prf_prd_code%TYPE,
    prf_fmt_code              product_formats.prf_fmt_code%TYPE,
    prd_definition            products.prd_definition%TYPE,
    prd_special_order_switch  products.prd_special_order_switch%TYPE,
    prf_conversion_to_base    product_formats.prf_conversion_to_base%TYPE,
    qty_wgt_initial_required  NUMBER,
    type_of_rep               VARCHAR2(1),    --S pour suggested ou R pour required sert surtout pour la redirection des loc en retenu
    to_loc_code               VARCHAR2(12),   --sert pour les réappro préventifs seulement
    validate_inventory_switch NUMBER,         --sert pour les réappro préventifs seulement
    plh_ids_rec               t_ids_rec,
    vph_ids_rec               t_ids_rec,
    osm_ids_rec               t_ids_rec
  );


  TYPE t_infos_to_replenish_rec   IS TABLE OF T_INFOS_FOR_REPLENISH;


PROCEDURE CREATE_INFOS_PROC(
  p_infos_to_replenish_rec    IN OUT  NOCOPY    T_INFOS_FOR_REPLENISH,
  p_whs_picking_code          IN                warehouses.whs_code%TYPE,
  p_prf_prd_code              IN                product_formats.prf_prd_code%TYPE,
  p_prf_fmt_code              IN                product_formats.prf_fmt_code%TYPE,
  p_prd_definition            IN                products.prd_definition%TYPE,
  p_prd_special_order_switch  IN                products.prd_special_order_switch%TYPE,
  p_prf_conversion_to_base    IN                product_formats.prf_conversion_to_base%TYPE,
  p_qty_wgt_initial_required  IN                NUMBER,
  p_type_of_rep               IN                VARCHAR2 DEFAULT 'R',  --required par défaut...
  p_to_loc_code               IN                locations.loc_code%TYPE DEFAULT NULL,   --sert pour les réappro préventifs seulement
  p_validate_inventory_switch IN                NUMBER DEFAULT 0      --sert pour les réappro préventifs seulement
);

PROCEDURE ADD_OSM_TO_INFOS_PROC(
  p_infos_to_replenish_rec  IN OUT  NOCOPY  T_INFOS_FOR_REPLENISH,
  p_osm_id                  IN              outstanding_missions.osm_id%TYPE
);

PROCEDURE ADD_PLH_TO_INFOS_PROC(
  p_infos_to_replenish_rec  IN OUT  NOCOPY  T_INFOS_FOR_REPLENISH,
  p_plh_id                  IN              pick_list_headers.plh_id%TYPE
);

PROCEDURE ADD_VPH_TO_INFOS_PROC(
  p_infos_to_replenish_rec  IN OUT  NOCOPY  T_INFOS_FOR_REPLENISH,
  p_vph_id                  IN              pick_list_headers.plh_id%TYPE
);



END REP_INFO_PACK;
/