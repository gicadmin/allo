CREATE OR REPLACE PACKAGE phenix.ICT_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
  p_max_items        IN NUMBER
);

PROCEDURE SET_USED_PROC(
  p_rowid IN rowid
);

PROCEDURE SET_ALL_USED_PROC(
  p_ict_prf_prd_code IN inventory_count_transactions.ict_prf_prd_code%TYPE,
  p_ict_prf_fmt_code IN inventory_count_transactions.ict_prf_fmt_code%TYPE,
  p_ict_loc_code     IN inventory_count_transactions.ict_loc_code%TYPE
);

END ICT_OPERATION_PACK;
/