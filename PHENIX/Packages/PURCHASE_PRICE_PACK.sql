CREATE OR REPLACE PACKAGE phenix.PURCHASE_PRICE_PACK IS

PROCEDURE FIND_POD_PRICE_PROC(
  p_prd_code                     IN VARCHAR2,
  p_fmt_code                     IN VARCHAR2,
  p_whs_code                     IN VARCHAR2, --ber1460
  p_ven_purchase_code            IN NUMBER,
  p_order_type                   IN VARCHAR2,
  p_expected_date                IN DATE,
  p_search_pige_switch           IN NUMBER,
  p_pod_manual_discount          IN OUT NUMBER,
  p_pod_manual_disc_cost_affect  IN OUT NUMBER,
  p_pod_pty_code                 IN OUT NUMBER,
  p_pod_allocation_1             IN OUT NUMBER,
  p_pod_allocation_1_applied_on  IN OUT NUMBER,
  p_pod_affect_match_cost_1_swi  IN OUT NUMBER,
  p_pod_allocation_2             IN OUT NUMBER,
  p_pod_allocation_2_applied_on  IN OUT NUMBER,
  p_pod_affect_match_cost_2_swi  IN OUT NUMBER,
  p_override_manual_alloc_3      IN NUMBER, --0 OU 1 Indique si l'allocation 3 sera overridé sans vérifier si une allocation manuelle avait été entré
  p_pod_allocation_3             IN OUT NUMBER,
  p_pod_allocation_3_applied_on  IN OUT NUMBER,
  p_pod_affect_match_cost_3_swi  IN OUT NUMBER,
  p_pod_ven_code                 IN OUT NUMBER,
  p_pod_ven_payable_code         IN OUT NUMBER, --cvi1097
  p_pod_reclaim_reference        IN OUT VARCHAR2,
  p_pod_reclaim_message          IN OUT VARCHAR2,
  p_pod_max_quantity_allowed     IN OUT NUMBER,
  p_pod_max_weight_allowed       IN OUT NUMBER,
  p_pod_avr                      IN OUT NUMBER,
  p_pod_list                     IN OUT NUMBER,
  p_pod_cost_1                   IN OUT NUMBER,
  p_pod_cost_2                   IN OUT NUMBER,
  p_pod_cost_3                   IN OUT NUMBER,
  p_pod_cost_4                   IN OUT NUMBER,
  p_pod_match_cost               IN OUT NUMBER,
  p_pod_consignment_amount       IN OUT NUMBER,
  p_pod_pod_poh_id               IN OUT NUMBER,
  p_pod_pod_line_number          IN OUT NUMBER,
  p_sales_prebook_left           IN OUT NUMBER,
  p_vpd_code                     OUT VARCHAR2,
  p_vpd_vcg_id                   OUT NUMBER,
  p_pod_added_trans_amount       OUT NUMBER,              --BER3533 Montant de transport utilisée lors de l'ajout au prix de liste
  p_pod_match_cost_with_freight  OUT NUMBER,              --BER3533
  p_pdi_already_created_switch   IN NUMBER DEFAULT 0,     --par défaut... on assume que les PDI n'existe pas encore (et la ligne POD non plus)
  p_poh_id                       IN NUMBER DEFAULT NULL,  --a remplir si la ligne existe déjà et qu'on RECALCUL les prix
  p_pod_line_number              IN NUMBER DEFAULT NULL   --a remplir si la ligne existe déjà et qu'on RECALCUL les prix
  );

PROCEDURE GET_AVR_PROC( --code pareil comme AVERAGE_COST_PROC dans GICLIB
  p_ven_purchase_code           IN  NUMBER, --code du fournisseur chez qui on achète
  p_prd_code                    IN  VARCHAR2,
  p_fmt_code                    IN  VARCHAR2,  --format solide
  p_cost_price                  IN  NUMBER,
  p_vcg_id                      IN  NUMBER,
  p_pod_avr                     OUT NUMBER
) ;

