CREATE TABLE phenix.pci_roles (
  pcro_id NUMBER(15) NOT NULL,
  pcro_pcro_id NUMBER(15),
  pcro_name VARCHAR2(30 BYTE) NOT NULL,
  pcro_alt_name VARCHAR2(30 BYTE),
  pcro_active_switch NUMBER(1) NOT NULL CONSTRAINT pcro_active_switch_ck CHECK (PCRO_ACTIVE_SWITCH IN (0, 1)),
  pcro_master_role_switch NUMBER(1) NOT NULL CONSTRAINT pcro_master_role_switch_ck CHECK (PCRO_MASTER_ROLE_SWITCH IN (0, 1)),
  pcro_owned_by_cus_code NUMBER(10),
  pcro_creation_date DATE DEFAULT SYSDATE NOT NULL,
  pcro_modification_date DATE DEFAULT SYSDATE NOT NULL,
  CONSTRAINT pcro_pk PRIMARY KEY (pcro_id) USING INDEX (CREATE UNIQUE INDEX phenix.pcro_pk_i ON phenix.pci_roles(pcro_id)    ),
  CONSTRAINT pcro_owned_by_cus_fk FOREIGN KEY (pcro_owned_by_cus_code) REFERENCES phenix.customers (cus_code) ON DELETE CASCADE,
  CONSTRAINT pcro_pcro_fk FOREIGN KEY (pcro_pcro_id) REFERENCES phenix.pci_roles (pcro_id)
);
COMMENT ON TABLE phenix.pci_roles IS 'Table des rôles dans PCI';
COMMENT ON COLUMN phenix.pci_roles.pcro_id IS 'Indique l''identifiant unique';
COMMENT ON COLUMN phenix.pci_roles.pcro_pcro_id IS 'Indique l''identifiant du role parent';
COMMENT ON COLUMN phenix.pci_roles.pcro_name IS 'Indique le nom du role';
COMMENT ON COLUMN phenix.pci_roles.pcro_alt_name IS 'Indique le nom alternatif du role ';
COMMENT ON COLUMN phenix.pci_roles.pcro_active_switch IS 'Indique le role est actif ';
COMMENT ON COLUMN phenix.pci_roles.pcro_master_role_switch IS 'Indique le numero de série du produit ';
COMMENT ON COLUMN phenix.pci_roles.pcro_owned_by_cus_code IS 'Indique le code du client qui a cree le role ';
COMMENT ON COLUMN phenix.pci_roles.pcro_creation_date IS 'Indique la date de creation';
COMMENT ON COLUMN phenix.pci_roles.pcro_modification_date IS 'Indique la date de modification';