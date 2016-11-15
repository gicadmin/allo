CREATE TABLE phenix.retail_client_types (
  rct_code NUMBER(3) NOT NULL,
  rct_description VARCHAR2(30 BYTE) NOT NULL,
  rct_alt_description VARCHAR2(30 BYTE),
  rct_partnership_program_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT rct_partnership_program_sw_ck CHECK (RCT_PARTNERSHIP_PROGRAM_SWITCH IN (0,1)),
  rct_minimum_cheque_amount NUMBER(10,2) NOT NULL,
  rct_ap_account VARCHAR2(40 BYTE),
  CONSTRAINT rct_pk PRIMARY KEY (rct_code)
);
COMMENT ON TABLE phenix.retail_client_types IS 'Type de détaillant';
COMMENT ON COLUMN phenix.retail_client_types.rct_code IS 'Code du type de détaillant';
COMMENT ON COLUMN phenix.retail_client_types.rct_description IS 'Description du type de détaillant';
COMMENT ON COLUMN phenix.retail_client_types.rct_alt_description IS 'Description alternative du type de détaillant';
COMMENT ON COLUMN phenix.retail_client_types.rct_partnership_program_switch IS 'Indique si le type de détaillant recherche un programme partenariat';
COMMENT ON COLUMN phenix.retail_client_types.rct_minimum_cheque_amount IS 'Indique le montant minimum requis pour l''envoi d''un chèque';
COMMENT ON COLUMN phenix.retail_client_types.rct_ap_account IS 'Indique le compte "Grand livre" utilisé pour ce type de détaillant';