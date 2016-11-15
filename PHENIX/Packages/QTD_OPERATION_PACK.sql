CREATE OR REPLACE PACKAGE phenix.QTD_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
  p_qtd_prf_prd_code IN quotation_details.qtd_prf_prd_code%TYPE,
  p_qtd_prf_fmt_code IN quotation_details.qtd_prf_fmt_code%TYPE
);

PROCEDURE PURGE_PROC(
  p_qtd_npf_prf_prd_code IN quotation_details.qtd_npf_prf_prd_code%TYPE,
  p_qtd_npf_prf_fmt_code IN quotation_details.qtd_npf_prf_fmt_code%TYPE
);

FUNCTION COUNT_QTD_LINE_FUNC(
  p_qth_id IN NUMBER
)
RETURN NUMBER;

FUNCTION FIND_QTD_ADMIN_METHOD_FUNC(
  p_cus_code  IN NUMBER,
  p_nac_code  IN NUMBER,
  p_qty_code  IN NUMBER
)
RETURN VARCHAR2;

FUNCTION COUNT_SAME_PRF_OTHER_QTH_FUNC(
  p_original_qth_id IN NUMBER,
  p_cus_code        IN NUMBER,
  p_naz_nac_code    IN NUMBER,
  p_naz_zone_code   IN NUMBER,
  p_qty_code        IN NUMBER,
  p_prd_code        IN VARCHAR2,
  p_fmt_code        IN VARCHAR2,
  p_date_to_check   IN DATE
)
RETURN NUMBER;

FUNCTION QUOTATION_RECALCULATION_FUNC(
  p_log_id           IN  NUMBER,
  p_nb_recalculated  OUT NUMBER,
  p_error_message    OUT NUMBER
)
RETURN BOOLEAN;

FUNCTION VALIDATE_CONTRACT_DATE_FUNC(
  p_qth_contract_start_date  IN quotation_headers.qth_contract_start_date%TYPE,
  p_qth_contract_end_date    IN quotation_headers.qth_contract_end_date%TYPE,
  p_qtd_contract_start_date  IN quotation_details.qtd_contract_start_date%TYPE,
  p_ctr_bef_contr_start_days IN control.ctr_bef_quot_contr_start_days%TYPE,
  p_ctr_aft_contr_start_days IN control.ctr_aft_quot_contr_start_days%TYPE,
  p_ctr_bef_contr_end_days   IN control.ctr_bef_quot_contr_end_days%TYPE
)
RETURN NUMBER;

FUNCTION CHECK_CONTRACT_FUNC(
  p_qtd_prf_prd_code IN quotation_details.qtd_prf_prd_code%TYPE
)
RETURN BOOLEAN;

FUNCTION CHECK_CONTRACT_FUNC(
  p_qtd_prf_prd_code IN quotation_details.qtd_prf_prd_code%TYPE,
  p_qty_whs_code     IN quotation_types.qty_whs_code%TYPE
)
RETURN BOOLEAN;

FUNCTION CHECK_QUOTATION_LINE_FUNC(
  p_cus_code         IN customers.cus_code%TYPE,
  p_qtd_prf_prd_code IN quotation_details.qtd_prf_prd_code%TYPE
)
RETURN BOOLEAN;

PROCEDURE INSERT_CUSTOMER_PRODUCT_PROC(
  p_qtd_prf_prd_code IN quotation_details.qtd_prf_prd_code%TYPE,
  p_qtd_prf_fmt_code IN quotation_details.qtd_prf_fmt_code%TYPE,
  p_xrg_code         IN xref_grids.xrg_code%TYPE,
  p_pxc_code         IN product_xref_codes.pxc_code%TYPE
);

PROCEDURE DELETE_CUSTOMER_PRODUCT_PROC(
  p_qtd_prf_prd_code IN quotation_details.qtd_prf_prd_code%TYPE,
  p_qtd_prf_fmt_code IN quotation_details.qtd_prf_fmt_code%TYPE,
  p_xrg_code         IN xref_grids.xrg_code%TYPE,
  p_old_pxc_code     IN product_xref_codes.pxc_code%TYPE,
  p_new_pxc_code     IN product_xref_codes.pxc_code%TYPE
);

PROCEDURE UPDATE_CUSTOMER_PRODUCT_PROC(
  p_qtd_qth_id                IN quotation_details.qtd_qth_id%TYPE,
  p_qtd_line_number           IN quotation_details.qtd_line_number%TYPE,
  p_qtd_prf_prd_code          IN quotation_details.qtd_prf_prd_code%TYPE,
  p_qtd_prf_fmt_code          IN quotation_details.qtd_prf_fmt_code%TYPE,
  p_qtd_customer_product_code IN quotation_details.qtd_customer_product_code%TYPE,
  p_xrg_code                  IN xref_grids.xrg_code%TYPE
);

PROCEDURE INSERT_CUSTOMER_PRODUCT_PROC(
  p_qtd_qth_id                IN quotation_details.qtd_qth_id%TYPE,
  p_qtd_line_number           IN quotation_details.qtd_line_number%TYPE,
  p_qtd_prf_prd_code          IN quotation_details.qtd_prf_prd_code%TYPE,
  p_qtd_prf_fmt_code          IN quotation_details.qtd_prf_fmt_code%TYPE,
  p_qtd_customer_product_code IN quotation_details.qtd_customer_product_code%TYPE,
  p_xrg_code                  IN xref_grids.xrg_code%TYPE
);

PROCEDURE PURGE_PROC(
  p_qtd_qth_id IN quotation_details.qtd_qth_id%TYPE
);

END QTD_OPERATION_PACK;
/