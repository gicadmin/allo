CREATE TABLE phenix.temp_cus_consignment_headers (
  tca_id NUMBER(10) NOT NULL,
  tca_cus_code VARCHAR2(10 BYTE) NOT NULL,
  tca_order_id VARCHAR2(3 BYTE) NOT NULL,
  tca_invoice_id VARCHAR2(10 BYTE) NOT NULL,
  tca_amount VARCHAR2(11 BYTE),
  tca_amount_escompte VARCHAR2(11 BYTE),
  tca_federal_tax_total VARCHAR2(9 BYTE),
  tca_provincial_tax_total VARCHAR2(9 BYTE),
  tca_ccr_code NUMBER(5),
  CONSTRAINT tca_pk PRIMARY KEY (tca_id),
  CONSTRAINT tca_ccr_fk FOREIGN KEY (tca_ccr_code) REFERENCES phenix.error_codes (ccr_code)
);
COMMENT ON COLUMN phenix.temp_cus_consignment_headers.tca_id IS 'Indique l''ID';
COMMENT ON COLUMN phenix.temp_cus_consignment_headers.tca_cus_code IS 'Indique le code du client concerné par le crédit.';
COMMENT ON COLUMN phenix.temp_cus_consignment_headers.tca_order_id IS 'Indique le numéro de commande généré par le système maxivente';
COMMENT ON COLUMN phenix.temp_cus_consignment_headers.tca_invoice_id IS 'Indique le numéro de facture généré par le système maxivente.';
COMMENT ON COLUMN phenix.temp_cus_consignment_headers.tca_amount IS 'Indique le montant avant taxe.';
COMMENT ON COLUMN phenix.temp_cus_consignment_headers.tca_amount_escompte IS 'Indique le montant d''escompte';
COMMENT ON COLUMN phenix.temp_cus_consignment_headers.tca_federal_tax_total IS 'Indique le montant total de la taxe fédérale';
COMMENT ON COLUMN phenix.temp_cus_consignment_headers.tca_provincial_tax_total IS 'Indique le montant total de la taxe provinciale';
COMMENT ON COLUMN phenix.temp_cus_consignment_headers.tca_ccr_code IS 'Indique le code d''erreur';