CREATE TABLE phenix.miscellaneous_charge_types (
  mct_code NUMBER(3) NOT NULL,
  mct_description VARCHAR2(30 BYTE) NOT NULL,
  mct_alt_description VARCHAR2(30 BYTE),
  mct_auto_calc_tax_switch NUMBER(1) NOT NULL CONSTRAINT mct_auto_calc_tax_switch_ck CHECK (MCT_AUTO_CALC_TAX_SWITCH IN (0,1)),
  mct_gl_account VARCHAR2(40 BYTE) NOT NULL,
  mct_remittance_type VARCHAR2(5 BYTE) CONSTRAINT mct_remittance_type_ck CHECK (MCT_REMITTANCE_TYPE IN ('TRAN', 'TRANV', 'TRIM', 'TRIMV', 'TDRP', 'TDRPV', 'GROW', 'ADDIT', 'PROG', 'PROGV', 'INTAD')
),
  CONSTRAINT mct_pk PRIMARY KEY (mct_code) USING INDEX (CREATE UNIQUE INDEX phenix.mct_pk_i ON phenix.miscellaneous_charge_types(mct_code)    ),
  CONSTRAINT mct_remittance_type_uk UNIQUE (mct_remittance_type)
);
COMMENT ON TABLE phenix.miscellaneous_charge_types IS 'Table des types de charges diverses';
COMMENT ON COLUMN phenix.miscellaneous_charge_types.mct_code IS 'Indique le code du type de charge';
COMMENT ON COLUMN phenix.miscellaneous_charge_types.mct_description IS 'Indique la description du type de charge';
COMMENT ON COLUMN phenix.miscellaneous_charge_types.mct_alt_description IS 'Indique la description alternative du type de charge';
COMMENT ON COLUMN phenix.miscellaneous_charge_types.mct_auto_calc_tax_switch IS 'Indique si les montants de taxes fédérale et provinciale sont calculés automatiquement dans les écrans de saisies pour les charges diverses';
COMMENT ON COLUMN phenix.miscellaneous_charge_types.mct_gl_account IS 'Indique le compte du grand livre pour ce type de charge';
COMMENT ON COLUMN phenix.miscellaneous_charge_types.mct_remittance_type IS 'Indique le type de remise liée à cette charge';