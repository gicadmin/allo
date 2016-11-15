CREATE OR REPLACE PACKAGE phenix.WSP_OPERATION_PACK IS

FUNCTION IS_PRD_SELLABLE_FUNC (
  p_prd_code IN warehouse_sellable_products.wsp_prw_prd_code%TYPE,
  p_whs_code IN warehouse_sellable_products.wsp_prw_whs_delivery_code%TYPE
)
RETURN BOOLEAN;


FUNCTION FIND_WHS_PICKING_FUNC(
	p_prd_code IN warehouse_sellable_products.wsp_prw_prd_code%TYPE,
  p_whs_code IN warehouse_sellable_products.wsp_prw_whs_delivery_code%TYPE
)
RETURN VARCHAR2;

END WSP_OPERATION_PACK;
/