CREATE OR REPLACE PACKAGE phenix.PURCHASE_PACK IS


/*
* GIMAT   DATE       PROGRAMMEUR              DESCRIPTION
* ------ ----------  ----------- ----------------------------------------
* ROL589 26/07/2004   RAYMOND     ELIMINER LA FONCTION SUGGEST_TO_PURCHASE
* EFE70  21-09-2011   Mawuko      Enlever la fonction UPDATE_CONSIGNMENT_FUNC
* BER3533 09-10-2012  Mawuko      Modifier  CALCULATE_VENDOR_SUMMARY_PROC : Modifier l'appel de CAPS_OPERATION_PACK.CALCULATE_VENDOR_SUMMARY_PROC en remplaçant p_tcd_pod_match_cost par  p_tcd_pod_match_cost_freight
* */

PROCEDURE CREATE_875_JOB_PROC(
  p_jsc_id IN NUMBER
);

FUNCTION FORMAT_PURCHASE_PRODUCT_FUNC(
  p_prd_code IN VARCHAR2
)
RETURN VARCHAR2;

PROCEDURE BEST_PURCHASE_PROMOTION_PROC(
  p_prd_code                  IN VARCHAR2,
  p_vpd_fmt_code              IN VARCHAR2,
  p_whs_code                  IN VARCHAR2,  --ber1460
  p_ven_code                  IN NUMBER,
  p_promo_type                IN VARCHAR2,
  p_delivery_date             IN DATE,
  p_search_pige               IN NUMBER,        --ber116
  v_pod_allocation_1          OUT NUMBER,
  v_pod_allocation_2          OUT NUMBER,
  v_pod_allocation_3          OUT NUMBER,
  v_pod_alloc_1_applied_on    OUT NUMBER,
  v_pod_alloc_2_applied_on    OUT NUMBER,
  v_pod_alloc_3_applied_on    OUT NUMBER,
  v_pod_affect_match_1_switch OUT NUMBER,     --FRE654
  v_pod_affect_match_2_switch OUT NUMBER,     --FRE654
  v_pod_affect_match_3_switch OUT NUMBER,     --FRE654
  v_pod_pty_code              OUT NUMBER,
  v_vpr_freegood_volume       OUT NUMBER,
  v_vpr_freegood_quantity     OUT NUMBER,
  v_vpr_end_date              OUT DATE,
  v_vpr_start_date            OUT DATE,
  v_vpr_max_qty_allowed       OUT NUMBER, --ber116
  v_vpr_max_wght_allowed      OUT NUMBER, --ber116
  p_pod_poh_id                OUT NUMBER,
  p_pod_line_number           OUT NUMBER,
  v_vpr_reclaim_ven_code      OUT NUMBER,  --FRE770
  v_vpr_reclaim_reference     OUT VARCHAR2, --FRE770
  v_vpr_reclaim_message       OUT VARCHAR2
);

PROCEDURE BEST_PURCHASE_PROMO_NEW_PROC(
  p_prd_code                    IN VARCHAR2,
  p_vpd_fmt_code                IN VARCHAR2,
  p_whs_code                    IN VARCHAR2,  --ber1460
  p_ven_code                    IN NUMBER,
  p_promo_type                  IN VARCHAR2,
  p_delivery_date               IN DATE,
  p_search_pige                 IN NUMBER,        --ber116
  v_pod_allocation_1            OUT NUMBER,
  v_pod_allocation_2            OUT NUMBER,
  v_pod_allocation_3            OUT NUMBER,
  v_pod_alloc_1_applied_on      OUT NUMBER,
  v_pod_alloc_2_applied_on      OUT NUMBER,
  v_pod_alloc_3_applied_on      OUT NUMBER,
  v_pod_affect_match_1_switch   OUT NUMBER,     --FRE654
  v_pod_affect_match_2_switch   OUT NUMBER,     --FRE654
  v_pod_affect_match_3_switch   OUT NUMBER,     --FRE654
  v_pod_pty_code                OUT NUMBER,
  v_vpr_freegood_volume         OUT NUMBER,
  v_vpr_freegood_quantity       OUT NUMBER,
  v_vpr_end_date                OUT DATE,
  v_vpr_start_date              OUT DATE,
  v_vpr_max_qty_allowed         OUT NUMBER, --ber116
  v_vpr_max_wght_allowed        OUT NUMBER, --ber116
  p_pod_poh_id                  OUT NUMBER,
  p_pod_line_number             OUT NUMBER,
  v_vpr_reclaim_ven_code        OUT NUMBER,  --FRE770
  v_vpr_reclaim_reference       OUT VARCHAR2, --FRE770
  v_vpr_reclaim_message         OUT VARCHAR2, --FRE770
  p_ven_check_deliv_date_switch IN NUMBER DEFAULT NULL,   --ber2489 possibilité de passer la valeur si on l'a déjà (sauve des select a répétition pour caps)
  p_ctr_allocation_1_applied_on IN NUMBER DEFAULT NULL,   --ber2489 possibilité de passer la valeur si on l'a déjà (sauve des select a répétition pour caps)
  p_ctr_allocation_2_applied_on IN NUMBER DEFAULT NULL,   --ber2489 possibilité de passer la valeur si on l'a déjà (sauve des select a répétition pour caps)
  p_ctr_allocation_3_applied_on IN NUMBER DEFAULT NULL,   --ber2489 possibilité de passer la valeur si on l'a déjà (sauve des select a répétition pour caps)
  p_ctr_affect_match_cost_1_swi IN NUMBER DEFAULT NULL,   --ber2489 possibilité de passer la valeur si on l'a déjà (sauve des select a répétition pour caps)
  p_ctr_affect_match_cost_2_swi IN NUMBER DEFAULT NULL,   --ber2489 possibilité de passer la valeur si on l'a déjà (sauve des select a répétition pour caps)
  p_ctr_affect_match_cost_3_swi IN NUMBER DEFAULT NULL    --ber2489 possibilité de passer la valeur si on l'a déjà (sauve des select a répétition pour caps)
);  --Note: Les valeurs de CONTROL doivent être TOUTES passée.. ou aucune... mais pas à moitié..

