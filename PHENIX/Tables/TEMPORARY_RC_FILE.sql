CREATE TABLE phenix.temporary_rc_file (
  trc_po_number VARCHAR2(15 BYTE),
  trc_line_number NUMBER(15),
  trc_product_code VARCHAR2(10 BYTE),
  trc_vendor_code NUMBER(10),
  trc_asn_source VARCHAR2(1 BYTE),
  trc_completion_code VARCHAR2(1 BYTE),
  trc_date_received DATE,
  trc_expected_quantity NUMBER(10,3),
  trc_expected_weight NUMBER(8,3),
  trc_received_quantity NUMBER(10,3),
  trc_received_weight NUMBER(8,3),
  trc_transaction_type VARCHAR2(1 BYTE)
);
COMMENT ON TABLE phenix.temporary_rc_file IS 'Table temporaire qui contient les confimations des réceptions';
COMMENT ON COLUMN phenix.temporary_rc_file.trc_po_number IS 'Numéro de la commande d''achat';
COMMENT ON COLUMN phenix.temporary_rc_file.trc_line_number IS 'Numéro de ligne';
COMMENT ON COLUMN phenix.temporary_rc_file.trc_product_code IS 'Code produit';
COMMENT ON COLUMN phenix.temporary_rc_file.trc_vendor_code IS 'Code fournisseur';
COMMENT ON COLUMN phenix.temporary_rc_file.trc_asn_source IS 'Source de la notice pré-livraison';
COMMENT ON COLUMN phenix.temporary_rc_file.trc_completion_code IS 'Code d''achèvement';
COMMENT ON COLUMN phenix.temporary_rc_file.trc_date_received IS 'Date reçu';
COMMENT ON COLUMN phenix.temporary_rc_file.trc_expected_quantity IS 'Quantité attendue';
COMMENT ON COLUMN phenix.temporary_rc_file.trc_expected_weight IS 'Poids attendu';
COMMENT ON COLUMN phenix.temporary_rc_file.trc_received_quantity IS 'Quantité reçue';
COMMENT ON COLUMN phenix.temporary_rc_file.trc_received_weight IS 'Poids reçu';
COMMENT ON COLUMN phenix.temporary_rc_file.trc_transaction_type IS 'Type de transaction';