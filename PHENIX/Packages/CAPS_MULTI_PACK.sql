CREATE OR REPLACE PACKAGE phenix.CAPS_MULTI_PACK IS

FUNCTION TEMPORARY_CAPS_MULTI_FUNC(
  p_current_tch_id          IN NUMBER,        --gic3152 indique le nouveau ID auquel on attache les détails de commande
  p_g_suselanguage          IN VARCHAR2,      --fre654 langue de l'usager du système (pour les prd_description)
  p_create_log_flat_switch  IN NUMBER,
  p_ccr_code                OUT NUMBER,
  p_old_tch_id              IN NUMBER DEFAULT NULL
)
RETURN NUMBER;

PROCEDURE ADD_TMW_INFO_PROC(
  p_current_tch_id                IN NUMBER,
  p_tch_order_type                IN VARCHAR2,
  p_tch_delivery_date             IN DATE,
  p_tch_automatic_order_switch    IN NUMBER,
  p_ven_purchase_code             IN NUMBER,
  p_ven_check_deliv_date_switch   IN NUMBER,
  p_ven_calc_consignment_switch   IN NUMBER,
  p_tmp_prd_code                  IN VARCHAR2,
  p_tmp_prd_definition            IN VARCHAR2,
  p_tmp_prd_special_order_switch  IN NUMBER,
  p_tmp_prd_fmt_solid_inv_code    IN VARCHAR2,
  p_tmp_prd_fmt_weighted_inv_cod  IN VARCHAR2,
  p_tmp_prd_availability_date     IN DATE,
  p_tmp_prd_seasonal_or_regular   IN VARCHAR2,
  p_tmp_vpd_prf_fmt_code          IN VARCHAR2,
  p_tmp_vpd_purchase_multiple     IN NUMBER,
  p_tmp_vpd_code                  IN VARCHAR2,
  p_tmp_vpd_vcg_id                IN NUMBER,
  p_tmp_vcg_collect_distrib_qual  IN VARCHAR2,  --csc8675
  p_tmp_vcg_collected_avr_pct     IN NUMBER,  --csc8675
  p_tmp_vcg_collected_avr_amount  IN NUMBER,  --csc8675
  p_tmp_vcg_qualifier             IN VARCHAR2,  --csc8675
  p_tmp_vcg_quart_warehouse_avr   IN NUMBER,  --csc8675
  p_tmp_vcg_qurt_whouse_avr_amt   IN NUMBER,  --csc8675
  p_tmp_prf_liter                 IN NUMBER,  --csc8675
  p_tmp_prf_purchase_weight_kg    IN NUMBER,  --csc8675
  p_tmp_prf_purchase_weight_lb    IN NUMBER,  --csc8675
  p_tmp_fmt_code_from_vcg_vendor  IN VARCHAR2,  --csc8675
  p_tmp_fmt_conv_from_vcg_vendor  IN NUMBER,    --csc8675
  p_tmp_days_between_order        IN NUMBER,
  p_tmp_convert_prd_to_vpd        IN NUMBER,
  p_tmp_convert_vpd_to_prd        IN NUMBER,
  p_tmp_prf_converted_purch_wght  IN NUMBER,
  p_tmp_prf_volume                IN NUMBER,
  p_tmp_vpd_items_per_palette     IN NUMBER,
  p_ctr_whs_code                  IN VARCHAR2,
  p_ctr_incl_pb_in_sugg_qty_swi   IN NUMBER,
  p_ctr_week_for_average          IN NUMBER,
  p_ctr_discard_week              IN NUMBER,
  p_ctr_exclude_week_switch       IN NUMBER,
  p_ctr_purchase_factor           IN NUMBER,
  p_ctr_allocation_1_applied_on   IN NUMBER,
  p_ctr_allocation_2_applied_on   IN NUMBER,
  p_ctr_allocation_3_applied_on   IN NUMBER,
  p_ctr_affect_match_cost_1_swi   IN NUMBER,
  p_ctr_affect_match_cost_2_swi   IN NUMBER,
  p_ctr_affect_match_cost_3_swi   IN NUMBER,
  p_ctr_calc_vdi_regular_switch   IN NUMBER,
  p_ven_pickup_switch             IN NUMBER, --EFE70
  p_tmp_next_cycle_date           IN DATE,
  p_stats_only_switch             IN NUMBER DEFAULT 0,
  p_log_id                        IN NUMBER DEFAULT NULL
);

