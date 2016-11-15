CREATE TABLE phenix.debug_traces (
  dtr_seq NUMBER(15) NOT NULL,
  dtr_created_date DATE DEFAULT SYSDATE NOT NULL,
  dtr_source VARCHAR2(256 BYTE) NOT NULL,
  dtr_backtrace VARCHAR2(4000 BYTE) NOT NULL,
  dtr_message VARCHAR2(4000 BYTE) NOT NULL,
  dtr_sid NUMBER,
  dtr_serial NUMBER,
  dtr_username VARCHAR2(30 BYTE),
  dtr_program VARCHAR2(64 BYTE),
  dtr_client_info VARCHAR2(64 BYTE),
  dtr_logon_time DATE,
  dtr_client_identifier VARCHAR2(64 BYTE)
);