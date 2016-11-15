CREATE OR REPLACE PACKAGE phenix.CND_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
  p_cnd_prf_prd_code IN consignment_details.cnd_prf_prd_code%TYPE,
  p_cnd_prf_fmt_code IN consignment_details.cnd_prf_fmt_code%TYPE
);

END CND_OPERATION_PACK;
/