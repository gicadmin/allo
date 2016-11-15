CREATE TABLE phenix.err_logs (
  err_id NUMBER(38) NOT NULL,
  err_modulename VARCHAR2(80 BYTE) NOT NULL,
  err_sqlcode NUMBER NOT NULL,
  err_message VARCHAR2(2000 BYTE),
  err_date DATE NOT NULL,
  err_uid NUMBER NOT NULL,
  err_user VARCHAR2(80 BYTE) NOT NULL,
  err_terminal VARCHAR2(80 BYTE) NOT NULL,
  CONSTRAINT err_pk PRIMARY KEY (err_id)
);