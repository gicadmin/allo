CREATE OR REPLACE PACKAGE phenix.CPR_PACK IS

FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  customer_promotions%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_cpr_id                         IN         customer_promotions.cpr_id%TYPE,
  p_cpr_rec                        OUT NOCOPY customer_promotions%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_cpr_id                         IN         customer_promotions.cpr_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_cpr_id                         IN         customer_promotions.cpr_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_cpr_id                         IN         customer_promotions.cpr_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_cpr_id                         IN         customer_promotions.cpr_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_cpr_id                         IN         customer_promotions.cpr_id%TYPE);


FUNCTION INSERT_FUNC(
  p_cpr_type                       IN         customer_promotions.cpr_type%TYPE,
  p_cpr_prf_prd_code               IN         customer_promotions.cpr_prf_prd_code%TYPE,
  p_cpr_prf_fmt_code               IN         customer_promotions.cpr_prf_fmt_code%TYPE,
  p_cpr_pty_code                   IN         customer_promotions.cpr_pty_code%TYPE,
  p_cpr_allocation_amount          IN         customer_promotions.cpr_allocation_amount%TYPE,
  p_cpr_count_switch               IN         customer_promotions.cpr_count_switch%TYPE,
  p_cpr_from_date                  IN         customer_promotions.cpr_from_date%TYPE,
  p_cpr_prebook_only_switch        IN         customer_promotions.cpr_prebook_only_switch%TYPE,
  p_cpr_to_date                    IN         customer_promotions.cpr_to_date%TYPE,
  p_cpr_special_allocation         IN         customer_promotions.cpr_special_allocation%TYPE,
  p_cpr_approval_switch            IN         customer_promotions.cpr_approval_switch%TYPE,
  p_cpr_pty_source_code            IN         customer_promotions.cpr_pty_source_code%TYPE,
  p_cpr_position_promo             IN         customer_promotions.cpr_position_promo%TYPE                  DEFAULT NULL,
  p_cpr_ven_car_code               IN         customer_promotions.cpr_ven_car_code%TYPE                    DEFAULT NULL,
  p_cpr_banner_to_date             IN         customer_promotions.cpr_banner_to_date%TYPE                  DEFAULT NULL,
  p_cpr_banner_from_date           IN         customer_promotions.cpr_banner_from_date%TYPE                DEFAULT NULL,
  p_cpr_car_amount                 IN         customer_promotions.cpr_car_amount%TYPE                      DEFAULT NULL,
  p_cpr_last_order_date            IN         customer_promotions.cpr_last_order_date%TYPE                 DEFAULT NULL,
  p_cpr_prebook_price              IN         customer_promotions.cpr_prebook_price%TYPE                   DEFAULT NULL,
  p_cpr_srp_promo_price            IN         customer_promotions.cpr_srp_promo_price%TYPE                 DEFAULT NULL,
  p_cpr_srp_quantity               IN         customer_promotions.cpr_srp_quantity%TYPE                    DEFAULT NULL,
  p_cpr_opening_inventory_quanti   IN         customer_promotions.cpr_opening_inventory_quantity%TYPE      DEFAULT NULL,
  p_cpr_opening_inventory_weight   IN         customer_promotions.cpr_opening_inventory_weight%TYPE        DEFAULT NULL,
  p_cpr_page_number                IN         customer_promotions.cpr_page_number%TYPE                     DEFAULT NULL,
  p_cpr_guaranteed_price           IN         customer_promotions.cpr_guaranteed_price%TYPE                DEFAULT NULL,
  p_cpr_message_1                  IN         customer_promotions.cpr_message_1%TYPE                       DEFAULT NULL,
  p_cpr_message_2                  IN         customer_promotions.cpr_message_2%TYPE                       DEFAULT NULL,
  p_cpr_message_3                  IN         customer_promotions.cpr_message_3%TYPE                       DEFAULT NULL,
  p_cpr_number_of_stickers         IN         customer_promotions.cpr_number_of_stickers%TYPE              DEFAULT NULL,
  p_cpr_member_fmt_code            IN         customer_promotions.cpr_member_fmt_code%TYPE                 DEFAULT NULL,
  p_cpr_member_fmt_price           IN         customer_promotions.cpr_member_fmt_price%TYPE                DEFAULT NULL,
  p_cpr_coupon_amount              IN         customer_promotions.cpr_coupon_amount%TYPE                   DEFAULT NULL,
  p_cpr_member_price               IN         customer_promotions.cpr_member_price%TYPE                    DEFAULT NULL,
  p_cpr_member_profit_percent      IN         customer_promotions.cpr_member_profit_percent%TYPE           DEFAULT NULL,
  p_cpr_retailer_profit_percent    IN         customer_promotions.cpr_retailer_profit_percent%TYPE         DEFAULT NULL,
  p_cpr_retailer_price             IN         customer_promotions.cpr_retailer_price%TYPE                  DEFAULT NULL,
  p_cpr_retailer_fmt_price         IN         customer_promotions.cpr_retailer_fmt_price%TYPE              DEFAULT NULL,
  p_cpr_srp_cost                   IN         customer_promotions.cpr_srp_cost%TYPE                        DEFAULT NULL,
  p_cpr_recount_processed_switch   IN         customer_promotions.cpr_recount_processed_switch%TYPE        DEFAULT 0 ,
  p_cpr_creation_date              IN         customer_promotions.cpr_creation_date%TYPE                   DEFAULT SYSDATE ,
  p_cpr_modification_date          IN         customer_promotions.cpr_modification_date%TYPE               DEFAULT SYSDATE ,
  p_cpr_recount_rebill_method      IN         customer_promotions.cpr_recount_rebill_method%TYPE           DEFAULT 'PR' ,
  p_cpr_broker_car_switch          IN         customer_promotions.cpr_broker_car_switch%TYPE               DEFAULT 0 )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY customer_promotions%ROWTYPE)
RETURN NUMBER;

-----------------------------------------------------------------------------------------------
-- Ajuster les fonctions / procédures ci-dessous afin de ne plus les utiliser au fil du temps
-- Les fonctions ci-haut doivent être considérées à la place
-- Déplacer les traitements dans un package OPERATION au besoin
-----------------------------------------------------------------------------------------------

PROCEDURE DELETE_CPR_PROC(
	p_cpr_id 					IN NUMBER,
	p_pbd_also_switch	IN NUMBER DEFAULT 1
);

PROCEDURE CUSTOMER_PROMO_PURGE_PROC(
	p_purge_customer_promo_days IN NUMBER,
	p_log_id 										IN NUMBER,
	p_nb_deleted								OUT NUMBER
);

END CPR_PACK;
/