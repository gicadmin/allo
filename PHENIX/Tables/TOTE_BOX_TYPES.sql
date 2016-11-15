CREATE TABLE phenix.tote_box_types (
  tot_code VARCHAR2(5 BYTE) NOT NULL,
  tot_description VARCHAR2(30 BYTE) NOT NULL,
  tot_alt_description VARCHAR2(30 BYTE),
  tot_price NUMBER(6,2) NOT NULL,
  CONSTRAINT tot_code_pk PRIMARY KEY (tot_code)
);
COMMENT ON TABLE phenix.tote_box_types IS ' Table contenant les différents types de bac ';
COMMENT ON COLUMN phenix.tote_box_types.tot_code IS 'Indique le type de bac ';
COMMENT ON COLUMN phenix.tote_box_types.tot_description IS 'Indique la description du bac ';
COMMENT ON COLUMN phenix.tote_box_types.tot_alt_description IS 'Indique la description alternative du bac ';
COMMENT ON COLUMN phenix.tote_box_types.tot_price IS 'Indique le prix du bac ';