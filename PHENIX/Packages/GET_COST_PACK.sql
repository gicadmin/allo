CREATE OR REPLACE PACKAGE phenix.GET_COST_PACK IS

PROCEDURE GET_AVERAGE_COSTS_PROC(
 p_jsc_id IN NUMBER
);

PROCEDURE CALCUL_AVERAGE_PROC(
  p_sprd_code                     IN VARCHAR2,
  p_prd_definition                IN VARCHAR2,  --fre1593
  p_prd_avg_cost_recalc_date      IN DATE,      --fre1593
  p_fmt_conversion_to_kilograms   IN NUMBER,    --fre1593
  p_sprd_fmt_solid_invent         IN VARCHAR2,
  p_nprd_quantity_accounting      IN NUMBER,
  p_nprd_weight_accounting        IN NUMBER,
  p_nprd_average_list             IN OUT NUMBER,
  p_nprd_average_cost_1           IN OUT NUMBER,
  p_nprd_average_cost_2           IN OUT NUMBER,
  p_nprd_average_cost_3           IN OUT NUMBER,
  p_nprd_average_cost_4           IN OUT NUMBER,
  p_nprd_average_weight           IN OUT NUMBER  --BER115
);

PROCEDURE PRODUCT_PROCESS_PROC(
  p_sprd_code                     IN VARCHAR2,
  p_prd_definition                IN VARCHAR2,  --fre1593
  p_prd_avg_cost_recalc_date      IN DATE,      --fre1593
  p_fmt_conversion_to_kilograms   IN NUMBER,    --fre1593
  p_prd_base_selling_list         IN NUMBER,    --fre1593
  p_prd_ven_code                  IN NUMBER,    --fre1593
  p_prd_cost_adjustment           IN NUMBER,    --fre1593
  p_prd_cost_admin_1              IN NUMBER,    --ARM73
  p_prd_cost_admin_2_percent      IN NUMBER,    --ARM73
  p_prd_pgr_code                  IN NUMBER,    --fre1593
  p_sprd_fmt_solid_invent         IN VARCHAR2,
  p_sprd_fmt_weighted_inv_code    IN VARCHAR2,
  p_nprd_quantity_accounting      IN NUMBER,
  p_nprd_weight_accounting        IN NUMBER,
  p_nprd_average_cost_1           IN OUT NUMBER,
  p_nprd_average_cost_2           IN OUT NUMBER,
  p_nprd_average_cost_3           IN OUT NUMBER,
  p_nprd_average_cost_4           IN OUT NUMBER,
  p_nprd_average_list             IN OUT NUMBER,
  p_nprd_avg_real_list            IN OUT NUMBER,
  p_nprd_avg_real_cost_1          IN OUT NUMBER,
  p_nprd_avg_real_cost_2          IN OUT NUMBER,
  p_nprd_avg_real_cost_3          IN OUT NUMBER,
  p_nprd_avg_real_cost_4          IN OUT NUMBER,
  p_ctr_invoice_cost              IN NUMBER,       --BER119--
  p_do_commit                     BOOLEAN DEFAULT TRUE
);

PROCEDURE NET_COST_PROC(
  p_cost_price                  IN NUMBER,
  p_allocation                  IN NUMBER,  --manual discounts
  p_manual_disc_cost_affected   IN NUMBER, --fre654
  p_allocation_1                IN NUMBER,
  p_allocation_2                IN NUMBER,
  p_allocation_3                IN NUMBER,
  p_allocation_1_applied_on     IN NUMBER,
  p_allocation_2_applied_on     IN NUMBER,
  p_allocation_3_applied_on     IN NUMBER,
  p_affect_match_cost_1_switch  IN NUMBER, --fre654
  p_affect_match_cost_2_switch  IN NUMBER, --fre654
  p_affect_match_cost_3_switch  IN NUMBER, --fre654
  p_pod_average                 IN NUMBER,
  p_discount_cost_1             IN OUT NUMBER,
  p_discount_cost_2             IN OUT NUMBER,
  p_discount_cost_3             IN OUT NUMBER,
  p_discount_cost_4             IN OUT NUMBER,
  p_match_discount              IN OUT NUMBER, --fre654
  p_net_cost_1                  OUT NUMBER,
  p_net_cost_2                  OUT NUMBER,
  p_net_cost_3                  OUT NUMBER,
  p_net_cost_4                  OUT NUMBER,
  p_net_match_cost              OUT NUMBER --fre654
);

--CSC1171 fonction créer pour obtenir le match_cost utilisé pour calculé les AVR et discount à rebill
--avant de faire le calcul final..
FUNCTION GET_MATCH_BEFORE_DISC_FUNC(
  p_cost_price                  IN NUMBER,
  p_allocation                  IN NUMBER,  --manual discounts
  p_allocation_1                IN NUMBER,
  p_allocation_2                IN NUMBER,
  p_allocation_3                IN NUMBER,
  p_affect_match_cost_1_switch  IN NUMBER,
  p_affect_match_cost_2_switch  IN NUMBER,
  p_affect_match_cost_3_switch  IN NUMBER
)
RETURN NUMBER;

PROCEDURE CALCUL_REAL_AVERAGE_PROC(
  p_sprd_code                     IN VARCHAR2,
  p_prd_definition                IN VARCHAR2,  --fre1593
  p_fmt_conversion_to_kilograms   IN NUMBER,    --fre1593
  p_sprd_fmt_solid_invent         IN VARCHAR2,
  p_nprd_quantity_accounting      IN NUMBER,
  p_nprd_weight_accounting        IN NUMBER,
  p_nprd_avg_real_list            IN OUT NUMBER,
  p_nprd_avg_real_cost_1          IN OUT NUMBER,
  p_nprd_avg_real_cost_2          IN OUT NUMBER,
  p_nprd_avg_real_cost_3          IN OUT NUMBER,
  p_nprd_avg_real_cost_4          IN OUT NUMBER,
  p_nprd_average_weight           IN OUT NUMBER --BER115
);

END GET_COST_PACK;
/