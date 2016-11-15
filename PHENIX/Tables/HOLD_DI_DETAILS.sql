CREATE TABLE phenix.hold_di_details (
  hdd_hdh_id NUMBER(15) NOT NULL,
  hdd_sequence NUMBER(6) NOT NULL,
  hdd_ccr_code NUMBER(5),
  hdd_prd_code VARCHAR2(10 BYTE),
  hdd_purch_vpd_code VARCHAR2(15 BYTE),
  hdd_upc_code VARCHAR2(18 BYTE),
  hdd_purchase_order_number NUMBER(15),
  hdd_purchase_line_number NUMBER(4),
  hdd_provincial_tax_rate NUMBER(6,3),
  hdd_federal_tax_rate NUMBER(6,3),
  hdd_list_price NUMBER(7,2),
  hdd_promotion_amount NUMBER(6,2),
  hdd_consignment_price NUMBER(7,2),
  hdd_invoiced_quantity NUMBER(7),
  hdd_invoiced_weight NUMBER(9,3),
  hdd_prebook_switch NUMBER(1),
  hdd_prd_description VARCHAR2(45 BYTE),
  hdd_shorted_quantity NUMBER(7),
  hdd_shorted_code VARCHAR2(2 BYTE),
  hdd_shorted_message VARCHAR2(30 BYTE),
  hdd_prebook_quantity_left NUMBER(7),
  hdd_substitution_switch NUMBER(1),
  hdd_original_vpd_code VARCHAR2(15 BYTE),
  CONSTRAINT hdd_hdh_id_fk FOREIGN KEY (hdd_hdh_id) REFERENCES phenix.hold_di_headers (hdh_id)
);
COMMENT ON TABLE phenix.hold_di_details IS 'Contient les lignes de factures reçues par EDI qui sont en train d''entrer dans le système mais on peut-être encore des erreurs.';
COMMENT ON COLUMN phenix.hold_di_details.hdd_hdh_id IS 'Indique le ID de la transaction d''entête (numéro séquentiel interne)';
COMMENT ON COLUMN phenix.hold_di_details.hdd_sequence IS 'Indique le numéro de ligne dans la facture';
COMMENT ON COLUMN phenix.hold_di_details.hdd_ccr_code IS 'Indique le code de l''erreur rencontrée';
COMMENT ON COLUMN phenix.hold_di_details.hdd_prd_code IS 'Indique le code du produit à l''interne concerné par cette ligne';
COMMENT ON COLUMN phenix.hold_di_details.hdd_purch_vpd_code IS 'Indique le code du produit fournisseur concerné par cette ligne';
COMMENT ON COLUMN phenix.hold_di_details.hdd_upc_code IS 'Indique le code UPC du produit concerné par cette ligne';
COMMENT ON COLUMN phenix.hold_di_details.hdd_purchase_order_number IS 'Indique le numéro de la commande d''achat initial';
COMMENT ON COLUMN phenix.hold_di_details.hdd_purchase_line_number IS 'Indique le numéro de ligne de la commande d''achat initiale';
COMMENT ON COLUMN phenix.hold_di_details.hdd_provincial_tax_rate IS 'Indique le taux de taxe provincial appliqué sur la ligne en cours';
COMMENT ON COLUMN phenix.hold_di_details.hdd_federal_tax_rate IS 'Indique le taux de taxe fédéral appliqué sur la ligne en cours';
COMMENT ON COLUMN phenix.hold_di_details.hdd_list_price IS 'Indique le prix de liste du produit';
COMMENT ON COLUMN phenix.hold_di_details.hdd_promotion_amount IS 'Indique le montant de promotion donné sur la ligne';
COMMENT ON COLUMN phenix.hold_di_details.hdd_consignment_price IS 'Indique le prix des consignes sur la ligne';
COMMENT ON COLUMN phenix.hold_di_details.hdd_invoiced_quantity IS 'Indique la quantité facturée';
COMMENT ON COLUMN phenix.hold_di_details.hdd_invoiced_weight IS 'Indique le poids facturé';
COMMENT ON COLUMN phenix.hold_di_details.hdd_prebook_switch IS 'Indique si la ligne était une ligne de bulletin';
COMMENT ON COLUMN phenix.hold_di_details.hdd_prd_description IS 'Indique la description du produit';
COMMENT ON COLUMN phenix.hold_di_details.hdd_shorted_quantity IS 'Indique la quantité à court du produit';
COMMENT ON COLUMN phenix.hold_di_details.hdd_shorted_code IS 'Indique le code de la raison à court';
COMMENT ON COLUMN phenix.hold_di_details.hdd_shorted_message IS 'Indique le message à court';
COMMENT ON COLUMN phenix.hold_di_details.hdd_prebook_quantity_left IS 'Indique la quantité restante en bulletin';
COMMENT ON COLUMN phenix.hold_di_details.hdd_substitution_switch IS 'Indique si le produit a été substitué';
COMMENT ON COLUMN phenix.hold_di_details.hdd_original_vpd_code IS 'Indique le produit fournisseur original qui avait été commandé';