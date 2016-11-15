CREATE OR REPLACE PACKAGE phenix.CUS_PACK AS

PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  customers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_cus_code                       IN         customers.cus_code%TYPE,
  p_cus_rec                        OUT NOCOPY customers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_cus_code                       IN         customers.cus_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_cus_code                       IN         customers.cus_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_cus_code                       IN         customers.cus_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_cus_code                       IN         customers.cus_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_cus_code                       IN         customers.cus_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_cus_code                       IN         customers.cus_code%TYPE);


PROCEDURE INSERT_PROC(
  p_cus_code                       IN         customers.cus_code%TYPE,
  p_cus_prv_resides_in_code        IN         customers.cus_prv_resides_in_code%TYPE,
  p_cus_use_code                   IN         customers.cus_use_code%TYPE,
  p_cus_address                    IN         customers.cus_address%TYPE,
  p_cus_city                       IN         customers.cus_city%TYPE,
  p_cus_multi_vend_drop_switch     IN         customers.cus_multi_vend_drop_switch%TYPE,
  p_cus_name                       IN         customers.cus_name%TYPE,
  p_cus_postal_code                IN         customers.cus_postal_code%TYPE,
  p_cus_telephone                  IN         customers.cus_telephone%TYPE,
  p_cus_active_schedule_end_date   IN         customers.cus_active_schedule_end_date%TYPE,
  p_cus_active_schedule_start_da   IN         customers.cus_active_schedule_start_date%TYPE,
  p_cus_whs_code                   IN         customers.cus_whs_code%TYPE,
  p_cus_corporate_name             IN         customers.cus_corporate_name%TYPE,
  p_cus_cus_code                   IN         customers.cus_cus_code%TYPE                        DEFAULT NULL,
  p_cus_cgr_code                   IN         customers.cus_cgr_code%TYPE                        DEFAULT NULL,
  p_cus_dgt_code                   IN         customers.cus_dgt_code%TYPE                        DEFAULT NULL,
  p_cus_prv_delivers_in_code       IN         customers.cus_prv_delivers_in_code%TYPE            DEFAULT NULL,
  p_cus_qty_code                   IN         customers.cus_qty_code%TYPE                        DEFAULT NULL,
  p_cus_srt_code                   IN         customers.cus_srt_code%TYPE                        DEFAULT NULL,
  p_cus_trt_code                   IN         customers.cus_trt_code%TYPE                        DEFAULT NULL,
  p_cus_use_telemark_code          IN         customers.cus_use_telemark_code%TYPE               DEFAULT NULL,
  p_cus_alt_name                   IN         customers.cus_alt_name%TYPE                        DEFAULT NULL,
  p_cus_alcohol_permit             IN         customers.cus_alcohol_permit%TYPE                  DEFAULT NULL,
  p_cus_customer_alpha_index       IN         customers.cus_customer_alpha_index%TYPE            DEFAULT NULL,
  p_cus_credit_limit               IN         customers.cus_credit_limit%TYPE                    DEFAULT NULL,
  p_cus_cigarette_counter          IN         customers.cus_cigarette_counter%TYPE               DEFAULT NULL,
  p_cus_date_last_paid             IN         customers.cus_date_last_paid%TYPE                  DEFAULT NULL,
  p_cus_deliver_to_address         IN         customers.cus_deliver_to_address%TYPE              DEFAULT NULL,
  p_cus_deliver_to_city            IN         customers.cus_deliver_to_city%TYPE                 DEFAULT NULL,
  p_cus_deliver_to_name            IN         customers.cus_deliver_to_name%TYPE                 DEFAULT NULL,
  p_cus_deliver_to_postal_code     IN         customers.cus_deliver_to_postal_code%TYPE          DEFAULT NULL,
  p_cus_duns_number                IN         customers.cus_duns_number%TYPE                     DEFAULT NULL,
  p_cus_fax_number                 IN         customers.cus_fax_number%TYPE                      DEFAULT NULL,
  p_cus_latitude                   IN         customers.cus_latitude%TYPE                        DEFAULT NULL,
  p_cus_longitude                  IN         customers.cus_longitude%TYPE                       DEFAULT NULL,
  p_cus_terms                      IN         customers.cus_terms%TYPE                           DEFAULT NULL,
  p_cus_tobacco_permit             IN         customers.cus_tobacco_permit%TYPE                  DEFAULT NULL,
  p_cus_surcharge_per_delivery     IN         customers.cus_surcharge_per_delivery%TYPE          DEFAULT NULL,
  p_cus_federal_tax_number         IN         customers.cus_federal_tax_number%TYPE              DEFAULT NULL,
  p_cus_provincial_tax_number      IN         customers.cus_provincial_tax_number%TYPE           DEFAULT NULL,
  p_cus_vrg_code                   IN         customers.cus_vrg_code%TYPE                        DEFAULT NULL,
  p_cus_pty_code                   IN         customers.cus_pty_code%TYPE                        DEFAULT NULL,
  p_cus_store_num                  IN         customers.cus_store_num%TYPE                       DEFAULT NULL,
  p_cus_edi_partner_identity       IN         customers.cus_edi_partner_identity%TYPE            DEFAULT NULL,
  p_cus_vendor_identification      IN         customers.cus_vendor_identification%TYPE           DEFAULT NULL,
  p_cus_car_code                   IN         customers.cus_car_code%TYPE                        DEFAULT NULL,
  p_cus_naz_nac_code               IN         customers.cus_naz_nac_code%TYPE                    DEFAULT NULL,
  p_cus_naz_zone_code              IN         customers.cus_naz_zone_code%TYPE                   DEFAULT NULL,
  p_cus_elimination_date           IN         customers.cus_elimination_date%TYPE                DEFAULT NULL,
  p_cus_broker_id                  IN         customers.cus_broker_id%TYPE                       DEFAULT NULL,
  p_cus_transport_allocation       IN         customers.cus_transport_allocation%TYPE            DEFAULT NULL,
  p_cus_pos_files_type             IN         customers.cus_pos_files_type%TYPE                  DEFAULT NULL,
  p_cus_fsg_code                   IN         customers.cus_fsg_code%TYPE                        DEFAULT NULL,
  p_cus_dcg_code                   IN         customers.cus_dcg_code%TYPE                        DEFAULT NULL,
  p_cus_bursary_amount             IN         customers.cus_bursary_amount%TYPE                  DEFAULT NULL,
  p_cus_bursary_end_date           IN         customers.cus_bursary_end_date%TYPE                DEFAULT NULL,
  p_cus_loan_interest_amount       IN         customers.cus_loan_interest_amount%TYPE            DEFAULT NULL,
  p_cus_loan_end_date              IN         customers.cus_loan_end_date%TYPE                   DEFAULT NULL,
  p_cus_minimum_profit_percent     IN         customers.cus_minimum_profit_percent%TYPE          DEFAULT NULL,
  p_cus_dsc_code                   IN         customers.cus_dsc_code%TYPE                        DEFAULT NULL,
  p_cus_deliver_telephone          IN         customers.cus_deliver_telephone%TYPE               DEFAULT NULL,
  p_cus_dairy_permit               IN         customers.cus_dairy_permit%TYPE                    DEFAULT NULL,
  p_cus_ovg_code                   IN         customers.cus_ovg_code%TYPE                        DEFAULT NULL,
  p_cus_last_balance_date          IN         customers.cus_last_balance_date%TYPE               DEFAULT NULL,
  p_cus_pug_code                   IN         customers.cus_pug_code%TYPE                        DEFAULT NULL,
  p_cus_cdk_code                   IN         customers.cus_cdk_code%TYPE                        DEFAULT NULL,
  p_cus_str_code                   IN         customers.cus_str_code%TYPE                        DEFAULT NULL,
  p_cus_cat_code                   IN         customers.cus_cat_code%TYPE                        DEFAULT NULL,
  p_cus_xrg_code                   IN         customers.cus_xrg_code%TYPE                        DEFAULT NULL,
  p_cus_sit_code                   IN         customers.cus_sit_code%TYPE                        DEFAULT NULL,
  p_cus_active_schedules_switch    IN         customers.cus_active_schedules_switch%TYPE         DEFAULT 1 ,
  p_cus_admin_method               IN         customers.cus_admin_method%TYPE                    DEFAULT 'P' ,
  p_cus_ar_payment_switch          IN         customers.cus_ar_payment_switch%TYPE               DEFAULT 0 ,
  p_cus_creation_date              IN         customers.cus_creation_date%TYPE                   DEFAULT SYSDATE ,
  p_cus_credit_control_switch      IN         customers.cus_credit_control_switch%TYPE           DEFAULT 0 ,
  p_cus_credit_status              IN         customers.cus_credit_status%TYPE                   DEFAULT 'N' ,
  p_cus_deleted_switch             IN         customers.cus_deleted_switch%TYPE                  DEFAULT 0 ,
  p_cus_interest                   IN         customers.cus_interest%TYPE                        DEFAULT 0 ,
  p_cus_inv_head_office_switch     IN         customers.cus_inv_head_office_switch%TYPE          DEFAULT 0 ,
  p_cus_invoice_copies             IN         customers.cus_invoice_copies%TYPE                  DEFAULT 1 ,
  p_cus_language_flag              IN         customers.cus_language_flag%TYPE                   DEFAULT 'F' ,
  p_cus_order_required_switch      IN         customers.cus_order_required_switch%TYPE           DEFAULT 0 ,
  p_cus_open_quotation_switch      IN         customers.cus_open_quotation_switch%TYPE           DEFAULT 1 ,
  p_cus_print_ticket_switch        IN         customers.cus_print_ticket_switch%TYPE             DEFAULT 0 ,
  p_cus_projected_sales_amount     IN         customers.cus_projected_sales_amount%TYPE          DEFAULT 0 ,
  p_cus_ranking                    IN         customers.cus_ranking%TYPE                         DEFAULT '5' ,
  p_cus_substitution_switch        IN         customers.cus_substitution_switch%TYPE             DEFAULT 0 ,
  p_cus_surcharge_switch           IN         customers.cus_surcharge_switch%TYPE                DEFAULT 1 ,
  p_cus_volume_rebate_switch       IN         customers.cus_volume_rebate_switch%TYPE            DEFAULT 0 ,
  p_cus_print_profile_switch       IN         customers.cus_print_profile_switch%TYPE            DEFAULT 0 ,
  p_cus_federal_tax_exempt_switc   IN         customers.cus_federal_tax_exempt_switch%TYPE       DEFAULT 0 ,
  p_cus_province_tax_exempt_swit   IN         customers.cus_province_tax_exempt_switch%TYPE      DEFAULT 0 ,
  p_cus_single_spec_order_switch   IN         customers.cus_single_spec_order_switch%TYPE        DEFAULT 0 ,
  p_cus_modification_date          IN         customers.cus_modification_date%TYPE               DEFAULT SYSDATE ,
  p_cus_reb_on_drop_terms_switch   IN         customers.cus_reb_on_drop_terms_switch%TYPE        DEFAULT 0 ,
  p_cus_reb_on_drop_avr_switch     IN         customers.cus_reb_on_drop_avr_switch%TYPE          DEFAULT 0 ,
  p_cus_reb_on_whouse_avr_switch   IN         customers.cus_reb_on_whouse_avr_switch%TYPE        DEFAULT 0 ,
  p_cus_generate_synch_file_swit   IN         customers.cus_generate_synch_file_switch%TYPE      DEFAULT 0 ,
  p_cus_edi_product_valid_flag     IN         customers.cus_edi_product_valid_flag%TYPE          DEFAULT 'P' ,
  p_cus_prebook_for_branch_switc   IN         customers.cus_prebook_for_branch_switch%TYPE       DEFAULT 0 ,
  p_cus_gen_vol_rebate_cr_switch   IN         customers.cus_gen_vol_rebate_cr_switch%TYPE        DEFAULT 0 ,
  p_cus_pgs_publish_price_switch   IN         customers.cus_pgs_publish_price_switch%TYPE        DEFAULT 0 ,
  p_cus_handling_amount            IN         customers.cus_handling_amount%TYPE                 DEFAULT 0 ,
  p_cus_minimum_profit_amount      IN         customers.cus_minimum_profit_amount%TYPE           DEFAULT NULL,
  p_cus_invoice_method             IN         customers.cus_invoice_method%TYPE                  DEFAULT 'COH' ,
  p_cus_transport_contribution     IN         customers.cus_transport_contribution%TYPE          DEFAULT 0 ,
  p_cus_minimum_delivery_charge    IN         customers.cus_minimum_delivery_charge%TYPE         DEFAULT 0 ,
  p_cus_block_quotation_pr_switc   IN         customers.cus_block_quotation_pr_switch%TYPE       DEFAULT 0 ,
  p_cus_profit_in_deliv_switch     IN         customers.cus_profit_in_deliv_switch%TYPE          DEFAULT 1 ,
  p_cus_print_inv_by_line_switch   IN         customers.cus_print_inv_by_line_switch%TYPE        DEFAULT 0 ,
  p_cus_recalc_price_at_inv_swit   IN         customers.cus_recalc_price_at_inv_switch%TYPE      DEFAULT 0 ,
  p_cus_last_balance_dollars       IN         customers.cus_last_balance_dollars%TYPE            DEFAULT 0 ,
  p_cus_last_balance_points        IN         customers.cus_last_balance_points%TYPE             DEFAULT 0 ,
  p_cus_vtt_stamp_required_switc   IN         customers.cus_vtt_stamp_required_switch%TYPE       DEFAULT 0 ,
  p_cus_invoice_pallets_switch     IN         customers.cus_invoice_pallets_switch%TYPE          DEFAULT 1 ,
  p_cus_inv_pal_hd_office_switch   IN         customers.cus_inv_pal_hd_office_switch%TYPE        DEFAULT 0 ,
  p_cus_combined_tr_invoice_swit   IN         customers.cus_combined_tr_invoice_switch%TYPE      DEFAULT 0 ,
  p_cus_detail_tr_invoice_switch   IN         customers.cus_detail_tr_invoice_switch%TYPE        DEFAULT 0 ,
  p_cus_growth_alloc_percent       IN         customers.cus_growth_alloc_percent%TYPE            DEFAULT 0 ,
  p_cus_additional_alloc_percent   IN         customers.cus_additional_alloc_percent%TYPE        DEFAULT 0 ,
  p_cus_whouse_vol_alloc_percent   IN         customers.cus_whouse_vol_alloc_percent%TYPE        DEFAULT 0 ,
  p_cus_drop_volume_alloc_percen   IN         customers.cus_drop_volume_alloc_percent%TYPE       DEFAULT 0 ,
  p_cus_internal_admin_percent     IN         customers.cus_internal_admin_percent%TYPE          DEFAULT 0 ,
  p_cus_past_due_grace_days        IN         customers.cus_past_due_grace_days%TYPE             DEFAULT 0 ,
  p_cus_incl_price_on_route_swit   IN         customers.cus_incl_price_on_route_switch%TYPE      DEFAULT 1 ,
  p_cus_pick_by_prw_zone_switch    IN         customers.cus_pick_by_prw_zone_switch%TYPE         DEFAULT 0 ,
  p_cus_gen_acct_stmnt_switch      IN         customers.cus_gen_acct_stmnt_switch%TYPE           DEFAULT 1 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY customers%ROWTYPE);

