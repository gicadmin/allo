CREATE OR REPLACE PACKAGE phenix.CSD_OPERATION_PACK IS
PROCEDURE COPY_PROC(
  p_from_sch_code          IN customer_schedules.csd_sch_code%TYPE,
  p_to_sch_code            IN customer_schedules.csd_sch_code%TYPE,
  p_delete_current_record  IN NUMBER
);

PROCEDURE RESET_CUSTOMER_SCHEDULE_PROC(
  p_date       IN DATE,
  p_nb_reset   OUT NUMBER
);

END CSD_OPERATION_PACK;
/