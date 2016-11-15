CREATE TABLE phenix.barcode_components (
  bcc_code NUMBER(5) NOT NULL,
  bcc_description VARCHAR2(30 BYTE) NOT NULL,
  bcc_alt_description VARCHAR2(30 BYTE) NOT NULL,
  CONSTRAINT bcc_pk PRIMARY KEY (bcc_code) USING INDEX (CREATE UNIQUE INDEX phenix.bcc_pk_i ON phenix.barcode_components(bcc_code)    )
);
COMMENT ON TABLE phenix.barcode_components IS 'Table des composantes des codes à barre';
COMMENT ON COLUMN phenix.barcode_components.bcc_code IS 'Indique le code de la composante du code à barre';
COMMENT ON COLUMN phenix.barcode_components.bcc_description IS 'Indique la description de la composante du code à barre';
COMMENT ON COLUMN phenix.barcode_components.bcc_alt_description IS 'Indique la description alternative de la composante du code à barre';