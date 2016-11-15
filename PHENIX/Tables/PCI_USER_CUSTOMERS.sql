CREATE TABLE phenix.pci_user_customers (
  puc_pus_id NUMBER(15) NOT NULL,
  puc_cus_code NUMBER(10) NOT NULL,
  puc_pcro_id NUMBER(15) NOT NULL,
  CONSTRAINT puc_pk PRIMARY KEY (puc_pus_id,puc_cus_code) USING INDEX (CREATE UNIQUE INDEX phenix.puc_pk_i ON phenix.pci_user_customers(puc_pus_id,puc_cus_code)    ),
  CONSTRAINT puc_cus_fk FOREIGN KEY (puc_cus_code) REFERENCES phenix.customers (cus_code) ON DELETE CASCADE,
  CONSTRAINT puc_pcro_fk FOREIGN KEY (puc_pcro_id) REFERENCES phenix.pci_roles (pcro_id),
  CONSTRAINT puc_pus_fk FOREIGN KEY (puc_pus_id) REFERENCES phenix.pci_users (pus_id) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.pci_user_customers IS 'Table des clients utilisateurs de PCI';
COMMENT ON COLUMN phenix.pci_user_customers.puc_pus_id IS 'Indique l''identifiant de l''utilisateur';
COMMENT ON COLUMN phenix.pci_user_customers.puc_cus_code IS 'Indique le code du client ';
COMMENT ON COLUMN phenix.pci_user_customers.puc_pcro_id IS 'Indique l''identifiant du role';