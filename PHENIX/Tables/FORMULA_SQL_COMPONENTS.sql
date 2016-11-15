CREATE TABLE phenix.formula_sql_components (
  fsc_id NUMBER(15) NOT NULL,
  fsc_name VARCHAR2(256 BYTE) NOT NULL,
  fsc_source_type VARCHAR2(5 BYTE) CONSTRAINT fsc_source_type_ck CHECK (FSC_SOURCE_TYPE IN ('PLSQL','SQL')),
  fsc_source_sql VARCHAR2(4000 BYTE),
  CONSTRAINT fsc_pk PRIMARY KEY (fsc_id),
  CONSTRAINT fsc_uk UNIQUE (fsc_name)
);