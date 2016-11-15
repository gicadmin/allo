CREATE OR REPLACE PACKAGE phenix.SRTH_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
  p_nb_days_to_keep  IN  NUMBER,
  p_max_items        IN  NUMBER
);

FUNCTION APPLY_PAYMENTS_TO_INVOICE_FUNC(
  p_srth_type      IN sales_register_trans_headers.srth_type%TYPE,
  p_srth_amount    IN sales_register_trans_headers.srth_amount%TYPE,
  p_srth_use_code  IN sales_register_trans_headers.srth_use_code%TYPE,
  p_srth_whs_code  IN sales_register_trans_headers.srth_whs_code%TYPE,
  p_srth_cre_code  IN sales_register_trans_headers.srth_cre_code%TYPE,
  p_srth_inh_id    IN sales_register_trans_headers.srth_inh_id%TYPE,
  p_srth_srth_id   IN sales_register_trans_headers.srth_srth_id%TYPE
)
RETURN NUMBER;

PROCEDURE PRINT_INVOICE_PAYMENTS_PROC(
  p_srth_srth_id  IN sales_register_trans_headers.srth_srth_id%TYPE,
  p_srth_cre_code IN sales_register_trans_headers.srth_cre_code%TYPE,
  p_srth_use_code IN sales_register_trans_headers.srth_use_code%TYPE,
  p_srth_whs_code IN sales_register_trans_headers.srth_whs_code%TYPE,
  p_language      IN VARCHAR2
);

PROCEDURE SUBMIT_INVOICE_PAYMENTS_PROC(
  p_srth_srth_id  IN sales_register_trans_headers.srth_srth_id%TYPE,
  p_srth_cre_code IN sales_register_trans_headers.srth_cre_code%TYPE,
  p_srth_use_code IN sales_register_trans_headers.srth_use_code%TYPE,
  p_srth_whs_code IN sales_register_trans_headers.srth_whs_code%TYPE,
  p_language      IN VARCHAR2
);

PROCEDURE CREATE_REFUND_PROC(
  p_srth_cre_code IN sales_register_trans_headers.srth_cre_code%TYPE,
  p_srth_use_code IN sales_register_trans_headers.srth_use_code%TYPE,
  p_srth_whs_code IN sales_register_trans_headers.srth_whs_code%TYPE,
  p_language      IN VARCHAR2
);

PROCEDURE CREATE_SALE_PROC(
  p_srth_amount   IN sales_register_trans_headers.srth_amount%TYPE,
  p_srth_inh_id   IN sales_register_trans_headers.srth_inh_id%TYPE,
  p_srth_cre_code IN sales_register_trans_headers.srth_cre_code%TYPE,
  p_srth_use_code IN sales_register_trans_headers.srth_use_code%TYPE,
  p_srth_whs_code IN sales_register_trans_headers.srth_whs_code%TYPE,
  p_language      IN VARCHAR2
);

PROCEDURE LAST_PAYMENT_PROC(
  p_srth_id       IN sales_register_trans_headers.srth_id%TYPE,
  p_srth_srth_id  IN sales_register_trans_headers.srth_srth_id%TYPE,
  p_srth_cre_code IN sales_register_trans_headers.srth_cre_code%TYPE,
  p_srth_use_code IN sales_register_trans_headers.srth_use_code%TYPE,
  p_srth_whs_code IN sales_register_trans_headers.srth_whs_code%TYPE,
  p_language      IN VARCHAR2
);

PROCEDURE PRINT_CASH_DRAWER_PROC(
  p_srth_id       IN sales_register_trans_headers.srth_id%TYPE,
  p_srth_cre_code IN sales_register_trans_headers.srth_cre_code%TYPE,
  p_srth_use_code IN sales_register_trans_headers.srth_use_code%TYPE,
  p_srth_whs_code IN sales_register_trans_headers.srth_whs_code%TYPE,
  p_language      IN VARCHAR2,
  p_nbr_copies    IN NUMBER   DEFAULT 1,
  p_trans_type    IN VARCHAR2 DEFAULT NULL
);

PROCEDURE OPEN_CASH_DRAWER_PROC(
  p_srth_id       IN sales_register_trans_headers.srth_id%TYPE,
  p_srth_cre_code IN sales_register_trans_headers.srth_cre_code%TYPE,
  p_srth_use_code IN sales_register_trans_headers.srth_use_code%TYPE,
  p_srth_whs_code IN sales_register_trans_headers.srth_whs_code%TYPE,
  p_language      IN VARCHAR2,
  p_nbr_copies    IN NUMBER   DEFAULT 1,
  p_trans_type    IN VARCHAR2 DEFAULT NULL
);

END SRTH_OPERATION_PACK;
/