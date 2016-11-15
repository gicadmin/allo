CREATE TABLE phenix.consignments (
  cns_code NUMBER(3) NOT NULL,
  cns_description VARCHAR2(30 BYTE) NOT NULL,
  cns_print_switch NUMBER(1) NOT NULL CONSTRAINT cns_print_switch_ck CHECK (CNS_PRINT_SWITCH IN (0, 1)),
  cns_alt_description VARCHAR2(30 BYTE),
  CONSTRAINT cns_pk PRIMARY KEY (cns_code)
);
COMMENT ON TABLE phenix.consignments IS 'Ensemble des montants des consignes';
COMMENT ON COLUMN phenix.consignments.cns_code IS 'Numéro d''ensemble des consignes';
COMMENT ON COLUMN phenix.consignments.cns_description IS 'Description';
COMMENT ON COLUMN phenix.consignments.cns_print_switch IS 'Indique si la consigne est imprimée';
COMMENT ON COLUMN phenix.consignments.cns_alt_description IS 'Description alternative';