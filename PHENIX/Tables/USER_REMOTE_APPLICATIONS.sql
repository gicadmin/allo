CREATE TABLE phenix.user_remote_applications (
  ura_id NUMBER(15) NOT NULL,
  ura_use_code NUMBER(5) NOT NULL,
  ura_key VARCHAR2(255 BYTE) NOT NULL,
  ura_creation_date DATE DEFAULT SYSDATE NOT NULL,
  ura_modification_date DATE DEFAULT SYSDATE NOT NULL,
  CONSTRAINT ura_pk PRIMARY KEY (ura_id),
  CONSTRAINT ura_uk_1 UNIQUE (ura_key),
  CONSTRAINT ura_use_fk FOREIGN KEY (ura_use_code) REFERENCES phenix."USERS" (use_code)
);