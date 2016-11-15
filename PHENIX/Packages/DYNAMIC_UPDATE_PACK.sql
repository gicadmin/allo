CREATE OR REPLACE PACKAGE phenix.DYNAMIC_UPDATE_PACK AS

PROCEDURE UPDATE_PROC(
  p_table_name    IN VARCHAR2,
  p_table_alias   IN VARCHAR2 DEFAULT NULL,
  p_file_name     IN VARCHAR2 DEFAULT NULL,
  p_file_name_out IN VARCHAR2 DEFAULT NULL,
  p_format_date   IN VARCHAR2 DEFAULT 'YYYY-MM-DD',
  p_separator     IN VARCHAR2 DEFAULT ';',
  p_mode          IN VARCHAR2 DEFAULT 'UPDATE',
  p_disable_key   IN BOOLEAN  DEFAULT TRUE
);

PROCEDURE UPDATE_PROC(
  p_constraint_name IN VARCHAR2,
  p_file_name       IN VARCHAR2 DEFAULT NULL,
  p_file_name_out   IN VARCHAR2 DEFAULT NULL,
  p_format_date     IN VARCHAR2 DEFAULT 'YYYY-MM-DD',
  p_separator       IN VARCHAR2 DEFAULT ';',
  p_mode            IN VARCHAR2 DEFAULT 'UPDATE',
  p_disable_key     IN BOOLEAN  DEFAULT TRUE
);

PROCEDURE REACTIVATE_KEY_PROC(
  p_table_name  IN VARCHAR2,
  p_table_alias IN VARCHAR2 DEFAULT NULL,
  p_separator   IN VARCHAR2 DEFAULT ';'
);

END DYNAMIC_UPDATE_PACK;
/