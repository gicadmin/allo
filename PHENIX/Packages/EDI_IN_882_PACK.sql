CREATE OR REPLACE PACKAGE phenix.EDI_IN_882_PACK IS

PROCEDURE PROCESS_STA_FILES_PROC(
  p_log_id IN NUMBER
) ;

PROCEDURE PROCESS_TSTA_FILES_PROC (
  p_log_id IN NUMBER
);

PROCEDURE PROCESS_SINGLE_TSTA_FILE_PROC (
	p_filename  IN VARCHAR2,
  p_log_id    IN NUMBER
);

END EDI_IN_882_PACK;
/