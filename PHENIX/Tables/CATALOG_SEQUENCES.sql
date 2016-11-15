CREATE TABLE phenix.catalog_sequences (
  ctg_code NUMBER(5) NOT NULL,
  ctg_description VARCHAR2(30 BYTE) NOT NULL,
  ctg_alt_description VARCHAR2(30 BYTE),
  CONSTRAINT ctg_pk PRIMARY KEY (ctg_code)
);
COMMENT ON TABLE phenix.catalog_sequences IS 'Regroupe les produits par leur ordre dans les catalogues';
COMMENT ON COLUMN phenix.catalog_sequences.ctg_code IS 'Numéro majeur de la séquence du catalogue';
COMMENT ON COLUMN phenix.catalog_sequences.ctg_description IS 'Description';
COMMENT ON COLUMN phenix.catalog_sequences.ctg_alt_description IS 'Description alternative';