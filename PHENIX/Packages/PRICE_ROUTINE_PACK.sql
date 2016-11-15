CREATE OR REPLACE PACKAGE phenix.PRICE_ROUTINE_PACK IS

/*gic814*/

FUNCTION CALCULATE_PSR_FUNC( --BER164
  p_base_price      IN NUMBER,
  p_profit_percent  IN NUMBER,
  p_srt             IN NUMBER
)
RETURN NUMBER;

FUNCTION GET_BEST_PROMOTION_FUNC(
  p_sprf_prd_code                 IN VARCHAR2,
  p_sprf_fmt_code                 IN VARCHAR2,
  p_ncus_code                     IN NUMBER,
  p_nuse_code                     IN NUMBER,
  p_prd_srp_fmt_code              IN VARCHAR2,   --gic3316
  p_npromo_amount_reg             OUT NUMBER,
  p_npromo_type_reg               OUT NUMBER,
  p_car_amount_reg                OUT NUMBER,    --cvi223
  p_srp_promo_price_reg           OUT NUMBER,    --rol1127
  p_srp_quantity_reg              OUT NUMBER,    --rol1127
  p_srp_format_reg                OUT VARCHAR2,  --rol1127
  p_npromo_amount_spe             OUT NUMBER,
  p_npromo_type_spe               OUT NUMBER,
  p_car_amount_spe                OUT NUMBER,    --cvi223
  p_srp_promo_price_spe           OUT NUMBER,    --rol1127
  p_srp_quantity_spe              OUT NUMBER,    --rol1127
  p_srp_format_spe                OUT VARCHAR2,   --rol1127
  p_whs_c_and_c_pricing_cus_code  IN NUMBER DEFAULT NULL    --bea257
)
RETURN BOOLEAN;

FUNCTION GET_DISCOUNT_FUNC(
  p_ncus_code           IN NUMBER,
  p_sprf_prd_code       IN VARCHAR2,
  p_sprf_fmt_code       IN VARCHAR2,
  p_nadmin_amount       IN OUT NUMBER,
  p_nadmin_percent      IN OUT NUMBER,
  p_npricing_strategy   IN OUT NUMBER,
  p_ncud_cost_used      IN OUT NUMBER --USG730
)
RETURN BOOLEAN;

FUNCTION GET_DISCOUNT_GRID_FUNC(
  p_ncus_dgt_code                IN NUMBER,
  p_sprf_prd_code                IN VARCHAR2,
  p_sprf_fmt_code                IN VARCHAR2,
  p_prd_pgr_code                 IN VARCHAR2,   --gic3316
  p_nadmin_amount                IN OUT NUMBER,
  p_nadmin_percent               IN OUT NUMBER,
  p_npricing_strategy            IN OUT NUMBER,
  p_ncud_cost_used               IN OUT NUMBER, --USG730
  p_cud_incl_prd_cost_admin_1_sw IN OUT NUMBER,
  p_cud_incl_prd_cost_admin_2_sw IN OUT NUMBER,
  p_cud_incl_prd_cost_adjust_sw  IN OUT NUMBER,
  p_cud_incl_prw_trans_switch    IN OUT NUMBER
)
RETURN BOOLEAN;

FUNCTION GET_QUOTATION_FUNC(
  p_ncus_code               IN NUMBER,
  p_cus_naz_nac_code        IN NUMBER,    --gic3316
  p_cus_naz_zone_code       IN NUMBER,    --gic3316
  p_cus_qty_code            IN NUMBER,    --gic3316
  p_sprf_prd_code           IN VARCHAR2,
  p_sprf_fmt_code           IN VARCHAR2,
  p_prd_srp_fmt_code        IN VARCHAR2,  --gic3316
  p_nprf_price              IN OUT NUMBER,
  p_srp_promo_price         IN OUT NUMBER,     --BER135
  p_pty_code                IN OUT NUMBER,     --CVI223
  p_car_amount              IN OUT NUMBER,     --CVI223
  p_srp_quantity            IN OUT NUMBER,     --BER135
  p_srp_format              IN OUT VARCHAR2,   --BER135
  p_promotional_item_switch IN OUT NUMBER,     --efe81
  p_royalty_amount          IN OUT NUMBER      --EFE116
)
RETURN BOOLEAN;

