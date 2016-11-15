CREATE OR REPLACE PACKAGE phenix.CAD_OPERATION_PACK IS


FUNCTION CALC_CREDITED_AND_RMA_QTY_FUNC(
  p_cus_code             IN NUMBER,
  p_cot_cod_coh_id       IN NUMBER,
  p_cot_cod_line_number  IN NUMBER,
  p_cot_line_number      IN NUMBER,
  p_prd_definition       IN VARCHAR2,
  p_prf_fmt_code         IN VARCHAR2
)
RETURN NUMBER;

FUNCTION CALC_CREDIT_AND_RMA_WGHT_FUNC(
  p_cus_code             IN NUMBER,
  p_cot_cod_coh_id       IN NUMBER,
  p_cot_cod_line_number  IN NUMBER,
  p_cot_line_number      IN NUMBER,
  p_prd_definition       IN VARCHAR2
)
RETURN NUMBER;

PROCEDURE PURGE_PROC(
  p_inh_id  IN invoice_headers.inh_id%type
);

PROCEDURE PURGE_PROC(
  p_cah_id  IN customer_adjustment_headers.cah_id%type
);


FUNCTION DOES_CAD_EXISTS_FOR_CRT_FUNC(
  p_crt_code IN credit_types.crt_code%TYPE
)
RETURN NUMBER;

FUNCTION ARE_THERE_OPENED_CAD_CRT_FUNC(
   p_cad_crt_code IN customer_adjustment_details.cad_crt_code%TYPE
)
RETURN NUMBER;

FUNCTION ARE_THERE_OPENED_CAD_CUS_FUNC (
  p_cus_code  IN customer_adjustment_headers.cah_cus_code%TYPE
)
RETURN NUMBER;

FUNCTION IS_THERE_OPEN_CAD_FOR_PRD_FUNC(
  p_prd_code IN customer_adjustment_details.cad_prf_prd_code%TYPE
)
RETURN BOOLEAN;

PROCEDURE SWITCH_TO_INV_QTY_WEIGHT_PROC (
  p_format_du_produit     IN products.prd_definition%TYPE ,
  p_cod_prf_prd_code      IN customer_order_details.cod_prf_prd_code%TYPE ,
  p_cod_prf_fmt_code      IN customer_order_details.cod_prf_fmt_code%TYPE ,
  p_cot_invoice_quantity  IN customer_order_transactions.cot_invoice_quantity%TYPE,
  p_cot_invoice_weight    IN customer_order_transactions.cot_invoice_weight%TYPE,
  p_cod_selling_retail    IN customer_order_details.cod_selling_retail%TYPE,
  p_cod_cost_price        IN customer_order_details.cod_cost_price%TYPE,
  p_new_sale              OUT NUMBER,
  p_new_cost              OUT NUMBER,
  p_invent_qty            OUT NUMBER,
  p_invent_wght           OUT NUMBER
);

PROCEDURE INSERT_CAD_PROC (
  p_inh_id                        IN NUMBER,
  p_cah_id                        IN NUMBER,
  p_cot_invoice_line              IN NUMBER,
  p_cod_prf_prd_code              IN VARCHAR2,
  p_cod_prf_fmt_code              IN VARCHAR2,
  p_cod_selling_retail            IN NUMBER,
  p_cod_base_selling_cost         IN NUMBER,
  p_cod_federal_tax_rate          IN NUMBER,
  p_cod_cost_price                IN NUMBER,
  p_cod_original_retail           IN NUMBER,
  p_cod_provincial_tax_rate       IN NUMBER,
  p_cot_cod_coh_id                IN NUMBER,
  p_cot_cod_line_number           IN NUMBER,
  p_cot_line_number               IN NUMBER,
  p_cod_tobacco_tax               IN NUMBER,
  p_cot_invoice_quantity          IN NUMBER,
  p_cot_invoice_weight            IN NUMBER,
  p_cod_pricing_source            IN VARCHAR2,
  p_cod_pty_code                  IN NUMBER,
  p_cad_average_cost_1            IN NUMBER,
  p_cad_average_cost_2            IN NUMBER,
  p_cad_average_cost_3            IN NUMBER,
  p_cad_average_cost_4            IN NUMBER,
  p_cad_average_list              IN NUMBER,
  p_cad_avg_real_cost_1           IN NUMBER,
  p_cad_avg_real_cost_2           IN NUMBER,
  p_cad_avg_real_cost_3           IN NUMBER,
  p_cad_avg_real_cost_4           IN NUMBER,
  p_cad_avg_real_list             IN NUMBER,
  p_prd_definition                IN VARCHAR2,
  p_cod_number_of_cigars          IN NUMBER,
  p_selling_before_tobacco_tax    IN NUMBER,
  p_before_tob_tax_incl_fed_tx    IN NUMBER,
  p_selling_bf_tob_per_cigar      IN NUMBER,
  p_cod_taxable_amount_per_cigar  IN NUMBER,
  p_cod_tobacco_tax_per_cigar     IN NUMBER,
  p_cod_tobacco_markup_rate       IN NUMBER,
  p_cod_tobacco_tax_rate          IN NUMBER,
  p_cad_credit_prebook_switch     IN NUMBER,
  p_cod_whs_picking_code          IN VARCHAR2,
  p_cah_whs_delivery_code         IN VARCHAR2,
  p_cod_royalty_amount            IN NUMBER,
  p_cod_invoiced_ext_price        IN NUMBER,
  p_crt_service_charge_switch     IN credit_types.crt_wms_interface_flag%TYPE,
  p_crt_wms_interface_flag        IN credit_types.crt_wms_interface_flag%TYPE,
  p_ctr_credit_retain_percentage  IN control.ctr_credit_retain_percent%TYPE,
  p_credit_reason                 IN customer_adjustment_details.cad_crt_code%TYPE,
  p_crt_apply_consignment_switch  IN credit_types.crt_apply_consignments_switch%TYPE,
  p_crt_inv_switch                IN NUMBER
);

PROCEDURE UPDATE_CAD_INH_ID_PROC(
  p_cad_inh_id  IN customer_adjustment_details.cad_inh_id%TYPE,
  p_cad_cah_id  IN customer_adjustment_details.cad_cah_id%TYPE
);

PROCEDURE CALCULATE_LINE_PROC(
  p_sale_to_invoice         IN NUMBER,
  p_surcharge_to_invoice    IN NUMBER,
  p_federal_tax_rate        IN NUMBER,
  p_provincial_tax_rate     IN NUMBER,
  p_compounded_tax_switch   IN NUMBER,
  p_invoiced_ext_price      OUT NUMBER,
  p_invoiced_ext_surcharge  OUT NUMBER,
  p_federal_tax_amount      OUT NUMBER,
  p_provincial_tax_amount   OUT NUMBER
);

END CAD_OPERATION_PACK;
/