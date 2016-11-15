CREATE OR REPLACE PACKAGE phenix.TPT_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
  p_tpt_prf_prd_code IN temporary_placement_table.tpt_prf_prd_code%TYPE,
  p_tpt_prf_fmt_code IN temporary_placement_table.tpt_prf_fmt_code%TYPE
);

END TPT_OPERATION_PACK;
/