FUNCTION GET_PREBOOK_FUNC( --GIC1197
  p_sprf_prd_code             IN VARCHAR2,
  p_sprf_fmt_code             IN VARCHAR2,
  p_ncus_code                 IN NUMBER,
  p_nuse_code                 IN NUMBER,
  p_current_coh               IN NUMBER,
  p_delivery_date             IN DATE,
  p_nprd_base_selling         IN OUT NUMBER,
  p_ncost_price               IN OUT NUMBER,
  p_nprf_price                IN OUT NUMBER,
  p_nselling_retail           IN OUT NUMBER,
  p_npricing_source           IN OUT VARCHAR2,
  p_npromotion_amount         IN OUT NUMBER,
  p_nfmt_surcharge            IN OUT NUMBER,
  p_npromotion_type           IN OUT NUMBER,
  p_car_amount                IN OUT NUMBER, --CVI223
  p_ntobacco_tax              IN OUT NUMBER,
  p_srp_promo_price           IN OUT NUMBER,
  p_srp_quantity              IN OUT NUMBER,
  p_srp_format                IN OUT VARCHAR2,
  p_nprd_average_cost_1       IN OUT NUMBER,
  p_nprd_average_cost_2       IN OUT NUMBER,
  p_nprd_average_cost_3       IN OUT NUMBER,
  p_nprd_average_cost_4       IN OUT NUMBER,
  p_nprd_average_list         IN OUT NUMBER,
  p_nprd_avg_real_cost_1      IN OUT NUMBER,
  p_nprd_avg_real_cost_2      IN OUT NUMBER,
  p_nprd_avg_real_cost_3      IN OUT NUMBER,
  p_nprd_avg_real_cost_4      IN OUT NUMBER,
  p_nprd_avg_real_list        IN OUT NUMBER,
  p_cod_prebook_method        IN OUT VARCHAR2,
  p_cod_coh_id                IN OUT NUMBER,
  p_cod_line_number           IN OUT NUMBER,
  p_max_quantity              IN OUT NUMBER,
  p_max_weight                IN OUT NUMBER,
  p_check_prebook_head_office IN NUMBER DEFAULT 0,  --cvi53 indique si on vérifie les piges maison mère ou pas (défaut = on vérifie pas)
  p_try_to_lock_code          IN NUMBER DEFAULT 1,  --cvi53
  p_ccr_code                  OUT NUMBER, --cvi53,
  p_interface_prebook         IN NUMBER DEFAULT 0,  --USG455
  p_royalty_amount            IN OUT NUMBER, -- EFE116
  p_cash_and_carry_switch     IN NUMBER DEFAULT 0,      --bea257
  p_whs_code                  IN VARCHAR2 DEFAULT NULL  --bea257
)
RETURN BOOLEAN;

