CREATE TABLE phenix.user_skipped_missions (
  usm_pmh_id NUMBER(15) NOT NULL,
  usm_use_code NUMBER(5) NOT NULL,
  CONSTRAINT usm_pk PRIMARY KEY (usm_pmh_id,usm_use_code),
  CONSTRAINT usm_pmh_fk FOREIGN KEY (usm_pmh_id) REFERENCES phenix.pick_mission_headers (pmh_id),
  CONSTRAINT usm_use_fk FOREIGN KEY (usm_use_code) REFERENCES phenix."USERS" (use_code)
);
COMMENT ON TABLE phenix.user_skipped_missions IS 'Table des missions outrepassées';
COMMENT ON COLUMN phenix.user_skipped_missions.usm_pmh_id IS 'Indique le numéro de la mission';
COMMENT ON COLUMN phenix.user_skipped_missions.usm_use_code IS 'Indique le code de l''utilisateur';