CREATE TABLE phenix.job_schedule_audits (
  jsa_id NUMBER(15) NOT NULL,
  jsa_use_code NUMBER(5) NOT NULL,
  jsa_delete_date DATE NOT NULL,
  jsa_pro_id NUMBER(15),
  jsa_int_id NUMBER(15),
  CONSTRAINT jsa_pk PRIMARY KEY (jsa_id) USING INDEX (CREATE INDEX phenix.jsa_pk ON phenix.job_schedule_audits(jsa_id)    ),
  CONSTRAINT jsa_int_fk FOREIGN KEY (jsa_int_id) REFERENCES phenix.interval_type (int_id),
  CONSTRAINT jsa_pro_fk FOREIGN KEY (jsa_pro_id) REFERENCES phenix.programs (pro_id),
  CONSTRAINT jsa_use_fk FOREIGN KEY (jsa_use_code) REFERENCES phenix."USERS" (use_code)
);
COMMENT ON TABLE phenix.job_schedule_audits IS 'Table contenant les log de modification de la table job_schedules';
COMMENT ON COLUMN phenix.job_schedule_audits.jsa_id IS 'Indique le id de la table';
COMMENT ON COLUMN phenix.job_schedule_audits.jsa_use_code IS 'Indique l''utilisateur qui a effectué la suppression';
COMMENT ON COLUMN phenix.job_schedule_audits.jsa_delete_date IS 'Indique la date de suppression';
COMMENT ON COLUMN phenix.job_schedule_audits.jsa_pro_id IS 'Indique l''identifiasnt du programme supprimé';
COMMENT ON COLUMN phenix.job_schedule_audits.jsa_int_id IS 'Indique l''intervalle du programme supprimé';