--procédure pour trouver l'info supplémentaire, mais qui renvoie par variable OUT les infos spécifiques à un produit entrepot (sert à caps_multi_summary)
--cette fonction est TOUJOURS appellée pour qu'on calcul les stats seulement...
PROCEDURE ADD_TMW_INFO_FOR_SCREEN_PROC(
  p_current_tch_id                IN NUMBER,
  p_current_whs_code              IN VARCHAR2,  --indique de quel warehouse on veut avoir les variables calculées en valeur OUT au lieu d'update direct dans la BD
  p_tmp_prd_code                  IN VARCHAR2,
  p_tmp_prd_definition            IN VARCHAR2,
  p_tmp_prd_special_order_switch  IN NUMBER,
  p_tmp_prd_fmt_solid_inv_code    IN VARCHAR2,
  p_tmp_prd_fmt_weighted_inv_cod  IN VARCHAR2,
  p_tmp_prd_availability_date     IN DATE,
  p_tmp_prd_seasonal_or_regular   IN VARCHAR2,
  p_tmp_vpd_prf_fmt_code          IN VARCHAR2,
  p_tmp_vpd_purchase_multiple     IN NUMBER,
  p_tmp_days_between_order        IN NUMBER,
  p_tmp_convert_prd_to_vpd        IN NUMBER,
  p_tmp_convert_vpd_to_prd        IN NUMBER,
  p_ctr_whs_code                  IN VARCHAR2,
  p_ctr_incl_pb_in_sugg_qty_swi   IN NUMBER,
  p_ctr_week_for_average          IN NUMBER,
  p_ctr_discard_week              IN NUMBER,
  p_ctr_exclude_week_switch       IN NUMBER,
  p_ctr_purchase_factor           IN NUMBER,
  p_ctr_allocation_1_applied_on   IN NUMBER,
  p_ctr_allocation_2_applied_on   IN NUMBER,
  p_ctr_allocation_3_applied_on   IN NUMBER,
  p_ctr_affect_match_cost_1_swi   IN NUMBER,
  p_ctr_affect_match_cost_2_swi   IN NUMBER,
  p_ctr_affect_match_cost_3_swi   IN NUMBER,
  p_tmp_next_cycle_date           IN DATE,
  p_tmp_ven_purchase_code         IN NUMBER,
  p_tmw_prd_qty_on_hand           OUT NUMBER,
  p_tmw_prd_qty_available         OUT NUMBER,
  p_tmw_prd_qty_on_cust_order     OUT NUMBER,
  p_tmw_prd_qty_on_open_pod       OUT NUMBER,
  p_tmw_prd_qty_damaged           OUT NUMBER,
  p_tmw_prd_conv_replenish_qty    OUT NUMBER,
  p_tmw_prd_conv_replenish_point  OUT NUMBER,
  p_tmw_prd_conv_replenish_coeff  OUT NUMBER,
  p_tmw_week_average_sales        OUT NUMBER,
  p_tmw_override_growth_switch    OUT NUMBER,
  p_tmw_average_inventory_per_wk  OUT NUMBER,
  p_tmw_original_qty_suggested    OUT NUMBER,
  p_tmw_original_wght_suggested   OUT NUMBER,
  p_tmw_pod_quantity_suggested    OUT NUMBER,
  p_tmw_pod_weight_suggested      OUT NUMBER,
  p_tmw_inv_min_qty_wght          OUT NUMBER,
  p_tmw_inv_max_qty_wght          OUT NUMBER,
  p_tmw_caps_stats_done_switch    OUT NUMBER,
  p_tmw_interco_to_validate_swi   OUT NUMBER,
  p_tmw_qty_interco_link_pod_in   OUT NUMBER,
  p_tmw_qty_interco_link_pod_out  OUT NUMBER
);

PROCEDURE FIX_AUTO_ORDER_MULTI_PROC(
  p_prd_definition          IN VARCHAR2,
  p_prw_purchasable_switch  IN NUMBER,
  p_pod_quantity_suggested  IN NUMBER,
  p_pod_weight_suggested    IN NUMBER,
  p_pod_pod_poh_id          IN NUMBER,
  p_vpr_freegood_quantity   IN NUMBER,
  p_vpr_freegood_volume     IN NUMBER,
  p_pod_quantity_ordered    OUT NUMBER,
  p_pod_weight_ordered      OUT NUMBER,
  p_pod_quantity_interco    OUT NUMBER,
  p_pod_weight_interco      OUT NUMBER,
  p_pod_quantity_freegood   OUT NUMBER,
  p_pod_weight_freegood     OUT NUMBER,
  p_log_id                  IN NUMBER DEFAULT NULL
);

