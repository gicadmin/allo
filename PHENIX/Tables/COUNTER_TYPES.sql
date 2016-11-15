CREATE TABLE phenix.counter_types (
  ctt_code NUMBER(3) NOT NULL,
  ctt_description VARCHAR2(30 BYTE) NOT NULL,
  ctt_alt_description VARCHAR2(30 BYTE),
  ctt_telemarketing_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctt_telemarketing_switch_ck CHECK (CTT_TELEMARKETING_SWITCH IN (0, 1)),
  ctt_broker_initiated_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctt_broker_initiated_switch_ck CHECK (CTT_BROKER_INITIATED_SWITCH IN (0, 1)),
  ctt_customer_rebate_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctt_customer_rebate_switch_ck CHECK (CTT_CUSTOMER_REBATE_SWITCH IN (0, 1)),
  ctt_broker_nac_code NUMBER(4),
  ctt_broker_type_code NUMBER(3),
  ctt_telemarketer_percent NUMBER(6,3) DEFAULT 0 NOT NULL,
  ctt_billing_method VARCHAR2(1 BYTE) DEFAULT 'N' NOT NULL CONSTRAINT ctt_billing_method_ck CHECK (CTT_BILLING_METHOD IN ('M','C','N')),
  ctt_last_date_billed DATE,
  ctt_billing_cycle NUMBER(3),
  ctt_retained_admin_percent NUMBER(6,3) DEFAULT 0 NOT NULL,
  CONSTRAINT ctt_broker_nac_type_uk UNIQUE (ctt_broker_nac_code,ctt_broker_type_code),
  CONSTRAINT ctt_pk PRIMARY KEY (ctt_code)
);
COMMENT ON TABLE phenix.counter_types IS 'Types de compteur';
COMMENT ON COLUMN phenix.counter_types.ctt_code IS 'Numéro des types de compteur';
COMMENT ON COLUMN phenix.counter_types.ctt_description IS 'Description';
COMMENT ON COLUMN phenix.counter_types.ctt_alt_description IS 'Description allternative';
COMMENT ON COLUMN phenix.counter_types.ctt_telemarketing_switch IS 'Indique si le type de compteur est utilisé dans télévente';
COMMENT ON COLUMN phenix.counter_types.ctt_broker_initiated_switch IS 'Indique si ce compteur est initié par le courtier';
COMMENT ON COLUMN phenix.counter_types.ctt_customer_rebate_switch IS 'Indique si ce compteur remet des dollars ou des points aux clients';
COMMENT ON COLUMN phenix.counter_types.ctt_broker_nac_code IS 'Indique le code du compte national chez le courtier dans le système STATSNAC';
COMMENT ON COLUMN phenix.counter_types.ctt_broker_type_code IS 'Indique le type de remises chez le courtier dans le système STATSNAC';
COMMENT ON COLUMN phenix.counter_types.ctt_telemarketer_percent IS 'Indique le pourcentage à payer au télévendeur ';
COMMENT ON COLUMN phenix.counter_types.ctt_billing_method IS 'Indique la manière / fréquence que l''entente sera refacturée (mensuellement, selon cycle, aucun)';
COMMENT ON COLUMN phenix.counter_types.ctt_last_date_billed IS 'Indique la dernière date de refacturation';
COMMENT ON COLUMN phenix.counter_types.ctt_billing_cycle IS 'Indique la fréquence des refacturations';
COMMENT ON COLUMN phenix.counter_types.ctt_retained_admin_percent IS 'Indique le pourcentage qui est retenu entre le montant de compteur et le montant payé au télévendeur et vendeur ';