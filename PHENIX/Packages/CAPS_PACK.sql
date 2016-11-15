CREATE OR REPLACE PACKAGE phenix.CAPS_PACK IS


FUNCTION TEMPORARY_CAPS_DETAILS_FUNC(
  p_current_tch_id          IN NUMBER,        --gic3152 indique le nouveau ID auquel on attache les détails de commande
  p_g_suselanguage          IN VARCHAR2,      --fre654 langue de l'usager du système (pour les prd_description)
  p_vwh_ship_days           IN NUMBER,        --USG346  délai de livraison (toujours le délai du fournisseur chez qui on commande)...
  p_create_log_flat_switch  IN NUMBER,
  p_ccr_code                OUT NUMBER,
  p_start_loc_code          IN VARCHAR2,
  p_end_loc_code            IN VARCHAR2,
  p_old_tch_id              IN NUMBER DEFAULT NULL
)
RETURN NUMBER;

PROCEDURE COPY_VALUES_FROM_OLD_PROC(
  p_current_tch_id              IN NUMBER,
  p_old_tch_id                  IN NUMBER,
  p_ctr_calc_vdi_regular_switch IN NUMBER,
  p_vwh_ship_days               IN NUMBER,
  p_ctr_incl_pb_in_sugg_qty_swi IN NUMBER,
  p_ctr_week_for_average        IN NUMBER,
  p_ctr_discard_week            IN NUMBER,
  p_ctr_exclude_week_switch     IN NUMBER,
  p_ctr_purchase_factor         IN NUMBER,
  p_last_week_fca_year          IN NUMBER,
  p_last_week_fca_period        IN NUMBER,
  p_last_week_fcw_week          IN NUMBER,
  p_log_id                      IN NUMBER
);

PROCEDURE FIX_AUTO_ORDER_PROC(
  p_tcd_prd_definition            IN VARCHAR2,
  p_tcd_pod_quantity_suggested    IN NUMBER,
  p_tcd_pod_weight_suggested      IN NUMBER,
  p_tcd_pod_pod_poh_id            IN NUMBER,
  p_tcd_pod_pige_prebook_left     IN NUMBER,
  p_tcd_vpr_freegood_quantity     IN NUMBER,
  p_tcd_vpr_freegood_volume       IN NUMBER,
  p_tcd_pod_quantity_ordered      OUT NUMBER,
  p_tcd_pod_weight_ordered        OUT NUMBER,
  p_tcd_sum_pod_qty_wght_ordered  OUT NUMBER,
  p_tcd_pod_quantity_freegood     OUT NUMBER,
  p_tcd_pod_weight_freegood       OUT NUMBER,
  p_log_id                        IN NUMBER DEFAULT NULL
);
FUNCTION FIND_TCD_FUNC ( --BER6426
  p_vpd_prd_code        IN VARCHAR2,
	p_ven_code    	      IN NUMBER,
  p_processing_only     IN NUMBER default 1
)
RETURN BOOLEAN;

FUNCTION DELETE_TCD_FUNC ( --ber6426
	p_vpd_prd_code  IN VARCHAR2,
	p_ven_code      IN NUMBER
)
RETURN BOOLEAN;

END CAPS_PACK;
/