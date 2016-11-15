CREATE OR REPLACE PACKAGE phenix.EDI_NI_TRANSFORM_PACK IS

PROCEDURE TRANSFORM_PROC(
  p_log_id         IN NUMBER,
  p_path_and_name  IN VARCHAR2
);
PROCEDURE PRINT_RAP_RBH_REJECTS_PROC(
  p_cus_code    IN customer_email_transactions.cmt_cus_code%TYPE,
  p_session_id  IN VARCHAR2
);

END EDI_NI_TRANSFORM_PACK;
/