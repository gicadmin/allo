CREATE OR REPLACE PACKAGE phenix.DGT_OPERATION_PACK AS


PROCEDURE COPY_GRID_PROC(
  p_jsc_id   IN job_schedules.jsc_id%TYPE
);


END DGT_OPERATION_PACK;
/