CREATE OR REPLACE PACKAGE phenix.STAT_ITWAL_PACK IS

PROCEDURE GEN_ITWAL_STATS_PROC(
  p_jsc_id IN job_schedules.jsc_id%TYPE
);

PROCEDURE EXTRACT_ITWAL_STATS_PROC(
  p_de_date           IN DATE,
  p_a_date            IN DATE,
  p_prod_or_test_flag IN VARCHAR2,
  p_adress_flag       IN VARCHAR2,
  p_pty_code_1        IN promotion_types.pty_code%TYPE,
  p_pty_code_2        IN promotion_types.pty_code%TYPE,
  p_pty_code_3        IN promotion_types.pty_code%TYPE,
  p_pty_code_4        IN promotion_types.pty_code%TYPE,
  p_error             OUT NUMBER
);
END STAT_ITWAL_PACK;
/