CREATE OR REPLACE PACKAGE phenix.COD_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  customer_order_details%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_cod_coh_id                     IN         customer_order_details.cod_coh_id%TYPE,
  p_cod_line_number                IN         customer_order_details.cod_line_number%TYPE,
  p_cod_rec                        OUT NOCOPY customer_order_details%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_cod_coh_id                     IN         customer_order_details.cod_coh_id%TYPE,
  p_cod_line_number                IN         customer_order_details.cod_line_number%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_cod_coh_id                     IN         customer_order_details.cod_coh_id%TYPE,
  p_cod_line_number                IN         customer_order_details.cod_line_number%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_cod_coh_id                     IN         customer_order_details.cod_coh_id%TYPE,
  p_cod_line_number                IN         customer_order_details.cod_line_number%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_cod_coh_id                     IN         customer_order_details.cod_coh_id%TYPE,
  p_cod_line_number                IN         customer_order_details.cod_line_number%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_cod_coh_id                     IN         customer_order_details.cod_coh_id%TYPE,
  p_cod_line_number                IN         customer_order_details.cod_line_number%TYPE);


PROCEDURE INSERT_PROC(
  p_cod_coh_id                     IN         customer_order_details.cod_coh_id%TYPE,
  p_cod_line_number                IN         customer_order_details.cod_line_number%TYPE,
  p_cod_prf_prd_code               IN         customer_order_details.cod_prf_prd_code%TYPE,
  p_cod_prf_fmt_code               IN         customer_order_details.cod_prf_fmt_code%TYPE,
  p_cod_base_selling_cost          IN         customer_order_details.cod_base_selling_cost%TYPE,
  p_cod_cost_price                 IN         customer_order_details.cod_cost_price%TYPE,
  p_cod_open_switch                IN         customer_order_details.cod_open_switch%TYPE,
  p_cod_order_type                 IN         customer_order_details.cod_order_type%TYPE,
  p_cod_original_retail            IN         customer_order_details.cod_original_retail%TYPE,
  p_cod_prebook_method             IN         customer_order_details.cod_prebook_method%TYPE,
  p_cod_pricing_source             IN         customer_order_details.cod_pricing_source%TYPE,
  p_cod_project_delivery_date      IN         customer_order_details.cod_project_delivery_date%TYPE,
  p_cod_promotion_amount           IN         customer_order_details.cod_promotion_amount%TYPE,
  p_cod_selling_retail             IN         customer_order_details.cod_selling_retail%TYPE,
  p_cod_spec_order_status          IN         customer_order_details.cod_spec_order_status%TYPE,
  p_cod_surcharge                  IN         customer_order_details.cod_surcharge%TYPE,
  p_cod_tobacco_tax                IN         customer_order_details.cod_tobacco_tax%TYPE,
  p_cod_average_cost_1             IN         customer_order_details.cod_average_cost_1%TYPE,
  p_cod_average_cost_2             IN         customer_order_details.cod_average_cost_2%TYPE,
  p_cod_average_cost_3             IN         customer_order_details.cod_average_cost_3%TYPE,
  p_cod_average_cost_4             IN         customer_order_details.cod_average_cost_4%TYPE,
  p_cod_average_list               IN         customer_order_details.cod_average_list%TYPE,
  p_cod_avg_real_cost_1            IN         customer_order_details.cod_avg_real_cost_1%TYPE,
  p_cod_avg_real_cost_2            IN         customer_order_details.cod_avg_real_cost_2%TYPE,
  p_cod_avg_real_cost_3            IN         customer_order_details.cod_avg_real_cost_3%TYPE,
  p_cod_avg_real_cost_4            IN         customer_order_details.cod_avg_real_cost_4%TYPE,
  p_cod_avg_real_list              IN         customer_order_details.cod_avg_real_list%TYPE,
  p_cod_use_code                   IN         customer_order_details.cod_use_code%TYPE,
  p_cod_whs_picking_code           IN         customer_order_details.cod_whs_picking_code%TYPE,
  p_cod_replacement_list           IN         customer_order_details.cod_replacement_list%TYPE,
  p_cod_replacement_cost_1         IN         customer_order_details.cod_replacement_cost_1%TYPE,
  p_cod_replacement_cost_2         IN         customer_order_details.cod_replacement_cost_2%TYPE,
  p_cod_replacement_cost_3         IN         customer_order_details.cod_replacement_cost_3%TYPE,
  p_cod_replacement_cost_4         IN         customer_order_details.cod_replacement_cost_4%TYPE,
  p_cod_cod_coh_id                 IN         customer_order_details.cod_cod_coh_id%TYPE                      DEFAULT NULL,
  p_cod_cod_line_number            IN         customer_order_details.cod_cod_line_number%TYPE                 DEFAULT NULL,
  p_cod_fmt_code_srp               IN         customer_order_details.cod_fmt_code_srp%TYPE                    DEFAULT NULL,
  p_cod_pod_poh_id                 IN         customer_order_details.cod_pod_poh_id%TYPE                      DEFAULT NULL,
  p_cod_pod_line_number            IN         customer_order_details.cod_pod_line_number%TYPE                 DEFAULT NULL,
  p_cod_prf_prd_original_code      IN         customer_order_details.cod_prf_prd_original_code%TYPE           DEFAULT NULL,
  p_cod_prf_fmt_original_code      IN         customer_order_details.cod_prf_fmt_original_code%TYPE           DEFAULT NULL,
  p_cod_pty_code                   IN         customer_order_details.cod_pty_code%TYPE                        DEFAULT NULL,
  p_cod_leftover_quantity          IN         customer_order_details.cod_leftover_quantity%TYPE               DEFAULT NULL,
  p_cod_leftover_weight            IN         customer_order_details.cod_leftover_weight%TYPE                 DEFAULT NULL,
  p_cod_message                    IN         customer_order_details.cod_message%TYPE                         DEFAULT NULL,
  p_cod_order_quantity             IN         customer_order_details.cod_order_quantity%TYPE                  DEFAULT NULL,
  p_cod_order_weight               IN         customer_order_details.cod_order_weight%TYPE                    DEFAULT NULL,
  p_cod_price_srp                  IN         customer_order_details.cod_price_srp%TYPE                       DEFAULT NULL,
  p_cod_quantity_srp               IN         customer_order_details.cod_quantity_srp%TYPE                    DEFAULT NULL,
  p_cod_use_telemark_code          IN         customer_order_details.cod_use_telemark_code%TYPE               DEFAULT NULL,
  p_cod_prebook_weeks              IN         customer_order_details.cod_prebook_weeks%TYPE                   DEFAULT NULL,
  p_cod_customer_product_code      IN         customer_order_details.cod_customer_product_code%TYPE           DEFAULT NULL,
  p_cod_customer_product_locatio   IN         customer_order_details.cod_customer_product_location%TYPE       DEFAULT NULL,
  p_cod_reserved_quantity          IN         customer_order_details.cod_reserved_quantity%TYPE               DEFAULT NULL,
  p_cod_reserved_weight            IN         customer_order_details.cod_reserved_weight%TYPE                 DEFAULT NULL,
  p_cod_customer_po_number         IN         customer_order_details.cod_customer_po_number%TYPE              DEFAULT NULL,
  p_cod_customer_po_line           IN         customer_order_details.cod_customer_po_line%TYPE                DEFAULT NULL,
  p_cod_shr_code                   IN         customer_order_details.cod_shr_code%TYPE                        DEFAULT NULL,
  p_cod_first_reservation_date     IN         customer_order_details.cod_first_reservation_date%TYPE          DEFAULT NULL,
  p_cod_number_of_cigars           IN         customer_order_details.cod_number_of_cigars%TYPE                DEFAULT NULL,
  p_cod_selling_before_tobacco_t   IN         customer_order_details.cod_selling_before_tobacco_tax%TYPE      DEFAULT NULL,
  p_cod_before_tob_tax_incl_fed_   IN         customer_order_details.cod_before_tob_tax_incl_fed_tx%TYPE      DEFAULT NULL,
  p_cod_selling_bf_tob_per_cigar   IN         customer_order_details.cod_selling_bf_tob_per_cigar%TYPE        DEFAULT NULL,
  p_cod_taxable_amount_per_cigar   IN         customer_order_details.cod_taxable_amount_per_cigar%TYPE        DEFAULT NULL,
  p_cod_tobacco_tax_per_cigar      IN         customer_order_details.cod_tobacco_tax_per_cigar%TYPE           DEFAULT NULL,
  p_cod_tobacco_markup_rate        IN         customer_order_details.cod_tobacco_markup_rate%TYPE             DEFAULT NULL,
  p_cod_tobacco_tax_rate           IN         customer_order_details.cod_tobacco_tax_rate%TYPE                DEFAULT NULL,
  p_cod_car_cpr_id                 IN         customer_order_details.cod_car_cpr_id%TYPE                      DEFAULT NULL,
  p_cod_freegood_message           IN         customer_order_details.cod_freegood_message%TYPE                DEFAULT NULL,
  p_cod_selling_retail_orig        IN         customer_order_details.cod_selling_retail_orig%TYPE             DEFAULT NULL,
  p_cod_pricing_source_orig        IN         customer_order_details.cod_pricing_source_orig%TYPE             DEFAULT NULL,
  p_cod_use_override_code          IN         customer_order_details.cod_use_override_code%TYPE               DEFAULT NULL,
  p_cod_desired_quantity           IN         customer_order_details.cod_desired_quantity%TYPE                DEFAULT NULL,
  p_cod_desired_weight             IN         customer_order_details.cod_desired_weight%TYPE                  DEFAULT NULL,
  p_cod_cash_and_carry_weight      IN         customer_order_details.cod_cash_and_carry_weight%TYPE           DEFAULT NULL,
  p_cod_vsi_original_code          IN         customer_order_details.cod_vsi_original_code%TYPE               DEFAULT NULL,
  p_cod_sio_distributed_amount     IN         customer_order_details.cod_sio_distributed_amount%TYPE          DEFAULT NULL,
  p_cod_sio_freegood_quantity      IN         customer_order_details.cod_sio_freegood_quantity%TYPE           DEFAULT NULL,
  p_cod_sio_collected_amount       IN         customer_order_details.cod_sio_collected_amount%TYPE            DEFAULT NULL,
  p_cod_vsi_code                   IN         customer_order_details.cod_vsi_code%TYPE                        DEFAULT NULL,
  p_cod_cod_shorted_coh_id         IN         customer_order_details.cod_cod_shorted_coh_id%TYPE              DEFAULT NULL,
  p_cod_cod_shorted_line_number    IN         customer_order_details.cod_cod_shorted_line_number%TYPE         DEFAULT NULL,
  p_cod_subst_inv_quantity         IN         customer_order_details.cod_subst_inv_quantity%TYPE              DEFAULT NULL,
  p_cod_subst_inv_weight           IN         customer_order_details.cod_subst_inv_weight%TYPE                DEFAULT NULL,
  p_cod_pre_printed_switch         IN         customer_order_details.cod_pre_printed_switch%TYPE              DEFAULT 1 ,
  p_cod_indirect_delivery_switch   IN         customer_order_details.cod_indirect_delivery_switch%TYPE        DEFAULT 0 ,
  p_cod_show_spec_prebook_switch   IN         customer_order_details.cod_show_spec_prebook_switch%TYPE        DEFAULT 0 ,
  p_cod_show_spec_fusion_switch    IN         customer_order_details.cod_show_spec_fusion_switch%TYPE         DEFAULT 0 ,
  p_cod_pre_print_in_proc_switch   IN         customer_order_details.cod_pre_print_in_proc_switch%TYPE        DEFAULT 0 ,
  p_cod_creation_date              IN         customer_order_details.cod_creation_date%TYPE                   DEFAULT SYSDATE ,
  p_cod_credit_promotion_switch    IN         customer_order_details.cod_credit_promotion_switch%TYPE         DEFAULT 0 ,
  p_cod_credit_rebate_amount       IN         customer_order_details.cod_credit_rebate_amount%TYPE            DEFAULT 0 ,
  p_cod_car_amount                 IN         customer_order_details.cod_car_amount%TYPE                      DEFAULT 0 ,
  p_cod_freegood_rebill_amount     IN         customer_order_details.cod_freegood_rebill_amount%TYPE          DEFAULT 0 ,
  p_cod_freegood_switch            IN         customer_order_details.cod_freegood_switch%TYPE                 DEFAULT 0 ,
  p_cod_royalty_amount             IN         customer_order_details.cod_royalty_amount%TYPE                  DEFAULT 0 ,
  p_cod_order_source               IN         customer_order_details.cod_order_source%TYPE                    DEFAULT 'LOAD' ,
  p_cod_invoiced_ext_price         IN         customer_order_details.cod_invoiced_ext_price%TYPE              DEFAULT 0 ,
  p_cod_division_order_switch      IN         customer_order_details.cod_division_order_switch%TYPE           DEFAULT 0 ,
  p_cod_invoiced_ext_surcharge     IN         customer_order_details.cod_invoiced_ext_surcharge%TYPE          DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY customer_order_details%ROWTYPE);

