CREATE TABLE phenix.pci_customer_display_sequences (
  pcds_id NUMBER(15) NOT NULL,
  pcds_pcdl_id NUMBER(15) NOT NULL,
  pcds_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  pcds_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  pcds_sequence NUMBER(6) NOT NULL,
  CONSTRAINT pcds_pk PRIMARY KEY (pcds_id) USING INDEX (CREATE UNIQUE INDEX phenix.pcds_pk_i ON phenix.pci_customer_display_sequences(pcds_id)    ),
  CONSTRAINT pcds_uk UNIQUE (pcds_pcdl_id,pcds_prf_prd_code,pcds_prf_fmt_code) USING INDEX (CREATE UNIQUE INDEX phenix.pcds_uk_i ON phenix.pci_customer_display_sequences(pcds_pcdl_id,pcds_prf_prd_code,pcds_prf_fmt_code)    ),
  CONSTRAINT pcds_pcdl_fk FOREIGN KEY (pcds_pcdl_id) REFERENCES phenix.pci_customer_display_lists (pcdl_id),
  CONSTRAINT pcds_prf_fk FOREIGN KEY (pcds_prf_prd_code,pcds_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code)
);
COMMENT ON TABLE phenix.pci_customer_display_sequences IS 'Table du contenu des listes d''affichage servant aux clients du PCI';
COMMENT ON COLUMN phenix.pci_customer_display_sequences.pcds_id IS 'Indique l''identifiant du contenu de la liste';
COMMENT ON COLUMN phenix.pci_customer_display_sequences.pcds_pcdl_id IS 'Indique l''identifiant de la liste';
COMMENT ON COLUMN phenix.pci_customer_display_sequences.pcds_prf_prd_code IS 'Indique le code du produit lié à la liste';
COMMENT ON COLUMN phenix.pci_customer_display_sequences.pcds_prf_fmt_code IS 'Indique le code du format lié à la liste';
COMMENT ON COLUMN phenix.pci_customer_display_sequences.pcds_sequence IS 'Indique la séquence d''affichage dans la liste';