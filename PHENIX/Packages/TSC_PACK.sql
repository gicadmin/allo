CREATE OR REPLACE PACKAGE phenix.TSC_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  temporary_shorted_cods%ROWTYPE);


PROCEDURE INSERT_PROC(
  p_tsc_coh_cus_code               IN         temporary_shorted_cods.tsc_coh_cus_code%TYPE                    DEFAULT NULL,
  p_tsc_coh_id                     IN         temporary_shorted_cods.tsc_coh_id%TYPE                          DEFAULT NULL,
  p_tsc_cod_line_number            IN         temporary_shorted_cods.tsc_cod_line_number%TYPE                 DEFAULT NULL,
  p_tsc_cod_prf_prd_code           IN         temporary_shorted_cods.tsc_cod_prf_prd_code%TYPE                DEFAULT NULL,
  p_tsc_cod_prf_fmt_code           IN         temporary_shorted_cods.tsc_cod_prf_fmt_code%TYPE                DEFAULT NULL,
  p_tsc_cod_selling_retail         IN         temporary_shorted_cods.tsc_cod_selling_retail%TYPE              DEFAULT NULL,
  p_tsc_cod_pty_code               IN         temporary_shorted_cods.tsc_cod_pty_code%TYPE                    DEFAULT NULL,
  p_tsc_cod_order_quantity         IN         temporary_shorted_cods.tsc_cod_order_quantity%TYPE              DEFAULT NULL,
  p_tsc_cod_order_weight           IN         temporary_shorted_cods.tsc_cod_order_weight%TYPE                DEFAULT NULL,
  p_tsc_cod_shr_code               IN         temporary_shorted_cods.tsc_cod_shr_code%TYPE                    DEFAULT NULL,
  p_tsc_prd_definition             IN         temporary_shorted_cods.tsc_prd_definition%TYPE                  DEFAULT NULL,
  p_tsc_prd_ven_code               IN         temporary_shorted_cods.tsc_prd_ven_code%TYPE                    DEFAULT NULL,
  p_tsc_ven_name                   IN         temporary_shorted_cods.tsc_ven_name%TYPE                        DEFAULT NULL,
  p_tsc_ven_short_name             IN         temporary_shorted_cods.tsc_ven_short_name%TYPE                  DEFAULT NULL,
  p_tsc_ven_use_code               IN         temporary_shorted_cods.tsc_ven_use_code%TYPE                    DEFAULT NULL,
  p_tsc_prd_brn_code               IN         temporary_shorted_cods.tsc_prd_brn_code%TYPE                    DEFAULT NULL,
  p_tsc_prd_description            IN         temporary_shorted_cods.tsc_prd_description%TYPE                 DEFAULT NULL,
  p_tsc_prf_description            IN         temporary_shorted_cods.tsc_prf_description%TYPE                 DEFAULT NULL,
  p_tsc_prf_conversion_to_base     IN         temporary_shorted_cods.tsc_prf_conversion_to_base%TYPE          DEFAULT NULL,
  p_tsc_cot_shorted_quantity       IN         temporary_shorted_cods.tsc_cot_shorted_quantity%TYPE            DEFAULT NULL,
  p_tsc_cot_shorted_weight         IN         temporary_shorted_cods.tsc_cot_shorted_weight%TYPE              DEFAULT NULL,
  p_tsc_cot_invoice_quantity       IN         temporary_shorted_cods.tsc_cot_invoice_quantity%TYPE            DEFAULT NULL,
  p_tsc_cot_invoice_weight         IN         temporary_shorted_cods.tsc_cot_invoice_weight%TYPE              DEFAULT NULL,
  p_tsc_prd_available              IN         temporary_shorted_cods.tsc_prd_available%TYPE                   DEFAULT NULL,
  p_tsc_pod_already_ordered        IN         temporary_shorted_cods.tsc_pod_already_ordered%TYPE             DEFAULT NULL,
  p_tsc_pod_receipt_date           IN         temporary_shorted_cods.tsc_pod_receipt_date%TYPE                DEFAULT NULL,
  p_tsc_inner_weight_in_inv_fmt    IN         temporary_shorted_cods.tsc_inner_weight_in_inv_fmt%TYPE         DEFAULT NULL,
  p_tsc_prd_special_order_switch   IN         temporary_shorted_cods.tsc_prd_special_order_switch%TYPE        DEFAULT NULL,
  p_tsc_whs_code                   IN         temporary_shorted_cods.tsc_whs_code%TYPE                        DEFAULT NULL,
  p_tsc_pod_is_late_switch         IN         temporary_shorted_cods.tsc_pod_is_late_switch%TYPE              DEFAULT NULL,
  p_tsc_substitute_prd_code        IN         temporary_shorted_cods.tsc_substitute_prd_code%TYPE             DEFAULT NULL,
  p_tsc_substitute_prd_descripti   IN         temporary_shorted_cods.tsc_substitute_prd_description%TYPE      DEFAULT NULL,
  p_tsc_substitute_prf_descripti   IN         temporary_shorted_cods.tsc_substitute_prf_description%TYPE      DEFAULT NULL,
  p_tsc_substitute_brand_name      IN         temporary_shorted_cods.tsc_substitute_brand_name%TYPE           DEFAULT NULL,
  p_tsc_substitute_quantity        IN         temporary_shorted_cods.tsc_substitute_quantity%TYPE             DEFAULT NULL,
  p_tsc_substitute_weight          IN         temporary_shorted_cods.tsc_substitute_weight%TYPE               DEFAULT NULL,
  p_tsc_order_quantity             IN         temporary_shorted_cods.tsc_order_quantity%TYPE                  DEFAULT NULL,
  p_tsc_order_weight               IN         temporary_shorted_cods.tsc_order_weight%TYPE                    DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY temporary_shorted_cods%ROWTYPE);

END TSC_PACK;
/