--Fonction surchargée qui va d'abord chercher les réservations et si aucune n'est trouvée la fonction régulière GET_PRICE_FUNC est appelée
FUNCTION GET_PRICE_FUNC( --GIC1197
  p_sprf_prd_code             IN VARCHAR2,
  p_sprf_fmt_code             IN VARCHAR2,
  p_ncus_code                 IN NUMBER,
  p_nuse_code                 IN NUMBER,
  p_current_coh               IN NUMBER,
  p_delivery_date             IN DATE,
  p_nprd_base_selling         IN OUT NUMBER,
  p_ncost_price               IN OUT NUMBER,
  p_nprf_price                IN OUT NUMBER,
  p_nselling_retail           IN OUT NUMBER,
  p_npricing_source           IN OUT VARCHAR2,
  p_npromotion_amount         IN OUT NUMBER,
  p_nfmt_surcharge            IN OUT NUMBER,
  p_npromotion_type           IN OUT NUMBER,
  p_car_amount                IN OUT NUMBER,  --cvi223
  p_promotional_item_switch   IN OUT NUMBER,  --EFE81
  p_ntobacco_tax              IN OUT NUMBER,
  p_srp_promo_price           IN OUT NUMBER,
  p_srp_quantity              IN OUT NUMBER,
  p_srp_format                IN OUT VARCHAR2,
  p_nprd_average_cost_1       IN OUT NUMBER,
  p_nprd_average_cost_2       IN OUT NUMBER,
  p_nprd_average_cost_3       IN OUT NUMBER,
  p_nprd_average_cost_4       IN OUT NUMBER,
  p_nprd_average_list         IN OUT NUMBER,
  p_nprd_avg_real_cost_1      IN OUT NUMBER,
  p_nprd_avg_real_cost_2      IN OUT NUMBER,
  p_nprd_avg_real_cost_3      IN OUT NUMBER,
  p_nprd_avg_real_cost_4      IN OUT NUMBER,
  p_nprd_avg_real_list        IN OUT NUMBER,
  p_cod_prebook_method        IN OUT VARCHAR2,
  p_cod_coh_id                IN OUT NUMBER,
  p_cod_line_number           IN OUT NUMBER,
  p_max_quantity              IN OUT NUMBER,
  p_max_weight                IN OUT NUMBER,
  p_check_prebook_head_office IN NUMBER DEFAULT 0,  --cvi53 indique si on vérifie les piges maison mère ou pas (défaut = on vérifie pas)
  p_try_to_lock_code          IN NUMBER DEFAULT 1,  --cvi53
  p_ccr_code                  OUT NUMBER,   --cvi53
  p_royalty_amount            IN OUT NUMBER, --EFE116
  p_cash_and_carry_switch     IN NUMBER DEFAULT 0,      --bea257
  p_whs_code                  IN VARCHAR2 DEFAULT NULL  --bea257
)
RETURN BOOLEAN;

--Fonction surchargée: Ce GET_PRICE_FUNC ne va pas chercher les réservations bulletins
FUNCTION GET_PRICE_FUNC(
  p_sprf_prd_code           IN VARCHAR2,
  p_sprf_fmt_code           IN VARCHAR2,
  p_ncus_code               IN NUMBER,
  p_nuse_code               IN NUMBER,
  p_nprd_base_selling       IN OUT NUMBER,
  p_ncost_price             IN OUT NUMBER,
  p_nprf_price              IN OUT NUMBER,
  p_nselling_retail         IN OUT NUMBER,
  p_npricing_source         IN OUT VARCHAR2,
  p_npromotion_amount       IN OUT NUMBER,
  p_nfmt_surcharge          IN OUT NUMBER,
  p_npromotion_type         IN OUT NUMBER,
  p_car_amount              IN OUT NUMBER,    --CVI223
  p_promotional_item_switch IN OUT NUMBER,  --EFE81
  p_ntobacco_tax            IN OUT NUMBER,
  p_srp_promo_price         IN OUT NUMBER,     --rol1127
  p_srp_quantity            IN OUT NUMBER,     --rol1127
  p_srp_format              IN OUT VARCHAR2,   --rol1127
  p_nprd_average_cost_1     IN OUT NUMBER,
  p_nprd_average_cost_2     IN OUT NUMBER,
  p_nprd_average_cost_3     IN OUT NUMBER,
  p_nprd_average_cost_4     IN OUT NUMBER,
  p_nprd_average_list       IN OUT NUMBER,
  p_nprd_avg_real_cost_1    IN OUT NUMBER,
  p_nprd_avg_real_cost_2    IN OUT NUMBER,
  p_nprd_avg_real_cost_3    IN OUT NUMBER,
  p_nprd_avg_real_cost_4    IN OUT NUMBER,
  p_nprd_avg_real_list      IN OUT NUMBER,
  p_ccr_code                IN OUT NUMBER, --cvi494
  p_royalty_amount          IN OUT NUMBER,  --EFE116
  p_cash_and_carry_switch     IN NUMBER DEFAULT 0,      --bea257
  p_whs_code                  IN VARCHAR2 DEFAULT NULL  --bea257
)
RETURN BOOLEAN;

