CREATE OR REPLACE PACKAGE phenix.STAT_INTERFACE_QUASEP_PACK IS

PROCEDURE GEN_QUASEP_STATS_PROC(
  p_jsc_id IN job_schedules.jsc_id%TYPE
);

PROCEDURE EXTRACT_QUASEP_STATS_PROC(
  p_from_date     IN DATE,
  p_to_date       IN DATE,
  p_whs_code      IN warehouses.whs_code%TYPE,
  p_from_cus_code IN customers.cus_code%TYPE,
  p_to_cus_code   IN customers.cus_code%TYPE,
  p_mail          IN OUT MAIL_PACK.T_MAIL_INFORMATION, --ber6586
  p_error         OUT NUMBER --fre4210
);

END STAT_INTERFACE_QUASEP_PACK;
/