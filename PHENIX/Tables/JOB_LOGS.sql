CREATE TABLE phenix.job_logs (
  jlo_id NUMBER(*,0) NOT NULL,
  jlo_pse_pro_id NUMBER(*,0),
  jlo_pse_sequence_execution NUMBER(*,0),
  jlo_jsc_id NUMBER(*,0),
  jlo_jobtype VARCHAR2(16 BYTE),
  jlo_queue VARCHAR2(16 BYTE),
  jlo_jobname VARCHAR2(128 BYTE),
  jlo_statuscode NUMBER,
  jlo_statustext VARCHAR2(2000 BYTE),
  jlo_jobowner VARCHAR2(64 BYTE),
  jlo_outputtype VARCHAR2(16 BYTE),
  jlo_outputname VARCHAR2(128 BYTE),
  jlo_queuedat DATE,
  jlo_startedat DATE,
  jlo_finishedat DATE,
  jlo_nextrunat DATE,
  jlo_parentjob NUMBER,
  CONSTRAINT jlo_pk PRIMARY KEY (jlo_id),
  CONSTRAINT jlo_jsc_fk FOREIGN KEY (jlo_jsc_id) REFERENCES phenix.job_schedules (jsc_id) ON DELETE CASCADE,
  CONSTRAINT jlo_pse_fk FOREIGN KEY (jlo_pse_pro_id,jlo_pse_sequence_execution) REFERENCES phenix.program_sequences (pse_pro_id,pse_sequence_execution) ON DELETE CASCADE
);