-----------------------------------------------------------------------------------------------
-- Ajuster les fonctions / procédures ci-dessous afin de ne plus les utiliser au fil du temps
-- Les fonctions ci-haut doivent être considérées à la place
-- Déplacer les traitements dans un package OPERATION au besoin
-----------------------------------------------------------------------------------------------

FUNCTION GET_FULL_CUS_FUNC(
  p_cus_code    IN customers.cus_code%TYPE,
  p_cus_record  OUT customers%ROWTYPE
)
RETURN BOOLEAN;

FUNCTION FIND_SINGLE_SPEC_ORDER_FUNC(
  p_cus_code IN customers.cus_code%TYPE
)
RETURN VARCHAR2;

FUNCTION FIND_SURCHARGE_PER_DELIV_FUNC(
  p_cus_code IN customers.cus_code%TYPE
)
RETURN VARCHAR2;

PROCEDURE FIND_CUS_QTY_NAZ_PROC(
  p_cus_code          IN customers.cus_code%TYPE,
  p_cus_qty_code      OUT customers.cus_qty_code%TYPE,
  p_cus_naz_nac_code  OUT customers.cus_naz_nac_code%TYPE,
  p_cus_naz_zone_code OUT customers.cus_naz_zone_code%TYPE
);

FUNCTION FIND_CUS_NAME_FUNC(
  p_cus_code IN NUMBER,
  p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

FUNCTION FIND_CUS_LANGUAGE_FUNC(
  p_cus_code IN customers.cus_code%TYPE
)
RETURN VARCHAR2;

FUNCTION FIND_INVOICED_HEAD_OFFICE_FUNC(
  p_cus_code                    IN customers.cus_code%TYPE,
  p_cus_cus_code                IN customers.cus_cus_code%TYPE DEFAULT NULL,  --les 2 valeurs doivent être passé, ou les 2 doivent être NULL
  p_cus_inv_head_office_switch  IN customers.cus_cus_code%TYPE DEFAULT NULL   --les 2 valeurs doivent être passé, ou les 2 doivent être NULL
)
RETURN NUMBER;

FUNCTION FIND_CUS_WHS_FUNC(
  p_cus_code IN NUMBER
)
RETURN VARCHAR2;

FUNCTION DO_CUS_EXISTS_FOR_CGR_FUNC(
  p_cus_cgr_code IN customers.cus_cgr_code%TYPE
)
RETURN BOOLEAN;

FUNCTION FIND_COLUMN_VALUE_VARCHAR_FUNC(
  p_column_name  IN VARCHAR2,
  p_cus_code     IN customers.cus_code%TYPE
)
RETURN VARCHAR2;

FUNCTION FIND_COLUMN_VALUE_DATE_FUNC(
  p_column_name  IN VARCHAR2,
  p_cus_code     IN customers.cus_code%TYPE
)
RETURN DATE;

FUNCTION FIND_COLUMN_VALUE_NUMBER_FUNC(
  p_column_name  IN VARCHAR2,
  p_cus_code     IN customers.cus_code%TYPE
)
RETURN NUMBER;

END CUS_PACK;
/