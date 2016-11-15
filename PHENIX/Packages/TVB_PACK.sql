CREATE OR REPLACE PACKAGE phenix.TVB_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  temporary_vendor_billings%ROWTYPE);


PROCEDURE INSERT_PROC(
  p_tvb_sid                        IN         temporary_vendor_billings.tvb_sid%TYPE                             DEFAULT NULL,
  p_tvb_line_number                IN         temporary_vendor_billings.tvb_line_number%TYPE                     DEFAULT NULL,
  p_tvb_vpd_code                   IN         temporary_vendor_billings.tvb_vpd_code%TYPE                        DEFAULT NULL,
  p_tvb_prf_prd_code               IN         temporary_vendor_billings.tvb_prf_prd_code%TYPE                    DEFAULT NULL,
  p_tvb_prf_fmt_code               IN         temporary_vendor_billings.tvb_prf_fmt_code%TYPE                    DEFAULT NULL,
  p_tvb_prd_ven_code               IN         temporary_vendor_billings.tvb_prd_ven_code%TYPE                    DEFAULT NULL,
  p_tvb_prd_definition             IN         temporary_vendor_billings.tvb_prd_definition%TYPE                  DEFAULT NULL,
  p_tvb_vct_code                   IN         temporary_vendor_billings.tvb_vct_code%TYPE                        DEFAULT NULL,
  p_tvb_vct_pick_switch            IN         temporary_vendor_billings.tvb_vct_pick_switch%TYPE                 DEFAULT NULL,
  p_tvb_vct_damage_switch          IN         temporary_vendor_billings.tvb_vct_damage_switch%TYPE               DEFAULT NULL,
  p_tvb_vct_price_source           IN         temporary_vendor_billings.tvb_vct_price_source%TYPE                DEFAULT NULL,
  p_tvb_vct_formats_allowed_swit   IN         temporary_vendor_billings.tvb_vct_formats_allowed_switch%TYPE      DEFAULT NULL,
  p_tvb_mah_ap_invoice_number      IN         temporary_vendor_billings.tvb_mah_ap_invoice_number%TYPE           DEFAULT NULL,
  p_tvb_mad_line_number            IN         temporary_vendor_billings.tvb_mad_line_number%TYPE                 DEFAULT NULL,
  p_tvb_vbd_original_cost          IN         temporary_vendor_billings.tvb_vbd_original_cost%TYPE               DEFAULT NULL,
  p_tvb_vbd_billed_retail          IN         temporary_vendor_billings.tvb_vbd_billed_retail%TYPE               DEFAULT NULL,
  p_tvb_vbd_requested_quantity     IN         temporary_vendor_billings.tvb_vbd_requested_quantity%TYPE          DEFAULT NULL,
  p_tvb_vbd_requested_weight       IN         temporary_vendor_billings.tvb_vbd_requested_weight%TYPE            DEFAULT NULL,
  p_tvb_vbd_surcharge              IN         temporary_vendor_billings.tvb_vbd_surcharge%TYPE                   DEFAULT NULL,
  p_tvb_use_code                   IN         temporary_vendor_billings.tvb_use_code%TYPE                        DEFAULT NULL,
  p_tvb_creation_date              IN         temporary_vendor_billings.tvb_creation_date%TYPE                   DEFAULT NULL,
  p_tvb_prf_price                  IN         temporary_vendor_billings.tvb_prf_price%TYPE                       DEFAULT NULL,
  p_tvb_prf_tobacco_tax            IN         temporary_vendor_billings.tvb_prf_tobacco_tax%TYPE                 DEFAULT NULL,
  p_tvb_vbh_id                     IN         temporary_vendor_billings.tvb_vbh_id%TYPE                          DEFAULT NULL,
  p_tvb_line_commited              IN         temporary_vendor_billings.tvb_line_commited%TYPE                   DEFAULT NULL,
  p_tvb_prf_whz_code               IN         temporary_vendor_billings.tvb_prf_whz_code%TYPE                    DEFAULT NULL,
  p_tvb_vbd_message                IN         temporary_vendor_billings.tvb_vbd_message%TYPE                     DEFAULT NULL,
  p_tvb_whs_code                   IN         temporary_vendor_billings.tvb_whs_code%TYPE                        DEFAULT NULL,
  p_tvb_vbh_reference_number       IN         temporary_vendor_billings.tvb_vbh_reference_number%TYPE            DEFAULT NULL,
  p_tvb_vbh_message                IN         temporary_vendor_billings.tvb_vbh_message%TYPE                     DEFAULT NULL,
  p_tvb_vbh_order_date             IN         temporary_vendor_billings.tvb_vbh_order_date%TYPE                  DEFAULT NULL,
  p_tvb_ven_payable_code           IN         temporary_vendor_billings.tvb_ven_payable_code%TYPE                DEFAULT NULL,
  p_tvb_vbd_admin_amount           IN         temporary_vendor_billings.tvb_vbd_admin_amount%TYPE                DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY temporary_vendor_billings%ROWTYPE);

END TVB_PACK;
/