--CVI2821 routine de prix qui annule les VOAR déjà appliqué par le GET PRICE normal... (sert surtout au réservation prebook...)
FUNCTION GET_PRICE_NO_VOAR_FUNC(
  p_sprf_prd_code           IN VARCHAR2,
  p_sprf_fmt_code           IN VARCHAR2,   --FRE2113 pour les dindes et bacon, il est TRÈS IMPORTANT de passé le format SOLIDE commandé (pour la surcharge)
  p_ncus_code               IN NUMBER,
  p_nuse_code               IN NUMBER,
  p_nprd_base_selling       IN OUT NUMBER,
  p_ncost_price             IN OUT NUMBER,
  p_nprf_price              IN OUT NUMBER,
  p_nselling_retail         IN OUT NUMBER,
  p_npricing_source         IN OUT VARCHAR2,
  p_npromotion_amount       IN OUT NUMBER,
  p_nfmt_surcharge          IN OUT NUMBER,
  p_npromotion_type         IN OUT NUMBER,
  p_car_amount              IN OUT NUMBER,     --CVI223
  p_promotional_item_switch IN OUT NUMBER,     --EFE81
  p_ntobacco_tax            IN OUT NUMBER,
  p_srp_promo_price         IN OUT NUMBER,     --rol1127
  p_srp_quantity            IN OUT NUMBER,     --rol1127
  p_srp_format              IN OUT VARCHAR2,   --rol1127
  p_nprd_average_cost_1     IN OUT NUMBER,
  p_nprd_average_cost_2     IN OUT NUMBER,
  p_nprd_average_cost_3     IN OUT NUMBER,
  p_nprd_average_cost_4     IN OUT NUMBER,
  p_nprd_average_list       IN OUT NUMBER,
  p_nprd_avg_real_cost_1    IN OUT NUMBER,
  p_nprd_avg_real_cost_2    IN OUT NUMBER,
  p_nprd_avg_real_cost_3    IN OUT NUMBER,
  p_nprd_avg_real_cost_4    IN OUT NUMBER,
  p_nprd_avg_real_list      IN OUT NUMBER,
  p_ccr_code                IN OUT NUMBER,  --cvi494
  p_royalty_amount          IN OUT NUMBER   --EFE116
)
RETURN BOOLEAN;

--CSC2595 Fonction wrapé pour l'utilisation de Louis-Francois.. qui ne peut pas recevoir de boolean
FUNCTION GET_PRICE_NUM_FUNC(
  p_sprf_prd_code         IN VARCHAR2,
  p_sprf_fmt_code         IN VARCHAR2,
  p_ncus_code             IN NUMBER,
  p_nuse_code             IN NUMBER,
  p_nprd_base_selling     IN OUT NUMBER,
  p_ncost_price           IN OUT NUMBER,
  p_nprf_price            IN OUT NUMBER,
  p_nselling_retail       IN OUT NUMBER,
  p_npricing_source       IN OUT VARCHAR2,
  p_npromotion_amount     IN OUT NUMBER,
  p_nfmt_surcharge        IN OUT NUMBER,
  p_npromotion_type       IN OUT NUMBER,
  p_car_amount            IN OUT NUMBER, --CVI223
  p_ntobacco_tax          IN OUT NUMBER,
  p_srp_promo_price       IN OUT NUMBER,    --rol1127
  p_srp_quantity          IN OUT NUMBER,      --rol1127
  p_srp_format            IN OUT VARCHAR2,      --rol1127
  p_nprd_average_cost_1   IN OUT NUMBER,
  p_nprd_average_cost_2   IN OUT NUMBER,
  p_nprd_average_cost_3   IN OUT NUMBER,
  p_nprd_average_cost_4   IN OUT NUMBER,
  p_nprd_average_list     IN OUT NUMBER,
  p_nprd_avg_real_cost_1  IN OUT NUMBER,
  p_nprd_avg_real_cost_2  IN OUT NUMBER,
  p_nprd_avg_real_cost_3  IN OUT NUMBER,
  p_nprd_avg_real_cost_4  IN OUT NUMBER,
  p_nprd_avg_real_list    IN OUT NUMBER
)
RETURN PLS_INTEGER;

