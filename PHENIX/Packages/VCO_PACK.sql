CREATE OR REPLACE PACKAGE phenix.VCO_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  validate_customer_orders%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_vco_id                         IN         validate_customer_orders.vco_id%TYPE,
  p_vco_rec                        OUT NOCOPY validate_customer_orders%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_vco_id                         IN         validate_customer_orders.vco_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vco_id                         IN         validate_customer_orders.vco_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_vco_id                         IN         validate_customer_orders.vco_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_vco_id                         IN         validate_customer_orders.vco_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vco_id                         IN         validate_customer_orders.vco_id%TYPE);


FUNCTION INSERT_FUNC(
  p_vco_coh_cus_code              IN         validate_customer_orders.vco_coh_cus_code%TYPE                   DEFAULT NULL,
  p_vco_coh_use_code              IN         validate_customer_orders.vco_coh_use_code%TYPE                   DEFAULT NULL,
  p_vco_coh_order_date            IN         validate_customer_orders.vco_coh_order_date%TYPE                 DEFAULT NULL,
  p_vco_coh_use_telemark_code     IN         validate_customer_orders.vco_coh_use_telemark_code%TYPE          DEFAULT NULL,
  p_vco_coh_message               IN         validate_customer_orders.vco_coh_message%TYPE                    DEFAULT NULL,
  p_vco_coh_reference_number      IN         validate_customer_orders.vco_coh_reference_number%TYPE           DEFAULT NULL,
  p_vco_cod_coh_id                IN         validate_customer_orders.vco_cod_coh_id%TYPE                     DEFAULT NULL,
  p_vco_cod_line_number           IN         validate_customer_orders.vco_cod_line_number%TYPE                DEFAULT NULL,
  p_vco_cod_prf_prd_code          IN         validate_customer_orders.vco_cod_prf_prd_code%TYPE               DEFAULT NULL,
  p_vco_cod_prf_fmt_code          IN         validate_customer_orders.vco_cod_prf_fmt_code%TYPE               DEFAULT NULL,
  p_vco_cod_base_selling_cost     IN         validate_customer_orders.vco_cod_base_selling_cost%TYPE          DEFAULT NULL,
  p_vco_cod_cost_price            IN         validate_customer_orders.vco_cod_cost_price%TYPE                 DEFAULT NULL,
  p_vco_cod_order_type            IN         validate_customer_orders.vco_cod_order_type%TYPE                 DEFAULT NULL,
  p_vco_cod_original_retail       IN         validate_customer_orders.vco_cod_original_retail%TYPE            DEFAULT NULL,
  p_vco_cod_prebook_method        IN         validate_customer_orders.vco_cod_prebook_method%TYPE             DEFAULT NULL,
  p_vco_cod_pricing_source        IN         validate_customer_orders.vco_cod_pricing_source%TYPE             DEFAULT NULL,
  p_vco_cod_project_delivery_dat  IN         validate_customer_orders.vco_cod_project_delivery_date%TYPE      DEFAULT NULL,
  p_vco_cod_promotion_amount      IN         validate_customer_orders.vco_cod_promotion_amount%TYPE           DEFAULT NULL,
  p_vco_cod_selling_retail        IN         validate_customer_orders.vco_cod_selling_retail%TYPE             DEFAULT NULL,
  p_vco_cod_spec_order_status     IN         validate_customer_orders.vco_cod_spec_order_status%TYPE          DEFAULT NULL,
  p_vco_cod_surcharge             IN         validate_customer_orders.vco_cod_surcharge%TYPE                  DEFAULT NULL,
  p_vco_cod_tobacco_tax           IN         validate_customer_orders.vco_cod_tobacco_tax%TYPE                DEFAULT NULL,
  p_vco_cod_cod_coh_id            IN         validate_customer_orders.vco_cod_cod_coh_id%TYPE                 DEFAULT NULL,
  p_vco_cod_cod_line_number       IN         validate_customer_orders.vco_cod_cod_line_number%TYPE            DEFAULT NULL,
  p_vco_cod_fmt_code_srp          IN         validate_customer_orders.vco_cod_fmt_code_srp%TYPE               DEFAULT NULL,
  p_vco_cod_pod_poh_id            IN         validate_customer_orders.vco_cod_pod_poh_id%TYPE                 DEFAULT NULL,
  p_vco_cod_pod_line_number       IN         validate_customer_orders.vco_cod_pod_line_number%TYPE            DEFAULT NULL,
  p_vco_cod_prf_prd_original_cod  IN         validate_customer_orders.vco_cod_prf_prd_original_code%TYPE      DEFAULT NULL,
  p_vco_cod_prf_fmt_original_cod  IN         validate_customer_orders.vco_cod_prf_fmt_original_code%TYPE      DEFAULT NULL,
  p_vco_cod_pty_code              IN         validate_customer_orders.vco_cod_pty_code%TYPE                   DEFAULT NULL,
  p_vco_cod_leftover_quantity     IN         validate_customer_orders.vco_cod_leftover_quantity%TYPE          DEFAULT NULL,
  p_vco_cod_leftover_weight       IN         validate_customer_orders.vco_cod_leftover_weight%TYPE            DEFAULT NULL,
  p_vco_cod_message               IN         validate_customer_orders.vco_cod_message%TYPE                    DEFAULT NULL,
  p_vco_cod_order_quantity        IN         validate_customer_orders.vco_cod_order_quantity%TYPE             DEFAULT NULL,
  p_vco_cod_order_weight          IN         validate_customer_orders.vco_cod_order_weight%TYPE               DEFAULT NULL,
  p_vco_cod_price_srp             IN         validate_customer_orders.vco_cod_price_srp%TYPE                  DEFAULT NULL,
  p_vco_cod_quantity_srp          IN         validate_customer_orders.vco_cod_quantity_srp%TYPE               DEFAULT NULL,
  p_vco_ccr_code                  IN         validate_customer_orders.vco_ccr_code%TYPE                       DEFAULT NULL,
  p_vco_cod_average_cost_1        IN         validate_customer_orders.vco_cod_average_cost_1%TYPE             DEFAULT NULL,
  p_vco_cod_average_cost_2        IN         validate_customer_orders.vco_cod_average_cost_2%TYPE             DEFAULT NULL,
  p_vco_cod_average_cost_3        IN         validate_customer_orders.vco_cod_average_cost_3%TYPE             DEFAULT NULL,
  p_vco_cod_average_cost_4        IN         validate_customer_orders.vco_cod_average_cost_4%TYPE             DEFAULT NULL,
  p_vco_cod_average_list          IN         validate_customer_orders.vco_cod_average_list%TYPE               DEFAULT NULL,
  p_vco_cod_avg_real_cost_1       IN         validate_customer_orders.vco_cod_avg_real_cost_1%TYPE            DEFAULT NULL,
  p_vco_cod_avg_real_cost_2       IN         validate_customer_orders.vco_cod_avg_real_cost_2%TYPE            DEFAULT NULL,
  p_vco_cod_avg_real_cost_3       IN         validate_customer_orders.vco_cod_avg_real_cost_3%TYPE            DEFAULT NULL,
  p_vco_cod_avg_real_cost_4       IN         validate_customer_orders.vco_cod_avg_real_cost_4%TYPE            DEFAULT NULL,
  p_vco_cod_avg_real_list         IN         validate_customer_orders.vco_cod_avg_real_list%TYPE              DEFAULT NULL,
  p_vco_reject_and_printed_switc  IN         validate_customer_orders.vco_reject_and_printed_switch%TYPE      DEFAULT NULL,
  p_vco_cod_customer_product_cod  IN         validate_customer_orders.vco_cod_customer_product_code%TYPE      DEFAULT NULL,
  p_vco_cod_customer_product_loc  IN         validate_customer_orders.vco_cod_customer_product_loc%TYPE       DEFAULT NULL,
  p_vco_accept_flag               IN         validate_customer_orders.vco_accept_flag%TYPE                    DEFAULT NULL,
  p_vco_cod_customer_po_line      IN         validate_customer_orders.vco_cod_customer_po_line%TYPE           DEFAULT NULL,
  p_vco_upc_code                  IN         validate_customer_orders.vco_upc_code%TYPE                       DEFAULT NULL,
  p_vco_transfered_product_code   IN         validate_customer_orders.vco_transfered_product_code%TYPE        DEFAULT NULL,
  p_vco_cod_car_amount            IN         validate_customer_orders.vco_cod_car_amount%TYPE                 DEFAULT NULL,
  p_vco_inserted_switch           IN         validate_customer_orders.vco_inserted_switch%TYPE                DEFAULT NULL,
  p_vco_coh_whs_delivery_code     IN         validate_customer_orders.vco_coh_whs_delivery_code%TYPE          DEFAULT NULL,
  p_vco_cod_whs_picking_code      IN         validate_customer_orders.vco_cod_whs_picking_code%TYPE           DEFAULT NULL,
  p_vco_selling_retail_orig       IN         validate_customer_orders.vco_selling_retail_orig%TYPE            DEFAULT NULL,
  p_vco_pricing_source_orig       IN         validate_customer_orders.vco_pricing_source_orig%TYPE            DEFAULT NULL,
  p_vco_use_override_code         IN         validate_customer_orders.vco_use_override_code%TYPE              DEFAULT NULL,
  p_vco_cod_desired_quantity      IN         validate_customer_orders.vco_cod_desired_quantity%TYPE           DEFAULT NULL,
  p_vco_cod_desired_weight        IN         validate_customer_orders.vco_cod_desired_weight%TYPE             DEFAULT NULL,
  p_vco_orig_ven_name             IN         validate_customer_orders.vco_orig_ven_name%TYPE                  DEFAULT NULL,
  p_vco_coh_pci_order_rgf_number  IN         validate_customer_orders.vco_coh_pci_order_rgf_number%TYPE       DEFAULT NULL,
  p_vco_requested_price           IN         validate_customer_orders.vco_requested_price%TYPE                DEFAULT NULL,
  p_vco_requested_delivery_date   IN         validate_customer_orders.vco_requested_delivery_date%TYPE        DEFAULT NULL,
  p_vco_availability_date         IN         validate_customer_orders.vco_availability_date%TYPE              DEFAULT NULL,
  p_vco_display_line_number       IN         validate_customer_orders.vco_display_line_number%TYPE            DEFAULT NULL,
  p_vco_cod_customer_po_number    IN         validate_customer_orders.vco_cod_customer_po_number%TYPE         DEFAULT NULL,
  p_vco_pxc_code                  IN         validate_customer_orders.vco_pxc_code%TYPE                       DEFAULT NULL,
  p_vco_cod_subst_inv_quantity    IN         validate_customer_orders.vco_cod_subst_inv_quantity%TYPE         DEFAULT NULL,
  p_vco_cod_subst_inv_weight      IN         validate_customer_orders.vco_cod_subst_inv_weight%TYPE           DEFAULT NULL,
  p_vco_shorted_id                IN         validate_customer_orders.vco_shorted_id%TYPE                     DEFAULT NULL,
  p_vco_ven_next_delivery_date    IN         validate_customer_orders.vco_ven_next_delivery_date%TYPE         DEFAULT NULL,
  p_vco_coh_approved_switch       IN         validate_customer_orders.vco_coh_approved_switch%TYPE            DEFAULT 0 ,
  p_vco_cod_royalty_amount        IN         validate_customer_orders.vco_cod_royalty_amount%TYPE             DEFAULT 0 ,
  p_vco_cod_division_order_switc  IN         validate_customer_orders.vco_cod_division_order_switch%TYPE      DEFAULT 0 )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY validate_customer_orders%ROWTYPE)
RETURN NUMBER;

END VCO_PACK;
/