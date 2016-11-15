CREATE TABLE phenix.application_users (
  ause_id NUMBER(15) NOT NULL,
  ause_login VARCHAR2(256 BYTE) NOT NULL,
  ause_status VARCHAR2(10 BYTE) DEFAULT 'ACTIVE' NOT NULL CONSTRAINT ause_status_ck CHECK (ause_status IN ('ACTIVE', 'LOCKED', 'DISABLED', 'DELETED')),
  ause_first_name VARCHAR2(64 BYTE) NOT NULL,
  ause_last_name VARCHAR2(64 BYTE) NOT NULL,
  ause_email VARCHAR2(256 BYTE) NOT NULL,
  ause_password VARCHAR2(80 BYTE) NOT NULL,
  ause_salt VARCHAR2(10 BYTE) NOT NULL,
  ause_login_attemps NUMBER(3) DEFAULT 0 NOT NULL,
  ause_creation_date DATE DEFAULT sysdate NOT NULL,
  ause_modification_date DATE DEFAULT sysdate NOT NULL,
  CONSTRAINT ause_pk PRIMARY KEY (ause_id),
  CONSTRAINT ause_uk_1 UNIQUE (ause_login),
  CONSTRAINT ause_uk_email UNIQUE (ause_email)
);