CREATE GLOBAL TEMPORARY TABLE phenix.temp_edi_statement_addresses (
  tesa_id NUMBER(15) NOT NULL,
  tesa_tesh_id NUMBER(15),
  tesa_whs_code VARCHAR2(2 BYTE),
  tesa_segment_type VARCHAR2(3 BYTE) NOT NULL,
  tesa_address_type VARCHAR2(2 BYTE) NOT NULL,
  tesa_enterprise_name VARCHAR2(35 BYTE),
  tesa_enterprise_reference VARCHAR2(35 BYTE),
  tesa_duns_number VARCHAR2(35 BYTE),
  tesa_site_number VARCHAR2(35 BYTE),
  tesa_telephone VARCHAR2(35 BYTE),
  tesa_contact_name VARCHAR2(35 BYTE),
  tesa_contact_telephone VARCHAR2(35 BYTE),
  tesa_address VARCHAR2(35 BYTE),
  tesa_address_suite VARCHAR2(35 BYTE),
  tesa_city VARCHAR2(30 BYTE),
  tesa_province_code VARCHAR2(2 BYTE),
  tesa_postal_code VARCHAR2(9 BYTE),
  tesa_country_code VARCHAR2(3 BYTE),
  CONSTRAINT tesa_pk PRIMARY KEY (tesa_id)
)
ON COMMIT DELETE ROWS;
COMMENT ON TABLE phenix.temp_edi_statement_addresses IS 'Indique Table des adresses des transactions edi';
COMMENT ON COLUMN phenix.temp_edi_statement_addresses.tesa_id IS 'Indique l''identifiant de la table';
COMMENT ON COLUMN phenix.temp_edi_statement_addresses.tesa_tesh_id IS 'Indique l''identifiant du header';
COMMENT ON COLUMN phenix.temp_edi_statement_addresses.tesa_whs_code IS 'Indique le code de l''entrepot';
COMMENT ON COLUMN phenix.temp_edi_statement_addresses.tesa_segment_type IS 'Indique l''identification du type de segment (RecordId)';
COMMENT ON COLUMN phenix.temp_edi_statement_addresses.tesa_address_type IS 'Indique l''dentifiant du type d''adresse';
COMMENT ON COLUMN phenix.temp_edi_statement_addresses.tesa_enterprise_name IS 'Indique le nom de l''entreprise';
COMMENT ON COLUMN phenix.temp_edi_statement_addresses.tesa_enterprise_reference IS 'Indique la référence à cette entreprise par le fournisseur (account ID)';
COMMENT ON COLUMN phenix.temp_edi_statement_addresses.tesa_duns_number IS 'Indique le Numéro Dun''s';
COMMENT ON COLUMN phenix.temp_edi_statement_addresses.tesa_site_number IS 'Indique le code d''identification de l''entreprise (siteNumber)';
COMMENT ON COLUMN phenix.temp_edi_statement_addresses.tesa_telephone IS 'Indique le téléphone';
COMMENT ON COLUMN phenix.temp_edi_statement_addresses.tesa_contact_name IS 'Indique le nom d''un contact';
COMMENT ON COLUMN phenix.temp_edi_statement_addresses.tesa_contact_telephone IS 'Indique le numéro de téléphone du contact';
COMMENT ON COLUMN phenix.temp_edi_statement_addresses.tesa_address IS 'Indique l''adresse';
COMMENT ON COLUMN phenix.temp_edi_statement_addresses.tesa_address_suite IS 'Indique la suite de l''adresse';
COMMENT ON COLUMN phenix.temp_edi_statement_addresses.tesa_city IS 'Indique la ville';
COMMENT ON COLUMN phenix.temp_edi_statement_addresses.tesa_province_code IS 'Indique le code de province';
COMMENT ON COLUMN phenix.temp_edi_statement_addresses.tesa_postal_code IS 'Indique le code postal';
COMMENT ON COLUMN phenix.temp_edi_statement_addresses.tesa_country_code IS 'Indique le code de pays';