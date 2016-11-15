CREATE OR REPLACE PACKAGE phenix.TCR_OPERATION_PACK AS
PROCEDURE DROP_TERM_WHS_REMITTANCES_PROC(
  p_jsc_id IN job_schedules.jsc_id%TYPE
);

PROCEDURE EXTRACT_CUS_DROP_REMISE_PROC(
  p_tcr_cus_code IN temporary_customer_remittances.tcr_cus_code%TYPE
);

PROCEDURE TRANSPORT_ALLOC_REMIT_PROC(
  p_jsc_id IN job_schedules.jsc_id%TYPE
);

PROCEDURE EXTRACT_CUS_TRANS_REMISE_PROC(
  p_tcr_cus_code IN temporary_customer_remittances.tcr_cus_code%TYPE
);
END TCR_OPERATION_PACK;
/