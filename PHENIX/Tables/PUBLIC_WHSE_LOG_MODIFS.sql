CREATE TABLE phenix.public_whse_log_modifs (
  pwlm_id NUMBER(15) NOT NULL,
  pwlm_use_code NUMBER(5) NOT NULL,
  pwlm_pwid_id NUMBER(15) NOT NULL,
  pwlm_name_field VARCHAR2(30 BYTE) NOT NULL,
  pwlm_befr_modif VARCHAR2(100 BYTE),
  pwlm_after_modif VARCHAR2(100 BYTE),
  pwlm_modification_date DATE NOT NULL,
  pwlm_modification_source VARCHAR2(50 BYTE) NOT NULL,
  CONSTRAINT pwlm_pk PRIMARY KEY (pwlm_id),
  CONSTRAINT pwlm_pwid_fk FOREIGN KEY (pwlm_pwid_id) REFERENCES phenix.public_whse_identifiers (pwid_id) ON DELETE CASCADE,
  CONSTRAINT pwlm_use_fk FOREIGN KEY (pwlm_use_code) REFERENCES phenix."USERS" (use_code)
);
COMMENT ON COLUMN phenix.public_whse_log_modifs.pwlm_id IS 'Indique la clé unique de la table';
COMMENT ON COLUMN phenix.public_whse_log_modifs.pwlm_use_code IS 'Indique l''utilisateur qui a effectué le changement';
COMMENT ON COLUMN phenix.public_whse_log_modifs.pwlm_pwid_id IS 'Indique le code de l''identifiant publique qui a subi un changement';
COMMENT ON COLUMN phenix.public_whse_log_modifs.pwlm_name_field IS 'Indique le nom du champ qui a changé';
COMMENT ON COLUMN phenix.public_whse_log_modifs.pwlm_befr_modif IS 'Indique la valeur du champ avant la modification';
COMMENT ON COLUMN phenix.public_whse_log_modifs.pwlm_after_modif IS 'Indique la valeur du champ après la modification';
COMMENT ON COLUMN phenix.public_whse_log_modifs.pwlm_modification_date IS 'Indique la date à laquelle le changement a été fait';
COMMENT ON COLUMN phenix.public_whse_log_modifs.pwlm_modification_source IS 'Indique la source changement';