CREATE TABLE phenix.indirect_billing_total_charges (
  ibt_ibh_id NUMBER(15) NOT NULL,
  ibt_charge_type VARCHAR2(3 BYTE),
  ibt_method_code VARCHAR2(4 BYTE),
  ibt_total_amount VARCHAR2(30 BYTE),
  ibt_percent_qualificatif VARCHAR2(1 BYTE),
  ibt_percent VARCHAR2(30 BYTE),
  ibt_quantity_uom VARCHAR2(2 BYTE),
  ibt_quantity VARCHAR2(30 BYTE),
  ibt_description VARCHAR2(45 BYTE),
  CONSTRAINT ibt_ibh_id_fk FOREIGN KEY (ibt_ibh_id) REFERENCES phenix.indirect_billing_headers (ibh_id)
);
COMMENT ON TABLE phenix.indirect_billing_total_charges IS 'Table contenant les détails de charge/rabais du sommaire de fichiers 810 arrivés par EDI';
COMMENT ON COLUMN phenix.indirect_billing_total_charges.ibt_ibh_id IS 'Contient la clé pour lier avec la table des entêtes';
COMMENT ON COLUMN phenix.indirect_billing_total_charges.ibt_charge_type IS 'Type de charge/rabais';
COMMENT ON COLUMN phenix.indirect_billing_total_charges.ibt_method_code IS 'Code de méthode';
COMMENT ON COLUMN phenix.indirect_billing_total_charges.ibt_total_amount IS 'Montant total de la charge/rabais';
COMMENT ON COLUMN phenix.indirect_billing_total_charges.ibt_percent_qualificatif IS 'Qualificatif du pourcentage';
COMMENT ON COLUMN phenix.indirect_billing_total_charges.ibt_percent IS 'Pourcentage';
COMMENT ON COLUMN phenix.indirect_billing_total_charges.ibt_quantity_uom IS 'UOM de la quantité';
COMMENT ON COLUMN phenix.indirect_billing_total_charges.ibt_quantity IS 'Quantité';
COMMENT ON COLUMN phenix.indirect_billing_total_charges.ibt_description IS 'Description';