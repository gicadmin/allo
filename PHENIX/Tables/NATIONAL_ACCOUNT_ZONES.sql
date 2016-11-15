CREATE TABLE phenix.national_account_zones (
  naz_nac_code NUMBER(4) NOT NULL,
  naz_zone_code NUMBER(3) NOT NULL,
  naz_description VARCHAR2(30 BYTE) NOT NULL,
  naz_alt_description VARCHAR2(30 BYTE),
  naz_prv_code VARCHAR2(2 BYTE) NOT NULL,
  naz_srt_code NUMBER(3) NOT NULL,
  naz_synchronization_id NUMBER(15),
  naz_unique_index NUMBER(15),
  CONSTRAINT naz_pk PRIMARY KEY (naz_nac_code,naz_zone_code),
  CONSTRAINT naz_nac_fk FOREIGN KEY (naz_nac_code) REFERENCES phenix.national_accounts (nac_code),
  CONSTRAINT naz_prv_fk FOREIGN KEY (naz_prv_code) REFERENCES phenix.provinces (prv_code),
  CONSTRAINT naz_srt_fk FOREIGN KEY (naz_srt_code) REFERENCES phenix.suggested_retail_price_types (srt_code)
);
COMMENT ON TABLE phenix.national_account_zones IS 'Table contenant les différentes zones d''un compte national';
COMMENT ON COLUMN phenix.national_account_zones.naz_nac_code IS 'Le code du compte national';
COMMENT ON COLUMN phenix.national_account_zones.naz_zone_code IS 'Code de la zone du compte national';
COMMENT ON COLUMN phenix.national_account_zones.naz_description IS 'Description de la zone';
COMMENT ON COLUMN phenix.national_account_zones.naz_alt_description IS 'Description alternative de la zone';
COMMENT ON COLUMN phenix.national_account_zones.naz_prv_code IS 'La province de la zone lié au compte national';
COMMENT ON COLUMN phenix.national_account_zones.naz_srt_code IS 'Le code du type de PDS de la zone';
COMMENT ON COLUMN phenix.national_account_zones.naz_synchronization_id IS 'Identifiant de synchronization';
COMMENT ON COLUMN phenix.national_account_zones.naz_unique_index IS 'Identifiant unique';