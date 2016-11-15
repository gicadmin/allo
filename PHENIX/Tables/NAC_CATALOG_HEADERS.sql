CREATE TABLE phenix.nac_catalog_headers (
  nch_id NUMBER(15) NOT NULL,
  nch_nac_code NUMBER(4) NOT NULL,
  nch_print_sequence NUMBER(6) NOT NULL,
  nch_description VARCHAR2(30 BYTE) NOT NULL,
  nch_alt_description VARCHAR2(30 BYTE),
  nch_synchronization_id NUMBER(15),
  CONSTRAINT nch_nat_sequence_uk UNIQUE (nch_nac_code,nch_print_sequence),
  CONSTRAINT nch_pk PRIMARY KEY (nch_id),
  CONSTRAINT nch_nac_fk FOREIGN KEY (nch_nac_code) REFERENCES phenix.national_accounts (nac_code)
);
COMMENT ON TABLE phenix.nac_catalog_headers IS 'Cette table contient les entêtes de bottin';
COMMENT ON COLUMN phenix.nac_catalog_headers.nch_id IS 'Numéro de l''entête';
COMMENT ON COLUMN phenix.nac_catalog_headers.nch_nac_code IS 'Indique le compte national du client';
COMMENT ON COLUMN phenix.nac_catalog_headers.nch_print_sequence IS 'Séquence d''impression';
COMMENT ON COLUMN phenix.nac_catalog_headers.nch_description IS 'Description de l''entête';
COMMENT ON COLUMN phenix.nac_catalog_headers.nch_alt_description IS 'Description alternative de l''entête';
COMMENT ON COLUMN phenix.nac_catalog_headers.nch_synchronization_id IS 'Identifiant de synchronization';