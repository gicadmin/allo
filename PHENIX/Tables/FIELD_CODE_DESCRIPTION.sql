CREATE TABLE phenix.field_code_description (
  fcc_fce_id NUMBER(15) NOT NULL,
  fcc_code_language VARCHAR2(10 BYTE) NOT NULL,
  fcc_description VARCHAR2(50 BYTE) NOT NULL,
  CONSTRAINT fcc_pk PRIMARY KEY (fcc_fce_id,fcc_code_language) USING INDEX (CREATE INDEX phenix.fcc_pk ON phenix.field_code_description(fcc_fce_id,fcc_code_language)    ),
  CONSTRAINT fcc_fce_id_fk FOREIGN KEY (fcc_fce_id) REFERENCES phenix.field_code (fce_id)
);
COMMENT ON TABLE phenix.field_code_description IS 'Table contenant la traduction';
COMMENT ON COLUMN phenix.field_code_description.fcc_fce_id IS 'Indique le id de la table parent';
COMMENT ON COLUMN phenix.field_code_description.fcc_code_language IS 'Indique le code de la langue';
COMMENT ON COLUMN phenix.field_code_description.fcc_description IS 'Indique la description dans la langue choisi';