PROCEDURE PRICE_CHANGE_ROUTINE_PROC(
  p_nven_purchase_code         IN NUMBER,
  p_nprice_to_change           IN NUMBER,
  p_nadjustment_to_change      IN NUMBER,
  p_ncost_admin_1_to_change    IN NUMBER,
  p_ncost_admin_2_percent      IN NUMBER,
  p_sprd_code                  IN VARCHAR2,
  p_update_same_product        IN VARCHAR2,
  p_prx_vpd_list_only_switch   IN NUMBER DEFAULT 0,
  p_use_code                   IN NUMBER DEFAULT NULL,   --USG792
  p_modification_source        IN VARCHAR2 DEFAULT NULL, --USG792
  p_alt_modif_source           IN VARCHAR2 DEFAULT NULL  --USG792
);


PROCEDURE PRICE_CHANGE_ROUTINE_PROC(
  p_nven_purchase_code         IN NUMBER,
  p_nprice_to_change           IN NUMBER,
  p_nadjustment_to_change      IN NUMBER,
  p_ncost_admin_1_to_change    IN NUMBER,
  p_ncost_admin_2_percent      IN NUMBER,
  p_sprd_code                  IN VARCHAR2,
  p_update_same_product        IN VARCHAR2,
  p_prx_effective_date         IN DATE   , --USG777
  p_use_code                   IN NUMBER DEFAULT NULL,   --USG792
  p_modification_source        IN VARCHAR2 DEFAULT NULL, --USG792
  p_alt_modif_source           IN VARCHAR2 DEFAULT NULL  --USG792
) ;


FUNCTION GET_SALES_COST_FUNC(
  p_prf_prd_code        IN VARCHAR2,
  p_prf_fmt_code        IN VARCHAR2,
  p_invoice_cost        IN NUMBER,
  p_cost_price          IN OUT NUMBER,
  p_prd_base_selling    IN OUT NUMBER,
  p_prd_average_cost_1  IN OUT NUMBER,
  p_prd_average_cost_2  IN OUT NUMBER,
  p_prd_average_cost_3  IN OUT NUMBER,
  p_prd_average_cost_4  IN OUT NUMBER,
  p_prd_average_list    IN OUT NUMBER,
  p_prd_avg_real_cost_1 IN OUT NUMBER,
  p_prd_avg_real_cost_2 IN OUT NUMBER,
  p_prd_avg_real_cost_3 IN OUT NUMBER,
  p_prd_avg_real_cost_4 IN OUT NUMBER,
  p_prd_avg_real_list   IN OUT NUMBER,
  p_cus_code            IN NUMBER DEFAULT NULL  --ber1442
)
RETURN BOOLEAN;

