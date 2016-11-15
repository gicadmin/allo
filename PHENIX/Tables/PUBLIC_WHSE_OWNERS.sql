CREATE TABLE phenix.public_whse_owners (
  pwo_code VARCHAR2(10 BYTE) NOT NULL,
  pwo_name VARCHAR2(30 BYTE) NOT NULL,
  pwo_alt_name VARCHAR2(30 BYTE),
  pwo_address VARCHAR2(45 BYTE) NOT NULL,
  pwo_city VARCHAR2(30 BYTE) NOT NULL,
  pwo_prv_code VARCHAR2(2 BYTE) NOT NULL,
  pwo_postal_code VARCHAR2(10 BYTE) NOT NULL,
  pwo_telephone NUMBER(11),
  pwo_fax NUMBER(11),
  pwo_edi_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT pwo_edi_switch_ck CHECK (PWO_EDI_SWITCH IN (0,1)),
  pwo_enterprise_identification VARCHAR2(15 BYTE),
  CONSTRAINT pwo_pk PRIMARY KEY (pwo_code),
  CONSTRAINT pwo_prv_fk FOREIGN KEY (pwo_prv_code) REFERENCES phenix.provinces (prv_code)
);
COMMENT ON COLUMN phenix.public_whse_owners.pwo_code IS 'Indique le code du propriétaire de la marchandise multi entreposée';
COMMENT ON COLUMN phenix.public_whse_owners.pwo_name IS 'Indique le nom du propriétaire de la marchandise multi entreposée';
COMMENT ON COLUMN phenix.public_whse_owners.pwo_alt_name IS 'Indique le nom alternatif du propriétaire de la marchandise multi entreposée';
COMMENT ON COLUMN phenix.public_whse_owners.pwo_address IS 'Indique l''adresse du propriétaire de la marchandise multi entreposée';
COMMENT ON COLUMN phenix.public_whse_owners.pwo_city IS 'Indique la ville du propriétaire de la marchandise multi entreposée';
COMMENT ON COLUMN phenix.public_whse_owners.pwo_prv_code IS 'Indique le code de la province du propriétaire de la marchandise multi entreposée';
COMMENT ON COLUMN phenix.public_whse_owners.pwo_postal_code IS 'Indique le code postal du propriétaire de la marchandise multi entreposée';
COMMENT ON COLUMN phenix.public_whse_owners.pwo_telephone IS 'Indique le numéro de téléphone du propriétaire de la marchandise multi entreposée';
COMMENT ON COLUMN phenix.public_whse_owners.pwo_fax IS 'Indique le numéro de télécopieur du propriétaire de la marchandise multi entreposée';
COMMENT ON COLUMN phenix.public_whse_owners.pwo_edi_switch IS 'Indique s''il y a des interface EDI avec ce propriétaire';
COMMENT ON COLUMN phenix.public_whse_owners.pwo_enterprise_identification IS 'Indique le numéro d''identification de notre entreprise chez le propriétaire';