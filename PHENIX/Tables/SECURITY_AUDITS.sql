CREATE TABLE phenix.security_audits (
  saud_id NUMBER(15) NOT NULL,
  saud_ause_login VARCHAR2(256 BYTE) NOT NULL,
  saud_creation_date DATE DEFAULT sysdate NOT NULL,
  saud_object_name VARCHAR2(64 BYTE) NOT NULL,
  saud_column_name VARCHAR2(64 BYTE) NOT NULL,
  saud_row_key VARCHAR2(256 BYTE) NOT NULL,
  saud_action VARCHAR2(15 BYTE) NOT NULL,
  saud_old_value VARCHAR2(4000 BYTE),
  saud_new_value VARCHAR2(4000 BYTE),
  CONSTRAINT saud_pk PRIMARY KEY (saud_id)
);