PROCEDURE GET_AVR_FULL_PARAMETERS_PROC(
  p_cost_price                  IN  NUMBER,
  p_vcg_collect_distrib_qualif  IN  VARCHAR2,
  p_vcg_collected_avr_percent   IN  NUMBER,
  p_vcg_collected_avr_amount    IN  NUMBER,
  p_vcg_qualifier               IN  VARCHAR2,
  p_vcg_quart_warehouse_avr     IN  NUMBER,
  p_vcg_quart_whouse_avr_amount IN  NUMBER,
  p_prf_liter                   IN  NUMBER, --pour des produits D/B, on doit utiliser le format PRD_FMT_WEIGHTED_INV_CODE, sinon, celui du format acheté
  p_prf_purchase_weight_kg      IN  NUMBER, --pour des produits D/B, on doit utiliser le format PRD_FMT_WEIGHTED_INV_CODE, sinon, celui du format acheté
  p_prf_purchase_weight_lb      IN  NUMBER, --pour des produits D/B, on doit utiliser le format PRD_FMT_WEIGHTED_INV_CODE, sinon, celui du format acheté
  p_conversion_other_vendor     IN  NUMBER, --indique la conversion entre le format acheté en ce moment et le format vendu par le fournisseur du VCG (utile seulement lorsqu'un montant par ITEM existe)
  p_pod_avr                     OUT NUMBER
) ;

PROCEDURE GET_PREBOOK_COST_PROC(
  p_prd_code                    IN VARCHAR2,
  p_fmt_code                    IN VARCHAR2,
  p_pod_pod_poh_id              IN NUMBER,
  p_pod_pod_line_number         IN NUMBER,
  p_ctr_calc_vdi_regular_switch IN NUMBER,
  p_pod_manual_discount         IN OUT NUMBER,
  p_pod_manual_disc_cost_affect IN OUT NUMBER,
  p_pod_pty_code                IN OUT NUMBER,
  p_pod_allocation_1            IN OUT NUMBER,
  p_pod_allocation_1_applied_on IN OUT NUMBER,
  p_pod_affect_match_cost_1_swi IN OUT NUMBER,
  p_pod_allocation_2            IN OUT NUMBER,
  p_pod_allocation_2_applied_on IN OUT NUMBER,
  p_pod_affect_match_cost_2_swi IN OUT NUMBER,
  p_pod_allocation_3            IN OUT NUMBER,
  p_pod_allocation_3_applied_on IN OUT NUMBER,
  p_pod_affect_match_cost_3_swi IN OUT NUMBER,
  p_pod_ven_code                IN OUT NUMBER,
  p_pod_ven_payable_code        IN OUT NUMBER,  --cvi1097
  p_pod_reclaim_message         IN OUT VARCHAR2,
  p_pod_reclaim_reference       IN OUT VARCHAR2,
  p_pod_max_quantity_allowed    IN OUT NUMBER,
  p_pod_max_weight_allowed      IN OUT NUMBER,
  p_pod_avr                     IN OUT NUMBER,
  p_pod_list                    IN OUT NUMBER,
  p_pod_cost_1                  IN OUT NUMBER,
  p_pod_cost_2                  IN OUT NUMBER,
  p_pod_cost_3                  IN OUT NUMBER,
  p_pod_cost_4                  IN OUT NUMBER,
  p_pod_match_cost              IN OUT NUMBER,
  p_pod_consignment_amount      IN OUT NUMBER,
  p_sales_prebook_left          IN OUT NUMBER,
  p_pod_added_transp_amount     OUT NUMBER,           --BER3533 Montant de transport utilisée lors de l'ajout au prix de liste
  p_pod_match_cost_with_freight OUT NUMBER
);

--BER618 trouve le montant de discounts qui vient d'autres fournisseur que celui du POH
--recois les valeurs tel quel du PO et calcul lui même le match avant escompte etc pour le reste du calcul des escomptes
FUNCTION FIND_DISCOUNT_OTHER_VEN_FUNC(
  p_pod_poh_id                    IN NUMBER,
  p_pod_line_number               IN NUMBER,
  p_poh_ven_purchase_code         IN NUMBER,
  p_pod_list                      IN NUMBER,
  p_pod_manual_discount           IN NUMBER,
  p_pod_allocation_1              IN NUMBER,
  p_pod_allocation_2              IN NUMBER,
  p_pod_allocation_3              IN NUMBER,
  p_pod_affect_match_cost_1_swi   IN NUMBER,
  p_pod_affect_match_cost_2_swi   IN NUMBER,
  p_pod_affect_match_cost_3_swi   IN NUMBER,
  p_ctr_calc_vdi_regular_switch   IN NUMBER
)
RETURN NUMBER;

--BER618 trouve le montant de discounts qui vient d'autres fournisseur que celui du POH
--doit recevoir les montant déjà correct (match_before_discounts et list_cost basé sur ctr_calc_vdi_regular_switch etc)
FUNCTION CALCUL_DISCOUNT_OTHER_FUNC(    --csc1171 changer de nom, avant elle sappellait GET_DISCOUNT_COD_PROC
  p_poh_id                  IN  NUMBER,
  p_pod_line_number         IN  NUMBER,
  p_poh_ven_purchase_code   IN  NUMBER,
  p_cost_price              IN  NUMBER,
  p_match_before_discount   IN  NUMBER
)
RETURN NUMBER;

END PURCHASE_PRICE_PACK;
/