-----------------------------------------------------------------------------------------------
-- Ajuster les fonctions / procédures ci-dessous afin de ne plus les utiliser au fil du temps
-- Les fonctions ci-haut doivent être considérées à la place
-- Déplacer les traitements dans un package OPERATION au besoin
-----------------------------------------------------------------------------------------------

FUNCTION FIND_COLUMN_VALUE_NUMBER_FUNC(
  p_column_name      IN VARCHAR2,
  p_cod_coh_id       IN customer_order_details.cod_coh_id%TYPE,
  p_cod_line_number  IN customer_order_details.cod_line_number%TYPE
)
RETURN NUMBER;

FUNCTION FIND_COLUMN_VALUE_DATE_FUNC(
  p_column_name      IN VARCHAR2,
  p_cod_coh_id       IN customer_order_details.cod_coh_id%TYPE,
  p_cod_line_number  IN customer_order_details.cod_line_number%TYPE
)
RETURN DATE;

FUNCTION FIND_COLUMN_VALUE_VARCHAR_FUNC(
  p_column_name      IN VARCHAR2,
  p_cod_coh_id       IN customer_order_details.cod_coh_id%TYPE,
  p_cod_line_number  IN customer_order_details.cod_line_number%TYPE
)
RETURN VARCHAR2;


END COD_PACK;
/