CREATE TABLE phenix.hold_asn_details (
  had_hah_id NUMBER(15) NOT NULL,
  had_sequence NUMBER(6) NOT NULL,
  had_ccr_code NUMBER(5),
  had_palette_number VARCHAR2(10 BYTE),
  had_prd_code VARCHAR2(10 BYTE),
  had_purch_vpd_code VARCHAR2(15 BYTE),
  had_manuf_vpd_code VARCHAR2(15 BYTE),
  had_original_prd_code VARCHAR2(10 BYTE),
  had_upc_code VARCHAR2(18 BYTE),
  had_prd_description VARCHAR2(45 BYTE),
  had_purchase_order_number NUMBER(15),
  had_purchase_line_number NUMBER(4),
  had_shipment_quantity NUMBER(7),
  had_shipment_weight NUMBER(9,3),
  had_substitution_switch NUMBER(1),
  CONSTRAINT had_hah_id_fk FOREIGN KEY (had_hah_id) REFERENCES phenix.hold_asn_headers (hah_id)
);
COMMENT ON TABLE phenix.hold_asn_details IS 'Contient les lignes de réception reçues par EDI qui sont en train d''entrer dans le système mais on peut-être encore des erreurs.';
COMMENT ON COLUMN phenix.hold_asn_details.had_hah_id IS 'Indique le ID de la transaction d''entête (numéro séquentiel interne)';
COMMENT ON COLUMN phenix.hold_asn_details.had_sequence IS 'Indique le numéro de la ligne de réception';
COMMENT ON COLUMN phenix.hold_asn_details.had_ccr_code IS 'Indique le code de l''erreur rencontrée';
COMMENT ON COLUMN phenix.hold_asn_details.had_palette_number IS 'Indique le numéro de la palette';
COMMENT ON COLUMN phenix.hold_asn_details.had_prd_code IS 'Indique le code du produit à l''interne concerné par cette ligne';
COMMENT ON COLUMN phenix.hold_asn_details.had_purch_vpd_code IS 'Indique le code du produit fournisseur concerné par cette ligne';
COMMENT ON COLUMN phenix.hold_asn_details.had_manuf_vpd_code IS 'Indique le code du produit manufacturier concerné par cette ligne';
COMMENT ON COLUMN phenix.hold_asn_details.had_original_prd_code IS 'Indique le produit original qui avait été commandé mais a été remplacé';
COMMENT ON COLUMN phenix.hold_asn_details.had_upc_code IS 'Indique le code UPC du produit concerné par cette ligne';
COMMENT ON COLUMN phenix.hold_asn_details.had_prd_description IS 'Indique la description du produit lu dant le fichier EDI';
COMMENT ON COLUMN phenix.hold_asn_details.had_purchase_order_number IS 'Indique le numéro de la commande d''achat initial';
COMMENT ON COLUMN phenix.hold_asn_details.had_purchase_line_number IS 'Indique le numéro de ligne de la commande d''achat initiale';
COMMENT ON COLUMN phenix.hold_asn_details.had_shipment_quantity IS 'Indique la quantité envoyée';
COMMENT ON COLUMN phenix.hold_asn_details.had_shipment_weight IS 'Indique le poids envoyé';
COMMENT ON COLUMN phenix.hold_asn_details.had_substitution_switch IS 'Indique si le produit a été substitué';