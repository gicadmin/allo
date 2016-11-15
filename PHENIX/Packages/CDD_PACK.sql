CREATE OR REPLACE PACKAGE phenix.CDD_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  customer_drop_details%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_cdd_cds_vds_id                 IN         customer_drop_details.cdd_cds_vds_id%TYPE,
  p_cdd_cds_cus_code               IN         customer_drop_details.cdd_cds_cus_code%TYPE,
  p_cdd_cds_reference_number       IN         customer_drop_details.cdd_cds_reference_number%TYPE,
  p_cdd_line_number                IN         customer_drop_details.cdd_line_number%TYPE,
  p_cdd_rec                        OUT NOCOPY customer_drop_details%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_cdd_cds_vds_id                 IN         customer_drop_details.cdd_cds_vds_id%TYPE,
  p_cdd_cds_cus_code               IN         customer_drop_details.cdd_cds_cus_code%TYPE,
  p_cdd_cds_reference_number       IN         customer_drop_details.cdd_cds_reference_number%TYPE,
  p_cdd_line_number                IN         customer_drop_details.cdd_line_number%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_cdd_cds_vds_id                 IN         customer_drop_details.cdd_cds_vds_id%TYPE,
  p_cdd_cds_cus_code               IN         customer_drop_details.cdd_cds_cus_code%TYPE,
  p_cdd_cds_reference_number       IN         customer_drop_details.cdd_cds_reference_number%TYPE,
  p_cdd_line_number                IN         customer_drop_details.cdd_line_number%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_cdd_cds_vds_id                 IN         customer_drop_details.cdd_cds_vds_id%TYPE,
  p_cdd_cds_cus_code               IN         customer_drop_details.cdd_cds_cus_code%TYPE,
  p_cdd_cds_reference_number       IN         customer_drop_details.cdd_cds_reference_number%TYPE,
  p_cdd_line_number                IN         customer_drop_details.cdd_line_number%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_cdd_cds_vds_id                 IN         customer_drop_details.cdd_cds_vds_id%TYPE,
  p_cdd_cds_cus_code               IN         customer_drop_details.cdd_cds_cus_code%TYPE,
  p_cdd_cds_reference_number       IN         customer_drop_details.cdd_cds_reference_number%TYPE,
  p_cdd_line_number                IN         customer_drop_details.cdd_line_number%TYPE);


PROCEDURE INSERT_PROC(
  p_cdd_cds_vds_id                 IN         customer_drop_details.cdd_cds_vds_id%TYPE,
  p_cdd_cds_cus_code               IN         customer_drop_details.cdd_cds_cus_code%TYPE,
  p_cdd_cds_reference_number       IN         customer_drop_details.cdd_cds_reference_number%TYPE,
  p_cdd_line_number                IN         customer_drop_details.cdd_line_number%TYPE,
  p_cdd_prf_prd_code               IN         customer_drop_details.cdd_prf_prd_code%TYPE,
  p_cdd_prf_fmt_code               IN         customer_drop_details.cdd_prf_fmt_code%TYPE,
  p_cdd_cost_price                 IN         customer_drop_details.cdd_cost_price%TYPE,
  p_cdd_original_retail            IN         customer_drop_details.cdd_original_retail%TYPE,
  p_cdd_selling_retail             IN         customer_drop_details.cdd_selling_retail%TYPE,
  p_cdd_tobacco_tax                IN         customer_drop_details.cdd_tobacco_tax%TYPE,
  p_cdd_ap_discount_amount         IN         customer_drop_details.cdd_ap_discount_amount%TYPE,
  p_cdd_ap_federal_tax_rate        IN         customer_drop_details.cdd_ap_federal_tax_rate%TYPE,
  p_cdd_ap_provincial_tax_rate     IN         customer_drop_details.cdd_ap_provincial_tax_rate%TYPE,
  p_cdd_ar_discount_amount         IN         customer_drop_details.cdd_ar_discount_amount%TYPE,
  p_cdd_ar_federal_tax_rate        IN         customer_drop_details.cdd_ar_federal_tax_rate%TYPE,
  p_cdd_ar_provincial_tax_rate     IN         customer_drop_details.cdd_ar_provincial_tax_rate%TYPE,
  p_cdd_original_cost              IN         customer_drop_details.cdd_original_cost%TYPE,
  p_cdd_order_quantity             IN         customer_drop_details.cdd_order_quantity%TYPE                  DEFAULT NULL,
  p_cdd_order_weight               IN         customer_drop_details.cdd_order_weight%TYPE                    DEFAULT NULL,
  p_cdd_number_of_cigars           IN         customer_drop_details.cdd_number_of_cigars%TYPE                DEFAULT NULL,
  p_cdd_selling_before_tobacco_t   IN         customer_drop_details.cdd_selling_before_tobacco_tax%TYPE      DEFAULT NULL,
  p_cdd_before_tob_tax_incl_fed_   IN         customer_drop_details.cdd_before_tob_tax_incl_fed_tx%TYPE      DEFAULT NULL,
  p_cdd_selling_bf_tob_per_cigar   IN         customer_drop_details.cdd_selling_bf_tob_per_cigar%TYPE        DEFAULT NULL,
  p_cdd_taxable_amount_per_cigar   IN         customer_drop_details.cdd_taxable_amount_per_cigar%TYPE        DEFAULT NULL,
  p_cdd_tobacco_tax_per_cigar      IN         customer_drop_details.cdd_tobacco_tax_per_cigar%TYPE           DEFAULT NULL,
  p_cdd_tobacco_markup_rate        IN         customer_drop_details.cdd_tobacco_markup_rate%TYPE             DEFAULT NULL,
  p_cdd_tobacco_tax_rate           IN         customer_drop_details.cdd_tobacco_tax_rate%TYPE                DEFAULT NULL,
  p_cdd_invoiced_ext_price         IN         customer_drop_details.cdd_invoiced_ext_price%TYPE              DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY customer_drop_details%ROWTYPE);

END CDD_PACK;
/