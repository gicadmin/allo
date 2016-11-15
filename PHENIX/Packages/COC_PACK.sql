CREATE OR REPLACE PACKAGE phenix.COC_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  customer_order_consignments%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_coc_cot_cod_coh_id             IN         customer_order_consignments.coc_cot_cod_coh_id%TYPE,
  p_coc_cot_cod_line_number        IN         customer_order_consignments.coc_cot_cod_line_number%TYPE,
  p_coc_cot_line_number            IN         customer_order_consignments.coc_cot_line_number%TYPE,
  p_coc_sequence                   IN         customer_order_consignments.coc_sequence%TYPE,
  p_coc_rec                        OUT NOCOPY customer_order_consignments%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_coc_cot_cod_coh_id             IN         customer_order_consignments.coc_cot_cod_coh_id%TYPE,
  p_coc_cot_cod_line_number        IN         customer_order_consignments.coc_cot_cod_line_number%TYPE,
  p_coc_cot_line_number            IN         customer_order_consignments.coc_cot_line_number%TYPE,
  p_coc_sequence                   IN         customer_order_consignments.coc_sequence%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_coc_cot_cod_coh_id             IN         customer_order_consignments.coc_cot_cod_coh_id%TYPE,
  p_coc_cot_cod_line_number        IN         customer_order_consignments.coc_cot_cod_line_number%TYPE,
  p_coc_cot_line_number            IN         customer_order_consignments.coc_cot_line_number%TYPE,
  p_coc_sequence                   IN         customer_order_consignments.coc_sequence%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_coc_cot_cod_coh_id             IN         customer_order_consignments.coc_cot_cod_coh_id%TYPE,
  p_coc_cot_cod_line_number        IN         customer_order_consignments.coc_cot_cod_line_number%TYPE,
  p_coc_cot_line_number            IN         customer_order_consignments.coc_cot_line_number%TYPE,
  p_coc_sequence                   IN         customer_order_consignments.coc_sequence%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_coc_cot_cod_coh_id             IN         customer_order_consignments.coc_cot_cod_coh_id%TYPE,
  p_coc_cot_cod_line_number        IN         customer_order_consignments.coc_cot_cod_line_number%TYPE,
  p_coc_cot_line_number            IN         customer_order_consignments.coc_cot_line_number%TYPE,
  p_coc_sequence                   IN         customer_order_consignments.coc_sequence%TYPE);


PROCEDURE INSERT_PROC(
  p_coc_cot_cod_coh_id      IN         customer_order_consignments.coc_cot_cod_coh_id%TYPE,
  p_coc_cot_cod_line_number IN         customer_order_consignments.coc_cot_cod_line_number%TYPE,
  p_coc_cot_line_number     IN         customer_order_consignments.coc_cot_line_number%TYPE,
  p_coc_sequence            IN         customer_order_consignments.coc_sequence%TYPE,
  p_coc_prf_prd_code        IN         customer_order_consignments.coc_prf_prd_code%TYPE,
  p_coc_prf_fmt_code        IN         customer_order_consignments.coc_prf_fmt_code%TYPE,
  p_coc_cost_price          IN         customer_order_consignments.coc_cost_price%TYPE,
  p_coc_quantity            IN         customer_order_consignments.coc_quantity%TYPE,
  p_coc_selling_price       IN         customer_order_consignments.coc_selling_price%TYPE,
  p_coc_federal_tax_rate    IN         customer_order_consignments.coc_federal_tax_rate%TYPE         DEFAULT 0 ,
  p_coc_provincial_tax_rate IN         customer_order_consignments.coc_provincial_tax_rate%TYPE      DEFAULT 0 ,
  p_coc_invoiced_ext_price  IN         customer_order_consignments.coc_invoiced_ext_price%TYPE       DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY customer_order_consignments%ROWTYPE);

END COC_PACK;
/