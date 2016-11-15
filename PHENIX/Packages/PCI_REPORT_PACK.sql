CREATE OR REPLACE PACKAGE phenix.PCI_REPORT_PACK IS

--
-- Génération du rapport effectuée par la tâche Oracle
--
PROCEDURE GENERATE_PROC(
  p_jsc_id           IN job_schedules.jsc_id%TYPE,
  p_from_directory   IN VARCHAR2,
  p_to_directory     IN VARCHAR2,
  p_output_file_name IN VARCHAR2,
  p_ftp_server_name  IN VARCHAR2,
  p_ftp_port         IN NUMBER,
  p_ftp_user         IN VARCHAR2,
  p_ftp_password     IN VARCHAR2,
  p_lang_code        IN VARCHAR2
);

--
-- Nouveau PCI (v5)
--
PROCEDURE GENERATE_PROC(
  p_report_url       IN VARCHAR2,
  p_from_directory   IN VARCHAR2,
  p_to_directory     IN VARCHAR2,
  p_output_file_name IN VARCHAR2,
  p_ftp_server_name  IN VARCHAR2,
  p_ftp_port         IN NUMBER,
  p_ftp_user         IN VARCHAR2,
  p_ftp_password     IN VARCHAR2,
  p_lang_code        IN VARCHAR2 DEFAULT 'FR'
);

--
-- PCI actuel
--
PROCEDURE GENERATE_PROC(
  p_report_url       IN VARCHAR2,
  p_ftp_directory    IN VARCHAR2,
  p_output_file_name IN VARCHAR2,
  p_lang_code        IN VARCHAR2 DEFAULT 'FR'
);

END PCI_REPORT_PACK;
/