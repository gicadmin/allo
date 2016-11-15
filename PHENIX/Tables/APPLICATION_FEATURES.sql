CREATE TABLE phenix.application_features (
  afea_id NUMBER(15) NOT NULL,
  afea_code VARCHAR2(256 BYTE) NOT NULL,
  afea_status VARCHAR2(10 BYTE) NOT NULL CONSTRAINT afea_status_ck CHECK (afea_status IN ('ACTIVE', 'DISABLED')),
  afea_creation_date DATE DEFAULT sysdate NOT NULL,
  afea_modification_date DATE DEFAULT sysdate NOT NULL,
  CONSTRAINT afea_pk PRIMARY KEY (afea_id),
  CONSTRAINT fea_uk_1 UNIQUE (afea_code)
);