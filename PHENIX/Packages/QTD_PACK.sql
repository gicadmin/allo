CREATE OR REPLACE PACKAGE phenix.QTD_PACK IS

PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  quotation_details%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_qtd_qth_id                     IN         quotation_details.qtd_qth_id%TYPE,
  p_qtd_line_number                IN         quotation_details.qtd_line_number%TYPE,
  p_qtd_rec                        OUT NOCOPY quotation_details%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_qtd_qth_id                     IN         quotation_details.qtd_qth_id%TYPE,
  p_qtd_line_number                IN         quotation_details.qtd_line_number%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_qtd_qth_id                     IN         quotation_details.qtd_qth_id%TYPE,
  p_qtd_line_number                IN         quotation_details.qtd_line_number%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_qtd_qth_id                     IN         quotation_details.qtd_qth_id%TYPE,
  p_qtd_line_number                IN         quotation_details.qtd_line_number%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_qtd_qth_id                     IN         quotation_details.qtd_qth_id%TYPE,
  p_qtd_line_number                IN         quotation_details.qtd_line_number%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_qtd_qth_id                     IN         quotation_details.qtd_qth_id%TYPE,
  p_qtd_line_number                IN         quotation_details.qtd_line_number%TYPE);


PROCEDURE INSERT_PROC(
  p_qtd_qth_id                     IN         quotation_details.qtd_qth_id%TYPE,
  p_qtd_line_number                IN         quotation_details.qtd_line_number%TYPE,
  p_qtd_prf_prd_code               IN         quotation_details.qtd_prf_prd_code%TYPE,
  p_qtd_prf_fmt_code               IN         quotation_details.qtd_prf_fmt_code%TYPE,
  p_qtd_admin_amount               IN         quotation_details.qtd_admin_amount%TYPE,
  p_qtd_cost_strategy              IN         quotation_details.qtd_cost_strategy%TYPE,
  p_qtd_print_control              IN         quotation_details.qtd_print_control%TYPE,
  p_qtd_promotion_amount           IN         quotation_details.qtd_promotion_amount%TYPE,
  p_qtd_selling_price              IN         quotation_details.qtd_selling_price%TYPE,
  p_qtd_count_amount               IN         quotation_details.qtd_count_amount%TYPE,
  p_qtd_original_cost              IN         quotation_details.qtd_original_cost%TYPE,
  p_qtd_original_retail            IN         quotation_details.qtd_original_retail%TYPE,
  p_qtd_sub_total                  IN         quotation_details.qtd_sub_total%TYPE,
  p_qtd_royalty_amount             IN         quotation_details.qtd_royalty_amount%TYPE,
  p_qtd_print_sequence             IN         quotation_details.qtd_print_sequence%TYPE                  DEFAULT NULL,
  p_qtd_customer_product_code      IN         quotation_details.qtd_customer_product_code%TYPE           DEFAULT NULL,
  p_qtd_suggested_retail_price     IN         quotation_details.qtd_suggested_retail_price%TYPE          DEFAULT NULL,
  p_qtd_srp_quantity               IN         quotation_details.qtd_srp_quantity%TYPE                    DEFAULT NULL,
  p_qtd_srp_percentage             IN         quotation_details.qtd_srp_percentage%TYPE                  DEFAULT NULL,
  p_qtd_pty_code                   IN         quotation_details.qtd_pty_code%TYPE                        DEFAULT NULL,
  p_qtd_npf_nac_code               IN         quotation_details.qtd_npf_nac_code%TYPE                    DEFAULT NULL,
  p_qtd_npf_prf_prd_code           IN         quotation_details.qtd_npf_prf_prd_code%TYPE                DEFAULT NULL,
  p_qtd_npf_prf_fmt_code           IN         quotation_details.qtd_npf_prf_fmt_code%TYPE                DEFAULT NULL,
  p_qtd_synchronization_id         IN         quotation_details.qtd_synchronization_id%TYPE              DEFAULT NULL,
  p_qtd_unique_index               IN         quotation_details.qtd_unique_index%TYPE                    DEFAULT NULL,
  p_qtd_system_srp_quantity        IN         quotation_details.qtd_system_srp_quantity%TYPE             DEFAULT NULL,
  p_qtd_system_srp_price           IN         quotation_details.qtd_system_srp_price%TYPE                DEFAULT NULL,
  p_qtd_system_srp_profit_percen   IN         quotation_details.qtd_system_srp_profit_percent%TYPE       DEFAULT NULL,
  p_qtd_recalculated_promo_date    IN         quotation_details.qtd_recalculated_promo_date%TYPE         DEFAULT NULL,
  p_qtd_contract_volume            IN         quotation_details.qtd_contract_volume%TYPE                 DEFAULT NULL,
  p_qtd_contract_start_date        IN         quotation_details.qtd_contract_start_date%TYPE             DEFAULT NULL,
  p_qtd_contract_message           IN         quotation_details.qtd_contract_message%TYPE                DEFAULT NULL,
  p_qtd_additional_adjustment      IN         quotation_details.qtd_additional_adjustment%TYPE           DEFAULT 0 ,
  p_qtd_auto_extend_switch         IN         quotation_details.qtd_auto_extend_switch%TYPE              DEFAULT 0 ,
  p_qtd_markup_used                IN         quotation_details.qtd_markup_used%TYPE                     DEFAULT 0 ,
  p_qtd_tobacco_tax                IN         quotation_details.qtd_tobacco_tax%TYPE                     DEFAULT 0 ,
  p_qtd_user_set_srp_fix_switch    IN         quotation_details.qtd_user_set_srp_fix_switch%TYPE         DEFAULT 0 ,
  p_qtd_car_amount                 IN         quotation_details.qtd_car_amount%TYPE                      DEFAULT 0 ,
  p_qtd_base_cost_type             IN         quotation_details.qtd_base_cost_type%TYPE                  DEFAULT 10 ,
  p_qtd_promotional_item_switch    IN         quotation_details.qtd_promotional_item_switch%TYPE         DEFAULT 0 ,
  p_qtd_prw_trans_in_cost_switch   IN         quotation_details.qtd_prw_trans_in_cost_switch%TYPE        DEFAULT 1 ,
  p_qtd_prd_admin_1_in_cost_swit   IN         quotation_details.qtd_prd_admin_1_in_cost_switch%TYPE      DEFAULT 1 ,
  p_qtd_prd_adj_in_cost_switch     IN         quotation_details.qtd_prd_adj_in_cost_switch%TYPE          DEFAULT 1 ,
  p_qtd_prd_admin_2_in_cost_swit   IN         quotation_details.qtd_prd_admin_2_in_cost_switch%TYPE      DEFAULT 1 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY quotation_details%ROWTYPE);

-----------------------------------------------------------------------------------------------
-- Ajuster les fonctions / procédures ci-dessous afin de ne plus les utiliser au fil du temps
-- Les fonctions ci-haut doivent être considérées à la place
-- Déplacer les traitements dans un package OPERATION au besoin
-----------------------------------------------------------------------------------------------

FUNCTION FIND_QTD_CUS_PRD_CODE_FUNC(
  p_qtd_prf_prd_code  IN quotation_details.qtd_prf_prd_code%TYPE,
  p_qtd_prf_fmt_code  IN quotation_details.qtd_prf_fmt_code%TYPE,
  p_qth_cus_code      IN quotation_headers.qth_cus_code%TYPE,
  p_qth_date          IN quotation_headers.qth_start_date%TYPE DEFAULT NULL
)
RETURN VARCHAR2;

END QTD_PACK;
/