PROCEDURE CALCUL_LINE_COST_PROC(
  p_ctr_calc_vdi_regular_switch   IN NUMBER,
  p_ven_calc_consignment_switch   IN NUMBER,
  p_tch_ven_purchase_code         IN NUMBER,
  p_tch_delivery_date             IN DATE,
  p_tch_order_type                IN VARCHAR2,
  p_tmp_prd_code                  IN VARCHAR2,
  p_tmp_fmt_code                  IN VARCHAR2,
  p_tmp_vpd_code                  IN VARCHAR2,
  p_tmp_vpd_vcg_id                IN NUMBER,
  p_tmp_vcg_collect_distrib_qual  IN VARCHAR2,  --csc8675
  p_tmp_vcg_collected_avr_pct     IN NUMBER,  --csc8675
  p_tmp_vcg_collected_avr_amount  IN NUMBER,  --csc8675
  p_tmp_vcg_qualifier             IN VARCHAR2,  --csc8675
  p_tmp_vcg_quart_warehouse_avr   IN NUMBER,  --csc8675
  p_tmp_vcg_qurt_whouse_avr_amt   IN NUMBER,  --csc8675
  p_tmp_prf_liter                 IN NUMBER,  --csc8675
  p_tmp_prf_purchase_weight_kg    IN NUMBER,  --csc8675
  p_tmp_prf_purchase_weight_lb    IN NUMBER,  --csc8675
  p_tmp_fmt_code_from_vcg_vendor  IN VARCHAR2,  --csc8675
  p_tmp_fmt_conv_from_vcg_vendor  IN NUMBER,    --csc8675
  p_tmw_whs_code                  IN VARCHAR2,
  p_tmw_prw_purchasable_switch    IN NUMBER,
  p_tmw_pod_pod_poh_id            IN NUMBER,
  p_ven_prv_code                  IN VARCHAR2,--EFE70
  p_tmp_prd_definition            IN VARCHAR2,--BER3533
  p_tmp_convert_prd_to_vpd        IN NUMBER,  --BER3533
  p_tmw_pod_list                  IN OUT NUMBER,
  p_tmw_pod_cost_1                IN OUT NUMBER,
  p_tmw_pod_cost_2                IN OUT NUMBER,
  p_tmw_pod_cost_3                IN OUT NUMBER,
  p_tmw_pod_cost_4                IN OUT NUMBER,
  p_tmw_pod_match_cost            IN OUT NUMBER,
  p_tmw_discount_cost_1           IN OUT NUMBER,
  p_tmw_discount_cost_2           IN OUT NUMBER,
  p_tmw_discount_cost_3           IN OUT NUMBER,
  p_tmw_discount_cost_4           IN OUT NUMBER,
  p_tmw_discount_match_cost       IN OUT NUMBER,
  p_tmw_pod_allocation_1          IN OUT NUMBER,
  p_tmw_pod_allocation_2          IN OUT NUMBER,
  p_tmw_pod_allocation_3          IN OUT NUMBER,
  p_tmw_pod_match_cost_1_switch   IN OUT NUMBER,
  p_tmw_pod_match_cost_2_switch   IN OUT NUMBER,
  p_tmw_pod_match_cost_3_switch   IN OUT NUMBER,
  p_tmw_pod_alloc_1_applied_on    IN OUT NUMBER,
  p_tmw_pod_alloc_2_applied_on    IN OUT NUMBER,
  p_tmw_pod_alloc_3_applied_on    IN OUT NUMBER,
  p_tmw_pod_manual_discount       IN OUT NUMBER,
  p_tmw_pod_disc_cost_affected    IN OUT NUMBER,
  p_tmw_pod_avr                   IN OUT NUMBER,
  p_tmw_pod_consignment_amount    IN OUT NUMBER,
  p_tmw_pod_added_transp_amount   OUT NUMBER, --BER3533
  p_tmw_pod_match_cost_freight    OUT NUMBER  --BER3533
);

PROCEDURE COPY_VALUES_FROM_OLD_PROC(
  p_current_tch_id              IN NUMBER,
  p_old_tch_id                  IN NUMBER,
  p_ctr_calc_vdi_regular_switch IN NUMBER,
  p_ctr_broker_vendor_id        IN NUMBER,
  p_ctr_whs_code                IN VARCHAR2,
  p_ctr_incl_pb_in_sugg_qty_swi IN NUMBER,
  p_ctr_week_for_average        IN NUMBER,
  p_ctr_discard_week            IN NUMBER,
  p_ctr_exclude_week_switch     IN NUMBER,
  p_ctr_purchase_factor         IN NUMBER,
  p_log_id                      IN NUMBER,
  p_ven_pickup_switch           IN NUMBER --EFE70
);

FUNCTION FIND_TMP_FUNC ( --ber6426
	p_vpd_prd_code 	  IN VARCHAR2,
	p_ven_code        IN NUMBER,
  p_processing_only IN NUMBER default 1
  )
RETURN BOOLEAN;

FUNCTION DELETE_TMP_FUNC ( --ber6426
  p_vpd_prd_code     IN VARCHAR2,
  p_ven_code        IN NUMBER
  )
RETURN BOOLEAN;

END CAPS_MULTI_PACK;
/