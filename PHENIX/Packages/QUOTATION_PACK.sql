CREATE OR REPLACE PACKAGE phenix.QUOTATION_PACK IS

--FRE795 fonction qui calcul le % de temps entre deux dates
FUNCTION GET_PERCENT_DATES_FUNC(
  p_start_date      IN DATE,
  p_end_date        IN DATE,
  p_ref_start_date  IN DATE,
  p_ref_end_date    IN DATE
)
RETURN NUMBER;

--procédure qui recalcule les montant selon la strategie choisie
PROCEDURE RECALCUL_SELON_STRATEGY_PROC(
  p_radio_admin                   IN VARCHAR2,  --'DOLL' OU 'perc'
  p_qtd_cost_strategy             IN NUMBER,
  p_cus_admin_flag                IN VARCHAR2,
  p_qtd_prf_prd_code              IN VARCHAR2,
  p_qtd_prf_fmt_code              IN VARCHAR2,
  p_qth_start_date                IN DATE,
  p_qth_end_date                  IN DATE,
  p_qtd_base_cost_type            IN NUMBER,  --fre2560
  p_qth_price_change_percent      IN NUMBER,
  p_qth_agreement_percent         IN NUMBER,  --FRE1057
  p_qth_promotion_percent         IN NUMBER,
  p_qth_recalculate_promo_switch  IN NUMBER,  --CVI225
  p_qth_cus_code                  IN NUMBER,
  p_qth_naz_nac_code              IN NUMBER,
  p_qth_naz_zone_code             IN NUMBER, --FRE1057
  p_qth_qty_code                  IN NUMBER,
  p_qtd_royalty_amount            IN NUMBER,  --CSC789
  p_qtd_user_set_srp_fix_switch   IN NUMBER, --CSC1292
  p_qtd_additional_adjustment     IN NUMBER, --CSC1292
  p_qtd_admin_amount              IN OUT NUMBER,
  p_qtd_markup_used               IN OUT NUMBER,
  p_qtd_promotion_amount          IN OUT NUMBER,
  p_qtd_pty_code                  IN OUT NUMBER,--CSC1293
  p_qtd_car_amount                IN OUT NUMBER,  --CVI223
  p_qtd_original_retail           IN OUT NUMBER,
  p_qtd_original_cost             IN OUT NUMBER,
  p_qtd_count_amount              IN OUT NUMBER,  --FRE1057
  p_qtd_sub_total                 IN OUT NUMBER,  --CSC789
  p_qtd_selling_price             IN OUT NUMBER,
  p_qtd_srp_quantity              IN OUT NUMBER,
  p_qtd_srp_percentage            IN OUT NUMBER,
  p_qtd_suggested_retail_price    IN OUT NUMBER,
  p_qtd_tobacco_tax               IN OUT NUMBER,
  p_qtd_system_srp_quantity       IN OUT NUMBER,  --CSC1292
  p_qtd_system_srp_price          IN OUT NUMBER,  --CSC1292
  p_qtd_system_srp_profit         IN OUT NUMBER,  --CSC1292
  p_qtd_prw_trans_in_cost_sw      IN NUMBER, --MTP96
  p_qtd_cost_admin_1_in_cost_sw   IN NUMBER, --ARM73
  p_qtd_cost_admin_2_in_cost_sw   IN NUMBER, --ARM73
  p_qtd_prd_adj_in_cost_sw        IN NUMBER  --MTP96
);

--procédure pour arrondir un PDS
PROCEDURE ROUNDING_PDS_PROC(
  p_srt_code                    IN NUMBER,
  p_qtd_suggested_retail_price  IN OUT NUMBER
);

--fonction qui retourne la promotion du produit format (si le % promo la permet)
FUNCTION RETURN_PROMOTION_FUNC (
  p_prd_code                      IN VARCHAR2,
  p_fmt_code                      IN VARCHAR2,
  p_start_date                    IN DATE,
  p_end_date                      IN DATE,
  p_qth_promotion_percent         IN NUMBER,
  p_qth_recalculate_promo_switch  IN NUMBER,  --cvi225
  p_qth_cus_code                  IN NUMBER,
  p_qth_naz_nac_code              IN NUMBER,
  p_qth_qty_code                  IN NUMBER,
  p_qtd_pty_code                  IN OUT NUMBER,  --CSC1293
  p_qtd_car_amount                IN OUT NUMBER,  --cvi223
  p_qtd_srp_quantity              IN OUT NUMBER,  --CSC1292
  p_qtd_suggested_retail_price    IN OUT NUMBER   --CSC1292
)
RETURN NUMBER;

