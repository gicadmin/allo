CREATE TABLE phenix.brand_names (
  brn_code NUMBER(5) NOT NULL,
  brn_description VARCHAR2(15 BYTE) NOT NULL,
  brn_alt_description VARCHAR2(15 BYTE),
  CONSTRAINT brn_pk PRIMARY KEY (brn_code)
);
COMMENT ON TABLE phenix.brand_names IS 'Marque de commerce';
COMMENT ON COLUMN phenix.brand_names.brn_code IS 'Code de la marque de commerce';
COMMENT ON COLUMN phenix.brand_names.brn_description IS 'Description';
COMMENT ON COLUMN phenix.brand_names.brn_alt_description IS 'Description alternative';