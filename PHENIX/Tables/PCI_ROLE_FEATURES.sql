CREATE TABLE phenix.pci_role_features (
  pcrf_pfe_code VARCHAR2(50 BYTE) NOT NULL,
  pcrf_pcro_id NUMBER(15) NOT NULL,
  CONSTRAINT pcrf_pk PRIMARY KEY (pcrf_pfe_code,pcrf_pcro_id) USING INDEX (CREATE UNIQUE INDEX phenix.pcrf_pk_i ON phenix.pci_role_features(pcrf_pfe_code,pcrf_pcro_id)    ),
  CONSTRAINT pcrf_pcro_fk FOREIGN KEY (pcrf_pcro_id) REFERENCES phenix.pci_roles (pcro_id),
  CONSTRAINT pcrf_pfe_fk FOREIGN KEY (pcrf_pfe_code) REFERENCES phenix.pci_features (pfe_code)
);
COMMENT ON TABLE phenix.pci_role_features IS 'Table des roles et fonctionnalité dans PCI';
COMMENT ON COLUMN phenix.pci_role_features.pcrf_pfe_code IS 'Indique l''identifiant de la fonctionnalite';
COMMENT ON COLUMN phenix.pci_role_features.pcrf_pcro_id IS 'Indique l''identifiant du role ';