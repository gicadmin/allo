CREATE OR REPLACE PACKAGE phenix.COT_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
	p_inh_id                    IN INVOICE_HEADERS.INH_ID%type
);

PROCEDURE FREE_INH_PROC(
  p_inh_id                    IN INVOICE_HEADERS.INH_ID%type
);

FUNCTION EXISTS_BY_COHID_FUNC(
  p_cot_cod_coh_id   IN customer_order_transactions.cot_cod_coh_id%TYPE
)RETURN BOOLEAN;

FUNCTION SUM_INVOICED_QTY_FUNC(
  p_cot_cod_coh_id       IN NUMBER,
  p_cot_cod_line_number  IN NUMBER,
  p_prd_definition       IN VARCHAR2
)
RETURN NUMBER;

FUNCTION SUM_INVOICED_WGHT_FUNC(
  p_cot_cod_coh_id       IN NUMBER,
  p_cot_cod_line_number  IN NUMBER,
  p_prd_definition       IN VARCHAR2
)
RETURN NUMBER;

FUNCTION COUNT_DIST_COD_ON_INH_FUNC(
  p_cot_inh_id IN customer_order_transactions.cot_inh_id%TYPE
)
RETURN NUMBER;

FUNCTION IS_COT_ALL_INVOICED_FUNC(
  p_cot_plh_id  IN customer_order_transactions.cot_plh_id%TYPE
)
RETURN BOOLEAN;

FUNCTION FIND_WHS_PICKING_FUNC(
  p_inh_id  IN customer_order_transactions.cot_inh_id%TYPE
)RETURN NUMBER;

PROCEDURE GET_NB_LINES_BY_INH_PROC(
  p_inh_id      IN customer_order_transactions.cot_inh_id%TYPE,
  p_count_all   OUT NUMBER,
  p_count_zero  OUT NUMBER
);

PROCEDURE GET_COT_INFO_PROC(
  p_cot_cod_coh_id           IN  customer_order_transactions.cot_cod_coh_id%TYPE,
  p_cot_cod_line_number      IN  customer_order_transactions.cot_cod_line_number%TYPE,
  p_cot_invoice_line_number  OUT customer_order_transactions.cot_invoice_line_number%TYPE,
  p_cot_line_number          OUT customer_order_transactions.cot_line_number%TYPE
);

FUNCTION EXIST_ADJUSTMENT_FUNC(
  p_cot_inh_id  IN CUSTOMER_ORDER_TRANSACTIONS.cot_inh_id%TYPE
) RETURN BOOLEAN;

FUNCTION EXIST_SPECIAL_ORDER_FUNC(
p_cot_inh_id  IN CUSTOMER_ORDER_TRANSACTIONS.cot_inh_id%TYPE
) RETURN BOOLEAN;

END COT_OPERATION_PACK;
/