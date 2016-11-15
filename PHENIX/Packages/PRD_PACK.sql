CREATE OR REPLACE PACKAGE phenix.PRD_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  products%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_prd_code                       IN         products.prd_code%TYPE,
  p_prd_rec                        OUT NOCOPY products%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_prd_code                       IN         products.prd_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_prd_code                       IN         products.prd_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_prd_code                       IN         products.prd_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_prd_code                       IN         products.prd_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_prd_code                       IN         products.prd_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_prd_code                       IN         products.prd_code%TYPE);


PROCEDURE INSERT_PROC(
  p_prd_code                       IN         products.prd_code%TYPE,
  p_prd_cls_code                   IN         products.prd_cls_code%TYPE,
  p_prd_pgr_code                   IN         products.prd_pgr_code%TYPE,
  p_prd_attribute                  IN         products.prd_attribute%TYPE,
  p_prd_average_cost_1             IN         products.prd_average_cost_1%TYPE,
  p_prd_average_cost_2             IN         products.prd_average_cost_2%TYPE,
  p_prd_average_cost_3             IN         products.prd_average_cost_3%TYPE,
  p_prd_average_cost_4             IN         products.prd_average_cost_4%TYPE,
  p_prd_average_list               IN         products.prd_average_list%TYPE,
  p_prd_avg_real_cost_1            IN         products.prd_avg_real_cost_1%TYPE,
  p_prd_avg_real_cost_2            IN         products.prd_avg_real_cost_2%TYPE,
  p_prd_avg_real_cost_3            IN         products.prd_avg_real_cost_3%TYPE,
  p_prd_avg_real_cost_4            IN         products.prd_avg_real_cost_4%TYPE,
  p_prd_avg_real_list              IN         products.prd_avg_real_list%TYPE,
  p_prd_base_selling_list          IN         products.prd_base_selling_list%TYPE,
  p_prd_broker_switch              IN         products.prd_broker_switch%TYPE,
  p_prd_cost_adjustment            IN         products.prd_cost_adjustment%TYPE,
  p_prd_description                IN         products.prd_description%TYPE,
  p_prd_differential               IN         products.prd_differential%TYPE,
  p_prd_dropship_switch            IN         products.prd_dropship_switch%TYPE,
  p_prd_invoiced_by_weight         IN         products.prd_invoiced_by_weight%TYPE,
  p_prd_last_list_paid             IN         products.prd_last_list_paid%TYPE,
  p_prd_lot_control_switch         IN         products.prd_lot_control_switch%TYPE,
  p_prd_multi_vendor_switch        IN         products.prd_multi_vendor_switch%TYPE,
  p_prd_scale_product_switch       IN         products.prd_scale_product_switch%TYPE,
  p_prd_short_description          IN         products.prd_short_description%TYPE,
  p_prd_special_order_switch       IN         products.prd_special_order_switch%TYPE,
  p_prd_status                     IN         products.prd_status%TYPE,
  p_prd_cost_admin_1               IN         products.prd_cost_admin_1%TYPE,
  p_prd_check_inventory_switch     IN         products.prd_check_inventory_switch%TYPE,
  p_prd_definition                 IN         products.prd_definition%TYPE,
  p_prd_default_whz_code           IN         products.prd_default_whz_code%TYPE,
  p_prd_packaging_type             IN         products.prd_packaging_type%TYPE,
  p_prd_catalog_sequence_code      IN         products.prd_catalog_sequence_code%TYPE           DEFAULT NULL,
  p_prd_brn_code                   IN         products.prd_brn_code%TYPE                        DEFAULT NULL,
  p_prd_cmd_code                   IN         products.prd_cmd_code%TYPE                        DEFAULT NULL,
  p_prd_ctg_code                   IN         products.prd_ctg_code%TYPE                        DEFAULT NULL,
  p_prd_fmt_solid_inventory_code   IN         products.prd_fmt_solid_inventory_code%TYPE        DEFAULT NULL,
  p_prd_fmt_weighted_inv_code      IN         products.prd_fmt_weighted_inv_code%TYPE           DEFAULT NULL,
  p_prd_ppf_code                   IN         products.prd_ppf_code%TYPE                        DEFAULT NULL,
  p_prd_prd_is_replacement_code    IN         products.prd_prd_is_replacement_code%TYPE         DEFAULT NULL,
  p_prd_prd_is_substitute_code     IN         products.prd_prd_is_substitute_code%TYPE          DEFAULT NULL,
  p_prd_srp_fmt_code               IN         products.prd_srp_fmt_code%TYPE                    DEFAULT NULL,
  p_prd_tip_code                   IN         products.prd_tip_code%TYPE                        DEFAULT NULL,
  p_prd_ven_code                   IN         products.prd_ven_code%TYPE                        DEFAULT NULL,
  p_prd_alt_description            IN         products.prd_alt_description%TYPE                 DEFAULT NULL,
  p_prd_perishable_alert           IN         products.prd_perishable_alert%TYPE                DEFAULT NULL,
  p_prd_perishable_expiry          IN         products.prd_perishable_expiry%TYPE               DEFAULT NULL,
  p_prd_season_end                 IN         products.prd_season_end%TYPE                      DEFAULT NULL,
  p_prd_season_start               IN         products.prd_season_start%TYPE                    DEFAULT NULL,
  p_prd_short_alt_description      IN         products.prd_short_alt_description%TYPE           DEFAULT NULL,
  p_prd_elimination_date           IN         products.prd_elimination_date%TYPE                DEFAULT NULL,
  p_prd_avg_cost_recalc_date       IN         products.prd_avg_cost_recalc_date%TYPE            DEFAULT NULL,
  p_prd_product_life               IN         products.prd_product_life%TYPE                    DEFAULT NULL,
  p_prd_minimum_reception_days     IN         products.prd_minimum_reception_days%TYPE          DEFAULT NULL,
  p_prd_size                       IN         products.prd_size%TYPE                            DEFAULT NULL,
  p_prd_size_uom                   IN         products.prd_size_uom%TYPE                        DEFAULT NULL,
  p_prd_message_1                  IN         products.prd_message_1%TYPE                       DEFAULT NULL,
  p_prd_message_2                  IN         products.prd_message_2%TYPE                       DEFAULT NULL,
  p_prd_message_3                  IN         products.prd_message_3%TYPE                       DEFAULT NULL,
  p_prd_reception_date_type        IN         products.prd_reception_date_type%TYPE             DEFAULT NULL,
  p_prd_haz_code                   IN         products.prd_haz_code%TYPE                        DEFAULT NULL,
  p_prd_broker_request_date        IN         products.prd_broker_request_date%TYPE             DEFAULT NULL,
  p_prd_last_price_change_date     IN         products.prd_last_price_change_date%TYPE          DEFAULT NULL,
  p_prd_last_base_selling_list     IN         products.prd_last_base_selling_list%TYPE          DEFAULT NULL,
  p_prd_liquidation_date           IN         products.prd_liquidation_date%TYPE                DEFAULT NULL,
  p_prd_reference_code             IN         products.prd_reference_code%TYPE                  DEFAULT NULL,
  p_prd_cat_code                   IN         products.prd_cat_code%TYPE                        DEFAULT NULL,
  p_prd_last_receipt_date          IN         products.prd_last_receipt_date%TYPE               DEFAULT NULL,
  p_prd_tbpc_code                  IN         products.prd_tbpc_code%TYPE                       DEFAULT NULL,
  p_prd_creation_date              IN         products.prd_creation_date%TYPE                   DEFAULT SYSDATE ,
  p_prd_valid_alt_code_switch      IN         products.prd_valid_alt_code_switch%TYPE           DEFAULT 0 ,
  p_prd_fluct_preparation_minute   IN         products.prd_fluct_preparation_minutes%TYPE       DEFAULT 0 ,
  p_prd_convert_to_spec_ord_swit   IN         products.prd_convert_to_spec_ord_switch%TYPE      DEFAULT 0 ,
  p_prd_date_modified              IN         products.prd_date_modified%TYPE                   DEFAULT SYSDATE ,
  p_prd_availability_date          IN         products.prd_availability_date%TYPE               DEFAULT SYSDATE ,
  p_prd_cigar_switch               IN         products.prd_cigar_switch%TYPE                    DEFAULT 0 ,
  p_prd_block_price_over_switch    IN         products.prd_block_price_over_switch%TYPE         DEFAULT 0 ,
  p_prd_dropship_retailer_switch   IN         products.prd_dropship_retailer_switch%TYPE        DEFAULT 0 ,
  p_prd_service_type               IN         products.prd_service_type%TYPE                    DEFAULT 'ADE' ,
  p_prd_fragile_product_switch     IN         products.prd_fragile_product_switch%TYPE          DEFAULT 0 ,
  p_prd_no_case_flow_switch        IN         products.prd_no_case_flow_switch%TYPE             DEFAULT 0 ,
  p_prd_exp_date_at_pick_switch    IN         products.prd_exp_date_at_pick_switch%TYPE         DEFAULT 0 ,
  p_prd_cost_admin_2_percent       IN         products.prd_cost_admin_2_percent%TYPE            DEFAULT 0 ,
  p_prd_commodity_discount_amoun   IN         products.prd_commodity_discount_amount%TYPE       DEFAULT 0 ,
  p_prd_last_received_po_list      IN         products.prd_last_received_po_list%TYPE           DEFAULT NULL,
  p_prd_last_received_po_cost_1    IN         products.prd_last_received_po_cost_1%TYPE         DEFAULT 0  ,
  p_prd_last_received_po_cost_2    IN         products.prd_last_received_po_cost_2%TYPE         DEFAULT 0  ,
  p_prd_last_received_po_cost_3    IN         products.prd_last_received_po_cost_3%TYPE         DEFAULT 0  ,
  p_prd_last_received_po_cost_4    IN         products.prd_last_received_po_cost_4%TYPE         DEFAULT 0  );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY products%ROWTYPE);


 ------------------------------------------------------------------------------------------------------

