CREATE TABLE phenix.index_log (
  "OWNER" VARCHAR2(30 BYTE) NOT NULL,
  index_name VARCHAR2(30 BYTE) NOT NULL,
  CONSTRAINT index_log_pk PRIMARY KEY ("OWNER",index_name)
);