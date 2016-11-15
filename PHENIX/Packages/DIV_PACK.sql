CREATE OR REPLACE PACKAGE phenix.DIV_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  divisions%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_div_id                         IN         divisions.div_id%TYPE,
  p_div_rec                        OUT NOCOPY divisions%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_div_id                         IN         divisions.div_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_div_id                         IN         divisions.div_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_div_id                         IN         divisions.div_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_div_id                         IN         divisions.div_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_div_id                         IN         divisions.div_id%TYPE);

FUNCTION GET_FULL_FUNC(
  p_div_dvn_code                   IN         divisions.div_dvn_code%TYPE,
  p_div_whs_code                   IN         divisions.div_whs_code%TYPE,
  p_div_rec                        OUT NOCOPY divisions%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_div_dvn_code                   IN         divisions.div_dvn_code%TYPE,
  p_div_whs_code                   IN         divisions.div_whs_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_div_dvn_code                   IN         divisions.div_dvn_code%TYPE,
  p_div_whs_code                   IN         divisions.div_whs_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_div_dvn_code                   IN         divisions.div_dvn_code%TYPE,
  p_div_whs_code                   IN         divisions.div_whs_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_div_dvn_code                   IN         divisions.div_dvn_code%TYPE,
  p_div_whs_code                   IN         divisions.div_whs_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_div_dvn_code                   IN         divisions.div_dvn_code%TYPE,
  p_div_whs_code                   IN         divisions.div_whs_code%TYPE);


FUNCTION INSERT_FUNC(
  p_div_ap_drops                   IN         divisions.div_ap_drops%TYPE,
  p_div_ap_purchases               IN         divisions.div_ap_purchases%TYPE,
  p_div_ap_transport               IN         divisions.div_ap_transport%TYPE,
  p_div_ar_billbacks               IN         divisions.div_ar_billbacks%TYPE,
  p_div_ar_credits                 IN         divisions.div_ar_credits%TYPE,
  p_div_ar_drops                   IN         divisions.div_ar_drops%TYPE,
  p_div_ar_sales                   IN         divisions.div_ar_sales%TYPE,
  p_div_ar_vendor_credits          IN         divisions.div_ar_vendor_credits%TYPE,
  p_div_ar_vendor_discounts        IN         divisions.div_ar_vendor_discounts%TYPE,
  p_div_ar_recount_promotions      IN         divisions.div_ar_recount_promotions%TYPE,
  p_div_billbacks_flag             IN         divisions.div_billbacks_flag%TYPE,
  p_div_recount_promotions_flag    IN         divisions.div_recount_promotions_flag%TYPE,
  p_div_vendor_credits_flag        IN         divisions.div_vendor_credits_flag%TYPE,
  p_div_vendor_discounts_flag      IN         divisions.div_vendor_discounts_flag%TYPE,
  p_div_ar_vendor_sales_agreemen   IN         divisions.div_ar_vendor_sales_agreement%TYPE,
  p_div_bill_for_transactions      IN         divisions.div_bill_for_transactions%TYPE,
  p_div_dvn_code                   IN         divisions.div_dvn_code%TYPE,
  p_div_whs_code                   IN         divisions.div_whs_code%TYPE,
  p_div_freegoods                  IN         divisions.div_freegoods%TYPE,
  p_div_freegoods_admin            IN         divisions.div_freegoods_admin%TYPE,
  p_div_vendor_admin               IN         divisions.div_vendor_admin%TYPE,
  p_div_oa_account                 IN         divisions.div_oa_account%TYPE,
  p_div_tpa_account                IN         divisions.div_tpa_account%TYPE,
  p_div_ar_drop_surcharges         IN         divisions.div_ar_drop_surcharges%TYPE,
  p_div_discount_account           IN         divisions.div_discount_account%TYPE,
  p_div_taxable_charge_account     IN         divisions.div_taxable_charge_account%TYPE,
  p_div_not_taxable_charge_accou   IN         divisions.div_not_taxable_charge_account%TYPE,
  p_div_alt_description            IN         divisions.div_alt_description%TYPE                 DEFAULT NULL,
  p_div_transfer_inventory_accou   IN         divisions.div_transfer_inventory_account%TYPE      DEFAULT NULL,
  p_div_transfer_freight_account   IN         divisions.div_transfer_freight_account%TYPE        DEFAULT NULL,
  p_div_ap_alloc_transport         IN         divisions.div_ap_alloc_transport%TYPE              DEFAULT NULL,
  p_div_ap_alloc_transport_volum   IN         divisions.div_ap_alloc_transport_volume%TYPE       DEFAULT NULL,
  p_div_ap_quart_rebate            IN         divisions.div_ap_quart_rebate%TYPE                 DEFAULT NULL,
  p_div_ap_quart_rebate_volume     IN         divisions.div_ap_quart_rebate_volume%TYPE          DEFAULT NULL,
  p_div_ap_term_drop               IN         divisions.div_ap_term_drop%TYPE                    DEFAULT NULL,
  p_div_ap_term_drop_volume        IN         divisions.div_ap_term_drop_volume%TYPE             DEFAULT NULL,
  p_div_ap_alloc_growth            IN         divisions.div_ap_alloc_growth%TYPE                 DEFAULT NULL,
  p_div_ap_alloc_additional        IN         divisions.div_ap_alloc_additional%TYPE             DEFAULT NULL,
  p_div_ap_alloc_prog              IN         divisions.div_ap_alloc_prog%TYPE                   DEFAULT NULL,
  p_div_ap_alloc_prog_volume       IN         divisions.div_ap_alloc_prog_volume%TYPE            DEFAULT NULL,
  p_div_warehouse_drop_switch      IN         divisions.div_warehouse_drop_switch%TYPE           DEFAULT 0 ,
  p_div_bill_for_trans_flag        IN         divisions.div_bill_for_trans_flag%TYPE             DEFAULT 'R' ,
  p_div_freegoods_flag             IN         divisions.div_freegoods_flag%TYPE                  DEFAULT 'R' ,
  p_div_freegoods_admin_flag       IN         divisions.div_freegoods_admin_flag%TYPE            DEFAULT 'R' ,
  p_div_oa_flag                    IN         divisions.div_oa_flag%TYPE                         DEFAULT 'P' ,
  p_div_tpa_flag                   IN         divisions.div_tpa_flag%TYPE                        DEFAULT 'P' ,
  p_div_telemarketer_counters      IN         divisions.div_telemarketer_counters%TYPE           DEFAULT 'A CHANGER' ,
  p_div_telemarketer_counters_fl   IN         divisions.div_telemarketer_counters_flag%TYPE      DEFAULT 'R' ,
  p_div_ar_sales_incentive         IN         divisions.div_ar_sales_incentive%TYPE              DEFAULT 'A CHANGER' )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY divisions%ROWTYPE)
RETURN NUMBER;

END DIV_PACK;
/