CREATE TABLE phenix.synchronization_traces (
  syt_id NUMBER(15) NOT NULL,
  syt_table_name VARCHAR2(30 BYTE) NOT NULL,
  syt_record_id NUMBER(15) NOT NULL,
  syt_creation_date DATE DEFAULT SYSDATE NOT NULL,
  syt_modification_date DATE DEFAULT SYSDATE NOT NULL,
  syt_elimination_date DATE,
  CONSTRAINT syt_pk PRIMARY KEY (syt_id)
);
COMMENT ON TABLE phenix.synchronization_traces IS 'Contient les traces de synchronization entre Phenix Colabor et Phenix membre';
COMMENT ON COLUMN phenix.synchronization_traces.syt_id IS 'Identifiant unique';
COMMENT ON COLUMN phenix.synchronization_traces.syt_table_name IS 'Nom de la table modifiée';
COMMENT ON COLUMN phenix.synchronization_traces.syt_record_id IS 'Identifiant de l''enregistrement sur la table modifiée';
COMMENT ON COLUMN phenix.synchronization_traces.syt_creation_date IS 'Date de création';
COMMENT ON COLUMN phenix.synchronization_traces.syt_modification_date IS 'Date de modification';
COMMENT ON COLUMN phenix.synchronization_traces.syt_elimination_date IS 'Date d''élimination';