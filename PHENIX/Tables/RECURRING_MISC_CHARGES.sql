CREATE TABLE phenix.recurring_misc_charges (
  rmc_id NUMBER(15) NOT NULL,
  rmc_mct_code NUMBER(3) NOT NULL,
  rmc_whs_code VARCHAR2(2 BYTE) NOT NULL,
  rmc_cus_code NUMBER(10),
  rmc_cus_payable_code NUMBER(10),
  rmc_ven_code NUMBER(5),
  rmc_ven_payable_code NUMBER(5),
  rmc_reference_number VARCHAR2(15 BYTE),
  rmc_amount NUMBER(10,2) NOT NULL,
  rmc_federal_tax NUMBER(8,2) NOT NULL,
  rmc_provincial_tax NUMBER(8,2) NOT NULL,
  rmc_billing_method VARCHAR2(1 BYTE) NOT NULL CONSTRAINT rmc_billing_method_ck CHECK (RMC_BILLING_METHOD IN ('C', 'M', 'W')),
  rmc_billing_cycle NUMBER(3),
  rmc_date_last_billed DATE,
  rmc_recurring_end_date DATE,
  rmc_message VARCHAR2(100 BYTE),
  rmc_creation_date DATE DEFAULT SYSDATE NOT NULL,
  CONSTRAINT rmc_billing_cycle_ck CHECK (
      (RMC_BILLING_METHOD = 'C' AND RMC_BILLING_CYCLE IS NOT NULL)
    OR (RMC_BILLING_METHOD <> 'C' AND RMC_BILLING_CYCLE IS NULL)
      ),
  CONSTRAINT rmc_cus_ven_ck CHECK (
      (RMC_CUS_CODE IS NOT NULL AND RMC_CUS_PAYABLE_CODE IS NOT NULL AND RMC_VEN_CODE IS NULL AND RMC_VEN_PAYABLE_CODE IS NULL)
    OR (RMC_VEN_CODE IS NOT NULL AND RMC_VEN_PAYABLE_CODE IS NOT NULL AND RMC_CUS_CODE IS NULL AND RMC_CUS_PAYABLE_CODE IS NULL)
      ),
  CONSTRAINT rmc_pk PRIMARY KEY (rmc_id) USING INDEX (CREATE UNIQUE INDEX phenix.rmc_pk_i ON phenix.recurring_misc_charges(rmc_id)    ),
  CONSTRAINT rmc_cus_fk FOREIGN KEY (rmc_cus_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT rmc_cus_payable_fk FOREIGN KEY (rmc_cus_payable_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT rmc_mct_fk FOREIGN KEY (rmc_mct_code) REFERENCES phenix.miscellaneous_charge_types (mct_code),
  CONSTRAINT rmc_ven_fk FOREIGN KEY (rmc_ven_code) REFERENCES phenix.vendors (ven_code),
  CONSTRAINT rmc_ven_payable_fk FOREIGN KEY (rmc_ven_payable_code) REFERENCES phenix.vendors (ven_code),
  CONSTRAINT rmc_whs_fk FOREIGN KEY (rmc_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.recurring_misc_charges IS 'Table des charges diverses récurrentes';
COMMENT ON COLUMN phenix.recurring_misc_charges.rmc_id IS 'Indique l''identifiant de la charge récurrente';
COMMENT ON COLUMN phenix.recurring_misc_charges.rmc_mct_code IS 'Indique le type de charge';
COMMENT ON COLUMN phenix.recurring_misc_charges.rmc_whs_code IS 'Indique le code d''entrepôt';
COMMENT ON COLUMN phenix.recurring_misc_charges.rmc_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.recurring_misc_charges.rmc_cus_payable_code IS 'Indique le code du client à facturer';
COMMENT ON COLUMN phenix.recurring_misc_charges.rmc_ven_code IS 'Indique le code du fournisseur';
COMMENT ON COLUMN phenix.recurring_misc_charges.rmc_ven_payable_code IS 'Indique le code du fournisseur à facturer';
COMMENT ON COLUMN phenix.recurring_misc_charges.rmc_reference_number IS 'Indique le numéro de référence à appliquer sur cette charge';
COMMENT ON COLUMN phenix.recurring_misc_charges.rmc_amount IS 'Indique le montant de vente';
COMMENT ON COLUMN phenix.recurring_misc_charges.rmc_federal_tax IS 'Indique le montant de la taxe fédérale';
COMMENT ON COLUMN phenix.recurring_misc_charges.rmc_provincial_tax IS 'Indique le montant de la taxe provinciale';
COMMENT ON COLUMN phenix.recurring_misc_charges.rmc_billing_method IS 'Indique la fréquence de refacturation de la charge';
COMMENT ON COLUMN phenix.recurring_misc_charges.rmc_billing_cycle IS 'Indique le cycle de facturation';
COMMENT ON COLUMN phenix.recurring_misc_charges.rmc_date_last_billed IS 'Indique la date de la dernière génération de cette charge récurrente';
COMMENT ON COLUMN phenix.recurring_misc_charges.rmc_recurring_end_date IS 'Indique la date de fin de cette charge récurrente';
COMMENT ON COLUMN phenix.recurring_misc_charges.rmc_message IS 'Indique le message optionnel';
COMMENT ON COLUMN phenix.recurring_misc_charges.rmc_creation_date IS 'Indique la date de création de la charge récurrente';