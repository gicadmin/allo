CREATE OR REPLACE PACKAGE phenix.VWG_OPERATION_PACK IS

-- Fonction qui retourne l'heure de tombée à partir d'un produit/entrepôt
FUNCTION GET_CUTOFF_TIME_FUNC(
  p_prd_code IN products.prd_code%TYPE,
  p_whs_code IN warehouses.whs_code%TYPE
)
RETURN VARCHAR2;

FUNCTION GET_VWG_FUNC(
  p_vwg_vwh_ven_code IN vendor_warehouse_groups.vwg_vwh_ven_code%TYPE,
  p_vwg_vwh_whs_code IN vendor_warehouse_groups.vwg_vwh_whs_code%TYPE,
  p_prd_code         IN products.prd_code%TYPE,
  p_vwg_rec          OUT NOCOPY vendor_warehouse_groups%ROWTYPE
)
RETURN BOOLEAN;

FUNCTION VALIDATE_CUTOFF_TIME_FUNC (
  p_vwg_vwh_ven_code IN vendor_warehouse_groups.vwg_vwh_ven_code%TYPE,
  p_vwg_vwh_whs_code IN vendor_warehouse_groups.vwg_vwh_whs_code%TYPE,
  p_prd_code         IN products.prd_code%TYPE,
  p_delivery_date    IN DATE,
  p_cutoff_time      IN vendor_warehouse_groups.vwg_cutoff_time%TYPE,
  p_delivery_gap     IN vendor_warehouse_groups.vwg_delivery_gap%TYPE
)
RETURN BOOLEAN;

PROCEDURE GET_CUTOFF_TIME_PROC(
  p_vwg_vwh_ven_code IN vendor_warehouse_groups.vwg_vwh_ven_code%TYPE,
  p_vwg_vwh_whs_code IN vendor_warehouse_groups.vwg_vwh_whs_code%TYPE,
  p_prd_code         IN products.prd_code%TYPE,
  p_cutoff_time      OUT vendor_warehouse_groups.vwg_cutoff_time%TYPE,
  p_delivery_gap     OUT vendor_warehouse_groups.vwg_delivery_gap%TYPE
);

END VWG_OPERATION_PACK;
/