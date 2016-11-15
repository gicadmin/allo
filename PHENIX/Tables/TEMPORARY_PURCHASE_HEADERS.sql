CREATE TABLE phenix.temporary_purchase_headers (
  tph_poh_expected_recep_date DATE,
  tph_poh_id NUMBER(15),
  tph_poh_order_date DATE,
  tph_poh_use_code NUMBER(5),
  tph_poh_ven_purchase_code NUMBER(5),
  tph_poh_ven_sent_by VARCHAR2(3 BYTE),
  tph_poh_ven_to_pay_code NUMBER(5)
);
COMMENT ON TABLE phenix.temporary_purchase_headers IS 'Table temporaire des entête de commande d''achat';
COMMENT ON COLUMN phenix.temporary_purchase_headers.tph_poh_expected_recep_date IS 'Date de réception attendue';
COMMENT ON COLUMN phenix.temporary_purchase_headers.tph_poh_id IS 'Numéro de la commande d''achat';
COMMENT ON COLUMN phenix.temporary_purchase_headers.tph_poh_order_date IS 'Date de commande';
COMMENT ON COLUMN phenix.temporary_purchase_headers.tph_poh_use_code IS 'Numéro de l''usager (Acheteur)';
COMMENT ON COLUMN phenix.temporary_purchase_headers.tph_poh_ven_purchase_code IS 'Numéro du fournisseur à l''achat';
COMMENT ON COLUMN phenix.temporary_purchase_headers.tph_poh_ven_sent_by IS 'Indique ou l''information a été envoyé';
COMMENT ON COLUMN phenix.temporary_purchase_headers.tph_poh_ven_to_pay_code IS 'Fournisseur payable';