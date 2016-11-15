CREATE OR REPLACE PACKAGE phenix.RTD_OPERATION_PACK IS

PROCEDURE SET_USED_PROC(
  p_rowid IN ROWID
);

PROCEDURE SET_ALL_USED_PROC(
  p_rtd_prf_prd_code  IN receipt_transaction_details.rtd_prf_prd_code%TYPE,
  p_rtd_prf_fmt_code  IN receipt_transaction_details.rtd_prf_fmt_code%TYPE,
  p_rtd_loc_code      IN receipt_transaction_details.rtd_loc_code%TYPE
);

END RTD_OPERATION_PACK;
/