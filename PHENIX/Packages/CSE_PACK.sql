CREATE OR REPLACE PACKAGE phenix.CSE_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  customer_stats_extract%ROWTYPE);


PROCEDURE INSERT_PROC(
  p_cse_cus_code                IN         customer_stats_extract.cse_cus_code%TYPE,
  p_cse_cus_name                IN         customer_stats_extract.cse_cus_name%TYPE,
  p_cse_cus_address             IN         customer_stats_extract.cse_cus_address%TYPE,
  p_cse_cus_city                IN         customer_stats_extract.cse_cus_city%TYPE,
  p_cse_cus_prv_resides_in_code IN         customer_stats_extract.cse_cus_prv_resides_in_code%TYPE,
  p_cse_cus_postal_code         IN         customer_stats_extract.cse_cus_postal_code%TYPE,
  p_cse_inh_type                IN         customer_stats_extract.cse_inh_type%TYPE,
  p_cse_inh_invoice_date        IN         customer_stats_extract.cse_inh_invoice_date%TYPE,
  p_cse_inh_id                  IN         customer_stats_extract.cse_inh_id%TYPE,
  p_cse_invoiced_ext_price      IN         customer_stats_extract.cse_invoiced_ext_price%TYPE,
  p_cse_cost_price              IN         customer_stats_extract.cse_cost_price%TYPE,
  p_cse_profit_amount           IN         customer_stats_extract.cse_profit_amount%TYPE,
  p_cse_invoice_line_number     IN         customer_stats_extract.cse_invoice_line_number%TYPE          DEFAULT NULL,
  p_cse_reference_number        IN         customer_stats_extract.cse_reference_number%TYPE             DEFAULT NULL,
  p_cse_prf_prd_code            IN         customer_stats_extract.cse_prf_prd_code%TYPE                 DEFAULT NULL,
  p_cse_prd_description         IN         customer_stats_extract.cse_prd_description%TYPE              DEFAULT NULL,
  p_cse_prf_fmt_code            IN         customer_stats_extract.cse_prf_fmt_code%TYPE                 DEFAULT NULL,
  p_cse_prf_description         IN         customer_stats_extract.cse_prf_description%TYPE              DEFAULT NULL,
  p_cse_ven_code                IN         customer_stats_extract.cse_ven_code%TYPE                     DEFAULT NULL,
  p_cse_ven_name                IN         customer_stats_extract.cse_ven_name%TYPE                     DEFAULT NULL,
  p_cse_brn_code                IN         customer_stats_extract.cse_brn_code%TYPE                     DEFAULT NULL,
  p_cse_brn_description         IN         customer_stats_extract.cse_brn_description%TYPE              DEFAULT NULL,
  p_cse_pgr_code                IN         customer_stats_extract.cse_pgr_code%TYPE                     DEFAULT NULL,
  p_cse_pgr_description         IN         customer_stats_extract.cse_pgr_description%TYPE              DEFAULT NULL,
  p_cse_cgr_code                IN         customer_stats_extract.cse_cgr_code%TYPE                     DEFAULT NULL,
  p_cse_cgr_description         IN         customer_stats_extract.cse_cgr_description%TYPE              DEFAULT NULL,
  p_cse_vgr_code                IN         customer_stats_extract.cse_vgr_code%TYPE                     DEFAULT NULL,
  p_cse_vgr_description         IN         customer_stats_extract.cse_vgr_description%TYPE              DEFAULT NULL,
  p_cse_dgt_code                IN         customer_stats_extract.cse_dgt_code%TYPE                     DEFAULT NULL,
  p_cse_vrg_code                IN         customer_stats_extract.cse_vrg_code%TYPE                     DEFAULT NULL,
  p_cse_trt_code                IN         customer_stats_extract.cse_trt_code%TYPE                     DEFAULT NULL,
  p_cse_trt_description         IN         customer_stats_extract.cse_trt_description%TYPE              DEFAULT NULL,
  p_cse_invoice_quantity        IN         customer_stats_extract.cse_invoice_quantity%TYPE             DEFAULT NULL,
  p_cse_invoice_weight          IN         customer_stats_extract.cse_invoice_weight%TYPE               DEFAULT NULL,
  p_cse_selling_format_price    IN         customer_stats_extract.cse_selling_format_price%TYPE         DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY customer_stats_extract%ROWTYPE);

END CSE_PACK;
/