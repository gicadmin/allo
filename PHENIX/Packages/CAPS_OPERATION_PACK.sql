CREATE OR REPLACE PACKAGE phenix.CAPS_OPERATION_PACK IS

----------------------------------------------------------------------------------------------------

--procédure utilisée pour remplir les valeurs de CAPS etc...
FUNCTION CALCUL_CAPS_STATS_FUNC(
  p_whs_code                    IN VARCHAR2,
  p_vwh_ship_days               IN NUMBER,
  p_ctr_incl_pb_in_sugg_qty_swi IN NUMBER,
  p_ctr_week_for_avg            IN NUMBER,
  p_ctr_discard_min_week        IN NUMBER,
  p_ctr_exclude_week_switch     IN NUMBER,
  p_ctr_purchase_factor         IN NUMBER,
  p_last_week_fiscal_year       IN NUMBER,
  p_last_week_fiscal_period     IN NUMBER,
  p_last_week_fiscal_week       IN NUMBER,
  p_prd_code                    IN VARCHAR2,
  p_prd_definition              IN VARCHAR2,
  p_prd_fmt_solid_inv_code      IN VARCHAR2,
  p_prd_fmt_weighted_inv_code   IN VARCHAR2,
  p_prd_availability_date       IN DATE,
  p_prd_seasonal_or_regular     IN VARCHAR2,
  p_prd_special_order_switch    IN NUMBER,
  p_vpd_prf_fmt_code            IN VARCHAR2,
  p_vpd_purchase_multiple       IN NUMBER,
  p_prw_replenish_coefficient   IN NUMBER,
  p_prw_replenish_point         IN NUMBER,
  p_prw_replenish_quantity      IN NUMBER,
  p_days_between_order          IN NUMBER,
  p_convert_prd_to_vpd          IN NUMBER,
  p_convert_vpd_to_prd          IN NUMBER,
  p_cod_prebook_bef_next_cycle  IN NUMBER,
  p_next_order_limit_date       IN DATE,
  p_current_fiscal_year         IN NUMBER,
  p_current_fiscal_period       IN NUMBER,
  p_current_fiscal_week         IN NUMBER,
  p_log_id                      IN NUMBER,
  p_prd_qty_accounting          IN OUT NUMBER,
  p_prd_qty_on_hand             IN OUT NUMBER,
  p_prd_qty_available           IN OUT NUMBER,
  p_prd_qty_damaged             IN OUT NUMBER,
  p_prd_qty_cash_n_carry        IN OUT NUMBER,
  p_prd_qty_on_cust_order       IN OUT NUMBER,
  p_prd_qty_on_open_pod         IN OUT NUMBER,
  p_prd_qty_indirect_deliv      IN OUT NUMBER,
  p_prd_qty_rma                 IN OUT NUMBER,
  p_prd_qty_interco_in          IN OUT NUMBER,
  p_prd_qty_interco_out         IN OUT NUMBER,
  p_prd_conv_replenish_qty      IN OUT NUMBER,
  p_prd_conv_replenish_point    IN OUT NUMBER,
  p_prd_conv_replenish_coeff    IN OUT NUMBER,
  p_week_average_sales          IN OUT NUMBER,
  p_override_growth_switch      IN OUT NUMBER,
  p_average_inventory_per_week  IN OUT NUMBER,
  p_pod_quantity_suggested      IN OUT NUMBER,
  p_pod_weight_suggested        IN OUT NUMBER,
  p_lost_sales_current_week     IN OUT NUMBER,
  p_lost_sales_last_week        IN OUT NUMBER,
  p_error                       OUT VARCHAR2,
  p_caps_multi_switch           IN NUMBER DEFAULT 0,
  p_prw_purchasable_switch      IN NUMBER DEFAULT 1,  --puisque CAPS régulier traite juste les produit achetable, le défaut est 1
  p_interco_in_link_pod         IN OUT NUMBER,
  p_interco_out_link_pod        IN OUT NUMBER,
  p_next_cycle_date             IN DATE,
  p_sales_days_per_week         IN NUMBER,
  p_ven_code                    IN NUMBER,
  p_contract_switch             OUT NUMBER,
  p_round_per_pallet_percent    IN NUMBER,    --csc7041
  p_round_per_row_percent       IN NUMBER,    --csc7041
  p_replenish_nb_of_week        IN NUMBER,    --csc7041
  p_prw_items_per_pallet        IN NUMBER,    --csc7041
  p_prw_items_per_row           IN NUMBER     --csc7041
)
RETURN BOOLEAN;

