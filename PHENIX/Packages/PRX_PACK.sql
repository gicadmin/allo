CREATE OR REPLACE PACKAGE phenix.PRX_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  price_changes%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_prx_id                         IN         price_changes.prx_id%TYPE,
  p_prx_rec                        OUT NOCOPY price_changes%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_prx_id                         IN         price_changes.prx_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_prx_id                         IN         price_changes.prx_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_prx_id                         IN         price_changes.prx_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_prx_id                         IN         price_changes.prx_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_prx_id                         IN         price_changes.prx_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_prx_id                         IN         price_changes.prx_id%TYPE);


FUNCTION INSERT_FUNC(
  p_prx_effective_date       IN         price_changes.prx_effective_date%TYPE,
  p_prx_posted_switch        IN         price_changes.prx_posted_switch%TYPE,
  p_prx_prf_prd_code         IN         price_changes.prx_prf_prd_code%TYPE              DEFAULT NULL,
  p_prx_prf_fmt_code         IN         price_changes.prx_prf_fmt_code%TYPE              DEFAULT NULL,
  p_prx_vpd_code             IN         price_changes.prx_vpd_code%TYPE                  DEFAULT NULL,
  p_prx_vpd_ven_code         IN         price_changes.prx_vpd_ven_code%TYPE              DEFAULT NULL,
  p_prx_cost                 IN         price_changes.prx_cost%TYPE                      DEFAULT NULL,
  p_prx_profit_percent       IN         price_changes.prx_profit_percent%TYPE            DEFAULT NULL,
  p_prx_sell_price           IN         price_changes.prx_sell_price%TYPE                DEFAULT NULL,
  p_prx_tobacco_tax          IN         price_changes.prx_tobacco_tax%TYPE               DEFAULT NULL,
  p_prx_cost_adjustment      IN         price_changes.prx_cost_adjustment%TYPE           DEFAULT NULL,
  p_prx_cost_admin_1         IN         price_changes.prx_cost_admin_1%TYPE              DEFAULT NULL,
  p_prx_srt_code             IN         price_changes.prx_srt_code%TYPE                  DEFAULT NULL,
  p_prx_minimum_sale_price   IN         price_changes.prx_minimum_sale_price%TYPE        DEFAULT NULL,
  p_prx_elimination_date     IN         price_changes.prx_elimination_date%TYPE          DEFAULT NULL,
  p_prx_use_code             IN         price_changes.prx_use_code%TYPE                  DEFAULT NULL,
  p_prx_modification_source  IN         price_changes.prx_modification_source%TYPE       DEFAULT NULL,
  p_prx_alt_modif_source     IN         price_changes.prx_alt_modif_source%TYPE          DEFAULT NULL,
  p_prx_cost_admin_2_percent IN         price_changes.prx_cost_admin_2_percent%TYPE      DEFAULT NULL,
  p_prx_creation_date        IN         price_changes.prx_creation_date%TYPE             DEFAULT SYSDATE ,
  p_prx_modification_date    IN         price_changes.prx_modification_date%TYPE         DEFAULT SYSDATE ,
  p_prx_fixed_srp_switch     IN         price_changes.prx_fixed_srp_switch%TYPE          DEFAULT 0 )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY price_changes%ROWTYPE)
RETURN NUMBER;



-----------------------------------------------------------------------------------------------
-- Ajuster les fonctions / procédures ci-dessous afin de ne plus les utiliser au fil du temps
-- Les fonctions ci-haut doivent être considérées à la place
-- Déplacer les traitements dans un package OPERATION au besoin
-----------------------------------------------------------------------------------------------

FUNCTION GET_PRX_ID_FUNC RETURN NUMBER;

--insertion d'un changement de prix du vendant
PROCEDURE INSERT_PRX_SELLING_PROC(
  p_prx_id                      IN price_changes.prx_id%TYPE,
  p_prx_effective_date          IN price_changes.prx_effective_date%TYPE,
  p_prx_prf_prd_code            IN price_changes.prx_prf_prd_code%TYPE,
  p_prx_prf_fmt_code            IN price_changes.prx_prf_fmt_code%TYPE,
  p_prx_tobacco_tax             IN price_changes.prx_tobacco_tax%TYPE,
  p_prx_profit_percent          IN price_changes.prx_profit_percent%TYPE,
  p_prx_sell_price              IN price_changes.prx_sell_price%TYPE,
  p_prx_minimum_sale_price      IN price_changes.prx_minimum_sale_price%TYPE,
  p_prx_posted_switch           IN price_changes.prx_posted_switch%TYPE DEFAULT 0,
  p_prx_use_code                IN price_changes.prx_use_code%TYPE DEFAULT NULL,           --USG792
  p_prx_modification_source     IN price_changes.prx_modification_source%TYPE DEFAULT NULL,--USG792
  p_prx_alt_modif_source        IN price_changes.prx_alt_modif_source%TYPE DEFAULT NULL    --USG792
);

PROCEDURE GET_PRICE_CHANGE_PROC(
  p_vpd_code              IN VARCHAR2,
  p_ven_code              IN NUMBER,
  p_prx_effective_date    OUT DATE,
  p_prx_cost              OUT NUMBER
);

--csc3019 creation de la fonction pour rapporter le prix contenant deja le price change
--si on est super d et que le type de promo est garanti (sinon, retourne prf_price seulement)
--appeller par le bottin des promotions pour linstant
FUNCTION FIND_PRICE_PRX_APPLIED_FUNC(
  p_prd_code                    IN VARCHAR2,
  p_fmt_code                    IN VARCHAR2,
  p_date_debut                  IN DATE,
  p_pty_guaranteed_price_switch IN NUMBER,
  p_super_distributor_switch    IN NUMBER
)
RETURN NUMBER;































END PRX_PACK;
/