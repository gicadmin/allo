CREATE TABLE phenix.temp_cus_consignment_details (
  tnd_tca_order_id VARCHAR2(3 BYTE) NOT NULL,
  tnd_line_number VARCHAR2(3 BYTE) NOT NULL,
  tnd_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  tnd_qty_shipped VARCHAR2(7 BYTE) NOT NULL,
  tnd_amount VARCHAR2(8 BYTE),
  tnd_amount_escompte VARCHAR2(8 BYTE),
  tnd_federal_tax_rate VARCHAR2(7 BYTE),
  tnd_provincial_tax_rate VARCHAR2(7 BYTE),
  tnd_ccr_code NUMBER(5),
  CONSTRAINT tnd_pk PRIMARY KEY (tnd_tca_order_id,tnd_line_number),
  CONSTRAINT tnd_ccr_fk FOREIGN KEY (tnd_ccr_code) REFERENCES phenix.error_codes (ccr_code)
);
COMMENT ON TABLE phenix.temp_cus_consignment_details IS 'Table utilisée pour les informations temporaires sur les détails du fichier maxivente';
COMMENT ON COLUMN phenix.temp_cus_consignment_details.tnd_tca_order_id IS 'Indique le numéro de la commande';
COMMENT ON COLUMN phenix.temp_cus_consignment_details.tnd_line_number IS 'Indique le numéro de la ligne de commande';
COMMENT ON COLUMN phenix.temp_cus_consignment_details.tnd_prf_prd_code IS 'Indique le code du produit';
COMMENT ON COLUMN phenix.temp_cus_consignment_details.tnd_qty_shipped IS 'Indique la quantité livrée';
COMMENT ON COLUMN phenix.temp_cus_consignment_details.tnd_amount IS 'Indique le montant avant taxes';
COMMENT ON COLUMN phenix.temp_cus_consignment_details.tnd_amount_escompte IS 'Indique le montant d''escompte';
COMMENT ON COLUMN phenix.temp_cus_consignment_details.tnd_federal_tax_rate IS 'Indique la taxe fédérale';
COMMENT ON COLUMN phenix.temp_cus_consignment_details.tnd_provincial_tax_rate IS 'Indique la taxe provinciale';
COMMENT ON COLUMN phenix.temp_cus_consignment_details.tnd_ccr_code IS 'Indique le code d''erreur';