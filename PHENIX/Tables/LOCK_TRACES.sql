CREATE TABLE phenix.lock_traces (
  ltr_ticket_code VARCHAR2(32 BYTE) NOT NULL,
  lts_create_date DATE NOT NULL,
  lts_rowid ROWID NOT NULL,
  ltr_object_id NUMBER NOT NULL,
  CONSTRAINT ltr_pk PRIMARY KEY (ltr_ticket_code)
);