--bea257 création d'une 2eme procédure...
FUNCTION GET_SALES_COST_FUNC(
  p_prf_prd_code        IN VARCHAR2,
  p_prf_fmt_code        IN VARCHAR2,
  p_invoice_cost        IN NUMBER,
  p_cost_price          IN OUT NUMBER,
  p_prd_base_selling    IN OUT NUMBER,
  p_prd_average_cost_1  IN OUT NUMBER,
  p_prd_average_cost_2  IN OUT NUMBER,
  p_prd_average_cost_3  IN OUT NUMBER,
  p_prd_average_cost_4  IN OUT NUMBER,
  p_prd_average_list    IN OUT NUMBER,
  p_prd_avg_real_cost_1 IN OUT NUMBER,
  p_prd_avg_real_cost_2 IN OUT NUMBER,
  p_prd_avg_real_cost_3 IN OUT NUMBER,
  p_prd_avg_real_cost_4 IN OUT NUMBER,
  p_prd_avg_real_list   IN OUT NUMBER,
  p_whs_code            IN VARCHAR2  --bea257
)
RETURN BOOLEAN;

FUNCTION DO_HEAD_OFFICE_ALLOW_PBK_FUNC(
  p_cus_cus_code IN NUMBER
)
RETURN NUMBER;

PROCEDURE RECALCUL_SRP_VIA_GROUP_PROC(
  p_jsc_id IN NUMBER
);

