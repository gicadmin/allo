CREATE TABLE phenix.drop_statement_discounts (
  dsd_id NUMBER(15) NOT NULL,
  dsd_dit_code NUMBER(3) NOT NULL,
  dsd_level VARCHAR2(1 BYTE) NOT NULL CONSTRAINT dsd_level_ck CHECK (DSD_LEVEL IN ('C', 'N', 'D', 'T')),
  dsd_cds_reference_number VARCHAR2(15 BYTE),
  dsd_cds_cus_code NUMBER(10),
  dsd_cds_vds_id NUMBER(15),
  dsd_cdd_cds_reference_number VARCHAR2(15 BYTE),
  dsd_cdd_line_number NUMBER(4),
  dsd_cdd_cds_cus_code NUMBER(10),
  dsd_cdd_cds_vds_id NUMBER(15),
  dsd_amount NUMBER(7,2),
  dsd_percent NUMBER(6,3),
  dsd_inh_id NUMBER(15),
  dsd_ven_code NUMBER(5) NOT NULL,
  dsd_final_amount NUMBER(7,2),
  dsd_federal_tax_rate NUMBER(6,3) DEFAULT 0 NOT NULL,
  dsd_provincial_tax_rate NUMBER(6,3) DEFAULT 0 NOT NULL,
  dsd_whs_code VARCHAR2(3 BYTE) NOT NULL,
  dsd_skip_invoicing_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT dsd_skip_invoicing_switch_ck CHECK (DSD_SKIP_INVOICING_SWITCH IN (0, 1)),
  dsd_invoiced_ext_price NUMBER(10,2) DEFAULT 0 NOT NULL,
  CONSTRAINT dsd_amount_perc_ck CHECK ((DSD_AMOUNT IS NULL AND DSD_PERCENT IS NOT NULL) OR
  (DSD_AMOUNT IS NOT NULL AND DSD_PERCENT IS NULL)),
  CONSTRAINT dsd_cds_cdd_ck CHECK ((DSD_CDS_VDS_ID IS NULL AND DSD_CDS_CUS_CODE IS NULL AND DSD_CDS_REFERENCE_NUMBER IS NULL AND
   DSD_CDD_CDS_VDS_ID IS NOT NULL AND DSD_CDD_CDS_CUS_CODE IS NOT NULL AND DSD_CDD_CDS_REFERENCE_NUMBER IS NOT NULL AND DSD_CDD_LINE_NUMBER IS NOT NULL)
 OR
  (DSD_CDS_VDS_ID IS NOT NULL AND DSD_CDS_CUS_CODE IS NOT NULL AND DSD_CDS_REFERENCE_NUMBER IS NOT NULL AND
   DSD_CDD_CDS_VDS_ID IS NULL AND DSD_CDD_CDS_CUS_CODE IS NULL AND DSD_CDD_CDS_REFERENCE_NUMBER IS NULL AND DSD_CDD_LINE_NUMBER IS NULL)),
  CONSTRAINT dsd_pk PRIMARY KEY (dsd_id),
  CONSTRAINT dsd_cdd_fk FOREIGN KEY (dsd_cdd_cds_vds_id,dsd_cdd_cds_cus_code,dsd_cdd_cds_reference_number,dsd_cdd_line_number) REFERENCES phenix.customer_drop_details (cdd_cds_vds_id,cdd_cds_cus_code,cdd_cds_reference_number,cdd_line_number),
  CONSTRAINT dsd_cds_fk FOREIGN KEY (dsd_cds_vds_id,dsd_cds_cus_code,dsd_cds_reference_number) REFERENCES phenix.customer_drop_statements (cds_vds_id,cds_cus_code,cds_reference_number) DISABLE NOVALIDATE,
  CONSTRAINT dsd_dit_fk FOREIGN KEY (dsd_dit_code) REFERENCES phenix.discount_types (dit_code),
  CONSTRAINT dsd_inh_fk FOREIGN KEY (dsd_inh_id) REFERENCES phenix.invoice_headers (inh_id),
  CONSTRAINT dsd_ven_fk FOREIGN KEY (dsd_ven_code) REFERENCES phenix.vendors (ven_code),
  CONSTRAINT dsd_whs_fk FOREIGN KEY (dsd_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.drop_statement_discounts IS 'Cette table contient les remises fournisseurs facturées plus tard ';
COMMENT ON COLUMN phenix.drop_statement_discounts.dsd_id IS 'Numéro d''identifiant pour l''escompte';
COMMENT ON COLUMN phenix.drop_statement_discounts.dsd_dit_code IS 'Numéro d''escompte';
COMMENT ON COLUMN phenix.drop_statement_discounts.dsd_level IS 'Indique si l''escompte est pour client detail ou NAC';
COMMENT ON COLUMN phenix.drop_statement_discounts.dsd_cds_reference_number IS 'Numéro de référence du document de réception du client';
COMMENT ON COLUMN phenix.drop_statement_discounts.dsd_cds_cus_code IS 'Numéro de client';
COMMENT ON COLUMN phenix.drop_statement_discounts.dsd_cds_vds_id IS 'Numéro de facture drop fournisseur';
COMMENT ON COLUMN phenix.drop_statement_discounts.dsd_cdd_cds_reference_number IS 'Numéro de référence du document de réception du client';
COMMENT ON COLUMN phenix.drop_statement_discounts.dsd_cdd_line_number IS 'Numéro de ligne';
COMMENT ON COLUMN phenix.drop_statement_discounts.dsd_cdd_cds_cus_code IS 'Numéro de client';
COMMENT ON COLUMN phenix.drop_statement_discounts.dsd_cdd_cds_vds_id IS 'Numéro de facture drop fournisseur';
COMMENT ON COLUMN phenix.drop_statement_discounts.dsd_amount IS 'Montant de l''escompte';
COMMENT ON COLUMN phenix.drop_statement_discounts.dsd_percent IS 'Pourcentage de l''escompte';
COMMENT ON COLUMN phenix.drop_statement_discounts.dsd_inh_id IS 'Numéro de la facture';
COMMENT ON COLUMN phenix.drop_statement_discounts.dsd_ven_code IS 'Numéro de fournisseur';
COMMENT ON COLUMN phenix.drop_statement_discounts.dsd_final_amount IS 'Montant final de l''escompte quand c''est un pourcentage,il va etre le prix * pourcentage';
COMMENT ON COLUMN phenix.drop_statement_discounts.dsd_federal_tax_rate IS 'Indique le taux de taxe appliqué à la ligne lors de la refacturation (le taux est rempli à la refacturation aussi)';
COMMENT ON COLUMN phenix.drop_statement_discounts.dsd_provincial_tax_rate IS 'Indique le taux de taxe appliqué à la ligne lors de la refacturation (le taux est rempli à la refacturation aussi)';
COMMENT ON COLUMN phenix.drop_statement_discounts.dsd_whs_code IS 'Indique le code d''entrepôt approprié à l''escompte';
COMMENT ON COLUMN phenix.drop_statement_discounts.dsd_skip_invoicing_switch IS 'Indique s''il y''a facturation';
COMMENT ON COLUMN phenix.drop_statement_discounts.dsd_invoiced_ext_price IS 'Indique le montant facturé à la ligne, qté * prix vendant ou poids * prix vendant, arrondi toujours vers le haut, à deux décimales';