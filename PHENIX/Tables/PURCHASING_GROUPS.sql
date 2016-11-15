CREATE TABLE phenix.purchasing_groups (
  pug_code NUMBER(5) NOT NULL,
  pug_description VARCHAR2(30 BYTE) NOT NULL,
  pug_alt_description VARCHAR2(30 BYTE),
  CONSTRAINT pug_pk PRIMARY KEY (pug_code)
);