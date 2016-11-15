CREATE OR REPLACE PACKAGE phenix.VEN_PACK AS

PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vendors%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_ven_oagr_identifier            IN         vendors.ven_oagr_identifier%TYPE,
  p_ven_oagr_marking               IN         vendors.ven_oagr_marking%TYPE,
  p_ven_rec                        OUT NOCOPY vendors%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_ven_oagr_identifier            IN         vendors.ven_oagr_identifier%TYPE,
  p_ven_oagr_marking               IN         vendors.ven_oagr_marking%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_ven_oagr_identifier            IN         vendors.ven_oagr_identifier%TYPE,
  p_ven_oagr_marking               IN         vendors.ven_oagr_marking%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_ven_oagr_identifier            IN         vendors.ven_oagr_identifier%TYPE,
  p_ven_oagr_marking               IN         vendors.ven_oagr_marking%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_ven_oagr_identifier            IN         vendors.ven_oagr_identifier%TYPE,
  p_ven_oagr_marking               IN         vendors.ven_oagr_marking%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_ven_oagr_identifier            IN         vendors.ven_oagr_identifier%TYPE,
  p_ven_oagr_marking               IN         vendors.ven_oagr_marking%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_ven_oagr_identifier            IN         vendors.ven_oagr_identifier%TYPE,
  p_ven_oagr_marking               IN         vendors.ven_oagr_marking%TYPE);

FUNCTION GET_FULL_FUNC(
  p_ven_code                       IN         vendors.ven_code%TYPE,
  p_ven_rec                        OUT NOCOPY vendors%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_ven_code                       IN         vendors.ven_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_ven_code                       IN         vendors.ven_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_ven_code                       IN         vendors.ven_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_ven_code                       IN         vendors.ven_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_ven_code                       IN         vendors.ven_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_ven_code                       IN         vendors.ven_code%TYPE);


