CREATE OR REPLACE PACKAGE phenix.PRX_OPERATION_PACK IS

PROCEDURE INSERT_PRX_COST_PROC(
  p_prx_effective_date          IN price_changes.prx_effective_date%TYPE,
  p_prx_vpd_code                IN price_changes.prx_vpd_code%TYPE,
  p_prx_vpd_ven_code            IN price_changes.prx_vpd_ven_code%TYPE,
  p_prx_cost                    IN price_changes.prx_cost%TYPE,
  p_prx_cost_adjustment         IN price_changes.prx_cost_adjustment%TYPE,
  p_prx_cost_admin_1            IN price_changes.prx_cost_admin_1%TYPE,
  p_prx_cost_admin_2_percent    IN price_changes.prx_cost_admin_2_percent%TYPE,
  p_prx_posted_switch           IN price_changes.prx_posted_switch%TYPE         DEFAULT 0,
  p_prx_vpd_list_only_switch    IN NUMBER  DEFAULT 0,    --EFE133
  p_prx_use_code                IN price_changes.prx_use_code%TYPE              DEFAULT NULL,
  p_prx_modification_source     IN price_changes.prx_modification_source%TYPE   DEFAULT NULL,
  p_prx_alt_modif_source        IN price_changes.prx_alt_modif_source%TYPE      DEFAULT NULL
);

PROCEDURE INSERT_PRX_SELLING_PROC(
  p_prx_effective_date        IN price_changes.prx_effective_date%TYPE,
  p_prx_prf_prd_code          IN price_changes.prx_prf_prd_code%TYPE,
  p_prx_prf_fmt_code          IN price_changes.prx_prf_fmt_code%TYPE,
  p_prx_tobacco_tax           IN price_changes.prx_tobacco_tax%TYPE,
  p_prx_profit_percent        IN price_changes.prx_profit_percent%TYPE,
  p_prx_sell_price            IN price_changes.prx_sell_price%TYPE,
  p_prx_minimum_sale_price    IN price_changes.prx_minimum_sale_price%TYPE,
  p_prx_posted_switch         IN price_changes.prx_posted_switch%TYPE       DEFAULT 0,
  p_prx_use_code              IN price_changes.prx_use_code%TYPE            DEFAULT NULL,
  p_prx_modification_source   IN price_changes.prx_modification_source%TYPE DEFAULT NULL,
  p_prx_alt_modif_source      IN price_changes.prx_alt_modif_source%TYPE    DEFAULT NULL
);

PROCEDURE INSERT_PRX_PDS_PROC(
  p_prx_effective_date        IN price_changes.prx_effective_date%TYPE,
  p_prx_srt_code              IN price_changes.prx_srt_code%TYPE,
  p_prx_prf_prd_code          IN price_changes.prx_prf_prd_code%TYPE,
  p_prx_prf_fmt_code          IN price_changes.prx_prf_fmt_code%TYPE,
  p_prx_profit_percent        IN price_changes.prx_profit_percent%TYPE,
  p_prx_sell_price            IN price_changes.prx_sell_price%TYPE,
  p_prx_fixed_srp_switch      IN price_changes.prx_fixed_srp_switch%TYPE    DEFAULT 0,
  p_prx_posted_switch         IN price_changes.prx_posted_switch%TYPE       DEFAULT 0,
  p_prx_use_code              IN price_changes.prx_use_code%TYPE            DEFAULT NULL,
  p_prx_modification_source   IN price_changes.prx_modification_source%TYPE DEFAULT NULL,
  p_prx_alt_modif_source      IN price_changes.prx_alt_modif_source%TYPE    DEFAULT NULL
);

