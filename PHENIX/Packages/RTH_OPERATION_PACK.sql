CREATE OR REPLACE PACKAGE phenix.RTH_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
  p_rth_id  IN receipt_transaction_headers.rth_id%TYPE
);

PROCEDURE PURGE_PROC(
  p_nb_days_to_keep  IN NUMBER,
  p_max_items        IN NUMBER
);

PROCEDURE FIND_USE_INFO_PROC(
  p_rth_id   IN  receipt_transaction_headers.rth_id%TYPE,
  p_use_code OUT users.use_code%TYPE,
  p_use_name OUT VARCHAR);

END RTH_OPERATION_PACK;
/