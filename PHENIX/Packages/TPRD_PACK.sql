CREATE OR REPLACE PACKAGE phenix.TPRD_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  temporary_product_details%ROWTYPE);


PROCEDURE INSERT_PROC(
  p_tprd_cus_code                 IN         temporary_product_details.tprd_cus_code%TYPE,
  p_tprd_prf_prd_code             IN         temporary_product_details.tprd_prf_prd_code%TYPE,
  p_tprd_prf_fmt_code             IN         temporary_product_details.tprd_prf_fmt_code%TYPE,
  p_tprd_prd_description          IN         temporary_product_details.tprd_prd_description%TYPE,
  p_tprd_fmt_description          IN         temporary_product_details.tprd_fmt_description%TYPE,
  p_tprd_fmt_short_code           IN         temporary_product_details.tprd_fmt_short_code%TYPE,
  p_tprd_prf_description          IN         temporary_product_details.tprd_prf_description%TYPE,
  p_tprd_prf_inner_weight         IN         temporary_product_details.tprd_prf_inner_weight%TYPE,
  p_tprd_prf_price                IN         temporary_product_details.tprd_prf_price%TYPE,
  p_tprd_extended_prf_price       IN         temporary_product_details.tprd_extended_prf_price%TYPE,
  p_tprd_selling_price            IN         temporary_product_details.tprd_selling_price%TYPE,
  p_tprd_extended_selling_price   IN         temporary_product_details.tprd_extended_selling_price%TYPE,
  p_tprd_extended_savings_amount  IN         temporary_product_details.tprd_extended_savings_amount%TYPE,
  p_tprd_pricing_source           IN         temporary_product_details.tprd_pricing_source%TYPE,
  p_tprd_promotional_item_switch  IN         temporary_product_details.tprd_promotional_item_switch%TYPE,
  p_tprd_promotion_amount         IN         temporary_product_details.tprd_promotion_amount%TYPE,
  p_tprd_quantity_weight_on_hand  IN         temporary_product_details.tprd_quantity_weight_on_hand%TYPE,
  p_tprd_prd_ven_code             IN         temporary_product_details.tprd_prd_ven_code%TYPE,
  p_tprd_ven_next_delivery_date   IN         temporary_product_details.tprd_ven_next_delivery_date%TYPE,
  p_tprd_ven_delivery_date_orig   IN         temporary_product_details.tprd_ven_delivery_date_orig%TYPE,
  p_tprd_whs_delivery_code        IN         temporary_product_details.tprd_whs_delivery_code%TYPE,
  p_tprd_whs_picking_code         IN         temporary_product_details.tprd_whs_picking_code%TYPE,
  p_tprd_prd_definition           IN         temporary_product_details.tprd_prd_definition%TYPE,
  p_tprd_blue_line_switch         IN         temporary_product_details.tprd_blue_line_switch%TYPE,
  p_tprd_nbr_certifications       IN         temporary_product_details.tprd_nbr_certifications%TYPE,
  p_tprd_brn_code                 IN         temporary_product_details.tprd_brn_code%TYPE                      DEFAULT NULL,
  p_tprd_brn_description          IN         temporary_product_details.tprd_brn_description%TYPE               DEFAULT NULL,
  p_tprd_ctg_code                 IN         temporary_product_details.tprd_ctg_code%TYPE                      DEFAULT NULL,
  p_tprd_ctg_description          IN         temporary_product_details.tprd_ctg_description%TYPE               DEFAULT NULL,
  p_tprd_cutoff_time              IN         temporary_product_details.tprd_cutoff_time%TYPE                   DEFAULT NULL,
  p_tprd_cutoff_date              IN         temporary_product_details.tprd_cutoff_date%TYPE                   DEFAULT NULL,
  p_tprd_prf_cns_code             IN         temporary_product_details.tprd_prf_cns_code%TYPE                  DEFAULT NULL,
  p_tprd_fmt_solid_inventory_cod  IN         temporary_product_details.tprd_fmt_solid_inventory_code%TYPE      DEFAULT NULL,
  p_tprd_fmt_invoiced_short_code  IN         temporary_product_details.tprd_fmt_invoiced_short_code%TYPE       DEFAULT NULL,
  p_tprd_ven_next_receipt_date    IN         temporary_product_details.tprd_ven_next_receipt_date%TYPE         DEFAULT NULL,
  p_tprd_ven_next_delivery_code   IN         temporary_product_details.tprd_ven_next_delivery_code%TYPE        DEFAULT NULL,
  p_tprd_pxc_code                 IN         temporary_product_details.tprd_pxc_code%TYPE                      DEFAULT NULL,
  p_tprd_dld_sequence             IN         temporary_product_details.tprd_dld_sequence%TYPE                  DEFAULT NULL,
  p_tprd_special_order_switch     IN         temporary_product_details.tprd_special_order_switch%TYPE          DEFAULT 0 ,
  p_tprd_infinite_inv_switch      IN         temporary_product_details.tprd_infinite_inv_switch%TYPE           DEFAULT 0 ,
  p_tprd_prf_pre_print_switch     IN         temporary_product_details.tprd_prf_pre_print_switch%TYPE          DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY temporary_product_details%ROWTYPE);

END TPRD_PACK;
/