CREATE TABLE phenix.pci_user_vendors (
  puv_pus_id NUMBER(15) NOT NULL,
  puv_ven_code NUMBER(5) NOT NULL,
  puv_pcro_id NUMBER(15) NOT NULL,
  CONSTRAINT puv_pk PRIMARY KEY (puv_pus_id,puv_ven_code) USING INDEX (CREATE UNIQUE INDEX phenix.puv_pk_i ON phenix.pci_user_vendors(puv_pus_id,puv_ven_code)    ),
  CONSTRAINT puv_pcro_fk FOREIGN KEY (puv_pcro_id) REFERENCES phenix.pci_roles (pcro_id),
  CONSTRAINT puv_pus_fk FOREIGN KEY (puv_pus_id) REFERENCES phenix.pci_users (pus_id) ON DELETE CASCADE,
  CONSTRAINT puv_ven_fk FOREIGN KEY (puv_ven_code) REFERENCES phenix.vendors (ven_code) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.pci_user_vendors IS 'Table des clients utilisateurs de PCI';
COMMENT ON COLUMN phenix.pci_user_vendors.puv_pus_id IS 'Indique l''identifiant de l''utilisateur';
COMMENT ON COLUMN phenix.pci_user_vendors.puv_ven_code IS 'Indique le code du vendeur ';
COMMENT ON COLUMN phenix.pci_user_vendors.puv_pcro_id IS 'Indique l''identifiant du role';