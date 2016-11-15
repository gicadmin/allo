CREATE TABLE phenix.suggested_retail_price_types (
  srt_code NUMBER(3) NOT NULL,
  srt_description VARCHAR2(30 BYTE) NOT NULL,
  srt_alt_description VARCHAR2(30 BYTE),
  srt_lower_rounding_value NUMBER(1),
  srt_upper_rounding_value NUMBER(1),
  CONSTRAINT srt_pk PRIMARY KEY (srt_code)
);
COMMENT ON TABLE phenix.suggested_retail_price_types IS 'Indique les différents types de prix de détail suggéré';
COMMENT ON COLUMN phenix.suggested_retail_price_types.srt_code IS 'Numéro de prix de détail suggéré';
COMMENT ON COLUMN phenix.suggested_retail_price_types.srt_description IS 'Description';
COMMENT ON COLUMN phenix.suggested_retail_price_types.srt_alt_description IS 'Description alternative';
COMMENT ON COLUMN phenix.suggested_retail_price_types.srt_lower_rounding_value IS 'Indique que tous les prix se terminant de 0 à 4 seront arrondi à cette valeur';
COMMENT ON COLUMN phenix.suggested_retail_price_types.srt_upper_rounding_value IS 'Indique que tous les prix se terminant de 5 à 9 seront arrondi à cette valeur';