--procédure qui calcul le selling price selon le montant admin
PROCEDURE CALCUL_WITH_AMOUNT_PROC(
  p_qtd_cost_strategy             IN NUMBER,
  p_qtd_original_cost             IN NUMBER,
  p_qtd_original_retail           IN NUMBER,
  p_qtd_admin_amount              IN OUT NUMBER,
  p_qtd_count_amount              IN NUMBER,    --in fre1057
  p_qtd_prf_prd_code              IN VARCHAR2,
  p_qtd_prf_fmt_code              IN VARCHAR2,
  p_qth_cus_code                  IN NUMBER,
  p_qth_qty_code                  IN NUMBER,
  p_qth_naz_nac_code              IN NUMBER,
  p_qth_naz_zone_code             IN NUMBER,  --csc789
  p_qth_start_date                IN DATE,  --Fre795
  p_qth_end_date                  IN DATE,  --Fre795
  p_qth_promotion_percent         IN NUMBER,  --fre795
  p_qth_recalculate_promo_switch  IN NUMBER,  --cvi225
  p_qth_price_change_percent      IN NUMBER,  --fre795
  p_cus_admin_flag                IN VARCHAR2,
  p_minimum_sale_price            IN NUMBER,  --in CSC1292(indique le montant minimum de vente du produit - null si aucun)
  p_promo_calcul                  IN NUMBER,  --in FRE1579
  p_temp_pty_code                 IN NUMBER,  --in FRE1579
  p_temp_car_amount               IN NUMBER,  --cvi223
  p_qtd_royalty_amount            IN NUMBER,  --csc789
  p_qtd_user_set_srp_fix_switch   IN NUMBER,  --csc1292
  p_qtd_additional_adjustment     IN NUMBER,  --csc1292
  p_qtd_promotion_amount          IN OUT NUMBER,  --fre1579 IN OUT
  p_qtd_pty_code                  IN OUT NUMBER,--fre1579
  p_qtd_car_amount                IN OUT NUMBER,  --cvi223
  p_qtd_suggested_retail_price    IN OUT NUMBER,
  p_qtd_srp_quantity              IN OUT NUMBER,
  p_qtd_srp_percentage            IN OUT NUMBER,
  p_qtd_sub_total                 IN OUT NUMBER,  --csc789
  p_qtd_selling_price             IN OUT NUMBER,  --csc789
  p_qtd_system_srp_quantity       IN OUT NUMBER,  --csc1292
  p_qtd_system_srp_price          IN OUT NUMBER,  --csc1292
  p_qtd_system_srp_profit         IN OUT NUMBER   --csc1292
);

--procédure qui calcul le selling price selon le % admin
PROCEDURE CALCUL_WITH_PERCENT_PROC(
  p_qtd_cost_strategy             IN NUMBER,
  p_qtd_original_cost             IN NUMBER,
  p_qtd_original_retail           IN NUMBER,
  p_qtd_markup_used               IN OUT NUMBER, --csc1292
  p_qtd_count_amount              IN NUMBER,    --in fre1057
  p_qtd_prf_prd_code              IN VARCHAR2,
  p_qtd_prf_fmt_code              IN VARCHAR2,
  p_qth_cus_code                  IN NUMBER,
  p_qth_qty_code                  IN NUMBER,
  p_qth_naz_nac_code              IN NUMBER,
  p_qth_naz_zone_code             IN NUMBER,  --csc789
  p_qth_start_date                IN DATE,  --Fre795
  p_qth_end_date                  IN DATE,  --Fre795
  p_qth_promotion_percent         IN NUMBER,  --fre795
  p_qth_recalculate_promo_switch  IN NUMBER,  --cvi225
  p_qth_price_change_percent      IN NUMBER,  --fre795
  p_cus_admin_flag                IN VARCHAR2,
  p_minimum_sale_price            IN NUMBER,  --in CSC1292(indique le montant minimum de vente du produit - null si aucun)
  p_promo_calcul                  IN NUMBER,  --in FRE1579
  p_temp_pty_code                 IN NUMBER,  --in FRE1579
  p_temp_car_amount               IN NUMBER,  --cvi223
  p_qtd_royalty_amount            IN NUMBER,  --csc789
  p_qtd_user_set_srp_fix_switch   IN NUMBER, --Csc1292
  p_qtd_additional_adjustment     IN NUMBER, --Csc1292
  p_qtd_promotion_amount          IN OUT NUMBER,  --fre1579 IN OUT
  p_qtd_pty_code                  IN OUT NUMBER,--fre1579
  p_qtd_car_amount                IN OUT NUMBER,  --cvi223
  p_qtd_srp_quantity              IN OUT NUMBER,
  p_qtd_srp_percentage            IN OUT NUMBER,
  p_qtd_sub_total                 IN OUT NUMBER,  --csc789
  p_qtd_selling_price             IN OUT NUMBER,  --csc789
  p_qtd_suggested_retail_price    IN OUT NUMBER,
  p_qtd_system_srp_quantity       IN OUT NUMBER,  --csc1292
  p_qtd_system_srp_price          IN OUT NUMBER,  --csc1292
  p_qtd_system_srp_profit         IN OUT NUMBER   --csc1292
);

