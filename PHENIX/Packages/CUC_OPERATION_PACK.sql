CREATE OR REPLACE PACKAGE phenix.CUC_OPERATION_PACK IS

PROCEDURE RESET_MAIL_PROC(
  p_coh_id   IN NUMBER,
  p_cus_code IN NUMBER,
  p_language IN VARCHAR2 DEFAULT 'F'
);

PROCEDURE ADD_ONE_CUS_CUC(
  p_cuc_cus_code      IN  customer_couriers.cuc_cus_code%TYPE,
  p_cuc_prf_prd_code  IN  customer_couriers.cuc_prf_prd_code%TYPE
);

PROCEDURE PURGE_PROC(
  p_cuc_prf_prd_code IN customer_couriers.cuc_prf_prd_code%TYPE,
  p_cuc_prf_fmt_code IN customer_couriers.cuc_prf_fmt_code%TYPE
);

END CUC_OPERATION_PACK;
/