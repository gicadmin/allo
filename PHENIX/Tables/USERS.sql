CREATE TABLE phenix."USERS" (
  use_code NUMBER(5) NOT NULL,
  use_first_name VARCHAR2(30 BYTE) NOT NULL,
  use_last_name VARCHAR2(30 BYTE) NOT NULL,
  use_language VARCHAR2(1 BYTE) NOT NULL CONSTRAINT use_language_ck CHECK (USE_LANGUAGE IN ('F', 'E')),
  use_prv_code VARCHAR2(2 BYTE),
  use_address VARCHAR2(45 BYTE),
  use_email VARCHAR2(80 BYTE),
  use_year_spiffs NUMBER(8,2),
  use_alt_email VARCHAR2(80 BYTE),
  use_fax NUMBER(11),
  use_city VARCHAR2(30 BYTE),
  use_login VARCHAR2(30 BYTE),
  use_password VARCHAR2(30 BYTE),
  use_postal_code VARCHAR2(10 BYTE),
  use_telephone NUMBER(11),
  use_telephone_2 NUMBER(11),
  use_telephone_extension NUMBER(5),
  use_telephone_extension_2 NUMBER(5),
  use_sgr_code VARCHAR2(30 BYTE),
  use_prn_id NUMBER(15),
  use_vr_password VARCHAR2(4 BYTE),
  use_wms_user_switch NUMBER(1) NOT NULL CONSTRAINT use_wms_user_switch_ck CHECK (USE_WMS_USER_SWITCH IN (0,1)),
  use_whs_code VARCHAR2(2 BYTE) NOT NULL,
  use_create_use_code NUMBER(5) DEFAULT 99999 NOT NULL,
  use_creation_date DATE DEFAULT SYSDATE NOT NULL,
  use_last_connection_date DATE,
  use_department VARCHAR2(2 BYTE) CONSTRAINT use_department_ck CHECK (USE_DEPARTMENT IN ('AC','EN','FI','IN','NC','RH','TR','VE')),
  use_message VARCHAR2(200 BYTE),
  CONSTRAINT use_login_ck CHECK ((USE_SGR_CODE is not NULL and
USE_PASSWORD is not NULL and
USE_LOGIN is not NULL) or
(USE_SGR_CODE is NULL and
USE_PASSWORD is NULL and
USE_LOGIN is NULL)),
  CONSTRAINT use_telephone_2_ck CHECK ((USE_TELEPHONE_2 is NULL and
USE_TELEPHONE_EXTENSION_2 is NULL) or
(USE_TELEPHONE_2 is not NULL and
USE_TELEPHONE_EXTENSION_2 is NULL) or
(USE_TELEPHONE_2 is not NULL and
USE_TELEPHONE_EXTENSION_2 is not NULL)),
  CONSTRAINT use_telephone_ck CHECK ((USE_TELEPHONE is NULL and
USE_TELEPHONE_EXTENSION is NULL) or
(USE_TELEPHONE is not NULL and
USE_TELEPHONE_EXTENSION is NULL) or
(USE_TELEPHONE is not NULL and
USE_TELEPHONE_EXTENSION is not NULL)),
  CONSTRAINT use_login_uk UNIQUE (use_login),
  CONSTRAINT use_pk PRIMARY KEY (use_code),
  CONSTRAINT use_create_use_fk FOREIGN KEY (use_create_use_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT use_prn_fk FOREIGN KEY (use_prn_id) REFERENCES phenix.printers (prn_id),
  CONSTRAINT use_prv_fk FOREIGN KEY (use_prv_code) REFERENCES phenix.provinces (prv_code),
  CONSTRAINT use_sgp_fk FOREIGN KEY (use_sgr_code) REFERENCES phenix.security_groups (sgr_code),
  CONSTRAINT use_whs_fk FOREIGN KEY (use_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix."USERS" IS 'Usager du système';
COMMENT ON COLUMN phenix."USERS".use_code IS 'Numéro de l''usager';
COMMENT ON COLUMN phenix."USERS".use_first_name IS 'Prénom';
COMMENT ON COLUMN phenix."USERS".use_last_name IS 'Nom';
COMMENT ON COLUMN phenix."USERS".use_language IS 'Langue';
COMMENT ON COLUMN phenix."USERS".use_prv_code IS 'Numéro de province';
COMMENT ON COLUMN phenix."USERS".use_address IS 'Adresse';
COMMENT ON COLUMN phenix."USERS".use_email IS 'Adresse de courriel';
COMMENT ON COLUMN phenix."USERS".use_year_spiffs IS '"spiffs" accumulés durant l''année';
COMMENT ON COLUMN phenix."USERS".use_alt_email IS 'Adresse de courriel alternatif';
COMMENT ON COLUMN phenix."USERS".use_fax IS 'Numéro de télécopieur';
COMMENT ON COLUMN phenix."USERS".use_city IS 'Ville';
COMMENT ON COLUMN phenix."USERS".use_login IS 'Alias (nom que l''usager utilise pour accéder au système)';
COMMENT ON COLUMN phenix."USERS".use_password IS 'Mot de passe de l''usager';
COMMENT ON COLUMN phenix."USERS".use_postal_code IS 'Code postal';
COMMENT ON COLUMN phenix."USERS".use_telephone IS 'Numéro de téléphone';
COMMENT ON COLUMN phenix."USERS".use_telephone_2 IS 'Deuxième numéro de téléphone';
COMMENT ON COLUMN phenix."USERS".use_telephone_extension IS 'Extention du numéro de téléphone';
COMMENT ON COLUMN phenix."USERS".use_telephone_extension_2 IS 'Extention du deuxième numéro de téléphone';
COMMENT ON COLUMN phenix."USERS".use_prn_id IS 'Numéro de l''imprimante';
COMMENT ON COLUMN phenix."USERS".use_vr_password IS 'Indique le mot de passe pour l''appareil de reconnaissance vocale';
COMMENT ON COLUMN phenix."USERS".use_wms_user_switch IS 'Indique que l''utilisateur est un usager du SGE';
COMMENT ON COLUMN phenix."USERS".use_whs_code IS 'Indique le code de l''entrepôt auquel appartient l''utilisateur';
COMMENT ON COLUMN phenix."USERS".use_create_use_code IS 'Indique le code utilisateur qui a crée le nouvel utilisateur';
COMMENT ON COLUMN phenix."USERS".use_creation_date IS 'Indique la date de création du nouvel utilisateur';
COMMENT ON COLUMN phenix."USERS".use_last_connection_date IS 'Indique la date de dernière connexion de l''utilisateur à l''application';
COMMENT ON COLUMN phenix."USERS".use_department IS 'Indique le département de employé';