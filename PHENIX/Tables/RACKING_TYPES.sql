CREATE TABLE phenix.racking_types (
  rac_code VARCHAR2(1 BYTE) NOT NULL,
  rac_description VARCHAR2(30 BYTE) NOT NULL,
  rac_alt_description VARCHAR2(30 BYTE),
  rac_min_days_sales NUMBER(2) NOT NULL,
  rac_contraint_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT rac_contraint_switch_ck CHECK (RAC_CONTRAINT_SWITCH IN (0,1)),
  rac_case_flow_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT rac_case_flow_switch_ck CHECK (RAC_CASE_FLOW_SWITCH IN (0,1)),
  rac_allow_double_loc_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT rac_allow_db_loc_switch_ck CHECK (RAC_ALLOW_DOUBLE_LOC_SWITCH IN (0,1)),
  CONSTRAINT rac_pk PRIMARY KEY (rac_code)
);
COMMENT ON TABLE phenix.racking_types IS 'Table utilisé pour maintenir les types de rayonnages ';
COMMENT ON COLUMN phenix.racking_types.rac_code IS 'Indique le code du type de rayonnage';
COMMENT ON COLUMN phenix.racking_types.rac_description IS 'Indique la description du type de rayonnage';
COMMENT ON COLUMN phenix.racking_types.rac_alt_description IS 'Indique la description alternative du type de rayonnage';
COMMENT ON COLUMN phenix.racking_types.rac_min_days_sales IS 'Indique le nombre de jours minimum que ce type de rayonnage est capable de couvrir l''inventaire vendu';
COMMENT ON COLUMN phenix.racking_types.rac_contraint_switch IS 'Indique si ce type de rayonnage est contraint par le poids et la fragilitée.';
COMMENT ON COLUMN phenix.racking_types.rac_case_flow_switch IS 'Indique si ce type de rayonnage est de type case flow.';
COMMENT ON COLUMN phenix.racking_types.rac_allow_double_loc_switch IS 'Indique si ce type de rayonnage peut supporter que deux localisations dans la même baie fusionnent pour en faire une seule.';