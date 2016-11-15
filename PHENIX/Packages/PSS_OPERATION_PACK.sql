CREATE OR REPLACE PACKAGE phenix.PSS_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
  p_pss_prd_code IN product_stats_summaries.pss_prd_code%TYPE
);

END PSS_OPERATION_PACK;
/