CREATE TABLE phenix.indirect_billing_addresses (
  iba_ibh_id NUMBER(15) NOT NULL,
  iba_address_type VARCHAR2(2 BYTE),
  iba_enterprise_name VARCHAR2(35 BYTE),
  iba_vendor_ref_to_enterprise VARCHAR2(35 BYTE),
  iba_duns VARCHAR2(35 BYTE),
  iba_enterprise_id VARCHAR2(35 BYTE),
  iba_telephone VARCHAR2(35 BYTE),
  iba_contact_name VARCHAR2(35 BYTE),
  iba_contact_telephone VARCHAR2(35 BYTE),
  iba_address VARCHAR2(35 BYTE),
  iba_address_2 VARCHAR2(35 BYTE),
  iba_city VARCHAR2(30 BYTE),
  iba_province_code VARCHAR2(2 BYTE),
  iba_postal_code VARCHAR2(9 BYTE),
  iba_country_code VARCHAR2(3 BYTE),
  CONSTRAINT iba_ibh_id_fk FOREIGN KEY (iba_ibh_id) REFERENCES phenix.indirect_billing_headers (ibh_id)
);
COMMENT ON TABLE phenix.indirect_billing_addresses IS 'Table contenant les lignes d''adresses de fichiers 810 arrivés par EDI';
COMMENT ON COLUMN phenix.indirect_billing_addresses.iba_ibh_id IS 'Contient la clé pour lier avec la table des entêtes';
COMMENT ON COLUMN phenix.indirect_billing_addresses.iba_address_type IS 'Type de l''adresse contenue sur la ligne en cours';
COMMENT ON COLUMN phenix.indirect_billing_addresses.iba_enterprise_name IS 'Nom de l''entreprise';
COMMENT ON COLUMN phenix.indirect_billing_addresses.iba_vendor_ref_to_enterprise IS 'Référence à cette entreprise par le fournisseur';
COMMENT ON COLUMN phenix.indirect_billing_addresses.iba_duns IS 'Numéro de DUNS';
COMMENT ON COLUMN phenix.indirect_billing_addresses.iba_enterprise_id IS 'Code d''identification de l''entreprise';
COMMENT ON COLUMN phenix.indirect_billing_addresses.iba_telephone IS 'Numéro de téléphone';
COMMENT ON COLUMN phenix.indirect_billing_addresses.iba_contact_name IS 'Nom du contact';
COMMENT ON COLUMN phenix.indirect_billing_addresses.iba_contact_telephone IS 'Numéro de téléphone du contact';
COMMENT ON COLUMN phenix.indirect_billing_addresses.iba_address IS 'Adresse';
COMMENT ON COLUMN phenix.indirect_billing_addresses.iba_address_2 IS 'Suite de l''adresse';
COMMENT ON COLUMN phenix.indirect_billing_addresses.iba_city IS 'Ville';
COMMENT ON COLUMN phenix.indirect_billing_addresses.iba_province_code IS 'Code de la province';
COMMENT ON COLUMN phenix.indirect_billing_addresses.iba_postal_code IS 'Code postal';
COMMENT ON COLUMN phenix.indirect_billing_addresses.iba_country_code IS 'Code du pays';