CREATE OR REPLACE PACKAGE phenix.TBO_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
  p_tbo_cus_code IN tote_box_transactions.tbo_cus_code%TYPE
);

END TBO_OPERATION_PACK;
/