CREATE TABLE phenix.program_sequences (
  pse_pro_id NUMBER(*,0) NOT NULL,
  pse_sequence_execution NUMBER NOT NULL,
  pse_master NUMBER(*,0) NOT NULL,
  CONSTRAINT pse_pk PRIMARY KEY (pse_pro_id,pse_sequence_execution),
  CONSTRAINT pse_uk UNIQUE (pse_sequence_execution,pse_master),
  CONSTRAINT pse_pod_fk FOREIGN KEY (pse_pro_id) REFERENCES phenix.programs (pro_id),
  CONSTRAINT pse_pod_master_fk FOREIGN KEY (pse_master) REFERENCES phenix.programs (pro_id)
);