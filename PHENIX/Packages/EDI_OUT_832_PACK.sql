CREATE OR REPLACE PACKAGE phenix.EDI_OUT_832_PACK AS

PROCEDURE GENERATE_EDI_832_JOB_PROC(
  p_jsc_id IN job_schedules.jsc_id%TYPE
  ) ;
PROCEDURE GENERATE_EDI_832_PROC(
  p_cus_code        IN customers.cus_code%TYPE,
  p_quotation_type  IN customers.cus_qty_code%TYPE
  );
END EDI_OUT_832_PACK;
/