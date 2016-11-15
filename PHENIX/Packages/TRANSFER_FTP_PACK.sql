CREATE OR REPLACE PACKAGE phenix.TRANSFER_FTP_PACK AS

TYPE t_string_table IS TABLE OF VARCHAR2(32767);

PROCEDURE RECEIVE_FILE_PROC(
  p_elements         IN INTEGER,
  p_files_clob       IN CLOB,
  p_from_directory   IN VARCHAR2,
  p_to_directory     IN VARCHAR2,
  p_ftp_server_name  IN VARCHAR2,
  p_ftp_port         IN VARCHAR2,
  p_ftp_user         IN VARCHAR2,
  p_ftp_password     IN VARCHAR2
);

PROCEDURE SEND_FILE_PROC(
  p_file             IN VARCHAR2,
  p_from_directory   IN VARCHAR2,
  p_to_directory     IN VARCHAR2,
  p_to_file          IN VARCHAR2 DEFAULT NULL, -- Conserva le nom du fichier source
  p_ftp_server_name  IN VARCHAR2,
  p_ftp_port         IN VARCHAR2,
  p_ftp_user         IN VARCHAR2,
  p_ftp_password     IN VARCHAR2
);

END TRANSFER_FTP_PACK;
/