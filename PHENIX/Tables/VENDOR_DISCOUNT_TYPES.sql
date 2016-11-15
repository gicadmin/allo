CREATE TABLE phenix.vendor_discount_types (
  vdt_ven_code NUMBER(5) NOT NULL,
  vdt_dit_code NUMBER(3) NOT NULL,
  vdt_billing_cycle NUMBER(3),
  vdt_date_last_billed DATE,
  vdt_refund_type_flag VARCHAR2(2 BYTE) NOT NULL CONSTRAINT vdt_refund_type_flag_ck CHECK (VDT_REFUND_TYPE_FLAG IN ('CN', 'CK')),
  vdt_billing_method VARCHAR2(1 BYTE) DEFAULT 'C' NOT NULL CONSTRAINT vdt_billing_method_ck CHECK (VDT_BILLING_METHOD IN ('A','C', 'M', 'N','T')),
  CONSTRAINT vdt_billing_cycle_ck CHECK ((VDT_BILLING_METHOD = 'C' AND VDT_BILLING_CYCLE IS NOT NULL) OR (VDT_BILLING_METHOD <> 'C' AND VDT_BILLING_CYCLE IS NULL)),
  CONSTRAINT vdt_pk PRIMARY KEY (vdt_ven_code,vdt_dit_code),
  CONSTRAINT vdt_dit_fk FOREIGN KEY (vdt_dit_code) REFERENCES phenix.discount_types (dit_code),
  CONSTRAINT vdt_ven_fk FOREIGN KEY (vdt_ven_code) REFERENCES phenix.vendors (ven_code)
);
COMMENT ON TABLE phenix.vendor_discount_types IS 'Types d''escomptes et rabais de volume annuel au niveau du fournisseur';
COMMENT ON COLUMN phenix.vendor_discount_types.vdt_ven_code IS 'Numéro de fournisseur';
COMMENT ON COLUMN phenix.vendor_discount_types.vdt_dit_code IS 'Numéro de type d''escompte';
COMMENT ON COLUMN phenix.vendor_discount_types.vdt_billing_cycle IS 'Cycle de re-facturation';
COMMENT ON COLUMN phenix.vendor_discount_types.vdt_date_last_billed IS 'Date de la dernière facturation';
COMMENT ON COLUMN phenix.vendor_discount_types.vdt_refund_type_flag IS 'Indique le type de remboursement';
COMMENT ON COLUMN phenix.vendor_discount_types.vdt_billing_method IS 'Indique la manière / fréquence que l''escompte sera refacturé (mensuellement, selon cycle, aucun)';