CREATE OR REPLACE PACKAGE phenix.TPRX_OPERATION_PACK AS

PROCEDURE BUILD_TPRX_PROC(
  p_from_pgr_code           IN product_groups.pgr_code%TYPE,
  p_to_pgr_code             IN product_groups.pgr_code%TYPE,
  p_ven_code                IN price_changes.prx_vpd_ven_code%TYPE,
  p_all_vendors_switch      IN NUMBER,
  p_product_type            IN VARCHAR2,
  p_effective_date          IN price_changes.prx_effective_date%TYPE,
  p_list_price_action       IN VARCHAR2,
  p_list_price_value        IN NUMBER,
  p_list_price_type         IN VARCHAR2,
  p_cost_adjustment_action  IN VARCHAR2,
  p_cost_adjustment_value   IN NUMBER,
  p_cost_adjustment_type    IN VARCHAR2,
  p_cost_admin_1_action     IN VARCHAR2,
  p_cost_admin_1_value      IN NUMBER,
  p_cost_admin_1_type       IN VARCHAR2,
  p_cost_admin_2_action     IN VARCHAR2,
  p_cost_admin_2_value      IN NUMBER,
  p_purchase_format_switch  IN NUMBER,
  p_other_formats_switch    IN NUMBER,
  p_tobacco_tax_action      IN VARCHAR2,
  p_tobacco_tax_value       IN NUMBER,
  p_tobacco_tax_type        IN VARCHAR2,
  p_profit_action           IN VARCHAR2,
  p_profit_value            IN NUMBER,
  p_use_code                IN users.use_code%TYPE
);

PROCEDURE CREATE_PRX_PROC(
  p_prx_modification_source  IN price_changes.prx_modification_source%TYPE,
  p_prx_alt_modif_source     IN price_changes.prx_alt_modif_source%TYPE
);

FUNCTION IS_PRX_EXISTS_FOR_TPRX_FUNC
RETURN BOOLEAN;

FUNCTION COUNT_TPRX_RESULTS_FUNC
RETURN NUMBER;

END TPRX_OPERATION_PACK;
/