CREATE TABLE phenix.edi_ni_rejects (
  enr_session_id VARCHAR2(200 BYTE),
  enr_cus_code NUMBER(10),
  enr_order_date DATE,
  enr_reference_number VARCHAR2(15 BYTE),
  enr_seller_prd_ref_number VARCHAR2(15 BYTE),
  enr_upc_code VARCHAR2(18 BYTE),
  enr_invoiced_quantity NUMBER(7),
  enr_customer_order_number VARCHAR2(15 BYTE),
  enr_ccr_code NUMBER(5),
  enr_store_num VARCHAR2(10 BYTE),
  enr_partner_id NUMBER(10),
  enr_error_message VARCHAR2(200 BYTE),
  enr_line_number NUMBER(4),
  enr_creation_date DATE DEFAULT SYSDATE NOT NULL
);
COMMENT ON COLUMN phenix.edi_ni_rejects.enr_session_id IS 'Indique le id de la session';
COMMENT ON COLUMN phenix.edi_ni_rejects.enr_cus_code IS 'Indique le code du client, utilisé pour mettre à jour les tables COH, PLH, INH';
COMMENT ON COLUMN phenix.edi_ni_rejects.enr_order_date IS 'Indique la date de la commande client';
COMMENT ON COLUMN phenix.edi_ni_rejects.enr_reference_number IS 'Indique le numéro de référence de la facture partenaire';
COMMENT ON COLUMN phenix.edi_ni_rejects.enr_seller_prd_ref_number IS 'Indique le code de produit du partenaire';
COMMENT ON COLUMN phenix.edi_ni_rejects.enr_upc_code IS 'Indique le code UPC';
COMMENT ON COLUMN phenix.edi_ni_rejects.enr_invoiced_quantity IS 'Indique la quantité facturée';
COMMENT ON COLUMN phenix.edi_ni_rejects.enr_customer_order_number IS 'Indique le numéro de commande du client';
COMMENT ON COLUMN phenix.edi_ni_rejects.enr_ccr_code IS 'Indique le code d''erreur';
COMMENT ON COLUMN phenix.edi_ni_rejects.enr_store_num IS 'Indique le numéro du magasin à l''intérieur d''une chaîne, ou le numéro de client chez le partenaire';
COMMENT ON COLUMN phenix.edi_ni_rejects.enr_partner_id IS 'Indique l''identification du partenaire d''affaire pour l''interface. utiliser pour envoyer le rapport de rejet';
COMMENT ON COLUMN phenix.edi_ni_rejects.enr_error_message IS 'Indique le message d''erreur';
COMMENT ON COLUMN phenix.edi_ni_rejects.enr_line_number IS 'Indique le numéro de ligne';