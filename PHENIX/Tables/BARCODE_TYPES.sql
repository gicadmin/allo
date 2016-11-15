CREATE TABLE phenix.barcode_types (
  bct_code NUMBER(5) NOT NULL,
  bct_name VARCHAR2(30 BYTE) NOT NULL,
  bct_format VARCHAR2(100 BYTE),
  CONSTRAINT bct_pk PRIMARY KEY (bct_code) USING INDEX (CREATE UNIQUE INDEX phenix.bct_pk_i ON phenix.barcode_types(bct_code)    )
);
COMMENT ON TABLE phenix.barcode_types IS 'Table des types des codes à barre';
COMMENT ON COLUMN phenix.barcode_types.bct_code IS 'Indique le code du type de code à barre';
COMMENT ON COLUMN phenix.barcode_types.bct_name IS 'Indique le nom du type de code à barre';
COMMENT ON COLUMN phenix.barcode_types.bct_format IS 'Indique le format à respecter ou l''exemple du code à barre';