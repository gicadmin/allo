CREATE TABLE phenix.drop_customer_surcharges (
  dcs_ven_code NUMBER(5) NOT NULL,
  dcs_cus_code NUMBER(10) NOT NULL,
  dcs_federal_tax_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT dcs_federal_tax_switch_ck CHECK (DCS_FEDERAL_TAX_SWITCH IN (0, 1)),
  dcs_provincial_tax_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT dcs_provincial_tax_switch_ck CHECK (DCS_PROVINCIAL_TAX_SWITCH IN (0, 1)),
  dcs_surcharge_amount NUMBER(8,2),
  dcs_surcharge_percent NUMBER(6,3),
  CONSTRAINT dcs_surcharg_amount_percent_ck CHECK ((DCS_SURCHARGE_AMOUNT IS NOT NULL AND DCS_SURCHARGE_PERCENT  IS NULL ) OR
         (DCS_SURCHARGE_AMOUNT IS NULL AND DCS_SURCHARGE_PERCENT  IS NOT NULL )),
  CONSTRAINT dcs_surc_amount_percent_ck CHECK ((DCS_SURCHARGE_AMOUNT IS NOT NULL AND DCS_SURCHARGE_PERCENT  IS NULL ) OR
         (DCS_SURCHARGE_AMOUNT IS NULL AND DCS_SURCHARGE_PERCENT  IS NOT NULL )),
  CONSTRAINT dcs_pk PRIMARY KEY (dcs_cus_code,dcs_ven_code),
  CONSTRAINT dcs_cus_code_fk FOREIGN KEY (dcs_cus_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT dcs_ven_code_fk FOREIGN KEY (dcs_ven_code) REFERENCES phenix.vendors (ven_code)
);
COMMENT ON TABLE phenix.drop_customer_surcharges IS 'Table contenant les surcharges de drops';
COMMENT ON COLUMN phenix.drop_customer_surcharges.dcs_ven_code IS 'Indique le code du fournisseur';
COMMENT ON COLUMN phenix.drop_customer_surcharges.dcs_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.drop_customer_surcharges.dcs_federal_tax_switch IS 'Indique si la taxe fédérale est applicable';
COMMENT ON COLUMN phenix.drop_customer_surcharges.dcs_provincial_tax_switch IS 'Indique si la taxe provinciale est applicable';
COMMENT ON COLUMN phenix.drop_customer_surcharges.dcs_surcharge_amount IS 'Indique le montant de la surcharge';