CREATE TABLE phenix.warehouse_conditions (
  whc_code VARCHAR2(2 BYTE) NOT NULL,
  whc_description VARCHAR2(30 BYTE) NOT NULL,
  whc_alt_description VARCHAR2(30 BYTE),
  CONSTRAINT whc_pk PRIMARY KEY (whc_code)
);
COMMENT ON TABLE phenix.warehouse_conditions IS 'Table permettant de définir différentes conditions d''entreposage';
COMMENT ON COLUMN phenix.warehouse_conditions.whc_code IS 'Indique le code de la condition d''entreposage';
COMMENT ON COLUMN phenix.warehouse_conditions.whc_description IS 'Indique la description de la condition d''entreposage';
COMMENT ON COLUMN phenix.warehouse_conditions.whc_alt_description IS 'Indique la description alternative de la condition d''entreposage';