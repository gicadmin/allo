CREATE TABLE phenix.vendor_addresses (
  vad_ven_code NUMBER(5) NOT NULL,
  vad_address_type VARCHAR2(2 BYTE) NOT NULL CONSTRAINT vad_address_type_ck CHECK (VAD_ADDRESS_TYPE IN ('PU', 'PA', 'PI')),
  vad_prv_code VARCHAR2(2 BYTE) NOT NULL,
  vad_address VARCHAR2(45 BYTE) NOT NULL,
  vad_city VARCHAR2(30 BYTE) NOT NULL,
  vad_postal_code VARCHAR2(10 BYTE) NOT NULL,
  vad_telephone NUMBER(11) NOT NULL,
  vad_extension NUMBER(5),
  vad_fax_number NUMBER(11),
  CONSTRAINT vad_pk PRIMARY KEY (vad_ven_code,vad_address_type),
  CONSTRAINT vad_prv_fk FOREIGN KEY (vad_prv_code) REFERENCES phenix.provinces (prv_code),
  CONSTRAINT vad_ven_fk FOREIGN KEY (vad_ven_code) REFERENCES phenix.vendors (ven_code)
);
COMMENT ON TABLE phenix.vendor_addresses IS 'Contient l''information concernant les différentes adresses des fournisseurs';
COMMENT ON COLUMN phenix.vendor_addresses.vad_ven_code IS 'Code fournisseur';
COMMENT ON COLUMN phenix.vendor_addresses.vad_address_type IS 'Type d''adresse';
COMMENT ON COLUMN phenix.vendor_addresses.vad_prv_code IS 'Numéro de province';
COMMENT ON COLUMN phenix.vendor_addresses.vad_address IS 'Adresse';
COMMENT ON COLUMN phenix.vendor_addresses.vad_city IS 'Ville';
COMMENT ON COLUMN phenix.vendor_addresses.vad_postal_code IS 'Code postal';
COMMENT ON COLUMN phenix.vendor_addresses.vad_telephone IS 'Téléphone du fournisseur';
COMMENT ON COLUMN phenix.vendor_addresses.vad_extension IS 'Numéro d''extention du téléphone';
COMMENT ON COLUMN phenix.vendor_addresses.vad_fax_number IS 'Numéro de fax du fournisseur';