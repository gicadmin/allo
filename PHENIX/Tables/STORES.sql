CREATE TABLE phenix.stores (
  str_code VARCHAR2(10 BYTE) NOT NULL,
  str_description VARCHAR2(30 BYTE) NOT NULL,
  str_alt_description VARCHAR2(30 BYTE),
  CONSTRAINT str_pk PRIMARY KEY (str_code) USING INDEX (CREATE UNIQUE INDEX phenix.str_pk_i ON phenix.stores(str_code)    )
);
COMMENT ON TABLE phenix.stores IS 'Table pour créer des regroupements de plusieurs codes de client';
COMMENT ON COLUMN phenix.stores.str_code IS 'Indique le code de regroupement';
COMMENT ON COLUMN phenix.stores.str_description IS 'Indique la description du regroupement';
COMMENT ON COLUMN phenix.stores.str_alt_description IS 'Indique la description alternative du regroupement';