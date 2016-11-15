CREATE TABLE phenix.customer_promotion_types (
  cpy_id NUMBER(8) NOT NULL,
  cpy_pty_code NUMBER(3) NOT NULL,
  cpy_decline_method_switch NUMBER(1) NOT NULL CONSTRAINT cpy_decline_method_switch_ck CHECK (CPY_DECLINE_METHOD_SWITCH IN (0, 1)),
  cpy_cus_code NUMBER(10),
  cpy_nac_code NUMBER(4),
  cpy_qty_code NUMBER(5),
  cpy_promotion_as_credit_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cpy_promotion_as_credit_swi_ck CHECK (CPY_PROMOTION_AS_CREDIT_SWITCH in (0, 1)),
  cpy_cgr_code NUMBER(3),
  CONSTRAINT cpy_validation_ck CHECK ((CPY_CUS_CODE IS NOT NULL AND CPY_NAC_CODE IS NULL AND CPY_QTY_CODE IS NULL AND CPY_CGR_CODE IS NULL) OR
         (CPY_NAC_CODE IS NOT NULL AND CPY_CUS_CODE IS NULL AND CPY_QTY_CODE IS NULL AND CPY_CGR_CODE IS NULL) OR
         (CPY_QTY_CODE IS NOT NULL AND CPY_CUS_CODE IS NULL AND CPY_NAC_CODE IS NULL AND CPY_CGR_CODE IS NULL) OR
         (CPY_CGR_CODE IS NOT NULL AND CPY_CUS_CODE IS NULL AND CPY_NAC_CODE IS NULL AND CPY_QTY_CODE IS NULL)),
  CONSTRAINT cpy_pk PRIMARY KEY (cpy_id),
  CONSTRAINT cpy_cgr_code_fk FOREIGN KEY (cpy_cgr_code) REFERENCES phenix.customer_groups (cgr_code),
  CONSTRAINT cpy_cus_fk FOREIGN KEY (cpy_cus_code) REFERENCES phenix.customers (cus_code) ON DELETE CASCADE,
  CONSTRAINT cpy_nac_fk FOREIGN KEY (cpy_nac_code) REFERENCES phenix.national_accounts (nac_code),
  CONSTRAINT cpy_pty_fk FOREIGN KEY (cpy_pty_code) REFERENCES phenix.promotion_types (pty_code),
  CONSTRAINT cpy_qty_fk FOREIGN KEY (cpy_qty_code) REFERENCES phenix.quotation_types (qty_code)
);
COMMENT ON TABLE phenix.customer_promotion_types IS 'Identifie les types de promotion que le client à droit';
COMMENT ON COLUMN phenix.customer_promotion_types.cpy_id IS 'Numéo d''identifiant des types de promotions client';
COMMENT ON COLUMN phenix.customer_promotion_types.cpy_pty_code IS 'Numéro de type de promotion';
COMMENT ON COLUMN phenix.customer_promotion_types.cpy_decline_method_switch IS 'Méthode de la commande bulletin';
COMMENT ON COLUMN phenix.customer_promotion_types.cpy_cus_code IS 'Numéro de client';
COMMENT ON COLUMN phenix.customer_promotion_types.cpy_nac_code IS 'Numéro de compte nationaux';
COMMENT ON COLUMN phenix.customer_promotion_types.cpy_qty_code IS 'Numéro de type de soumission';
COMMENT ON COLUMN phenix.customer_promotion_types.cpy_promotion_as_credit_switch IS 'Indique si la promotion sera donnée sur une note de crédit';
COMMENT ON COLUMN phenix.customer_promotion_types.cpy_cgr_code IS 'Indique le code de groupe du client';