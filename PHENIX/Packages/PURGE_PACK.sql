CREATE OR REPLACE PACKAGE phenix.PURGE_PACK IS

FUNCTION GET_SHORT_NAME RETURN VARCHAR2;

PROCEDURE PURGE_PROC(
  p_jsc_id IN JOB_SCHEDULES.JSC_ID%TYPE
);

END PURGE_PACK;
/