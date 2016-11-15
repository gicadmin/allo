CREATE TABLE phenix.statistics_tracking_types (
  stt_code VARCHAR2(6 BYTE) NOT NULL,
  stt_active_switch NUMBER(1) NOT NULL CONSTRAINT stt_active_switch_ck CHECK (STT_ACTIVE_SWITCH IN (0, 1)),
  stt_description VARCHAR2(30 BYTE) NOT NULL,
  stt_alt_description VARCHAR2(30 BYTE),
  stt_customer_table_flag VARCHAR2(1 BYTE) NOT NULL CONSTRAINT stt_customer_table_flag_ck CHECK (stt_customer_table_flag IN ('I','E')),
  stt_ftp_server_name VARCHAR2(100 BYTE),
  stt_ftp_login VARCHAR2(50 BYTE),
  stt_ftp_password VARCHAR2(50 BYTE),
  stt_ftp_port NUMBER(5),
  stt_ftp_directory_name VARCHAR2(100 BYTE),
  CONSTRAINT stt_ftp_ck CHECK ( (STT_FTP_SERVER_NAME IS NOT NULL AND STT_FTP_LOGIN IS NOT NULL AND STT_FTP_PASSWORD IS NOT NULL AND STT_FTP_PORT IS NOT NULL) OR (STT_FTP_SERVER_NAME IS NULL) ),
  CONSTRAINT stt_pk PRIMARY KEY (stt_code)
);
COMMENT ON TABLE phenix.statistics_tracking_types IS 'Types des statistiques de suivis';
COMMENT ON COLUMN phenix.statistics_tracking_types.stt_code IS 'Code unique de la table';
COMMENT ON COLUMN phenix.statistics_tracking_types.stt_active_switch IS 'Indique si le type est actif';
COMMENT ON COLUMN phenix.statistics_tracking_types.stt_description IS 'Description';
COMMENT ON COLUMN phenix.statistics_tracking_types.stt_alt_description IS 'Description alternative';
COMMENT ON COLUMN phenix.statistics_tracking_types.stt_customer_table_flag IS 'Indique si les clients reliés à ce type de statistique sont inclus ou exclus ';
COMMENT ON COLUMN phenix.statistics_tracking_types.stt_ftp_server_name IS 'Indique le nom du serveur FTP';
COMMENT ON COLUMN phenix.statistics_tracking_types.stt_ftp_login IS 'Indique le login du serveur FTP';
COMMENT ON COLUMN phenix.statistics_tracking_types.stt_ftp_password IS 'Indique le mot de passe FTP';
COMMENT ON COLUMN phenix.statistics_tracking_types.stt_ftp_port IS 'Indique le numéro du port FTP';
COMMENT ON COLUMN phenix.statistics_tracking_types.stt_ftp_directory_name IS 'Indique le nom du répertoire FTP';