----------------------------------------------------------------------------------------------------

FUNCTION CALCUL_QTE_SUGGERE_FUNC(
  p_multiple_achat            IN NUMBER,
  p_qte                       IN NUMBER,
  p_ctr_purchase_factor       IN NUMBER,
  p_round_per_pallet_percent  IN NUMBER,
  p_round_per_row_percent     IN NUMBER,
  p_prw_items_per_pallet      IN NUMBER,  --assurer que la palettisation représente bien le format du fournisseur (si plus grand format vendable = CAISSE mais qu'on achete des UNITE, on doit faire la conversion)
  p_prw_items_per_row         IN NUMBER,   --assurer que la palettisation représente bien le format du fournisseur (si plus grand format vendable = CAISSE mais qu'on achete des UNITE, on doit faire la conversion)
  p_message                   IN OUT VARCHAR2
  )
RETURN NUMBER;

----------------------------------------------------------------------------------------------------

PROCEDURE FIX_SUGGESTED_SPECIAL_PROC(
  p_tcd_prd_code                  IN VARCHAR2,
  p_tcd_vpd_prf_fmt_code          IN VARCHAR2,
  p_tcd_prd_definition            IN VARCHAR2,
  p_tcd_prd_special_order_switch  IN NUMBER,
  p_tch_whs_code                  IN VARCHAR2,
  p_tcd_cod_special_left_weight   IN NUMBER,
  p_tcd_cod_special_left_qty      IN NUMBER,
  p_tcd_prd_qty_on_hand           IN NUMBER,
  p_tcd_pod_weight_suggested      IN OUT NUMBER,
  p_tcd_pod_quantity_suggested    IN OUT NUMBER,
  p_log_id                        IN NUMBER DEFAULT NULL
);

----------------------------------------------------------------------------------------------------

PROCEDURE CALCULATE_VENDOR_SUMMARY_PROC(
  p_tcd_prd_code                  IN VARCHAR2,
  p_tcd_vpd_prf_fmt_code          IN VARCHAR2,
  p_tcd_prd_definition            IN VARCHAR2,
  p_tcd_pod_match_cost_freight    IN NUMBER,
  p_tcd_pod_quantity_ordered      IN NUMBER,
  p_tcd_pod_weight_ordered        IN NUMBER,
  p_tcd_pod_quantity_freegood     IN NUMBER,
  p_tcd_pod_weight_freegood       IN NUMBER,
  p_tcd_prf_converted_purch_wght  IN NUMBER,
  p_tcd_prf_volume                IN NUMBER,
  p_tcd_vpd_items_per_palette     IN NUMBER,
  p_tcd_total_products            OUT NUMBER,
  p_tcd_total_order_weight        OUT NUMBER,
  p_tcd_total_order_volume        OUT NUMBER,
  p_tcd_total_order               OUT NUMBER,
  p_tcd_total_number_of_palettes  OUT NUMBER
);

----------------------------------------------------------------------------------------------------

FUNCTION COUNT_SALES_DAYS_PER_WEEK_FUNC(
  p_whs_code IN warehouses.whs_code%TYPE
)
RETURN NUMBER;

----------------------------------------------------------------------------------------------------

FUNCTION COUNT_DAYS_BETWEEN_ORDER_FUNC(
  p_whs_code        IN warehouses.whs_code%TYPE,
  p_order_date      IN DATE,
  p_next_cycle_date IN DATE
)
RETURN NUMBER;

----------------------------------------------------------------------------------------------------

FUNCTION COUNT_DAYS_WITH_DELAY_PERIOD(
  p_whs_code                 IN warehouses.whs_code%TYPE,
  p_next_cycle_date          IN DATE,
  p_next_cycle_delivery_date IN DATE
)
RETURN NUMBER;

---------------------------------------------------------------------------------------------------

END CAPS_OPERATION_PACK;
/