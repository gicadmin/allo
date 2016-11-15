CREATE TABLE phenix.transport_credit_types (
  tct_code NUMBER(3) NOT NULL,
  tct_description VARCHAR2(30 BYTE) NOT NULL,
  tct_alt_description VARCHAR2(30 BYTE),
  tct_debit_only_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT tct_debit_only_switch_ck CHECK (tct_debit_only_switch IN (0, 1)),
  CONSTRAINT tct_pk PRIMARY KEY (tct_code)
);
COMMENT ON TABLE phenix.transport_credit_types IS 'Table utilisée pour les types de crédit du transport';
COMMENT ON COLUMN phenix.transport_credit_types.tct_code IS 'Indique le numéro du type de crédit';
COMMENT ON COLUMN phenix.transport_credit_types.tct_description IS 'Indique la description du type de crédit';
COMMENT ON COLUMN phenix.transport_credit_types.tct_alt_description IS 'Indique la description alternative du type de crédit';
COMMENT ON COLUMN phenix.transport_credit_types.tct_debit_only_switch IS 'Indique si ce type de crédit insère une ligne de débit seulement (sans avoir une ligne de crédit associée)';