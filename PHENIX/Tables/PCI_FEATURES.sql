CREATE TABLE phenix.pci_features (
  pfe_code VARCHAR2(50 BYTE) NOT NULL,
  pfe_name VARCHAR2(30 BYTE) NOT NULL,
  pfe_alt_name VARCHAR2(30 BYTE),
  pfe_description VARCHAR2(200 BYTE) NOT NULL,
  pfe_alt_description VARCHAR2(200 BYTE),
  pfe_active_switch NUMBER(1) DEFAULT (0) NOT NULL CONSTRAINT pfe_active_switch_ck CHECK (PFE_ACTIVE_SWITCH IN (0, 1)),
  pfe_default_value_switch NUMBER(1) DEFAULT (0) NOT NULL CONSTRAINT pfe_default_value_switch_ck CHECK (PFE_DEFAULT_VALUE_SWITCH IN (0, 1)),
  pfe_creation_date DATE DEFAULT SYSDATE NOT NULL,
  pfe_modification_date DATE DEFAULT SYSDATE NOT NULL,
  CONSTRAINT pfe_pk PRIMARY KEY (pfe_code) USING INDEX (CREATE UNIQUE INDEX phenix.pfe_pk_i ON phenix.pci_features(pfe_code)    )
);
COMMENT ON TABLE phenix.pci_features IS 'Table des fonctionnalitées dans PCI';
COMMENT ON COLUMN phenix.pci_features.pfe_code IS 'Indique l''identifiant unique';
COMMENT ON COLUMN phenix.pci_features.pfe_name IS 'Indique le nom de la fonctionnalité';
COMMENT ON COLUMN phenix.pci_features.pfe_alt_name IS 'Indique le nom alternatif du role ';
COMMENT ON COLUMN phenix.pci_features.pfe_description IS 'Indique le nom alternatif de la fonctionnalité ';
COMMENT ON COLUMN phenix.pci_features.pfe_alt_description IS 'Indique la description alternative ';
COMMENT ON COLUMN phenix.pci_features.pfe_active_switch IS 'Indique si la fonctionnalité est active ';
COMMENT ON COLUMN phenix.pci_features.pfe_default_value_switch IS 'Indique la fonctionnalité est active par defaut ';
COMMENT ON COLUMN phenix.pci_features.pfe_creation_date IS 'Indique la date de creation';
COMMENT ON COLUMN phenix.pci_features.pfe_modification_date IS 'Indique la date de modification';