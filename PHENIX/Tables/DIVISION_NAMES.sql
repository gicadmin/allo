CREATE TABLE phenix.division_names (
  dvn_code NUMBER(3) NOT NULL,
  dvn_description VARCHAR2(30 BYTE) NOT NULL,
  dvn_alt_description VARCHAR2(30 BYTE),
  dvn_additional_alloc_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT dvn_additional_alloc_switch_ck CHECK (DVN_ADDITIONAL_ALLOC_SWITCH IN (0,1)),
  CONSTRAINT dvn_pk PRIMARY KEY (dvn_code)
);
COMMENT ON TABLE phenix.division_names IS 'Table contenant les noms de division';
COMMENT ON COLUMN phenix.division_names.dvn_code IS 'Indique le code de la division';
COMMENT ON COLUMN phenix.division_names.dvn_description IS 'Indique la description de la division';
COMMENT ON COLUMN phenix.division_names.dvn_alt_description IS 'Indique la description alternative de la division';
COMMENT ON COLUMN phenix.division_names.dvn_additional_alloc_switch IS 'Indique si le compte GL est une marque qui aura droit à l''allocation additionnelle';