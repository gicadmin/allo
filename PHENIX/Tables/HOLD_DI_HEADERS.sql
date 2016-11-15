CREATE TABLE phenix.hold_di_headers (
  hdh_id NUMBER(15) NOT NULL,
  hdh_ccr_code NUMBER(5),
  hdh_purch_ven_code NUMBER(5),
  hdh_purch_vendor_code VARCHAR2(15 BYTE),
  hdh_to_pay_ven_code NUMBER(5),
  hdh_to_pay_vendor_code VARCHAR2(15 BYTE),
  hdh_input_date VARCHAR2(8 BYTE),
  hdh_date DATE,
  hdh_reference_number VARCHAR2(22 BYTE),
  hdh_message VARCHAR2(100 BYTE),
  hdh_federal_tax_total NUMBER(8,2),
  hdh_provincial_tax_total NUMBER(8,2),
  hdh_transport_cost NUMBER(7,2),
  hdh_purchase_total NUMBER(8,2),
  hdh_indirect_delivery_switch NUMBER(1) DEFAULT 0 NOT NULL,
  hdh_po_number NUMBER(15),
  hdh_whs_member_id VARCHAR2(15 BYTE),
  hdh_whs_code VARCHAR2(2 BYTE),
  hdh_original_rebill_number VARCHAR2(22 BYTE),
  CONSTRAINT hdh_id_pk PRIMARY KEY (hdh_id)
);
COMMENT ON TABLE phenix.hold_di_headers IS 'Contient les factures reçues par EDI qui sont en train d''entrer dans le système mais on peut-être encore des erreurs.';
COMMENT ON COLUMN phenix.hold_di_headers.hdh_id IS 'Indique le ID de la transaction (numéro séquentiel interne)';
COMMENT ON COLUMN phenix.hold_di_headers.hdh_ccr_code IS 'Indique le code de l''erreur rencontrée';
COMMENT ON COLUMN phenix.hold_di_headers.hdh_purch_ven_code IS 'Indique le code du fournisseur à l''achat';
COMMENT ON COLUMN phenix.hold_di_headers.hdh_purch_vendor_code IS 'Indique le code du fournisseur à l''achat tel que lu dans le fichier';
COMMENT ON COLUMN phenix.hold_di_headers.hdh_to_pay_ven_code IS 'Indique le code du fournisseur à payer';
COMMENT ON COLUMN phenix.hold_di_headers.hdh_to_pay_vendor_code IS 'Indique le code du fournisseur à payer tel que lu dans le fichier';
COMMENT ON COLUMN phenix.hold_di_headers.hdh_input_date IS 'Indique la date de facturation telle que lu dans le fichier';
COMMENT ON COLUMN phenix.hold_di_headers.hdh_date IS 'Indique la date de facturation';
COMMENT ON COLUMN phenix.hold_di_headers.hdh_reference_number IS 'Indique le numéro de référence de la facture';
COMMENT ON COLUMN phenix.hold_di_headers.hdh_message IS 'Indique le message associé à la facture';
COMMENT ON COLUMN phenix.hold_di_headers.hdh_federal_tax_total IS 'Indique le total de la taxe fédérale appliquée sur la facture';
COMMENT ON COLUMN phenix.hold_di_headers.hdh_provincial_tax_total IS 'Indique le total de la taxe provinciale appliquée sur la facture';
COMMENT ON COLUMN phenix.hold_di_headers.hdh_transport_cost IS 'Indique le prix du transport appliqué sur la facture';
COMMENT ON COLUMN phenix.hold_di_headers.hdh_purchase_total IS 'Indique le prix total de la facture (avant les taxes et le transport)';
COMMENT ON COLUMN phenix.hold_di_headers.hdh_indirect_delivery_switch IS 'Indique si la facture est pour une livraison indirecte';
COMMENT ON COLUMN phenix.hold_di_headers.hdh_po_number IS 'Indique le numéro de le commande d''achat concerné lors des factures indirectes';
COMMENT ON COLUMN phenix.hold_di_headers.hdh_whs_member_id IS 'Indique le numéro de membre tel que lu dans le fichier EDI';
COMMENT ON COLUMN phenix.hold_di_headers.hdh_whs_code IS 'Indique l''entrepôt concerné par cette facture';
COMMENT ON COLUMN phenix.hold_di_headers.hdh_original_rebill_number IS 'Indique le numéro de facture original du fournisseur';