CREATE TABLE phenix.field_code (
  fce_id NUMBER(15) NOT NULL,
  fce_code VARCHAR2(50 BYTE) NOT NULL,
  CONSTRAINT fce_pk PRIMARY KEY (fce_id) USING INDEX (CREATE INDEX phenix.fce_pk ON phenix.field_code(fce_id)    ),
  CONSTRAINT fce_uk UNIQUE (fce_code)
);
COMMENT ON TABLE phenix.field_code IS 'Table contenant les éléments pour la traduction';
COMMENT ON COLUMN phenix.field_code.fce_id IS 'Indique le id de la table';
COMMENT ON COLUMN phenix.field_code.fce_code IS 'Indique le code à traduire';