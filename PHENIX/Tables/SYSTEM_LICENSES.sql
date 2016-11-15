CREATE TABLE phenix.system_licenses (
  sli_code VARCHAR2(22 BYTE) NOT NULL,
  sli_computer_information VARCHAR2(13 BYTE) NOT NULL,
  sli_expiration_date DATE NOT NULL,
  sli_number_of_users NUMBER(3) NOT NULL,
  sli_registration_key VARCHAR2(13 BYTE) NOT NULL,
  sli_validation_code VARCHAR2(11 BYTE) NOT NULL,
  sli_number_of_users_sge NUMBER(3) DEFAULT 20 NOT NULL,
  CONSTRAINT sli_pk PRIMARY KEY (sli_code)
);
COMMENT ON TABLE phenix.system_licenses IS 'Table contenant les informations des licenses des programmes du système';
COMMENT ON COLUMN phenix.system_licenses.sli_code IS 'Code de la license';
COMMENT ON COLUMN phenix.system_licenses.sli_computer_information IS 'Contient l''information identifiant l''ordinateur du serveur';
COMMENT ON COLUMN phenix.system_licenses.sli_expiration_date IS 'Date d''expiration de la licence';
COMMENT ON COLUMN phenix.system_licenses.sli_number_of_users IS 'Nombre d''usagers permis par la licence';
COMMENT ON COLUMN phenix.system_licenses.sli_registration_key IS 'Contient la clé pour validider la licence';
COMMENT ON COLUMN phenix.system_licenses.sli_validation_code IS 'Code de validation';
COMMENT ON COLUMN phenix.system_licenses.sli_number_of_users_sge IS 'Nombre d''usagers permis par la licence SGE';