CREATE TABLE phenix.vendor_sales_agreements (
  vsa_code NUMBER(10) NOT NULL,
  vsa_ven_code NUMBER(5) NOT NULL,
  vsa_ap_ar_flag VARCHAR2(1 BYTE) NOT NULL CONSTRAINT vsa_ap_ar_flag_ck CHECK (VSA_AP_AR_FLAG IN ('P', 'R')),
  vsa_description VARCHAR2(30 BYTE) NOT NULL,
  vsa_billing_cycle NUMBER(3),
  vsa_alt_description VARCHAR2(30 BYTE),
  vsa_date_last_billed DATE,
  vsa_output_file_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT vsa_output_file_switch_ck CHECK (VSA_OUTPUT_FILE_SWITCH IN (0, 1)),
  vsa_process_credit_switch NUMBER(1) NOT NULL CONSTRAINT vsa_process_credit_switch_ck CHECK (VSA_PROCESS_CREDIT_SWITCH IN (0,1)),
  vsa_billing_method VARCHAR2(1 BYTE) DEFAULT 'C' NOT NULL CONSTRAINT vsa_billing_method_ck CHECK (VSA_BILLING_METHOD IN ('C', 'M', 'N')),
  vsa_freegood_reclaim_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT vsa_freegood_reclaim_switch_ck CHECK (VSA_FREEGOOD_RECLAIM_SWITCH IN (0, 1)),
  vsa_synchronization_id NUMBER(15),
  CONSTRAINT vsa_billing_cycle_ck CHECK ((VSA_BILLING_METHOD = 'C' AND VSA_BILLING_CYCLE IS NOT NULL) OR (VSA_BILLING_METHOD <> 'C' AND VSA_BILLING_CYCLE IS NULL)),
  CONSTRAINT vsa_pk PRIMARY KEY (vsa_code),
  CONSTRAINT vsa_ven_fk FOREIGN KEY (vsa_ven_code) REFERENCES phenix.vendors (ven_code)
);
COMMENT ON TABLE phenix.vendor_sales_agreements IS 'Grille des ententes pour les ventes des fournisseurs';
COMMENT ON COLUMN phenix.vendor_sales_agreements.vsa_code IS 'Indique le code de l''entente fournisseur à la vente';
COMMENT ON COLUMN phenix.vendor_sales_agreements.vsa_ven_code IS 'Indique le code du fournisseur';
COMMENT ON COLUMN phenix.vendor_sales_agreements.vsa_ap_ar_flag IS 'Indique si on envoit aux comptes à recevoir ou aux comptes payables';
COMMENT ON COLUMN phenix.vendor_sales_agreements.vsa_description IS 'Indique la description de l''entente fournisseur à la vente';
COMMENT ON COLUMN phenix.vendor_sales_agreements.vsa_billing_cycle IS 'Indique la fréquence des refacturations';
COMMENT ON COLUMN phenix.vendor_sales_agreements.vsa_alt_description IS 'Indique la description alternative de l''entente fournisseur à la vente';
COMMENT ON COLUMN phenix.vendor_sales_agreements.vsa_date_last_billed IS 'Indique la dernière date de refacturation';
COMMENT ON COLUMN phenix.vendor_sales_agreements.vsa_output_file_switch IS 'Indique si on crée un fichier lors de la génération de la facturation des ententes fournisseurs à la vente';
COMMENT ON COLUMN phenix.vendor_sales_agreements.vsa_process_credit_switch IS 'Indique si le crédit sera traité dans cette entente';
COMMENT ON COLUMN phenix.vendor_sales_agreements.vsa_billing_method IS 'Indique la manière / fréquence que l''entente sera refacturée (mensuellement, selon cycle, aucun)';
COMMENT ON COLUMN phenix.vendor_sales_agreements.vsa_freegood_reclaim_switch IS 'Indique si une gratuité peut être réclamée dans cette entente.';
COMMENT ON COLUMN phenix.vendor_sales_agreements.vsa_synchronization_id IS 'Indique l''identifiant de synchronization';