FUNCTION SPECORDER_TO_PURCHASE_FUNC(
  p_tch_id            IN NUMBER,
  p_prd_code          IN VARCHAR2,
  p_vpd_prf_fmt_code  IN VARCHAR2,
  p_prd_definition    IN VARCHAR2,
  p_whs_code          IN VARCHAR2 --ber1460
)
RETURN NUMBER;

FUNCTION GET_PROD_ON_POD_OP_FUNC(   --FRE712
  p_prd_code        IN VARCHAR2,          --code de produit recherché
  p_fmt_code        IN VARCHAR2,          --format dans lequel on veut recevoir la quantité converti
  p_prd_definition  IN VARCHAR2,          --type de produit 'F', 'S', 'D', 'B'
  p_max_poh_date    IN DATE DEFAULT NULL, --sil y a des pod fixed delivery, on prendra seulement ceux livrable avant la date en paramètre, si le paramètre est null, on ne valide pas la date
  p_whs_code        IN VARCHAR2 DEFAULT NULL  --BER1458
)
RETURN NUMBER;

FUNCTION GET_INDIRECT_DELIVERY_FUNC(  --CSC1487 --GET_LIVIND_FUNC
  p_prd_code        IN VARCHAR2,          --code de produit recherché
  p_fmt_code        IN VARCHAR2,          --format dans lequel on veut recevoir la quantité converti
  p_prd_definition  IN VARCHAR2,
  p_whs_code        IN VARCHAR2 DEFAULT NULL --s il y a l entrepot on prendra les POH dont lentrepôt est celui passé en passé en paramètre
                                             --  si le paramètre est null, on prend tout      ---BER1458
)
RETURN NUMBER;

FUNCTION GET_RMA_FUNC(  --CSC1959
  p_prd_code       IN VARCHAR2,         --code de produit recherché
  p_fmt_code       IN VARCHAR2,         --format dans lequel on veut recevoir la quantité converti
  p_prd_definition IN VARCHAR2,
  p_whs_code       IN VARCHAR2 DEFAULT NULL  --BER1458
)
RETURN NUMBER;

FUNCTION  GET_INTERCO_IN_FUNC(  ---BER1458
  p_prd_code        IN VARCHAR2,          --code de produit recherché
  p_fmt_code        IN VARCHAR2,          --format dans lequel on veut recevoir la quantité converti
  p_prd_definition  IN VARCHAR2,
  p_whs_code        IN VARCHAR2 DEFAULT NULL
) RETURN NUMBER ;

FUNCTION  GET_INTERCO_OUT_FUNC(  ---BER1458
    p_prd_code      IN VARCHAR2,          --code de produit recherché
  p_fmt_code        IN VARCHAR2,          --format dans lequel on veut recevoir la quantité converti
  p_prd_definition  IN VARCHAR2,
  p_whs_code        IN VARCHAR2 DEFAULT NULL
) RETURN NUMBER ;

FUNCTION GET_INTERCO_LINK_POD_IN_FUNC(  ---BER1458
    p_prd_code      IN VARCHAR2,          --code de produit recherché
  p_fmt_code        IN VARCHAR2,          --format dans lequel on retourne la quantité converti
  p_prd_definition  IN VARCHAR2,
  p_whs_code        IN VARCHAR2 DEFAULT NULL --s il y a l entrepot on prendra les Transferts  dont lentrepôt de destination est celui passé en passé en paramètre --  si le paramètre est null, on prend tout
)
RETURN NUMBER;

FUNCTION GET_INTERCO_LINK_POD_OUT_FUNC(  ---BER1458
    p_prd_code      IN VARCHAR2,          --code de produit recherché
  p_fmt_code        IN VARCHAR2,          --format dans lequel on retourne la quantité convertie
  p_prd_definition  IN VARCHAR2,
  p_whs_code        IN VARCHAR2 DEFAULT NULL --s il y a l entrepot on prendra les Transferts  dont lentrepôt de destination est celui passé en passé en paramètre --  si le paramètre est null, on prend tout
)
RETURN NUMBER;

FUNCTION SPECORDER_RECEIVED_FUNC( --FRE1674
  p_prd_code          IN VARCHAR2,
  p_vpd_prf_fmt_code  IN VARCHAR2,
  p_prd_definition    IN VARCHAR2,
  p_whs_code          IN VARCHAR2
)
RETURN NUMBER;

PROCEDURE FIND_INTERCO_VALUES_PROC(
  p_ctr_multi_warehouse_switch    IN NUMBER,
  p_ctr_whs_code                  IN VARCHAR2,
  p_prd_code                      IN VARCHAR2,
  p_tch_whs_code                  IN VARCHAR2,
  p_tcd_more_than_one_whs_switch  IN OUT NUMBER,
  p_tcd_other_whs_only_switch     IN OUT NUMBER
);

END PURCHASE_PACK;
/