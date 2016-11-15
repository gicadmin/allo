CREATE TABLE phenix.establishment_barcodes (
  ebc_id NUMBER(15) NOT NULL,
  ebc_est_code VARCHAR2(7 BYTE) NOT NULL,
  ebc_bct_code NUMBER(5) NOT NULL,
  CONSTRAINT ebc_pk PRIMARY KEY (ebc_id) USING INDEX (CREATE UNIQUE INDEX phenix.ebc_pk_i ON phenix.establishment_barcodes(ebc_id)    ),
  CONSTRAINT ebc_uk UNIQUE (ebc_est_code,ebc_bct_code) USING INDEX (CREATE UNIQUE INDEX phenix.ebc_uk_i ON phenix.establishment_barcodes(ebc_est_code,ebc_bct_code)    ),
  CONSTRAINT ebc_bct_fk FOREIGN KEY (ebc_bct_code) REFERENCES phenix.barcode_types (bct_code),
  CONSTRAINT ebc_est_fk FOREIGN KEY (ebc_est_code) REFERENCES phenix.establishments (est_code)
);
COMMENT ON TABLE phenix.establishment_barcodes IS 'Table unissant les établissements aux codes à barre';
COMMENT ON COLUMN phenix.establishment_barcodes.ebc_id IS 'Indique l''identifiant du lien entre l''établissement et le code à barre';
COMMENT ON COLUMN phenix.establishment_barcodes.ebc_est_code IS 'Indique le code de l''établissement';
COMMENT ON COLUMN phenix.establishment_barcodes.ebc_bct_code IS 'Indique le code du type du code à barre';