CREATE TABLE phenix.pci_customer_display_lists (
  pcdl_id NUMBER(15) NOT NULL,
  pcdl_description VARCHAR2(30 BYTE) NOT NULL,
  pcdl_alt_description VARCHAR2(30 BYTE),
  pcdl_cus_code NUMBER(10) NOT NULL,
  CONSTRAINT pcdl_pk PRIMARY KEY (pcdl_id) USING INDEX (CREATE UNIQUE INDEX phenix.pcdl_pk_i ON phenix.pci_customer_display_lists(pcdl_id)    ),
  CONSTRAINT pcdl_cus_fk FOREIGN KEY (pcdl_cus_code) REFERENCES phenix.customers (cus_code) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.pci_customer_display_lists IS 'Table des listes d''affichage servant aux clients du PCI';
COMMENT ON COLUMN phenix.pci_customer_display_lists.pcdl_id IS 'Indique l''identifiant de la liste';
COMMENT ON COLUMN phenix.pci_customer_display_lists.pcdl_description IS 'Indique la description de la liste';
COMMENT ON COLUMN phenix.pci_customer_display_lists.pcdl_alt_description IS 'Indique la description alternative de la liste';
COMMENT ON COLUMN phenix.pci_customer_display_lists.pcdl_cus_code IS 'Indique à quel client la liste appartient';