CREATE TABLE phenix.client_type_associations (
  cta_rcl_id NUMBER(6) NOT NULL,
  cta_rct_code NUMBER(3) NOT NULL,
  cta_contract_signature_date DATE,
  cta_first_payment_period_date DATE,
  cta_defered_payment_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cta_defered_payment_switch_ck CHECK (CTA_DEFERED_PAYMENT_SWITCH IN (0,1)),
  CONSTRAINT cta_pk PRIMARY KEY (cta_rcl_id,cta_rct_code),
  CONSTRAINT cta_rcl_fk FOREIGN KEY (cta_rcl_id) REFERENCES phenix.retail_clients (rcl_id),
  CONSTRAINT cta_rct_fk FOREIGN KEY (cta_rct_code) REFERENCES phenix.retail_client_types (rct_code)
);
COMMENT ON COLUMN phenix.client_type_associations.cta_rcl_id IS 'Indique le code du détaillant';
COMMENT ON COLUMN phenix.client_type_associations.cta_rct_code IS 'Indique le code du type de détaillant';
COMMENT ON COLUMN phenix.client_type_associations.cta_contract_signature_date IS 'Indique la date à laquelle le détaillant a signé le contrat pour faire parti du programme partenariat';
COMMENT ON COLUMN phenix.client_type_associations.cta_first_payment_period_date IS 'Indique la date de la première période effective a être payée (informatif seulement)';
COMMENT ON COLUMN phenix.client_type_associations.cta_defered_payment_switch IS 'Indique si le paiement est différé';