FUNCTION CREATE_SRP_VIA_GROUP_FUNC(
  p_prd_code            IN VARCHAR2,
  p_fmt_code            IN VARCHAR2,
  p_prd_avec_succes     IN OUT NUMBER,
  p_prd_en_probleme     IN OUT NUMBER,
  p_prd_locked          IN OUT NUMBER,
  p_pds_deja_bon        IN OUT NUMBER,
  p_pds_recalculer      IN OUT NUMBER,
  p_pds_creer           IN OUT NUMBER,
  p_log_id              IN NUMBER DEFAULT NULL,
  p_allow_update_prd_bd IN NUMBER DEFAULT 1,  --indique si on peut updater directement la table product ou pas (l'appel de define_inventory_products devrait dire 0)
  p_do_commit_switch    IN NUMBER DEFAULT 1   --indique si la procédure doit COMMIT ou pas
)
RETURN BOOLEAN;

--GIC3316 nouvelle fonction appelé quand on a déjà le CUS DGT CODE et le PRD PGR CODE
FUNCTION GET_DISCOUNT_FUNC(
  p_ncus_code                    IN NUMBER,
  p_cus_dgt_code                 IN NUMBER,     --gic3316
  p_sprf_prd_code                IN VARCHAR2,
  p_sprf_fmt_code                IN VARCHAR2,
  p_prd_pgr_code                 IN NUMBER,     --gic3316
  p_nadmin_amount                IN OUT NUMBER,
  p_nadmin_percent               IN OUT NUMBER,
  p_npricing_strategy            IN OUT NUMBER,
  p_ncud_cost_used               IN OUT NUMBER, --USG730
  p_cud_incl_prd_cost_admin_1_sw IN OUT NUMBER,
  p_cud_incl_prd_cost_admin_2_sw IN OUT NUMBER,
  p_cud_incl_prd_cost_adjust_sw  IN OUT NUMBER,
  p_cud_incl_prw_trans_switch    IN OUT NUMBER
)
RETURN BOOLEAN;

--FRE3350 nouvelle fonction qui calcul les escomptes et retourne les valeurs à GET PRICE FUNC
FUNCTION GET_DISCOUNT_AMOUNT_FUNC(
  p_ncus_code                    IN NUMBER,
  p_cus_dgt_code                 IN NUMBER,
  p_sprf_prd_code                IN VARCHAR2,
  p_sprf_fmt_code                IN VARCHAR2,
  p_prd_pgr_code                 IN NUMBER,
  p_nprf_price                   IN NUMBER,
  p_prd_base_selling_list        IN NUMBER,
  p_prd_cost_admin_1             IN NUMBER,
  p_prd_cost_admin_2_percent     IN NUMBER,
  p_prd_cost_adjustment          IN NUMBER,
  p_prw_added_transp_amount      IN NUMBER,
  p_prf_tobacco_tax              IN NUMBER,
  p_nprd_average_cost_1          IN NUMBER,
  p_nprd_average_cost_2          IN NUMBER,
  p_nprd_average_cost_3          IN NUMBER,
  p_nprd_average_cost_4          IN NUMBER,
  p_nprd_average_list            IN NUMBER,
  p_nprd_avg_real_cost_1         IN NUMBER,
  p_nprd_avg_real_cost_2         IN NUMBER,
  p_nprd_avg_real_cost_3         IN NUMBER,
  p_nprd_avg_real_cost_4         IN NUMBER,
  p_nprd_avg_real_list           IN NUMBER,
  p_nprd_last_list_paid          IN NUMBER,
  p_cpr_allocation_spe           IN NUMBER,
  p_cus_admin_method             IN VARCHAR2,
  p_nadmin_amount                IN OUT NUMBER,
  p_npricing_strategy            IN OUT NUMBER,
  p_ndiscount_price              IN OUT NUMBER,
  p_nadmin_percent               IN NUMBER DEFAULT NULL,  --USG675
  p_ncud_cost_used               IN NUMBER DEFAULT NULL,  --USG675
  p_specific_cud                 IN NUMBER DEFAULT 0,     --USG675
  p_cud_incl_prd_cost_admin_1_sw IN NUMBER DEFAULT 0,
  p_cud_incl_prd_cost_admin_2_sw IN NUMBER DEFAULT 0,
  p_cud_incl_prd_cost_adjust_sw  IN NUMBER DEFAULT 0,
  p_cud_incl_prw_trans_switch    IN NUMBER DEFAULT 0
)
RETURN BOOLEAN;

FUNCTION GET_PRD_SUMMARY_COST_FUNC(
  p_prd_base_selling_list  IN products.prd_base_selling_list%TYPE,
  p_prd_cost_adjustment    IN products.prd_cost_adjustment%TYPE,
  p_prd_cost_admin_1       IN products.prd_cost_admin_1%TYPE
) RETURN NUMBER;
PRAGMA RESTRICT_REFERENCES (GET_PRD_SUMMARY_COST_FUNC,RNDS,WNDS,RNPS,WNPS);

FUNCTION GET_ADJUSTED_COST_FUNC(
  p_prd_base_selling_list     IN products.prd_base_selling_list%TYPE,
  p_prd_cost_adjustment       IN products.prd_cost_adjustment%TYPE,
  p_prd_cost_admin_1          IN products.prd_cost_admin_1%TYPE,
  p_prd_cost_admin_2_percent  IN products.prd_cost_admin_2_percent%TYPE,
  p_prw_added_transport       IN product_warehouses.prw_added_transp_amount%TYPE DEFAULT 0,
  p_prf_conversion            IN NUMBER DEFAULT 1,
  p_scale_precision           IN NUMBER DEFAULT 2
) RETURN NUMBER;
PRAGMA RESTRICT_REFERENCES (GET_ADJUSTED_COST_FUNC,RNDS,WNDS,RNPS,WNPS);

PROCEDURE GET_FORMAT_SURCHARGE_PROC(
  p_prf_prd_code          IN  product_formats.prf_prd_code%TYPE,
  p_prf_fmt_code          IN  product_formats.prf_fmt_code%TYPE,
  p_prf_surcharge         OUT product_formats.prf_surcharge%TYPE,
  p_prf_surcharge_percent OUT product_formats.prf_surcharge_percent%TYPE,
  p_fmt_surcharge         OUT formats.fmt_surcharge%TYPE,
  p_fmt_surcharge_percent OUT formats.fmt_surcharge_percent%TYPE
);

FUNCTION GET_FORMAT_SURCHARGE_FUNC(
  p_prf_prd_code  IN product_formats.prf_prd_code%TYPE,
  p_prf_fmt_code  IN product_formats.prf_fmt_code%TYPE,
  p_cus_code      IN customers.cus_code%TYPE,
  p_selling_price IN NUMBER
) RETURN NUMBER;

FUNCTION GET_FORMAT_SURCHARGE_FUNC(
  p_cus_surcharge_switch  IN customers.cus_surcharge_switch%TYPE,
  p_prf_surcharge         IN product_formats.prf_surcharge%TYPE,
  p_prf_surcharge_percent IN product_formats.prf_surcharge_percent%TYPE,
  p_fmt_surcharge         IN formats.fmt_surcharge%TYPE,
  p_fmt_surcharge_percent IN formats.fmt_surcharge_percent%TYPE,
  p_selling_price         IN NUMBER
) RETURN NUMBER;

PROCEDURE GEN_CUS_PRICE_LIST_PROC(
  p_cus_code IN customers.cus_code%TYPE
);

PROCEDURE GET_PRICE_FOR_PCI_PROC(
  p_sprf_prd_code             IN VARCHAR2,
  p_sprf_fmt_code             IN VARCHAR2,
  p_ncus_code                 IN NUMBER,
  p_delivery_date             IN DATE,
  p_nuse_code                 IN NUMBER,
  p_current_coh               IN NUMBER,
  p_check_prebook_head_office IN NUMBER,
  p_try_to_lock_code          IN NUMBER,
  p_nprd_base_selling         OUT NUMBER,
  p_ncost_price               OUT NUMBER,
  p_nprf_price                OUT NUMBER,
  p_nselling_retail           OUT NUMBER,
  p_npricing_source           OUT VARCHAR2,
  p_npromotion_amount         OUT NUMBER,
  p_nfmt_surcharge            OUT NUMBER,
  p_npromotion_type           OUT NUMBER,
  p_car_amount                OUT NUMBER,
  p_promotional_item_switch   OUT NUMBER,
  p_ntobacco_tax              OUT NUMBER,
  p_srp_promo_price           OUT NUMBER,
  p_srp_quantity              OUT NUMBER,
  p_srp_format                OUT VARCHAR2,
  p_nprd_average_cost_1       OUT NUMBER,
  p_nprd_average_cost_2       OUT NUMBER,
  p_nprd_average_cost_3       OUT NUMBER,
  p_nprd_average_cost_4       OUT NUMBER,
  p_nprd_average_list         OUT NUMBER,
  p_nprd_avg_real_cost_1      OUT NUMBER,
  p_nprd_avg_real_cost_2      OUT NUMBER,
  p_nprd_avg_real_cost_3      OUT NUMBER,
  p_nprd_avg_real_cost_4      OUT NUMBER,
  p_nprd_avg_real_list        OUT NUMBER,
  p_cod_prebook_method        OUT VARCHAR2,
  p_cod_coh_id                OUT NUMBER,
  p_cod_line_number           OUT NUMBER,
  p_max_quantity              OUT NUMBER,
  p_max_weight                OUT NUMBER,
  p_royalty_amount            OUT NUMBER,
  p_approx_original_price     OUT NUMBER,
  p_approx_selling_price      OUT NUMBER,
  p_approx_savings            OUT NUMBER
);

PROCEDURE GET_PRICE_FOR_PCI_PROC(
  p_sprf_prd_code            IN  VARCHAR2,
  p_sprf_fmt_code            IN  VARCHAR2,
  p_ncus_code                IN  NUMBER,
  p_delivery_date            IN  DATE,
  p_nprf_price               OUT NUMBER,
  p_nselling_retail          OUT NUMBER,
  p_npricing_source          OUT VARCHAR2,
  p_npromotion_amount        OUT NUMBER,
  p_npromotion_type          OUT NUMBER,
  p_promotional_item_switch  OUT NUMBER,
  p_approx_original_price    OUT NUMBER,
  p_approx_selling_price     OUT NUMBER,
  p_approx_savings           OUT NUMBER
);

PROCEDURE GEN_CGR_PRICE_LIST_PROC(
  p_cgr_code IN customers.cus_cgr_code%TYPE
);

END PRICE_ROUTINE_PACK;
/