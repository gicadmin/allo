CREATE TABLE phenix.user_log_modifs (
  ulm_id NUMBER(15) NOT NULL,
  ulm_modif_use_code NUMBER(5) NOT NULL,
  ulm_use_code NUMBER(5) NOT NULL,
  ulm_name_field VARCHAR2(30 BYTE) NOT NULL,
  ulm_before_modif VARCHAR2(100 BYTE),
  ulm_after_modif VARCHAR2(100 BYTE),
  ulm_modification_date DATE NOT NULL,
  ulm_modification_source VARCHAR2(50 BYTE) NOT NULL,
  CONSTRAINT ulm_pk PRIMARY KEY (ulm_id) USING INDEX (CREATE INDEX phenix.ulm_pk ON phenix.user_log_modifs(ulm_id)    )
);
COMMENT ON TABLE phenix.user_log_modifs IS 'Table contenant les log de modification de la table USERS';
COMMENT ON COLUMN phenix.user_log_modifs.ulm_id IS 'Indique le id de la table';
COMMENT ON COLUMN phenix.user_log_modifs.ulm_modif_use_code IS 'Indique l''utilisateur qui a effectué le changement';
COMMENT ON COLUMN phenix.user_log_modifs.ulm_use_code IS 'Indique le code d''utilisateur qui a subi un changement';
COMMENT ON COLUMN phenix.user_log_modifs.ulm_name_field IS 'Indique le nom du champ qui a changé ';
COMMENT ON COLUMN phenix.user_log_modifs.ulm_before_modif IS 'Indique la valeur du champ avant la modification';
COMMENT ON COLUMN phenix.user_log_modifs.ulm_after_modif IS 'Indique la valeur du champ après la modification';
COMMENT ON COLUMN phenix.user_log_modifs.ulm_modification_date IS 'Indique la date à laquelle le changement a été fait';
COMMENT ON COLUMN phenix.user_log_modifs.ulm_modification_source IS 'Indique la source changement';