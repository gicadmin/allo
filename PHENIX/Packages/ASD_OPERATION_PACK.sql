CREATE OR REPLACE PACKAGE phenix.ASD_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
  p_asd_ash_id IN account_statement_details.asd_ash_id%TYPE
);

END ASD_OPERATION_PACK;
/