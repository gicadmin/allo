CREATE TABLE phenix.miscellaneous_charge_headers (
  mch_id NUMBER(15) NOT NULL,
  mch_type VARCHAR2(1 BYTE) NOT NULL CONSTRAINT mch_type_ck CHECK (MCH_TYPE IN ('V', 'C')),
  mch_whs_code VARCHAR2(2 BYTE) NOT NULL,
  mch_date DATE NOT NULL,
  mch_cus_code NUMBER(10),
  mch_cus_payable_code NUMBER(10),
  mch_ven_code NUMBER(5),
  mch_ven_payable_code NUMBER(5),
  mch_use_code NUMBER(5) NOT NULL,
  CONSTRAINT mch_ven_cus_type_ck CHECK (
    (MCH_TYPE = 'V' AND MCH_VEN_CODE IS NOT NULL AND MCH_VEN_PAYABLE_CODE IS NOT NULL AND MCH_CUS_CODE IS NULL AND MCH_CUS_PAYABLE_CODE IS NULL)
   OR (MCH_TYPE = 'C' AND MCH_CUS_CODE IS NOT NULL AND MCH_CUS_PAYABLE_CODE IS NOT NULL AND MCH_VEN_CODE IS NULL AND MCH_VEN_PAYABLE_CODE IS NULL)
     ),
  CONSTRAINT mch_pk PRIMARY KEY (mch_id) USING INDEX (CREATE UNIQUE INDEX phenix.mch_pk_i ON phenix.miscellaneous_charge_headers(mch_id)    ),
  CONSTRAINT mch_cus_fk FOREIGN KEY (mch_cus_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT mch_cus_payable_fk FOREIGN KEY (mch_cus_payable_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT mch_use_fk FOREIGN KEY (mch_use_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT mch_ven_fk FOREIGN KEY (mch_ven_code) REFERENCES phenix.vendors (ven_code),
  CONSTRAINT mch_ven_payable_fk FOREIGN KEY (mch_ven_payable_code) REFERENCES phenix.vendors (ven_code),
  CONSTRAINT mch_whs_fk FOREIGN KEY (mch_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.miscellaneous_charge_headers IS 'Table des en-têtes de charges diverses';
COMMENT ON COLUMN phenix.miscellaneous_charge_headers.mch_id IS 'Indique l''identifiant de l''en-tête de charge';
COMMENT ON COLUMN phenix.miscellaneous_charge_headers.mch_type IS 'Indique s''il s''agit d''une charge pour un client ou pour un fournisseur';
COMMENT ON COLUMN phenix.miscellaneous_charge_headers.mch_whs_code IS 'Indique le code de l''entrepôt';
COMMENT ON COLUMN phenix.miscellaneous_charge_headers.mch_date IS 'Indique la date de la charge';
COMMENT ON COLUMN phenix.miscellaneous_charge_headers.mch_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.miscellaneous_charge_headers.mch_cus_payable_code IS 'Indique le code du client facturé';
COMMENT ON COLUMN phenix.miscellaneous_charge_headers.mch_ven_code IS 'Indique le code du fournisseur';
COMMENT ON COLUMN phenix.miscellaneous_charge_headers.mch_ven_payable_code IS 'Indique le code du fournisseur facturé';
COMMENT ON COLUMN phenix.miscellaneous_charge_headers.mch_use_code IS 'Indique le code de l''utilisateur qui a saisi la charge';