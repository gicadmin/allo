CREATE TABLE phenix.indirect_billing_details (
  ibd_ibh_id NUMBER(15) NOT NULL,
  ibd_line_number NUMBER(4) NOT NULL,
  ibd_ccr_code NUMBER(5),
  ibd_quantity_invoiced VARCHAR2(30 BYTE),
  ibd_quantity_invoiced_uom VARCHAR2(2 BYTE),
  ibd_quantity_ordered VARCHAR2(30 BYTE),
  ibd_quantity_ordered_uom VARCHAR2(2 BYTE),
  ibd_list_price VARCHAR2(30 BYTE),
  ibd_net_price VARCHAR2(30 BYTE),
  ibd_seller_item_number VARCHAR2(30 BYTE),
  ibd_buyer_item_number VARCHAR2(30 BYTE),
  ibd_gtin VARCHAR2(18 BYTE),
  ibd_buyer_poh_number VARCHAR2(30 BYTE),
  ibd_buyer_pod_line_number VARCHAR2(30 BYTE),
  ibd_description VARCHAR2(45 BYTE),
  ibd_item_pack VARCHAR2(6 BYTE),
  ibd_item_size VARCHAR2(30 BYTE),
  ibd_item_uom VARCHAR2(2 BYTE),
  ibd_item_inner_pack VARCHAR2(6 BYTE),
  ibd_complete_format VARCHAR2(45 BYTE),
  ibd_weight_invoiced_in_kg VARCHAR2(30 BYTE),
  ibd_federal_tax_amount VARCHAR2(30 BYTE),
  ibd_federal_tax_rate VARCHAR2(30 BYTE),
  ibd_federal_base_amount VARCHAR2(30 BYTE),
  ibd_provincial_tax_amount VARCHAR2(30 BYTE),
  ibd_provincial_tax_rate VARCHAR2(30 BYTE),
  ibd_provincial_base_amount VARCHAR2(30 BYTE),
  ibd_tobacco_tax_amount VARCHAR2(30 BYTE),
  ibd_quantity_shorted VARCHAR2(30 BYTE),
  ibd_quantity_shorted_uom VARCHAR2(2 BYTE),
  ibd_short_reference VARCHAR2(2 BYTE),
  ibd_shorted_message VARCHAR2(30 BYTE),
  ibd_quantity_prebook_left VARCHAR2(30 BYTE),
  ibd_substitution_flag VARCHAR2(1 BYTE),
  ibd_original_product VARCHAR2(30 BYTE),
  ibd_prebook_flag VARCHAR2(1 BYTE),
  ibd_consignment_flag VARCHAR2(1 BYTE),
  CONSTRAINT ibd_ibh_id_fk FOREIGN KEY (ibd_ibh_id) REFERENCES phenix.indirect_billing_headers (ibh_id)
);
COMMENT ON TABLE phenix.indirect_billing_details IS 'Table contenant les lignes de détails de fichiers 810 arrivés par EDI';
COMMENT ON COLUMN phenix.indirect_billing_details.ibd_ibh_id IS 'Contient la clé pour lier avec la table des entêtes';
COMMENT ON COLUMN phenix.indirect_billing_details.ibd_line_number IS 'Numéro de la ligne de détails';
COMMENT ON COLUMN phenix.indirect_billing_details.ibd_ccr_code IS 'Indique le code de l''erreur rencontrée';
COMMENT ON COLUMN phenix.indirect_billing_details.ibd_quantity_invoiced IS 'Quantité facturée';
COMMENT ON COLUMN phenix.indirect_billing_details.ibd_quantity_invoiced_uom IS 'UOM de la quantité facturée';
COMMENT ON COLUMN phenix.indirect_billing_details.ibd_quantity_ordered IS 'Quantité commandée';
COMMENT ON COLUMN phenix.indirect_billing_details.ibd_quantity_ordered_uom IS 'UOM de la quantité commandée';
COMMENT ON COLUMN phenix.indirect_billing_details.ibd_list_price IS 'Prix de liste';
COMMENT ON COLUMN phenix.indirect_billing_details.ibd_net_price IS 'Prix net';
COMMENT ON COLUMN phenix.indirect_billing_details.ibd_seller_item_number IS 'Code du produit chez le vendeur';
COMMENT ON COLUMN phenix.indirect_billing_details.ibd_buyer_item_number IS 'Code du produit chez l''acheteur';
COMMENT ON COLUMN phenix.indirect_billing_details.ibd_gtin IS 'Code à barre';
COMMENT ON COLUMN phenix.indirect_billing_details.ibd_buyer_poh_number IS 'Numéro de la commande d''achat de l''acheteur';
COMMENT ON COLUMN phenix.indirect_billing_details.ibd_buyer_pod_line_number IS 'Numéro de ligne de la commande d''achat de l''acheteur';
COMMENT ON COLUMN phenix.indirect_billing_details.ibd_description IS 'Description';
COMMENT ON COLUMN phenix.indirect_billing_details.ibd_item_pack IS 'Unité du format du produit';
COMMENT ON COLUMN phenix.indirect_billing_details.ibd_item_size IS 'Taille du produit';
COMMENT ON COLUMN phenix.indirect_billing_details.ibd_item_uom IS 'UOM du produit';
COMMENT ON COLUMN phenix.indirect_billing_details.ibd_item_inner_pack IS 'Unité du format plus petit à l''intérieur du produit';
COMMENT ON COLUMN phenix.indirect_billing_details.ibd_complete_format IS 'Description complète du format du produit';
COMMENT ON COLUMN phenix.indirect_billing_details.ibd_weight_invoiced_in_kg IS 'Poids facturé en kilogrammes';
COMMENT ON COLUMN phenix.indirect_billing_details.ibd_federal_tax_amount IS 'Montant de taxe fédérale';
COMMENT ON COLUMN phenix.indirect_billing_details.ibd_federal_tax_rate IS 'Taux de taxe fédérale';
COMMENT ON COLUMN phenix.indirect_billing_details.ibd_federal_base_amount IS 'Montant de base pour appliquer la taxe fédérale';
COMMENT ON COLUMN phenix.indirect_billing_details.ibd_provincial_tax_amount IS 'Montant de taxe provinciale';
COMMENT ON COLUMN phenix.indirect_billing_details.ibd_provincial_tax_rate IS 'Taux de taxe provinciale';
COMMENT ON COLUMN phenix.indirect_billing_details.ibd_provincial_base_amount IS 'Montant de base pour appliquer la taxe provinciale';
COMMENT ON COLUMN phenix.indirect_billing_details.ibd_tobacco_tax_amount IS 'Montant de taxe tabac';
COMMENT ON COLUMN phenix.indirect_billing_details.ibd_quantity_shorted IS 'Quantité à court';
COMMENT ON COLUMN phenix.indirect_billing_details.ibd_quantity_shorted_uom IS 'UOM de la quantité à court';
COMMENT ON COLUMN phenix.indirect_billing_details.ibd_short_reference IS 'Référence de la raison à court';
COMMENT ON COLUMN phenix.indirect_billing_details.ibd_shorted_message IS 'Message de la raison à court';
COMMENT ON COLUMN phenix.indirect_billing_details.ibd_quantity_prebook_left IS 'Quantité restante au bulletin (prebook)';
COMMENT ON COLUMN phenix.indirect_billing_details.ibd_substitution_flag IS 'Indique s''il y a une substitution';
COMMENT ON COLUMN phenix.indirect_billing_details.ibd_original_product IS 'Code de produit d''origine';
COMMENT ON COLUMN phenix.indirect_billing_details.ibd_prebook_flag IS 'Indique si la ligne correspond à un bulletin (prebook)';
COMMENT ON COLUMN phenix.indirect_billing_details.ibd_consignment_flag IS 'Indique si la ligne est une consigne';