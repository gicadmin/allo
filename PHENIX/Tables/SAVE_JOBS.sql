CREATE TABLE phenix.save_jobs (
  "JOB" NUMBER NOT NULL,
  log_user VARCHAR2(30 BYTE) NOT NULL,
  priv_user VARCHAR2(30 BYTE) NOT NULL,
  schema_user VARCHAR2(30 BYTE) NOT NULL,
  broken VARCHAR2(1 BYTE),
  what VARCHAR2(4000 BYTE)
);