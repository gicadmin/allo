CREATE TABLE phenix.validate_customer_drops (
  vcd_broker_vendor_id VARCHAR2(10 BYTE),
  vcd_vendor_name VARCHAR2(30 BYTE),
  vcd_statement_number VARCHAR2(16 BYTE),
  vcd_statement_date VARCHAR2(8 BYTE),
  vcd_drop_reference VARCHAR2(15 BYTE),
  vcd_drop_customer VARCHAR2(12 BYTE),
  vcd_drop_date VARCHAR2(8 BYTE),
  vcd_federal_tax_amount VARCHAR2(7 BYTE),
  vcd_provincial_tax_amount VARCHAR2(7 BYTE),
  vcd_transaction_amount VARCHAR2(9 BYTE),
  vcd_statment_total VARCHAR2(8 BYTE),
  vcd_ccr_code NUMBER(5),
  vcd_cds_rcl_id VARCHAR2(6 BYTE),
  vcd_whs_member_id VARCHAR2(15 BYTE),
  vcd_whs_code VARCHAR2(2 BYTE),
  CONSTRAINT vcd_ccr_fk FOREIGN KEY (vcd_ccr_code) REFERENCES phenix.error_codes (ccr_code)
);
COMMENT ON TABLE phenix.validate_customer_drops IS 'Contient les informations temporaires pour les commandes clients drops';
COMMENT ON COLUMN phenix.validate_customer_drops.vcd_broker_vendor_id IS 'Identifiant du fournisseur';
COMMENT ON COLUMN phenix.validate_customer_drops.vcd_vendor_name IS 'Nom du fournisseur';
COMMENT ON COLUMN phenix.validate_customer_drops.vcd_statement_number IS 'Date de la déclaration';
COMMENT ON COLUMN phenix.validate_customer_drops.vcd_statement_date IS 'Date de la déclaration';
COMMENT ON COLUMN phenix.validate_customer_drops.vcd_drop_reference IS 'Numéro de référence de la transaction';
COMMENT ON COLUMN phenix.validate_customer_drops.vcd_drop_customer IS 'Numéro du client';
COMMENT ON COLUMN phenix.validate_customer_drops.vcd_drop_date IS 'Date de la transaction';
COMMENT ON COLUMN phenix.validate_customer_drops.vcd_federal_tax_amount IS 'Montant de la taxe fédérale';
COMMENT ON COLUMN phenix.validate_customer_drops.vcd_provincial_tax_amount IS 'Montant de la taxe provinciale';
COMMENT ON COLUMN phenix.validate_customer_drops.vcd_transaction_amount IS 'Montant de la transaction';
COMMENT ON COLUMN phenix.validate_customer_drops.vcd_statment_total IS 'Total de la déclaration';
COMMENT ON COLUMN phenix.validate_customer_drops.vcd_ccr_code IS 'Code d''erreur';
COMMENT ON COLUMN phenix.validate_customer_drops.vcd_cds_rcl_id IS 'Code de détaillant';
COMMENT ON COLUMN phenix.validate_customer_drops.vcd_whs_member_id IS 'Indique le numéro de membre tel que lu dans le fichier EDI';
COMMENT ON COLUMN phenix.validate_customer_drops.vcd_whs_code IS 'Indique le code d''entrepôt pour cette facture';