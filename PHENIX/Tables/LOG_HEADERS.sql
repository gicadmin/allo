CREATE TABLE phenix.log_headers (
  loh_id NUMBER(15) NOT NULL,
  loh_module_name VARCHAR2(100 BYTE) NOT NULL,
  loh_module_type VARCHAR2(3 BYTE) NOT NULL CONSTRAINT loh_module_type_ck CHECK (LOH_MODULE_TYPE IN ('FUN', 'PRO', 'FOR', 'RAP', 'TRI', 'OTR')),
  loh_end TIMESTAMP(3),
  loh_file_name_in VARCHAR2(500 BYTE),
  loh_file_name_out VARCHAR2(500 BYTE),
  loh_message VARCHAR2(2000 BYTE),
  loh_start TIMESTAMP(3),
  CONSTRAINT loh_pk PRIMARY KEY (loh_id)
);
COMMENT ON TABLE phenix.log_headers IS 'Contient les informations générales concernant les différentes tâches';
COMMENT ON COLUMN phenix.log_headers.loh_id IS 'Numéro de l''identifiant';
COMMENT ON COLUMN phenix.log_headers.loh_module_name IS 'Nom du module';
COMMENT ON COLUMN phenix.log_headers.loh_module_type IS 'Type de module';
COMMENT ON COLUMN phenix.log_headers.loh_end IS 'Fin de la procédure ou fonction';
COMMENT ON COLUMN phenix.log_headers.loh_file_name_in IS 'Nom et chemin du fichier intrant';
COMMENT ON COLUMN phenix.log_headers.loh_file_name_out IS 'Nom et chemin du fichier sortant';
COMMENT ON COLUMN phenix.log_headers.loh_message IS 'Message descriptif';
COMMENT ON COLUMN phenix.log_headers.loh_start IS 'Début de la procédure ou fonction';