CREATE TABLE phenix.system_active_sessions (
  sas_session_id NUMBER(12) NOT NULL,
  sas_sen_code VARCHAR2(6 BYTE) NOT NULL,
  sas_use_code NUMBER(5) NOT NULL,
  sas_date DATE NOT NULL,
  CONSTRAINT sas_pk PRIMARY KEY (sas_session_id),
  CONSTRAINT sas_sen_fk FOREIGN KEY (sas_sen_code) REFERENCES phenix.system_environments (sen_code)
);
COMMENT ON TABLE phenix.system_active_sessions IS 'Indique les différente sessions actives';
COMMENT ON COLUMN phenix.system_active_sessions.sas_session_id IS 'L''identifiant de la session';
COMMENT ON COLUMN phenix.system_active_sessions.sas_sen_code IS 'Code de l''environnement';
COMMENT ON COLUMN phenix.system_active_sessions.sas_use_code IS 'Code usage (pas de relation à la table usager)';
COMMENT ON COLUMN phenix.system_active_sessions.sas_date IS 'Date quand la session a commencé';