--efe81 procédure permettant de trouver sil y a des price change MANUF qui fit l'interval de price change permis
FUNCTION FIND_MANUF_PRICE_CHANGE_FUNC(
  p_prd_code                  IN VARCHAR2,
  p_fmt_code                  IN VARCHAR2,
  p_prd_definition            IN VARCHAR2,
  p_prd_ven_code              IN NUMBER,
  p_qth_start_date            IN DATE,
  p_qth_end_date              IN DATE,
  p_qth_price_change_percent  IN NUMBER,
  p_prx_cost_only             IN OUT NUMBER     --renvoie le coutant des futurs price change (sans cost_adjust ni transport_coeff)(déjà converti au format de la soumission)
  )
RETURN BOOLEAN;

--efe81 procédure permettant de trouver sil y a des price change sur la taxes tabac du produit format en cours
FUNCTION FIND_TOBACCO_PRICE_CHANGE_FUNC(
  p_prd_code                  IN VARCHAR2,
  p_fmt_code                  IN VARCHAR2,
  p_prd_definition            IN VARCHAR2,
  p_qth_start_date            IN DATE,
  p_qth_end_date              IN DATE,
  p_qth_price_change_percent  IN NUMBER,
  p_prx_tobacco_tax           IN OUT NUMBER --renvoie les taxes tabac des futurs price change
)
RETURN BOOLEAN;

--efe81 procédure permettant de trouver sil y a des price change MANUF qui fit l'interval de price change permis
FUNCTION FIND_ADDED_TRANSPORT_FUNC(
  p_whs_code                  IN VARCHAR2,
  p_prd_code                  IN VARCHAR2,
  p_qth_start_date            IN DATE,
  p_qth_end_date              IN DATE,
  p_qth_price_change_percent  IN NUMBER,
  p_wpc_added_transp_amount   IN OUT NUMBER --renvoie l'ajout de transport des futurs price change (AU FORMAT D''INVENTAIRE!!)
)
RETURN BOOLEAN;