PROCEDURE GENERATE_PRX_PROC(
  p_prd_code                 IN products.prd_code%TYPE,
  p_prd_base_selling_list    IN products.prd_base_selling_list%TYPE,
  p_prd_cost_adjustment      IN products.prd_cost_adjustment%TYPE,
  p_prd_cost_admin_1         IN products.prd_cost_admin_1%TYPE,
  p_prd_cost_admin_2_percent IN products.prd_cost_admin_2_percent%TYPE,
  p_effective_date           IN DATE,
  p_apply_on_all_ven_switch  IN NUMBER,
  p_modification_source      IN VARCHAR2,
  p_alt_modif_source         IN VARCHAR2 DEFAULT NULL
);

PROCEDURE PURGE_PROC(
  p_prx_prf_prd_code IN price_changes.prx_prf_prd_code%TYPE,
  p_prx_prf_fmt_code IN price_changes.prx_prf_fmt_code%TYPE
);

PROCEDURE PURGE_PROC(
  p_prx_vpd_code     IN price_changes.prx_vpd_code%TYPE,
  p_prx_vpd_ven_code IN price_changes.prx_vpd_ven_code%TYPE
);

FUNCTION LOCK_PRX_COST_FUNC(
  p_prx_vpd_code     IN price_changes.prx_vpd_code%TYPE,
  p_prx_vpd_ven_code IN price_changes.prx_vpd_ven_code%TYPE
)
RETURN BOOLEAN;

FUNCTION EXISTS_PRX_FOR_DATE_FUNC( --GCL9796
  p_vpd_code              IN VARCHAR2,
  p_ven_code              IN NUMBER,
  p_limit_date            IN DATE,
  p_prx_cost              OUT NUMBER
)
RETURN BOOLEAN;

--BEA238 trouve le price change le plus futur (mais avant la date donnée) et retourne le record
FUNCTION GET_PRICE_CHANGE_FUNC(
  p_prd_code    IN VARCHAR2,
  p_fmt_code    IN VARCHAR2,
  p_max_date    IN DATE,
  p_prx_rec    OUT NOCOPY price_changes%ROWTYPE
)
RETURN BOOLEAN;

--BEA238 trouve un changement de prix coutant le plus futur possible mais AVANT(ou égal à) une date donnée
--retourne les prix converti au format en paramètre
FUNCTION FIND_COST_PRICE_CHANGE_FUNC(
  p_prd_code                  IN VARCHAR2,
  p_fmt_code                  IN VARCHAR2,  --format d'inventaire...
  p_prd_definition            IN VARCHAR2,
  p_prd_ven_code              IN NUMBER,
  p_to_date                   IN DATE,
  p_prx_cost_only             IN OUT NUMBER,    --renvoie le coutant des futurs price change (sans cost_adjust ni transport_coeff)(déjà converti au format demandé)
  p_prx_cost_adjustment       IN OUT NUMBER,    --renvoie le cost_adjustment des futurs price change (déjà converti au format demandé)
  p_prx_cost_admin_1          IN OUT NUMBER,    --renvoie le coûtant d'administration 1 des futurs price change (déjà converti au format demandé)
  p_prx_cost_admin_2_percent  IN OUT NUMBER     --renvoie le coûtant d'administration 2 des futurs price change (pourcentage)
)
RETURN BOOLEAN;

PROCEDURE RESET_R_PRX_PROC;

PROCEDURE LOAD_PRX_PROC(
  p_prx_vpd_code      IN price_changes.prx_vpd_code%TYPE,
  p_prx_vpd_ven_code  IN price_changes.prx_vpd_ven_code%TYPE
);

PROCEDURE DELETE_PRX_PROC(
  p_prx_vpd_code      IN price_changes.prx_vpd_code%TYPE,
  p_prx_vpd_ven_code  IN price_changes.prx_vpd_ven_code%TYPE
);

PROCEDURE RECREATE_PRX_PROC(
  p_new_vpd_code      IN price_changes.prx_vpd_code%TYPE,
  p_new_vpd_ven_code  IN price_changes.prx_vpd_ven_code%TYPE
);

END PRX_OPERATION_PACK;
/