FUNCTION GET_PRD_FUNC(
  p_prd_code        IN VARCHAR2,
  p_products_rec    OUT NOCOPY products%ROWTYPE,
  p_poh_id          IN NUMBER DEFAULT NULL,   --si on cherche le produit du ASN
  p_pod_line_number IN NUMBER DEFAULT NULL    --si on cherche le produit du ASN
)
RETURN PLS_INTEGER;

FUNCTION GET_PRD_DEFINITION_FUNC(
  p_prd_code IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION LOCK_PRD_FUNC(
  p_prd_code IN VARCHAR2
)
RETURN BOOLEAN;

FUNCTION LOCK_PRD_FUNC(
  p_prd_code      IN VARCHAR2,
  p_prd_ppf_code  OUT NUMBER
)
RETURN BOOLEAN;

FUNCTION FIND_BRN_MANUF_FUNC(
  p_prd_code IN VARCHAR2,
  p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

FUNCTION FIND_PRD_DESCRIPTION_FUNC(
  p_prd_code IN VARCHAR2,
  p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

PROCEDURE GET_PRD_SEASON_DATES_PROC(
  p_prd_code          IN VARCHAR2,
  p_prd_season_start  OUT DATE,
  p_prd_season_end    OUT DATE
);

FUNCTION DOES_PRD_EXISTS_FUNC(
  p_prd_code IN products.prd_code%TYPE
)
RETURN BOOLEAN;

FUNCTION FIND_COLUMN_VALUE_VARCHAR_FUNC(
  p_column_name     IN VARCHAR2,
  p_prd_code        IN products.prd_code%TYPE
)
RETURN VARCHAR2;

FUNCTION FIND_COLUMN_VALUE_NUMBER_FUNC(
  p_column_name     IN VARCHAR2,
  p_prd_code        IN products.prd_code%TYPE
)
RETURN NUMBER;

FUNCTION FIND_COLUMN_VALUE_DATE_FUNC(
  p_column_name     IN VARCHAR2,
  p_prd_code        IN products.prd_code%TYPE
)
RETURN DATE;

FUNCTION RESET_LIQUIDATION_DATE_FUNC
RETURN NUMBER;

PROCEDURE SET_LIQUIDATION_DATE_PROC(
  p_prd_code  IN products.prd_code%TYPE
);

END PRD_PACK;
/