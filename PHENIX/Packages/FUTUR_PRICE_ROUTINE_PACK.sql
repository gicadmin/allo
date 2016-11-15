CREATE OR REPLACE PACKAGE phenix.FUTUR_PRICE_ROUTINE_PACK IS


FUNCTION GET_BEST_PROMOTION_FUNC(
  p_sprf_prd_code         IN VARCHAR2,
  p_sprf_fmt_code         IN VARCHAR2,
  p_ncus_code             IN NUMBER,
  p_nuse_code             IN NUMBER,
  p_ddate                 IN DATE,
  p_dat_fin               IN DATE,       --CHA580 si le paramètre est null, on ne valide pas la date
  p_npromo_amount_reg     OUT NUMBER,
  p_npromo_type_reg       OUT NUMBER,
  p_srp_promo_price_reg   OUT NUMBER,    --rol1127
  p_srp_quantity_reg      OUT NUMBER,    --rol1127
  p_srp_format_reg        OUT VARCHAR2,  --rol1127
  p_npromo_amount_spe     OUT NUMBER,
  p_npromo_type_spe       OUT NUMBER,
  p_srp_promo_price_spe   OUT NUMBER,    --rol1127
  p_srp_quantity_spe      OUT NUMBER,    --rol1127
  p_srp_format_spe        OUT VARCHAR2   --rol1127
)
RETURN BOOLEAN;

--cette fonction détermine si il éxiste une soumission et retourne un BOOLEAN
FUNCTION GET_QUOTATION_FUNC(
  p_ncus_code       IN NUMBER,
  p_sprf_prd_code   IN VARCHAR2,
  p_sprf_fmt_code   IN VARCHAR2,
  p_ddate           IN DATE,
  p_dat_fin         IN DATE, --CHA580 si le paramètre est null, on ne valide pas la date
  p_nprf_price      IN OUT NUMBER,
  p_srp_promo_price IN OUT NUMBER,   --BER135
  p_srp_quantity    IN OUT NUMBER,     --BER135
  p_srp_format      IN OUT VARCHAR2   --BER135
)
RETURN BOOLEAN;

FUNCTION GET_PRICE_FUNC(
  p_sprf_prd_code       IN VARCHAR2,
  p_sprf_fmt_code       IN VARCHAR2, --FRE2113 pour les dindes et bacon, il est TRÈS IMPORTANT de passé le format SOLIDE commandé (pour la surcharge)
  p_ncus_code           IN NUMBER,
  p_nuse_code           IN NUMBER,
  p_ddate               IN DATE,
  p_nprd_base_selling   IN OUT NUMBER,
  p_ncost_price         IN OUT NUMBER,
  p_nprf_price          IN OUT NUMBER,
  p_nselling_retail     IN OUT NUMBER,
  p_npricing_source     IN OUT VARCHAR2,
  p_npromotion_amount   IN OUT NUMBER,
  p_nfmt_surcharge      IN OUT NUMBER,
  p_npromotion_type     IN OUT NUMBER,
  p_ntobacco_tax        IN OUT NUMBER,
  p_srp_promo_price     IN OUT NUMBER,     --rol1127
  p_srp_quantity        IN OUT NUMBER,        --rol1127
  p_srp_format          IN OUT VARCHAR2,        --rol1127
  p_dat_fin             IN DATE DEFAULT NULL --CHA580 si le paramètre est null, on ne valide pas la date
)
RETURN BOOLEAN;

FUNCTION GET_SALES_COST_FUNC(
  p_prf_prd_code      IN VARCHAR2,
  p_prf_fmt_code      IN VARCHAR2,
  p_invoice_cost      IN NUMBER,
  p_date              IN DATE,
  p_cost_price        IN OUT NUMBER,
  p_prd_base_selling  IN OUT NUMBER,
  p_cus_code          IN NUMBER --BER1442 pas besoin de mettre par défaut ici... on control la seule place qui l'appelle
)
RETURN BOOLEAN;

END FUTUR_PRICE_ROUTINE_PACK;
/