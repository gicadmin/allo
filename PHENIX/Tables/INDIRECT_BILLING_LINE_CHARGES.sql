CREATE TABLE phenix.indirect_billing_line_charges (
  ibl_ibd_ibh_id NUMBER(15) NOT NULL,
  ibl_ibd_line_number NUMBER(4) NOT NULL,
  ibl_charge_type VARCHAR2(3 BYTE),
  ibl_method_code VARCHAR2(4 BYTE),
  ibl_total_amount VARCHAR2(30 BYTE),
  ibl_percent_qualificatif VARCHAR2(1 BYTE),
  ibl_percent VARCHAR2(30 BYTE),
  ibl_quantity_uom VARCHAR2(2 BYTE),
  ibl_quantity VARCHAR2(30 BYTE),
  ibl_description VARCHAR2(45 BYTE),
  CONSTRAINT ibl_ibd_ibh_id_fk FOREIGN KEY (ibl_ibd_ibh_id) REFERENCES phenix.indirect_billing_headers (ibh_id)
);
COMMENT ON TABLE phenix.indirect_billing_line_charges IS 'Table contenant les détails de charge/rabais des lignes de fichiers 810 arrivés par EDI';
COMMENT ON COLUMN phenix.indirect_billing_line_charges.ibl_ibd_ibh_id IS 'Contient la clé pour lier avec la table des entêtes';
COMMENT ON COLUMN phenix.indirect_billing_line_charges.ibl_ibd_line_number IS 'Contient la clé pour référencer au numéro de la ligne de détails';
COMMENT ON COLUMN phenix.indirect_billing_line_charges.ibl_charge_type IS 'Type de charge/rabais';
COMMENT ON COLUMN phenix.indirect_billing_line_charges.ibl_method_code IS 'Code de méthode';
COMMENT ON COLUMN phenix.indirect_billing_line_charges.ibl_total_amount IS 'Montant total de la charge/rabais';
COMMENT ON COLUMN phenix.indirect_billing_line_charges.ibl_percent_qualificatif IS 'Qualificatif du pourcentage';
COMMENT ON COLUMN phenix.indirect_billing_line_charges.ibl_percent IS 'Pourcentage';
COMMENT ON COLUMN phenix.indirect_billing_line_charges.ibl_quantity_uom IS 'UOM de la quantité';
COMMENT ON COLUMN phenix.indirect_billing_line_charges.ibl_quantity IS 'Quantité';
COMMENT ON COLUMN phenix.indirect_billing_line_charges.ibl_description IS 'Description';