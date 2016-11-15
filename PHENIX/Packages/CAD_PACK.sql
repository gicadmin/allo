CREATE OR REPLACE PACKAGE phenix.CAD_PACK IS



FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  customer_adjustment_details%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_cad_id                         IN         customer_adjustment_details.cad_id%TYPE,
  p_cad_rec                        OUT NOCOPY customer_adjustment_details%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_cad_id                         IN         customer_adjustment_details.cad_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_cad_id                         IN         customer_adjustment_details.cad_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_cad_id                         IN         customer_adjustment_details.cad_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_cad_id                         IN         customer_adjustment_details.cad_id%TYPE);


FUNCTION INSERT_FUNC(
  p_cad_cah_id                     IN         customer_adjustment_details.cad_cah_id%TYPE,
  p_cad_line_number                IN         customer_adjustment_details.cad_line_number%TYPE,
  p_cad_prf_prd_code               IN         customer_adjustment_details.cad_prf_prd_code%TYPE,
  p_cad_prf_fmt_code               IN         customer_adjustment_details.cad_prf_fmt_code%TYPE,
  p_cad_crt_code                   IN         customer_adjustment_details.cad_crt_code%TYPE,
  p_cad_adjusted_retail            IN         customer_adjustment_details.cad_adjusted_retail%TYPE,
  p_cad_approved_switch            IN         customer_adjustment_details.cad_approved_switch%TYPE,
  p_cad_cost_price                 IN         customer_adjustment_details.cad_cost_price%TYPE,
  p_cad_debit_switch               IN         customer_adjustment_details.cad_debit_switch%TYPE,
  p_cad_federal_tax_rate           IN         customer_adjustment_details.cad_federal_tax_rate%TYPE,
  p_cad_invoice_cost               IN         customer_adjustment_details.cad_invoice_cost%TYPE,
  p_cad_original_price             IN         customer_adjustment_details.cad_original_price%TYPE,
  p_cad_provincial_tax_rate        IN         customer_adjustment_details.cad_provincial_tax_rate%TYPE,
  p_cad_service_charge             IN         customer_adjustment_details.cad_service_charge%TYPE,
  p_cad_tobacco_tax                IN         customer_adjustment_details.cad_tobacco_tax%TYPE,
  p_cad_average_cost_1             IN         customer_adjustment_details.cad_average_cost_1%TYPE,
  p_cad_average_cost_2             IN         customer_adjustment_details.cad_average_cost_2%TYPE,
  p_cad_average_cost_3             IN         customer_adjustment_details.cad_average_cost_3%TYPE,
  p_cad_average_cost_4             IN         customer_adjustment_details.cad_average_cost_4%TYPE,
  p_cad_average_list               IN         customer_adjustment_details.cad_average_list%TYPE,
  p_cad_avg_real_cost_1            IN         customer_adjustment_details.cad_avg_real_cost_1%TYPE,
  p_cad_avg_real_cost_2            IN         customer_adjustment_details.cad_avg_real_cost_2%TYPE,
  p_cad_avg_real_cost_3            IN         customer_adjustment_details.cad_avg_real_cost_3%TYPE,
  p_cad_avg_real_cost_4            IN         customer_adjustment_details.cad_avg_real_cost_4%TYPE,
  p_cad_avg_real_list              IN         customer_adjustment_details.cad_avg_real_list%TYPE,
  p_cad_whs_picking_code           IN         customer_adjustment_details.cad_whs_picking_code%TYPE,
  p_cad_replacement_list           IN         customer_adjustment_details.cad_replacement_list%TYPE,
  p_cad_replacement_cost_1         IN         customer_adjustment_details.cad_replacement_cost_1%TYPE,
  p_cad_replacement_cost_2         IN         customer_adjustment_details.cad_replacement_cost_2%TYPE,
  p_cad_replacement_cost_3         IN         customer_adjustment_details.cad_replacement_cost_3%TYPE,
  p_cad_replacement_cost_4         IN         customer_adjustment_details.cad_replacement_cost_4%TYPE,
  p_cad_inh_id                     IN         customer_adjustment_details.cad_inh_id%TYPE                          DEFAULT NULL,
  p_cad_cot_cod_coh_id             IN         customer_adjustment_details.cad_cot_cod_coh_id%TYPE                  DEFAULT NULL,
  p_cad_cot_cod_line_number        IN         customer_adjustment_details.cad_cot_cod_line_number%TYPE             DEFAULT NULL,
  p_cad_cot_line_number            IN         customer_adjustment_details.cad_cot_line_number%TYPE                 DEFAULT NULL,
  p_cad_adjusted_quantity          IN         customer_adjustment_details.cad_adjusted_quantity%TYPE               DEFAULT NULL,
  p_cad_adjusted_weight            IN         customer_adjustment_details.cad_adjusted_weight%TYPE                 DEFAULT NULL,
  p_cad_message                    IN         customer_adjustment_details.cad_message%TYPE                         DEFAULT NULL,
  p_cad_rma_quantity               IN         customer_adjustment_details.cad_rma_quantity%TYPE                    DEFAULT NULL,
  p_cad_rma_weight                 IN         customer_adjustment_details.cad_rma_weight%TYPE                      DEFAULT NULL,
  p_cad_number_of_cigars           IN         customer_adjustment_details.cad_number_of_cigars%TYPE                DEFAULT NULL,
  p_cad_selling_before_tobacco_t   IN         customer_adjustment_details.cad_selling_before_tobacco_tax%TYPE      DEFAULT NULL,
  p_cad_before_tob_tax_incl_fed_   IN         customer_adjustment_details.cad_before_tob_tax_incl_fed_tx%TYPE      DEFAULT NULL,
  p_cad_selling_bf_tob_per_cigar   IN         customer_adjustment_details.cad_selling_bf_tob_per_cigar%TYPE        DEFAULT NULL,
  p_cad_taxable_amount_per_cigar   IN         customer_adjustment_details.cad_taxable_amount_per_cigar%TYPE        DEFAULT NULL,
  p_cad_tobacco_tax_per_cigar      IN         customer_adjustment_details.cad_tobacco_tax_per_cigar%TYPE           DEFAULT NULL,
  p_cad_tobacco_markup_rate        IN         customer_adjustment_details.cad_tobacco_markup_rate%TYPE             DEFAULT NULL,
  p_cad_tobacco_tax_rate           IN         customer_adjustment_details.cad_tobacco_tax_rate%TYPE                DEFAULT NULL,
  p_cad_exact_weight_switch        IN         customer_adjustment_details.cad_exact_weight_switch%TYPE             DEFAULT 0 ,
  p_cad_receipt_required_switch    IN         customer_adjustment_details.cad_receipt_required_switch%TYPE         DEFAULT 0 ,
  p_cad_credit_prebook_switch      IN         customer_adjustment_details.cad_credit_prebook_switch%TYPE           DEFAULT 0 ,
  p_cad_surcharge_discount         IN         customer_adjustment_details.cad_surcharge_discount%TYPE              DEFAULT 0 ,
  p_cad_invoiced_ext_price         IN         customer_adjustment_details.cad_invoiced_ext_price%TYPE              DEFAULT 0 ,
  p_cad_invoiced_ext_surcharge     IN         customer_adjustment_details.cad_invoiced_ext_surcharge%TYPE          DEFAULT 0 ,
  p_cad_royalty_amount             IN         customer_adjustment_details.cad_royalty_amount%TYPE                  DEFAULT 0 )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY customer_adjustment_details%ROWTYPE)
RETURN NUMBER;


END CAD_PACK;
/