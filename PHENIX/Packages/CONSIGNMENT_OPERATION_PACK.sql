CREATE OR REPLACE PACKAGE phenix.CONSIGNMENT_OPERATION_PACK IS

PROCEDURE CREATE_CONSIGNMENT_PROC(
  p_cus_code                IN  NUMBER,   --fre2459
  p_prd_code                IN  VARCHAR2,
  p_fmt_code                IN  VARCHAR2,
  p_quantity                IN  NUMBER,
  p_type_trans              IN  VARCHAR2, --CAD pour note de crédit ou COD pour vente
  p_federal_tax_amount      OUT NUMBER,   --fre2459 la taxe fédérale totale des produits consignes liés au produit_format p_prd_code  p_fmt_code
  p_provincial_tax_amount   OUT NUMBER,   --fre2459 la taxe provinci totale des produits consignes liés au produit_format p_prd_code  p_fmt_code
  p_cad_id                  IN  NUMBER   DEFAULT NULL,
  p_cot_cod_coh_id          IN  NUMBER   DEFAULT NULL,
  p_cot_cod_line_number     IN  NUMBER   DEFAULT NULL,
  p_cot_line_number         IN  NUMBER   DEFAULT NULL,
  p_cash_or_comptoir_switch IN  NUMBER   DEFAULT 0
);

PROCEDURE SUM_COC_PER_INH_PROC(
  p_inh_id      IN customer_order_transactions.cot_inh_id%TYPE,
  p_total_cost  OUT NUMBER,
  p_total_sale  OUT NUMBER
);

PROCEDURE SUM_CAC_PER_INH_PROC(
  p_inh_id      IN customer_order_transactions.cot_inh_id%TYPE,
  p_total_cost  OUT NUMBER,
  p_total_sale  OUT NUMBER
);

FUNCTION GET_PRF_CONSIGNMENT_PRICE_FUNC(
  p_prd_code IN VARCHAR2,
  p_fmt_code IN VARCHAR2,
  p_prv_code IN VARCHAR2 --EFE70
)
RETURN NUMBER;

FUNCTION GET_PRF_CONSIGNMENT_PRICE_FUNC(
  p_prd_code              IN VARCHAR2,
  p_fmt_code              IN VARCHAR2,
  p_prv_code              IN VARCHAR2,
  p_whs_code              IN VARCHAR2,
  p_federal_tax_rate      IN NUMBER,
  p_provincial_tax_rate   IN NUMBER,
  p_compounded_tax_switch IN NUMBER,
  p_qty_weight_to_invoice IN NUMBER,
  p_sum_federal_tax       OUT NUMBER,
  p_sum_provincial_tax    OUT NUMBER
)
RETURN NUMBER;

END CONSIGNMENT_OPERATION_PACK;
/