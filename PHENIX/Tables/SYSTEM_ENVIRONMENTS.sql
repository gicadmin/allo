CREATE TABLE phenix.system_environments (
  sen_code VARCHAR2(6 BYTE) NOT NULL,
  sen_active_switch NUMBER(1) NOT NULL CONSTRAINT sen_active_switch_ck CHECK (SEN_ACTIVE_SWITCH IN (0, 1)),
  sen_connection VARCHAR2(12 BYTE) NOT NULL,
  sen_description VARCHAR2(45 BYTE) NOT NULL,
  sen_user_password VARCHAR2(30 BYTE) NOT NULL,
  sen_alt_description VARCHAR2(45 BYTE),
  sen_path VARCHAR2(240 BYTE),
  sen_rptgateway VARCHAR2(100 BYTE) NOT NULL,
  sen_rptserver VARCHAR2(100 BYTE) NOT NULL,
  sen_destrep VARCHAR2(1000 BYTE) NOT NULL,
  sen_smtphost VARCHAR2(100 BYTE) NOT NULL,
  sen_helppath VARCHAR2(100 BYTE) NOT NULL,
  sen_ias_name VARCHAR2(30 BYTE),
  sen_dblink_name VARCHAR2(30 BYTE),
  sen_wms_server_name VARCHAR2(100 BYTE),
  sen_wms_server_name_test VARCHAR2(100 BYTE),
  sen_wms_server_name_prod VARCHAR2(100 BYTE),
  sen_wms_server_name_test_rf VARCHAR2(100 BYTE),
  sen_wms_server_name_prod_rf VARCHAR2(100 BYTE),
  sen_client_ip VARCHAR2(100 BYTE) NOT NULL,
  sen_error_mail VARCHAR2(200 BYTE) NOT NULL,
  sen_image_path VARCHAR2(100 BYTE) NOT NULL,
  sen_smtp_port NUMBER(6),
  sen_smtp_user VARCHAR2(30 BYTE),
  sen_smtp_password VARCHAR2(30 BYTE),
  sen_smtp_auth_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT sen_smtp_auth_switch_ck CHECK (SEN_SMTP_AUTH_SWITCH IN (0, 1)),
  sen_smtp_timeout NUMBER(4),
  sen_accpacsync_url VARCHAR2(100 BYTE),
  CONSTRAINT sen_pk PRIMARY KEY (sen_code)
);
COMMENT ON TABLE phenix.system_environments IS 'Indique les différents environnements du système';
COMMENT ON COLUMN phenix.system_environments.sen_code IS 'Numéro de l''environnement';
COMMENT ON COLUMN phenix.system_environments.sen_active_switch IS 'Indique si l''environnement est actif ou non';
COMMENT ON COLUMN phenix.system_environments.sen_connection IS 'Indique l''identifiant de la connection';
COMMENT ON COLUMN phenix.system_environments.sen_description IS 'Description';
COMMENT ON COLUMN phenix.system_environments.sen_user_password IS 'Mot de passe de l''usager';
COMMENT ON COLUMN phenix.system_environments.sen_alt_description IS 'Description alternative';
COMMENT ON COLUMN phenix.system_environments.sen_path IS 'Indique le chemin de l''environnement';
COMMENT ON COLUMN phenix.system_environments.sen_rptgateway IS 'L''adresse du serveur d''application IAS';
COMMENT ON COLUMN phenix.system_environments.sen_rptserver IS 'Serveur de rapport spécifique';
COMMENT ON COLUMN phenix.system_environments.sen_destrep IS 'Destinations des outputs';
COMMENT ON COLUMN phenix.system_environments.sen_smtphost IS 'Indique le serveur de courriel';
COMMENT ON COLUMN phenix.system_environments.sen_helppath IS 'Chemin d''accès pour l''aide en ligne';
COMMENT ON COLUMN phenix.system_environments.sen_ias_name IS 'Nom du serveur IAS';
COMMENT ON COLUMN phenix.system_environments.sen_dblink_name IS 'Nom du database link';
COMMENT ON COLUMN phenix.system_environments.sen_wms_server_name IS 'Nom du serveur du SGE';
COMMENT ON COLUMN phenix.system_environments.sen_wms_server_name_test IS 'Nom du serveur du SGE test';
COMMENT ON COLUMN phenix.system_environments.sen_wms_server_name_prod IS 'Nom du serveur du SGE prod';
COMMENT ON COLUMN phenix.system_environments.sen_wms_server_name_test_rf IS 'Nom du serveur du SGE_RF test';
COMMENT ON COLUMN phenix.system_environments.sen_wms_server_name_prod_rf IS 'Nom du serveur du SGE_RF prod';
COMMENT ON COLUMN phenix.system_environments.sen_client_ip IS 'Indique l''adresse IP du client';
COMMENT ON COLUMN phenix.system_environments.sen_error_mail IS 'Indique l''adresse de courriel pour l''envoi des erreurs (utilisé dans le CopyData)';
COMMENT ON COLUMN phenix.system_environments.sen_image_path IS 'Indique le chemin pour accéder aux images';
COMMENT ON COLUMN phenix.system_environments.sen_smtp_port IS 'Indique le numéro de port du serveur SMTP authentifié';
COMMENT ON COLUMN phenix.system_environments.sen_smtp_user IS 'Indique le nom d''utilisateur du serveur SMTP authentifié';
COMMENT ON COLUMN phenix.system_environments.sen_smtp_password IS 'Indique le mot de passe de l''utilisateur du serveur SMTP authentifié';
COMMENT ON COLUMN phenix.system_environments.sen_smtp_auth_switch IS 'Indique l''utilisation d''un serveur SMTP authentifié avec utilisateur / mot de passe';
COMMENT ON COLUMN phenix.system_environments.sen_smtp_timeout IS 'Indique le délai (en secondes) avant abandon de la connection';
COMMENT ON COLUMN phenix.system_environments.sen_accpacsync_url IS 'Indique le lien pour lancer la synchronisation accpac';