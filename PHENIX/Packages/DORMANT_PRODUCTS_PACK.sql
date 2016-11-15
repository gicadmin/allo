CREATE OR REPLACE PACKAGE phenix.DORMANT_PRODUCTS_PACK IS
PROCEDURE EXTRACT_DORMANT_PRODUCTS_PROC(
  p_jsc_id   IN job_schedules.jsc_id%TYPE
);
PROCEDURE GENERATE_INFO_PROC (
  p_mail        IN OUT MAIL_PACK.T_MAIL_INFORMATION,
  p_whs_code    IN VARCHAR2,
  p_nb_semaine  IN NUMBER,
  p_de_manuf    IN NUMBER,
  p_a_manuf     IN NUMBER,
  p_de_prd_pgr  IN NUMBER,
  p_a_prd_pgr   IN NUMBER,
  p_acheteur    IN NUMBER,
  p_file_out    IN VARCHAR2,
  p_language    IN VARCHAR2 DEFAULT 'FR'
);

END DORMANT_PRODUCTS_PACK;
/