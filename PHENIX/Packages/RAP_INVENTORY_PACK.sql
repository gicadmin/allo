CREATE OR REPLACE PACKAGE phenix.RAP_INVENTORY_PACK IS

PROCEDURE DETAILED_INVENTORY_PROC(
  p_jsc_id  IN job_schedules.jsc_id%TYPE
);

END RAP_INVENTORY_PACK;
/