PROCEDURE INSERT_PROC(
  p_ven_code                       IN         vendors.ven_code%TYPE,
  p_ven_cat_code                   IN         vendors.ven_cat_code%TYPE,
  p_ven_use_code                   IN         vendors.ven_use_code%TYPE,
  p_ven_delivery_method            IN         vendors.ven_delivery_method%TYPE,
  p_ven_name                       IN         vendors.ven_name%TYPE,
  p_ven_short_name                 IN         vendors.ven_short_name%TYPE,
  p_ven_dvn_code                   IN         vendors.ven_dvn_code%TYPE,
  p_ven_terms                      IN         vendors.ven_terms%TYPE                           DEFAULT NULL,
  p_ven_ven_payable_code           IN         vendors.ven_ven_payable_code%TYPE                DEFAULT NULL,
  p_ven_broker_vendor_id           IN         vendors.ven_broker_vendor_id%TYPE                DEFAULT NULL,
  p_ven_duns_number                IN         vendors.ven_duns_number%TYPE                     DEFAULT NULL,
  p_ven_email                      IN         vendors.ven_email%TYPE                           DEFAULT NULL,
  p_ven_ven_pickup_code            IN         vendors.ven_ven_pickup_code%TYPE                 DEFAULT NULL,
  p_ven_edi_customer_mask          IN         vendors.ven_edi_customer_mask%TYPE               DEFAULT NULL,
  p_ven_negotiator_use_code        IN         vendors.ven_negotiator_use_code%TYPE             DEFAULT NULL,
  p_ven_ven_association_code       IN         vendors.ven_ven_association_code%TYPE            DEFAULT NULL,
  p_ven_car_code                   IN         vendors.ven_car_code%TYPE                        DEFAULT NULL,
  p_ven_elimination_date           IN         vendors.ven_elimination_date%TYPE                DEFAULT NULL,
  p_ven_message                    IN         vendors.ven_message%TYPE                         DEFAULT NULL,
  p_ven_alt_name                   IN         vendors.ven_alt_name%TYPE                        DEFAULT NULL,
  p_ven_dsc_code                   IN         vendors.ven_dsc_code%TYPE                        DEFAULT NULL,
  p_ven_freegood_admin_percent     IN         vendors.ven_freegood_admin_percent%TYPE          DEFAULT NULL,
  p_ven_enterprise_identificatio   IN         vendors.ven_enterprise_identification%TYPE       DEFAULT NULL,
  p_ven_in_association_vendor_co   IN         vendors.ven_in_association_vendor_code%TYPE      DEFAULT NULL,
  p_ven_reception_charge           IN         vendors.ven_reception_charge%TYPE                DEFAULT NULL,
  p_ven_recept_charge_ven_code     IN         vendors.ven_recept_charge_ven_code%TYPE          DEFAULT NULL,
  p_ven_logo                       IN         vendors.ven_logo%TYPE                            DEFAULT NULL,
  p_ven_oagr_identifier            IN         vendors.ven_oagr_identifier%TYPE                 DEFAULT NULL,
  p_ven_oagr_last_invoiced_date    IN         vendors.ven_oagr_last_invoiced_date%TYPE         DEFAULT NULL,
  p_ven_oagr_cwd_id                IN         vendors.ven_oagr_cwd_id%TYPE                     DEFAULT NULL,
  p_ven_gln_code                   IN         vendors.ven_gln_code%TYPE                        DEFAULT NULL,
  p_ven_association_admin_percen   IN         vendors.ven_association_admin_percent%TYPE       DEFAULT NULL,
  p_ven_vgr_code                   IN         vendors.ven_vgr_code%TYPE                        DEFAULT NULL,
  p_ven_oagr_marking               IN         vendors.ven_oagr_marking%TYPE                    DEFAULT NULL,
  p_ven_carrier_message            IN         vendors.ven_carrier_message%TYPE                 DEFAULT NULL,
  p_ven_auto_order_switch          IN         vendors.ven_auto_order_switch%TYPE               DEFAULT 0 ,
  p_ven_discount_total_switch      IN         vendors.ven_discount_total_switch%TYPE           DEFAULT 0 ,
  p_ven_drop_warehouse_flag        IN         vendors.ven_drop_warehouse_flag%TYPE             DEFAULT 'W' ,
  p_ven_fob                        IN         vendors.ven_fob%TYPE                             DEFAULT 'D' ,
  p_ven_freight_cost               IN         vendors.ven_freight_cost%TYPE                    DEFAULT 0 ,
  p_ven_minimum_order_dollars      IN         vendors.ven_minimum_order_dollars%TYPE           DEFAULT 0 ,
  p_ven_minimum_order_quantity     IN         vendors.ven_minimum_order_quantity%TYPE          DEFAULT 1 ,
  p_ven_minimum_order_weight       IN         vendors.ven_minimum_order_weight%TYPE            DEFAULT 0 ,
  p_ven_status                     IN         vendors.ven_status%TYPE                          DEFAULT 'A' ,
  p_ven_tobacco_switch             IN         vendors.ven_tobacco_switch%TYPE                  DEFAULT 0 ,
  p_ven_transmit_po_method         IN         vendors.ven_transmit_po_method%TYPE              DEFAULT 'MAI' ,
  p_ven_transport_allocation       IN         vendors.ven_transport_allocation%TYPE            DEFAULT 0 ,
  p_ven_wine_switch                IN         vendors.ven_wine_switch%TYPE                     DEFAULT 0 ,
  p_ven_modify_at_match_switch     IN         vendors.ven_modify_at_match_switch%TYPE          DEFAULT 1 ,
  p_ven_credit_reference_switch    IN         vendors.ven_credit_reference_switch%TYPE         DEFAULT 0 ,
  p_ven_forced_single_pb_switch    IN         vendors.ven_forced_single_pb_switch%TYPE         DEFAULT 1 ,
  p_ven_create_ar_switch           IN         vendors.ven_create_ar_switch%TYPE                DEFAULT 0 ,
  p_ven_spec_order_process_days    IN         vendors.ven_spec_order_process_days%TYPE         DEFAULT 0 ,
  p_ven_minimum_order_volume       IN         vendors.ven_minimum_order_volume%TYPE            DEFAULT 0 ,
  p_ven_check_deliv_date_switch    IN         vendors.ven_check_deliv_date_switch%TYPE         DEFAULT 0 ,
  p_ven_freight_calculation_meth   IN         vendors.ven_freight_calculation_method%TYPE      DEFAULT 'FX' ,
  p_ven_association_switch         IN         vendors.ven_association_switch%TYPE              DEFAULT 0 ,
  p_ven_creation_date              IN         vendors.ven_creation_date%TYPE                   DEFAULT SYSDATE ,
  p_ven_modification_date          IN         vendors.ven_modification_date%TYPE               DEFAULT SYSDATE ,
  p_ven_produce_stat_files_switc   IN         vendors.ven_produce_stat_files_switch%TYPE       DEFAULT 0 ,
  p_ven_calc_drop_prv_tax_switch   IN         vendors.ven_calc_drop_prv_tax_switch%TYPE        DEFAULT 1 ,
  p_ven_match_credit_note_switch   IN         vendors.ven_match_credit_note_switch%TYPE        DEFAULT 0 ,
  p_ven_drop_terms                 IN         vendors.ven_drop_terms%TYPE                      DEFAULT 0 ,
  p_ven_quart_drop_ship_avr        IN         vendors.ven_quart_drop_ship_avr%TYPE             DEFAULT 0 ,
  p_ven_collected_avr_percent      IN         vendors.ven_collected_avr_percent%TYPE           DEFAULT 0 ,
  p_ven_distributed_avr_percent    IN         vendors.ven_distributed_avr_percent%TYPE         DEFAULT 0 ,
  p_ven_federal_tax_exempt_switc   IN         vendors.ven_federal_tax_exempt_switch%TYPE       DEFAULT 0 ,
  p_ven_province_tax_exempt_swit   IN         vendors.ven_province_tax_exempt_switch%TYPE      DEFAULT 0 ,
  p_ven_expiry_date_format         IN         vendors.ven_expiry_date_format%TYPE              DEFAULT 'G' ,
  p_ven_net_price_on_inv_switch    IN         vendors.ven_net_price_on_inv_switch%TYPE         DEFAULT 1 ,
  p_ven_language_flag              IN         vendors.ven_language_flag%TYPE                   DEFAULT 'F' ,
  p_ven_visible_pgs_switch         IN         vendors.ven_visible_pgs_switch%TYPE              DEFAULT 1 ,
  p_ven_pgs_cus_promotion_switch   IN         vendors.ven_pgs_cus_promotion_switch%TYPE        DEFAULT 1 ,
  p_ven_detail_va_invoice_switch   IN         vendors.ven_detail_va_invoice_switch%TYPE        DEFAULT 0 ,
  p_ven_detail_vr_invoice_switch   IN         vendors.ven_detail_vr_invoice_switch%TYPE        DEFAULT 0 ,
  p_ven_no_prices_on_cus_bf_swit   IN         vendors.ven_no_prices_on_cus_bf_switch%TYPE      DEFAULT 0 ,
  p_ven_freegood_rebill_source     IN         vendors.ven_freegood_rebill_source%TYPE          DEFAULT 'L' ,
  p_ven_detail_vg_invoice_switch   IN         vendors.ven_detail_vg_invoice_switch%TYPE        DEFAULT 0 ,
  p_ven_calc_consignment_switch    IN         vendors.ven_calc_consignment_switch%TYPE         DEFAULT 1 ,
  p_ven_pgs_price_change_flag      IN         vendors.ven_pgs_price_change_flag%TYPE           DEFAULT 'A' ,
  p_ven_section_on_inv_switch      IN         vendors.ven_section_on_inv_switch%TYPE           DEFAULT 0 ,
  p_ven_oagr_frequency             IN         vendors.ven_oagr_frequency%TYPE                  DEFAULT 1 ,
  p_ven_detail_vt_invoice_switch   IN         vendors.ven_detail_vt_invoice_switch%TYPE        DEFAULT 0 ,
  p_ven_check_price_change_switc   IN         vendors.ven_check_price_change_switch%TYPE       DEFAULT 0 ,
  p_ven_reprint_bf_switch          IN         vendors.ven_reprint_bf_switch%TYPE               DEFAULT 0 ,
  p_ven_detail_vs_invoice_switch   IN         vendors.ven_detail_vs_invoice_switch%TYPE        DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY vendors%ROWTYPE);

FUNCTION GET_VEN_FUNC(
	p_ven_code    IN NUMBER,
  p_vendors_rec OUT NOCOPY vendors%ROWTYPE
)
RETURN PLS_INTEGER;

FUNCTION LOCK_VEN_FUNC(
	p_ven_code 			IN vendors.ven_code%TYPE
)
RETURN BOOLEAN;

FUNCTION FIND_VEN_PAYABLE_FUNC(
	p_ven_code IN NUMBER
)
RETURN NUMBER;

FUNCTION FIND_VEN_NAME_FUNC(
	p_ven_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

--ber3036 création de la fonction
FUNCTION FIND_VEN_SHORT_NAME_FUNC(
	p_ven_code IN NUMBER
)
RETURN VARCHAR2;

FUNCTION DO_VEN_EXISTS_FUNC(
	p_ven_code IN NUMBER
)
RETURN BOOLEAN;

FUNCTION DO_VEN_HAS_EDI_IN_RIGHTS_FUNC(
	p_ven_code 	IN NUMBER,
	p_edi_type	IN NUMBER
)
RETURN BOOLEAN;

END VEN_PACK;
/