CREATE OR REPLACE PACKAGE phenix.TSS_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
  p_tss_prd_code IN temp_product_stats_summaries.tss_prd_code%TYPE
);

END TSS_OPERATION_PACK;
/