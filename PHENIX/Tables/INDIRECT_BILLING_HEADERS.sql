CREATE TABLE phenix.indirect_billing_headers (
  ibh_id NUMBER(15) NOT NULL,
  ibh_ccr_code NUMBER(5),
  ibh_ven_code VARCHAR2(35 BYTE),
  ibh_sender_qualificatif VARCHAR2(2 BYTE),
  ibh_sender_code VARCHAR2(15 BYTE),
  ibh_receiver_qualificatif VARCHAR2(2 BYTE),
  ibh_receiver_code VARCHAR2(15 BYTE),
  ibh_invoice_type VARCHAR2(2 BYTE),
  ibh_invoice_date VARCHAR2(8 BYTE),
  ibh_invoice_number VARCHAR2(16 BYTE),
  ibh_order_date VARCHAR2(8 BYTE),
  ibh_customer_order_number VARCHAR2(22 BYTE),
  ibh_shipment_ref_number VARCHAR2(30 BYTE),
  ibh_picklist_ref_number VARCHAR2(30 BYTE),
  ibh_ship_date VARCHAR2(8 BYTE),
  ibh_rebill_invoice_number VARCHAR2(30 BYTE),
  ibh_rebill_invoice_date VARCHAR2(8 BYTE),
  ibh_federal_tax_number VARCHAR2(30 BYTE),
  ibh_provincial_tax_number VARCHAR2(30 BYTE),
  ibh_tobacco_tax_number VARCHAR2(30 BYTE),
  ibh_saq_permit_number VARCHAR2(30 BYTE),
  ibh_terms_start_date VARCHAR2(8 BYTE),
  ibh_terms_discount_percent VARCHAR2(30 BYTE),
  ibh_terms_discount_days_due VARCHAR2(3 BYTE),
  ibh_terms_net_due_date VARCHAR2(3 BYTE),
  ibh_devise VARCHAR2(3 BYTE),
  ibh_invoice_due_date VARCHAR2(8 BYTE),
  ibh_note_1 VARCHAR2(60 BYTE),
  ibh_note_2 VARCHAR2(60 BYTE),
  ibh_cus_code VARCHAR2(35 BYTE),
  ibh_cus_name VARCHAR2(35 BYTE),
  ibh_is_transfered_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ibh_is_transfered_switch_ck CHECK (IBH_IS_TRANSFERED_SWITCH in (0, 1)),
  ibh_ven_code_flag VARCHAR2(2 BYTE),
  ibh_whs_member_id VARCHAR2(15 BYTE),
  ibh_whs_code VARCHAR2(2 BYTE),
  CONSTRAINT ibh_id_pk PRIMARY KEY (ibh_id)
);
COMMENT ON TABLE phenix.indirect_billing_headers IS 'Table contenant les entêtes de fichiers 810 arrivés par EDI';
COMMENT ON COLUMN phenix.indirect_billing_headers.ibh_id IS 'ID de la table';
COMMENT ON COLUMN phenix.indirect_billing_headers.ibh_ccr_code IS 'Indique le code de l''erreur rencontrée';
COMMENT ON COLUMN phenix.indirect_billing_headers.ibh_ven_code IS 'Code du fournisseur';
COMMENT ON COLUMN phenix.indirect_billing_headers.ibh_sender_qualificatif IS 'Qualificatif du code de l''envoyeur';
COMMENT ON COLUMN phenix.indirect_billing_headers.ibh_sender_code IS 'Code de l''envoyeur';
COMMENT ON COLUMN phenix.indirect_billing_headers.ibh_receiver_qualificatif IS 'Qualificatif du receveur';
COMMENT ON COLUMN phenix.indirect_billing_headers.ibh_receiver_code IS 'Code du receveur';
COMMENT ON COLUMN phenix.indirect_billing_headers.ibh_invoice_type IS 'Type de facture';
COMMENT ON COLUMN phenix.indirect_billing_headers.ibh_invoice_date IS 'Date de la facture (format YYYYMMDD)';
COMMENT ON COLUMN phenix.indirect_billing_headers.ibh_invoice_number IS 'Numéro de facture';
COMMENT ON COLUMN phenix.indirect_billing_headers.ibh_order_date IS 'Date de la commande (format YYYYMMDD)';
COMMENT ON COLUMN phenix.indirect_billing_headers.ibh_customer_order_number IS 'Numéro de la commande du client';
COMMENT ON COLUMN phenix.indirect_billing_headers.ibh_shipment_ref_number IS 'Numéro de référence de l''envoi';
COMMENT ON COLUMN phenix.indirect_billing_headers.ibh_picklist_ref_number IS 'Numéro de référence de la pick liste';
COMMENT ON COLUMN phenix.indirect_billing_headers.ibh_ship_date IS 'Date de l''envoi (format YYYYMMDD)';
COMMENT ON COLUMN phenix.indirect_billing_headers.ibh_rebill_invoice_number IS 'Numéro de refacturation';
COMMENT ON COLUMN phenix.indirect_billing_headers.ibh_rebill_invoice_date IS 'Date de refacturation (format YYYYMMDD)';
COMMENT ON COLUMN phenix.indirect_billing_headers.ibh_federal_tax_number IS 'Numéro de la taxe fédérale';
COMMENT ON COLUMN phenix.indirect_billing_headers.ibh_provincial_tax_number IS 'Numéro de la taxe provinciale';
COMMENT ON COLUMN phenix.indirect_billing_headers.ibh_tobacco_tax_number IS 'Numéro de la taxe tabac';
COMMENT ON COLUMN phenix.indirect_billing_headers.ibh_saq_permit_number IS 'Numéro de permis de la SAQ';
COMMENT ON COLUMN phenix.indirect_billing_headers.ibh_terms_start_date IS 'Date de début des termes (format YYYYMMDD)';
COMMENT ON COLUMN phenix.indirect_billing_headers.ibh_terms_discount_percent IS 'Pourcentage d''escompte des termes';
COMMENT ON COLUMN phenix.indirect_billing_headers.ibh_terms_discount_days_due IS 'Jours d''escomptes pour les termes';
COMMENT ON COLUMN phenix.indirect_billing_headers.ibh_terms_net_due_date IS 'Date des termes';
COMMENT ON COLUMN phenix.indirect_billing_headers.ibh_devise IS 'Devise';
COMMENT ON COLUMN phenix.indirect_billing_headers.ibh_invoice_due_date IS 'Date due pour la facture (format YYYYMMDD)';
COMMENT ON COLUMN phenix.indirect_billing_headers.ibh_note_1 IS 'Note';
COMMENT ON COLUMN phenix.indirect_billing_headers.ibh_note_2 IS 'Note (suite)';
COMMENT ON COLUMN phenix.indirect_billing_headers.ibh_cus_code IS 'Code du client à qui ira la facture';
COMMENT ON COLUMN phenix.indirect_billing_headers.ibh_cus_name IS 'Description du client à qui ira la facture';
COMMENT ON COLUMN phenix.indirect_billing_headers.ibh_is_transfered_switch IS 'Indique si la transaction a déjà été créer dans les VENDOR_DROP_STATEMENTS etc';
COMMENT ON COLUMN phenix.indirect_billing_headers.ibh_ven_code_flag IS 'Indique le type d''information (code de fournisseur ou numéro DUNS) se retrouvant dans le champs IBH_VEN_CODE';
COMMENT ON COLUMN phenix.indirect_billing_headers.ibh_whs_member_id IS 'Indique le numéro de membre tel que lu dans le fichier EDI';
COMMENT ON COLUMN phenix.indirect_billing_headers.ibh_whs_code IS 'Indique l''entrepôt concerné par cette facture';