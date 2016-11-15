CREATE TABLE phenix.security_login_audits (
  slau_id NUMBER(15) NOT NULL,
  slau_ause_login VARCHAR2(256 BYTE),
  slau_status VARCHAR2(15 BYTE) NOT NULL,
  slau_connection_information VARCHAR2(4000 BYTE),
  slau_creation_date DATE DEFAULT sysdate NOT NULL,
  CONSTRAINT slau_pk PRIMARY KEY (slau_id)
);