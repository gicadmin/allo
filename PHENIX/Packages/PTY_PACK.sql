CREATE OR REPLACE PACKAGE phenix.PTY_PACK AS

PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  promotion_types%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pty_code                       IN         promotion_types.pty_code%TYPE,
  p_pty_rec                        OUT NOCOPY promotion_types%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pty_code                       IN         promotion_types.pty_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pty_code                       IN         promotion_types.pty_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_pty_code                       IN         promotion_types.pty_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pty_code                       IN         promotion_types.pty_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pty_code                       IN         promotion_types.pty_code%TYPE);


PROCEDURE INSERT_PROC(
  p_pty_code                       IN         promotion_types.pty_code%TYPE,
  p_pty_broker_switch              IN         promotion_types.pty_broker_switch%TYPE,
  p_pty_cost_plus_switch           IN         promotion_types.pty_cost_plus_switch%TYPE,
  p_pty_customer_vendor_flag       IN         promotion_types.pty_customer_vendor_flag%TYPE,
  p_pty_description                IN         promotion_types.pty_description%TYPE,
  p_pty_telemark_only_switch       IN         promotion_types.pty_telemark_only_switch%TYPE,
  p_pty_exceptional_sales_switch   IN         promotion_types.pty_exceptional_sales_switch%TYPE,
  p_pty_alt_description            IN         promotion_types.pty_alt_description%TYPE                 DEFAULT NULL,
  p_pty_retain_margin              IN         promotion_types.pty_retain_margin%TYPE                   DEFAULT NULL,
  p_pty_cus_promo_start_lead_day   IN         promotion_types.pty_cus_promo_start_lead_days%TYPE       DEFAULT NULL,
  p_pty_cus_promo_end_lead_days    IN         promotion_types.pty_cus_promo_end_lead_days%TYPE         DEFAULT NULL,
  p_pty_prebook_reservation_days   IN         promotion_types.pty_prebook_reservation_days%TYPE        DEFAULT NULL,
  p_pty_retain_margin_ven          IN         promotion_types.pty_retain_margin_ven%TYPE               DEFAULT NULL,
  p_pty_prebook_dc_percentage      IN         promotion_types.pty_prebook_dc_percentage%TYPE           DEFAULT NULL,
  p_pty_nb_of_week_bef_expiratio   IN         promotion_types.pty_nb_of_week_bef_expiration%TYPE       DEFAULT NULL,
  p_pty_guaranteed_price_switch    IN         promotion_types.pty_guaranteed_price_switch%TYPE         DEFAULT 0 ,
  p_pty_allow_spec_order_switch    IN         promotion_types.pty_allow_spec_order_switch%TYPE         DEFAULT 0 ,
  p_pty_show_switch                IN         promotion_types.pty_show_switch%TYPE                     DEFAULT 0 ,
  p_pty_cumulative_switch          IN         promotion_types.pty_cumulative_switch%TYPE               DEFAULT 0 ,
  p_pty_pgs_create_manuf_switch    IN         promotion_types.pty_pgs_create_manuf_switch%TYPE         DEFAULT 0 ,
  p_pty_incl_royalty_on_inv_swit   IN         promotion_types.pty_incl_royalty_on_inv_switch%TYPE      DEFAULT 1 ,
  p_pty_guaranteed_alloc_switch    IN         promotion_types.pty_guaranteed_alloc_switch%TYPE         DEFAULT 0                     ,
  p_pty_exclude_cumulative_switc   IN         promotion_types.pty_exclude_cumulative_switch%TYPE       DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY promotion_types%ROWTYPE);

-----------------------------------------------------------------------------------------------
-- Ajuster les fonctions / procédures ci-dessous afin de ne plus les utiliser au fil du temps
-- Les fonctions ci-haut doivent être considérées à la place
-- Déplacer les traitements dans un package OPERATION au besoin
-----------------------------------------------------------------------------------------------

FUNCTION FIND_PTY_DESCRIPTION_FUNC(
  p_pty_code IN NUMBER,
  p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

FUNCTION FIND_COLUMN_VALUE_NUMBER_FUNC(
  p_column_name     IN VARCHAR2,
  p_pty_code         IN promotion_types.pty_code%TYPE
)
RETURN NUMBER;

END PTY_PACK;
/