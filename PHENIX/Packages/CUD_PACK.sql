CREATE OR REPLACE PACKAGE phenix.CUD_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  customer_discounts%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_cud_id                         IN         customer_discounts.cud_id%TYPE,
  p_cud_rec                        OUT NOCOPY customer_discounts%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_cud_id                         IN         customer_discounts.cud_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_cud_id                         IN         customer_discounts.cud_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_cud_id                         IN         customer_discounts.cud_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_cud_id                         IN         customer_discounts.cud_id%TYPE);


FUNCTION INSERT_FUNC(
  p_cud_pricing_strategy           IN         customer_discounts.cud_pricing_strategy%TYPE,
  p_cud_cus_code                   IN         customer_discounts.cud_cus_code%TYPE                        DEFAULT NULL,
  p_cud_dgt_code                   IN         customer_discounts.cud_dgt_code%TYPE                        DEFAULT NULL,
  p_cud_pgr_code                   IN         customer_discounts.cud_pgr_code%TYPE                        DEFAULT NULL,
  p_cud_prd_code                   IN         customer_discounts.cud_prd_code%TYPE                        DEFAULT NULL,
  p_cud_prf_prd_code               IN         customer_discounts.cud_prf_prd_code%TYPE                    DEFAULT NULL,
  p_cud_prf_fmt_code               IN         customer_discounts.cud_prf_fmt_code%TYPE                    DEFAULT NULL,
  p_cud_admin_amount               IN         customer_discounts.cud_admin_amount%TYPE                    DEFAULT NULL,
  p_cud_admin_percent              IN         customer_discounts.cud_admin_percent%TYPE                   DEFAULT NULL,
  p_cud_surcharge_percent          IN         customer_discounts.cud_surcharge_percent%TYPE               DEFAULT NULL,
  p_cud_group_fmt_code             IN         customer_discounts.cud_group_fmt_code%TYPE                  DEFAULT NULL,
  p_cud_group_pgr_code             IN         customer_discounts.cud_group_pgr_code%TYPE                  DEFAULT NULL,
  p_cud_cost_used                  IN         customer_discounts.cud_cost_used%TYPE                       DEFAULT 10 ,
  p_cud_prd_admin_1_in_cost_swit   IN         customer_discounts.cud_prd_admin_1_in_cost_switch%TYPE      DEFAULT 0 ,
  p_cud_prd_admin_2_in_cost_swit   IN         customer_discounts.cud_prd_admin_2_in_cost_switch%TYPE      DEFAULT 0 ,
  p_cud_prd_adj_in_cost_switch     IN         customer_discounts.cud_prd_adj_in_cost_switch%TYPE          DEFAULT 0 ,
  p_cud_prw_trans_in_cost_switch   IN         customer_discounts.cud_prw_trans_in_cost_switch%TYPE        DEFAULT 0 )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY customer_discounts%ROWTYPE)
RETURN NUMBER;

END CUD_PACK;
/