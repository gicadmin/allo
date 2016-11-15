CREATE OR REPLACE PACKAGE phenix.EDI_NI_EXTRACT_PACK IS

FUNCTION PROCESS_810_NI_FILE_FUNC(
  p_file_in           IN UTL_FILE.FILE_TYPE,
  p_log_id            IN NUMBER,
  p_loop_file         IN NUMBER,
  p_path_and_name     IN VARCHAR2,
  p_bckpath_and_name  IN VARCHAR2,
  p_file_type         IN VARCHAR2
)
RETURN BOOLEAN;

END EDI_NI_EXTRACT_PACK;
/