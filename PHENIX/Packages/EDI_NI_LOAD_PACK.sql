CREATE OR REPLACE PACKAGE phenix.EDI_NI_LOAD_PACK IS

PROCEDURE LOAD_CREDIT_PROC(
  p_log_id            IN NUMBER,
  p_loop_file         IN NUMBER,
  p_path_and_name     IN VARCHAR2,
  p_bckpath_and_name  IN VARCHAR2
);

PROCEDURE LOAD_INVOICE_PROC(
  p_log_id            IN NUMBER,
  p_loop_file         IN NUMBER,
  p_path_and_name     IN VARCHAR2,
  p_bckpath_and_name  IN VARCHAR2
);

END EDI_NI_LOAD_PACK;
/