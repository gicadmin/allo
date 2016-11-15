CREATE OR REPLACE PACKAGE phenix.WSP_PACK IS

-- Retourne l'entrepôt de cueillette
-- selon l'entrepôt de livraison et le produit
FUNCTION FIND_PICK_WAREHOUSE_FUNC(
  p_wsp_prw_whs_delivery_code IN warehouse_sellable_products.wsp_prw_whs_delivery_code%TYPE,
  p_wsp_prw_prd_code          IN warehouse_sellable_products.wsp_prw_prd_code%TYPE
)
RETURN VARCHAR2;

END WSP_PACK;
/