--efe133  Fonction basée sur FIND_MANUF_PRICE_CHANGE_FUNC et permettant de trouver sil y a des price change MANUF ind‚pendamment du fournisseur seulement
----pour les produits dont le changement de prix n affecte pas uniquement le prix de liste fournisseur
FUNCTION FIND_COST_PRICE_CHANGE_FUNC(
  p_prd_code                  IN VARCHAR2,
  p_fmt_code                  IN VARCHAR2,
  p_prd_definition            IN VARCHAR2,
  p_prd_ven_code              IN NUMBER,
  p_qth_start_date            IN DATE,
  p_qth_end_date              IN DATE,
  p_qth_price_change_percent  IN NUMBER,
  p_prx_cost_only             IN OUT NUMBER,    --renvoie le coutant des futurs price change (sans cost_adjust ni transport_coeff)(déjà converti au format de la soumission)
  p_prx_cost_adjustment       IN OUT NUMBER,    --renvoie le cost_adjustment des futurs price change (déjà converti au format de la soumission)
  p_prx_cost_admin_1          IN OUT NUMBER,    --renvoie le coûtant d'administration 1 des futurs price change (déjà converti au format de la soumission)
  p_prx_cost_admin_2_percent  IN OUT NUMBER     --renvoie le coûtant d'administration 2 des futurs price change (pourcentage)
)
RETURN BOOLEAN;
--procédure qui calcule le coutant (selon s'il y a des price changes coutant qui correspondent au % etc..)
PROCEDURE CALCUL_ORIGINAL_COST_PROC(
  p_qtd_prf_prd_code            IN VARCHAR2,
  p_qtd_prf_fmt_code            IN VARCHAR2,
  p_qth_cus_code                IN NUMBER, --fre1057
  p_qth_naz_nac_code            IN NUMBER, --fre1057
  p_qth_naz_zone_code           IN NUMBER, --fre1057
  p_qth_qty_code                IN NUMBER, --fre1057
  p_qth_start_date              IN DATE,
  p_qth_end_date                IN DATE,
  p_qtd_base_cost_type          IN NUMBER, --fre2560
  p_qth_price_change_percent    IN NUMBER,
  p_qth_agreement_percent       IN NUMBER, --fre1057
  p_qtd_original_cost           IN OUT NUMBER,
  p_qtd_tobacco_tax             IN OUT NUMBER,
  p_qtd_prw_trans_in_cost_sw    IN NUMBER, --MTP96
  p_qtd_prd_admin_1_in_cost_sw  IN NUMBER, --ARM73
  p_qtd_prd_admin_2_in_cost_sw  IN NUMBER, --ARM73
  p_qtd_prd_adj_in_cost_sw      IN NUMBER  --MTP96
);

--procédure qui calcule le original retail (selon s'il y a des price changes vendant qui correspondent au % etc..)
PROCEDURE CALCUL_ORIGINAL_RETAIL_PROC(
  p_qtd_prf_prd_code          IN VARCHAR2,
  p_qtd_prf_fmt_code          IN VARCHAR2,
  p_qth_start_date            IN DATE,
  p_qth_end_date              IN DATE,
  p_qth_price_change_percent  IN NUMBER,
  p_qtd_original_retail       IN OUT NUMBER,
  p_prf_minimum_sale_price    IN OUT NUMBER --csc1292
);

--procédure qui recalcule le $ ou % admin lorsqu'on vient de modifier le selling price
PROCEDURE CALCUL_ADMIN_ON_SUB_TOT_PROC( --csc789 CALCUL_ADMIN_ON_SELLING_PROC devient CALCUL_ADMIN_ON_SUB_TOT_PROC
  p_qtd_sub_total                 IN NUMBER,  --csc789
  p_qtd_cost_strategy             IN NUMBER,
  p_radio_admin                   IN VARCHAR2,
  p_qtd_count_amount              IN NUMBER,    --fre1057
  p_cus_admin_flag                IN VARCHAR2,
  p_qtd_original_cost             IN NUMBER,
  p_qtd_original_retail           IN NUMBER,
  p_qtd_prf_prd_code              IN VARCHAR2,  --fre795
  p_qtd_prf_fmt_code              IN VARCHAR2,  --fre795
  p_qth_start_date                IN DATE,      --fre795
  p_qth_end_date                  IN DATE,      --fre795
  p_qth_promotion_percent         IN NUMBER,    --fre795
  p_qth_recalculate_promo_switch  IN NUMBER,  --cvi225
  p_qth_price_change_percent      IN NUMBER,    --FRE795
  p_qth_cus_code                  IN NUMBER,    --FRE795
  p_qth_naz_nac_code              IN NUMBER,    --FRE795
  p_qth_qty_code                  IN NUMBER,    --FRE795
  p_promo_calcul                  IN NUMBER,  --IN FRE1579
  p_temp_pty_code                 IN NUMBER,  --IN FRE1579
  p_temp_car_amount               IN NUMBER,  --CVI223
  p_qtd_pty_code                  IN OUT NUMBER,  --FRE1579
  p_qtd_car_amount                IN OUT NUMBER,  --CVI223
  p_qtd_promotion_amount          IN OUT NUMBER,  --IN OUT pour fre1579
  p_qtd_markup_used               IN OUT NUMBER,
  p_qtd_admin_amount              IN OUT NUMBER,
  p_check_promo_weird             IN BOOLEAN DEFAULT TRUE --fre1579
);

--procédure pour calculer seulement le nouveau prix basé sur le pourcentage admin
PROCEDURE CALCUL_SUB_TOT_WITH_PERC_PROC(  --csc789 CALCUL_SELLING_WITH_PERC_PROC devient  CALCUL_SUB_TOT_WITH_PERC_PROC
  p_qtd_cost_strategy             IN NUMBER,
  p_qtd_original_cost             IN NUMBER,
  p_qtd_original_retail           IN NUMBER,
  p_qtd_markup_used               IN NUMBER,
  p_qtd_count_amount              IN NUMBER,      --fre1057
  p_qtd_prf_prd_code              IN VARCHAR2,    --fre795
  p_qtd_prf_fmt_code              IN VARCHAR2,    --fre795
  p_qth_start_date                IN DATE,        --fre795
  p_qth_end_date                  IN DATE,        --fre795
  p_qth_promotion_percent         IN NUMBER,      --fre795
  p_qth_recalculate_promo_switch  IN NUMBER,  --cvi225
  p_qth_price_change_percent      IN NUMBER,      --fre795
  p_qth_cus_code                  IN NUMBER,      --fre795
  p_qth_naz_nac_code              IN NUMBER,      --fre795
  p_qth_qty_code                  IN NUMBER,      --fre795
  p_cus_admin_flag                IN VARCHAR2,
  p_promo_calcul                  IN NUMBER,  --in FRE1579
  p_temp_pty_code                 IN NUMBER,  --in FRE1579
  p_temp_car_amount               IN NUMBER,  --cvi223
  p_qtd_pty_code                  IN OUT NUMBER,  --fre1579
  p_qtd_car_amount                IN OUT NUMBER,  --cvi223
  p_qtd_promotion_amount          IN OUT NUMBER,  --fre795
  p_qtd_sub_total                 IN OUT NUMBER   --csc789
);

--procédure qui calcule le original cost, original_retail, promo, et selling price, selon la strategie 1
PROCEDURE CALCUL_WITH_STRATEGY_1_PROC(
  p_qtd_prf_prd_code              IN VARCHAR2,
  p_qtd_prf_fmt_code              IN VARCHAR2,
  p_qth_start_date                IN DATE,
  p_qth_end_date                  IN DATE,
  p_qtd_base_cost_type            IN NUMBER, --fre2560
  p_qth_price_change_percent      IN NUMBER,
  p_qth_agreement_percent         IN NUMBER, --fre1057 in
  p_qth_cus_code                  IN NUMBER,  --fre1057 in
  p_qth_naz_nac_code              IN NUMBER,  --fre1057 in
  p_qth_naz_zone_code             IN NUMBER, --fre1057 in
  p_qth_qty_code                  IN NUMBER, --fre1057 in
  p_qtd_original_retail           IN OUT NUMBER,
  p_qtd_original_cost             IN OUT NUMBER,
  p_qtd_promotion_amount          IN OUT NUMBER,
  p_qtd_pty_code                  IN OUT NUMBER,--csc1293
  p_qtd_car_amount                IN OUT NUMBER, --cvi223
  p_qtd_tobacco_tax               IN OUT NUMBER,
  p_minimum_sale                  IN OUT NUMBER, --csc1292
  p_qtd_prw_trans_in_cost_sw      IN NUMBER, --MTP96
  p_qtd_cost_admin_1_in_cost_sw   IN NUMBER, --ARM73
  p_qtd_cost_admin_2_in_cost_sw   IN NUMBER, --ARM73
  p_qtd_prd_adj_in_cost_sw        IN NUMBER  --MTP96
);

--procédure qui calcule le original cost, original_retail, promo, et selling price, selon la strategie 2
PROCEDURE CALCUL_WITH_STRATEGY_2_PROC(
  p_qtd_prf_prd_code              IN VARCHAR2,  --in
  p_qtd_prf_fmt_code              IN VARCHAR2,  --in
  p_qth_start_date                IN DATE,    --in
  p_qth_end_date                  IN DATE,      --in
  p_qtd_base_cost_type            IN NUMBER,  --fre2560
  p_qth_price_change_percent      IN NUMBER,  --in
  p_qth_agreement_percent         IN NUMBER,  --fre1057
  p_qth_promotion_percent         IN NUMBER,  --in
  p_qth_recalculate_promo_switch  IN NUMBER,  --cvi225
  p_qth_cus_code                  IN NUMBER,  --in
  p_qth_naz_nac_code              IN NUMBER,  --in
  p_qth_naz_zone_code             IN NUMBER,  --fre1057 in
  p_qth_qty_code                  IN NUMBER,      --in
  p_qtd_original_retail           IN OUT NUMBER,      --IN OUT
  p_qtd_original_cost             IN OUT NUMBER,      --IN OUT
  p_qtd_promotion_amount          IN OUT NUMBER,
  p_qtd_pty_code                  IN OUT NUMBER,--csc1293
  p_qtd_car_amount                IN OUT NUMBER,  --cvi223
  p_qtd_tobacco_tax               IN OUT NUMBER,
  p_minimum_sale                  IN OUT NUMBER,  --csc1292
  p_qtd_prw_trans_in_cost_sw      IN NUMBER, --MTP96
  p_qtd_cost_admin_1_in_cost_sw   IN NUMBER, --ARM73
  p_qtd_cost_admin_2_in_cost_sw   IN NUMBER, --ARM73
  p_qtd_prd_adj_in_cost_sw        IN NUMBER  --MTP96
  );

--procédure qui calcule le original cost, original_retail, promo, et selling price, selon la strategie 3
PROCEDURE CALCUL_WITH_STRATEGY_3_PROC(
  p_qtd_prf_prd_code              IN VARCHAR2,  --in
  p_qtd_prf_fmt_code              IN VARCHAR2,  --in
  p_qth_start_date                IN DATE,    --in
  p_qth_end_date                  IN DATE,      --in
  p_qtd_base_cost_type            IN NUMBER,  --fre2560
  p_qth_price_change_percent      IN NUMBER,  --in
  p_qth_agreement_percent         IN NUMBER,  --fre1057
  p_qth_promotion_percent         IN NUMBER,  --in
  p_qth_recalculate_promo_switch  IN NUMBER,  --cvi225
  p_qth_cus_code                  IN NUMBER,  --in
  p_qth_naz_nac_code              IN NUMBER,  --in
  p_qth_naz_zone_code             IN NUMBER,  --fre1057 in
  p_qth_qty_code                  IN NUMBER,      --in
  p_qtd_original_retail           IN OUT NUMBER,      --IN OUT
  p_qtd_original_cost             IN OUT NUMBER,      --IN OUT
  p_qtd_promotion_amount          IN OUT NUMBER,
  p_qtd_pty_code                  IN OUT NUMBER,--csc1293
  p_qtd_car_amount                IN OUT NUMBER,  --cvi223
  p_qtd_tobacco_tax               IN OUT NUMBER,
  p_minimum_sale                  IN OUT NUMBER,  --csc1292
  p_qtd_prw_trans_in_cost_sw      IN NUMBER, --MTP96
  p_qtd_cost_admin_1_in_cost_sw   IN NUMBER, --ARM73
  p_qtd_cost_admin_2_in_cost_sw   IN NUMBER, --ARM73
  p_qtd_prd_adj_in_cost_sw        IN NUMBER  --MTP96
);

--procédure qui calcule le original cost, original_retail, promo, et selling price, selon la strategie 4
PROCEDURE CALCUL_WITH_STRATEGY_4_PROC(
  p_qtd_prf_prd_code              IN VARCHAR2,  --in
  p_qtd_prf_fmt_code              IN VARCHAR2, --in
  p_qth_start_date                IN DATE,     --in
  p_qth_end_date                  IN DATE,     --in
  p_qtd_base_cost_type            IN NUMBER, --fre2560
  p_qth_price_change_percent      IN NUMBER,   --in
  p_qth_agreement_percent         IN NUMBER, --fre1057
  p_qth_cus_code                  IN NUMBER,  --in
  p_qth_naz_nac_code              IN NUMBER,  --in
  p_qth_naz_zone_code             IN NUMBER, --fre1057 in
  p_qth_qty_code                  IN NUMBER,     --in
  p_qtd_original_retail           IN OUT NUMBER,
  p_qtd_original_cost             IN OUT NUMBER,   --in out
  p_qtd_promotion_amount          IN OUT NUMBER, --in out
  p_qtd_pty_code                  IN OUT NUMBER,--csc1293
  p_qtd_car_amount                IN OUT NUMBER, --cvi223
  p_qtd_tobacco_tax               IN OUT NUMBER,
  p_minimum_sale                  IN OUT NUMBER, --csc1292
  p_qtd_prw_trans_in_cost_sw      IN NUMBER, --MTP96
  p_qtd_cost_admin_1_in_cost_sw   IN NUMBER, --ARM73
  p_qtd_cost_admin_2_in_cost_sw   IN NUMBER, --ARM73
  p_qtd_prd_adj_in_cost_sw        IN NUMBER  --MTP96
);

--procédure qui calcule le original cost, original_retail, promo, et selling price, selon la strategie 5
PROCEDURE CALCUL_WITH_STRATEGY_5_PROC(
  p_qtd_prf_prd_code              IN VARCHAR2,  --in
  p_qtd_prf_fmt_code              IN VARCHAR2,  --in
  p_qth_start_date                IN DATE,    --in
  p_qth_end_date                  IN DATE,      --in
  p_qtd_base_cost_type            IN NUMBER,  --fre2560
  p_qth_price_change_percent      IN NUMBER,    --in
  p_qth_agreement_percent         IN NUMBER,  --fre1057
  p_qth_promotion_percent         IN NUMBER,  --in
  p_qth_recalculate_promo_switch  IN NUMBER,  --cvi225
  p_qth_cus_code                  IN NUMBER,    --in
  p_qth_naz_nac_code              IN NUMBER,    --in
  p_qth_naz_zone_code             IN NUMBER,  --fre1057 in
  p_qth_qty_code                  IN NUMBER,  --in
  p_qtd_original_retail           IN OUT NUMBER,  --IN OUT
  p_qtd_original_cost             IN OUT NUMBER,  --in out
  p_qtd_promotion_amount          IN OUT NUMBER,
  p_qtd_pty_code                  IN OUT NUMBER,--csc1293
  p_qtd_car_amount                IN OUT NUMBER,  --cvi223
  p_qtd_tobacco_tax               IN OUT NUMBER,
  p_minimum_sale                  IN OUT NUMBER,  --csc1292
  p_qtd_prw_trans_in_cost_sw      IN NUMBER, --MTP96
  p_qtd_cost_admin_1_in_cost_sw   IN NUMBER, --ARM73
  p_qtd_cost_admin_2_in_cost_sw   IN NUMBER, --ARM73
  p_qtd_prd_adj_in_cost_sw        IN NUMBER  --MTP96
);

--procédure qui calcule le original cost, original_retail, promo, et selling price, selon la strategie 6
PROCEDURE CALCUL_WITH_STRATEGY_6_PROC(
  p_qtd_prf_prd_code              IN VARCHAR2,    --in
  p_qtd_prf_fmt_code              IN VARCHAR2,    --in
  p_qth_start_date                IN DATE,    --in
  p_qth_end_date                  IN DATE,      --in
  p_qtd_base_cost_type            IN NUMBER,  --fre2560
  p_qth_price_change_percent      IN NUMBER,    --in
  p_qth_agreement_percent         IN NUMBER,  --fre1057
  p_qth_promotion_percent         IN NUMBER,    --in
  p_qth_recalculate_promo_switch  IN NUMBER,  --cvi225
  p_qth_cus_code                  IN NUMBER,    --in
  p_qth_naz_nac_code              IN NUMBER,    --in
  p_qth_naz_zone_code             IN NUMBER,  --fre1057 in
  p_qth_qty_code                  IN NUMBER,    --in
  p_qtd_original_retail           IN OUT NUMBER,    --IN OUT
  p_qtd_original_cost             IN OUT NUMBER,    --in out
  p_qtd_promotion_amount          IN OUT NUMBER,
  p_qtd_pty_code                  IN OUT NUMBER,--csc1293
  p_qtd_car_amount                IN OUT NUMBER,  --cvi223
  p_qtd_tobacco_tax               IN OUT NUMBER,
  p_minimum_sale                  IN OUT NUMBER,  --csc1292
  p_qtd_prw_trans_in_cost_sw      IN NUMBER, --MTP96
  p_qtd_cost_admin_1_in_cost_sw   IN NUMBER, --ARM73
  p_qtd_cost_admin_2_in_cost_sw   IN NUMBER, --ARM73
  p_qtd_prd_adj_in_cost_sw        IN NUMBER  --MTP96
);

--procédure qui calcule le original cost, original_retail, promo, et selling price, selon la strategie 7
PROCEDURE CALCUL_WITH_STRATEGY_7_PROC(
  p_qtd_prf_prd_code              IN VARCHAR2,  --in
  p_qtd_prf_fmt_code              IN VARCHAR2,  --in
  p_qth_start_date                IN DATE,    --in
  p_qth_end_date                  IN DATE,      --in
  p_qtd_base_cost_type            IN NUMBER,  --fre2560
  p_qth_price_change_percent      IN NUMBER,  --in
  p_qth_agreement_percent         IN NUMBER,  --fre1057
  p_qth_promotion_percent         IN NUMBER,  --in
  p_qth_recalculate_promo_switch  IN NUMBER,  --cvi225
  p_qth_cus_code                  IN NUMBER,  --in
  p_qth_naz_nac_code              IN NUMBER,  --in
  p_qth_naz_zone_code             IN NUMBER,  --fre1057 in
  p_qth_qty_code                  IN NUMBER,      --in
  p_qtd_original_retail           IN OUT NUMBER,      --IN OUT
  p_qtd_original_cost             IN OUT NUMBER,      --IN OUT
  p_qtd_promotion_amount          IN OUT NUMBER,
  p_qtd_pty_code                  IN OUT NUMBER,--csc1293
  p_qtd_car_amount                IN OUT NUMBER,  --cvi223
  p_qtd_tobacco_tax               IN OUT NUMBER,
  p_minimum_sale                  IN OUT NUMBER,  --csc1292
  p_qtd_prw_trans_in_cost_sw      IN NUMBER, --MTP96
  p_qtd_cost_admin_1_in_cost_sw   IN NUMBER, --ARM73
  p_qtd_cost_admin_2_in_cost_sw   IN NUMBER, --ARM73
  p_qtd_prd_adj_in_cost_sw        IN NUMBER  --MTP96
);

--fre1057 fonction qui vérifie si on a accès à un coutant garanti dans les ententes fournisseur (VSA)
FUNCTION GET_GUARANTEED_COST_FUNC(
  p_qth_cus_code          IN NUMBER,
  p_qth_naz_nac_code      IN NUMBER,
  p_qth_naz_zone_code     IN NUMBER,
  p_qth_qty_code          IN NUMBER,
  p_qtd_prf_prd_code      IN VARCHAR2,
  p_qtd_prf_fmt_code      IN VARCHAR2,
  p_qth_start_date        IN DATE,
  p_qth_end_date          IN DATE,
  p_qth_agreement_percent IN NUMBER,
  p_guaranteed_cost       OUT NUMBER  --cette valeur sera rempli seulement si on a trouvé un coutant garanti valide
)
RETURN BOOLEAN;

--fre1057 fonction qui vérifie si on a accès à des ententes fournisseurs (autre que coutant garanti)
FUNCTION COUNT_AGREEMENT_AMOUNT_FUNC(
  p_qth_cus_code          IN NUMBER,
  p_qth_naz_nac_code      IN NUMBER,
  p_qth_naz_zone_code     IN NUMBER,
  p_qth_qty_code          IN NUMBER,
  p_qtd_prf_prd_code      IN VARCHAR2,
  p_qtd_prf_fmt_code      IN VARCHAR2,
  p_qth_start_date        IN DATE,
  p_qth_end_date          IN DATE,
  p_qth_agreement_percent IN NUMBER
)
RETURN NUMBER;

--CSC1292 function qui renvoit vrai ou faux si le PRODUCT_SRPS du PDS est fixe ou pas
FUNCTION VALIDATE_IF_PSR_IS_FIXED_FUNC(
  p_prd_code          IN VARCHAR2,
  p_fmt_code          IN VARCHAR2,
  p_cus_code          IN NUMBER,
  p_nac_code          IN NUMBER,
  p_nac_zone          IN NUMBER,
  p_qty_code          IN NUMBER,
  p_srp_price         OUT NUMBER, --valeur utile seulement lorsquon est en train de calculer... pour sauver un select
  p_srp_profit        OUT NUMBER  --valeur utile seulement lorsquon est en train de calculer... pour sauver un select
)
RETURN BOOLEAN;

--CSC1292 procédure qui calcule le pourcentage de profit basé sur la quantité et le prix passé en paramètre
PROCEDURE ADJUST_PERCENT_ON_PDS_PROC (
  p_qtd_prf_prd_code    IN VARCHAR2,
  p_qtd_prf_fmt_code    IN VARCHAR2,
  p_qtd_srp_fmt_code    IN VARCHAR2,
  p_qtd_selling_price   IN NUMBER,  --selling_price - additionnal_amount
  p_srp_price           IN NUMBER,
  p_srp_quantity        IN NUMBER,
  p_srp_profit          OUT NUMBER
);

--CSC1292 procédure qui calcule le prix basé sur la quantité et le pourcentage de profit passé en paramètre
PROCEDURE ADJUST_PDS_ON_PERCENT_PROC(
  p_qtd_prf_prd_code      IN VARCHAR2,
  p_qtd_prf_fmt_code      IN VARCHAR2,
  p_qtd_srp_fmt_code      IN VARCHAR2,
  p_qtd_selling_price     IN NUMBER,  --selling_price - additionnal_amount
  p_cus_code              IN NUMBER,
  p_nac_code              IN NUMBER,
  p_nac_zone              IN NUMBER,
  p_qty_code              IN NUMBER,
  p_srp_profit            IN NUMBER,
  p_srp_quantity          IN NUMBER,
  p_srp_price             OUT NUMBER
);

--CSC1292 procédure qui trouve quel est le PDS suggéré par le système (prix, qté et pourcentage profit)
PROCEDURE FIND_SUGGESTED_PDS_INFO_PROC (
  p_prd_code                      IN VARCHAR2,
  p_fmt_code                      IN VARCHAR2,
  p_start_date                    IN DATE,
  p_end_date                      IN DATE,
  p_qth_promotion_percent         IN NUMBER,
  p_qth_recalculate_promo_switch  IN NUMBER,  --cvi225
  p_cus_code                      IN NUMBER,
  p_nac_code                      IN NUMBER,
  p_nac_zone                      IN NUMBER,
  p_qty_code                      IN NUMBER,
  p_qtd_pty_code                  IN NUMBER,  --on n'ajoute pas le CAR_AMOUNT ICI CVI223
  p_qtd_selling_price             IN NUMBER,
  p_qtd_additional_adjustment     IN NUMBER,
  p_pds_quantity                  OUT NUMBER,
  p_pds_price                     OUT NUMBER,
  p_pds_percent                   OUT NUMBER
);

--FRE1579 remettre la procédure qui valide si la stratégie utilisé est mieux que la promo BASIC...
FUNCTION VALIDATE_FINAL_SUB_TOTAL_FUNC (
  p_qtd_cost_strategy             IN NUMBER,
  p_qtd_prf_prd_code              IN VARCHAR2,
  p_qtd_prf_fmt_code              IN VARCHAR2,
  p_qth_start_date                IN DATE,
  p_qth_end_date                  IN DATE,
  p_qth_promotion_percent         IN NUMBER,
  p_qth_recalculate_promo_switch  IN NUMBER,  --cvi225
  p_qtd_markup_used               IN NUMBER,
  p_qtd_admin_amount              IN NUMBER,
  p_qth_cus_code                  IN NUMBER,
  p_qth_naz_nac_code              IN NUMBER,
  p_qth_qty_code                  IN NUMBER,
  p_minimum_sale_price            IN NUMBER,
  p_qtd_pty_code                  IN OUT NUMBER,  --CSC1293
  p_qtd_car_amount                IN OUT NUMBER   --cvi223
)
RETURN NUMBER;

--FRE1579 procédure pour appliquer la promo qui détruit le calcul de la soumission...
PROCEDURE RECALCUL_PROMO_WEIRD_PROC(
  p_qtd_cost_strategy       IN NUMBER,
  p_radio_admin             IN VARCHAR2,  --'DOLL' ou 'PERC'
  p_cus_admin_flag          IN VARCHAR2,
  p_qtd_original_cost       IN NUMBER,
  p_qtd_original_retail     IN NUMBER,
  p_qtd_count_amount        IN NUMBER,
  p_qtd_admin_amount        IN NUMBER,
  p_qtd_markup_used         IN NUMBER,
  p_promo_calcul            IN NUMBER,
  p_temp_pty_code           IN NUMBER,
  p_temp_car_amount         IN NUMBER,  --cvi223
  p_qtd_promotion_amount    IN OUT NUMBER,
  p_qtd_pty_code            IN OUT NUMBER,
  p_qtd_car_amount          IN OUT NUMBER,  --cvi223
  p_qtd_sub_total           IN OUT NUMBER
);

--function qui applique les montants en cours pour trouvé le sous-total que ca donne
FUNCTION FIND_SUB_TOTAL_NO_CHANGE_FUNC(
  p_qtd_cost_strategy       IN NUMBER,
  p_radio_admin             IN VARCHAR2,  --'DOLL' ou 'PERC'
  p_cus_admin_flag          IN VARCHAR2,
  p_qtd_original_cost       IN NUMBER,
  p_qtd_original_retail     IN NUMBER,
  p_qtd_count_amount        IN NUMBER,
  p_qtd_admin_amount        IN NUMBER,
  p_qtd_markup_used         IN NUMBER,
  p_qtd_promotion_amount    IN NUMBER
)
RETURN NUMBER;

FUNCTION CONVERT_PERC_TO_AMOUNT_FUNC(
  p_qtd_cost_strategy       IN NUMBER,
  p_cus_admin_flag          IN VARCHAR2,
  p_qtd_original_cost       IN NUMBER,
  p_qtd_original_retail     IN NUMBER,
  p_qtd_promotion_amount    IN NUMBER,
  p_qtd_count_amount        IN NUMBER,
  p_qtd_markup_used         IN NUMBER,
  p_qtd_sub_total           IN NUMBER
)
RETURN NUMBER;

END QUOTATION_PACK;
/