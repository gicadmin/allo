CREATE TABLE phenix.sites (
  sit_code NUMBER(10) NOT NULL,
  sit_description VARCHAR2(30 BYTE) NOT NULL,
  sit_alt_description VARCHAR2(30 BYTE),
  sit_address VARCHAR2(45 BYTE) NOT NULL,
  sit_city VARCHAR2(30 BYTE) NOT NULL,
  sit_prv_code VARCHAR2(2 BYTE) NOT NULL,
  sit_postal_code VARCHAR2(10 BYTE) NOT NULL,
  CONSTRAINT sit_pk PRIMARY KEY (sit_code),
  CONSTRAINT sit_prv_fk FOREIGN KEY (sit_prv_code) REFERENCES phenix.provinces (prv_code)
);
COMMENT ON TABLE phenix.sites IS 'Table des sites physique pour les contrats';
COMMENT ON COLUMN phenix.sites.sit_code IS 'Indique le numéro du site physique pour les contrats';
COMMENT ON COLUMN phenix.sites.sit_description IS 'Indique la description du site physique pour les contrats';
COMMENT ON COLUMN phenix.sites.sit_alt_description IS 'Indique la description alternative du site physique pour les contrats';
COMMENT ON COLUMN phenix.sites.sit_address IS 'Indique l''adresse du site physique pour les contrats';
COMMENT ON COLUMN phenix.sites.sit_city IS 'Indique la ville du site physique pour les contrats';
COMMENT ON COLUMN phenix.sites.sit_prv_code IS 'Indique le code de province du site physique pour les contrats';
COMMENT ON COLUMN phenix.sites.sit_postal_code IS 'Indique le code postal du site physique pour les contrats';