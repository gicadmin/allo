CREATE TABLE phenix.application_messages (
  ames_id NUMBER(15) NOT NULL,
  ames_status VARCHAR2(10 BYTE) DEFAULT 'ACTIVE' NOT NULL CONSTRAINT ames_status_ck CHECK (AMES_status IN ('ACTIVE', 'DISABLED')),
  ames_start_date DATE NOT NULL,
  ames_end_date DATE NOT NULL,
  ames_type VARCHAR2(10 BYTE) DEFAULT 'SYS_BLK' NOT NULL CONSTRAINT ames_type_ck CHECK (AMES_TYPE IN ('SYS_BLK', 'SYS_UNBLK', 'PUBLICITY')),
  ames_source VARCHAR2(10 BYTE) DEFAULT 'WEB' NOT NULL CONSTRAINT ames_source_ck CHECK (AMES_SOURCE IN ('WEB', 'EXTERN')),
  ames_creation_date DATE DEFAULT sysdate NOT NULL,
  ames_modification_date DATE DEFAULT sysdate NOT NULL,
  CONSTRAINT ames_pk PRIMARY KEY (ames_id)
);