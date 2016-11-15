CREATE TABLE phenix.countries (
  cun_code VARCHAR2(3 BYTE) NOT NULL,
  cun_description VARCHAR2(30 BYTE) NOT NULL,
  cun_alt_description VARCHAR2(30 BYTE),
  cun_postal_code_mask VARCHAR2(10 BYTE) NOT NULL CONSTRAINT cun_postal_code_mask_ck CHECK (CUN_POSTAL_CODE_MASK IN ('ANABNANBBB', 'NNNNNBNNNN')),
  CONSTRAINT cun_pk PRIMARY KEY (cun_code)
);
COMMENT ON TABLE phenix.countries IS 'Pays';
COMMENT ON COLUMN phenix.countries.cun_code IS 'Code du pays';
COMMENT ON COLUMN phenix.countries.cun_description IS 'Description';
COMMENT ON COLUMN phenix.countries.cun_alt_description IS 'Description alternative';
COMMENT ON COLUMN phenix.countries.cun_postal_code_mask IS 'Masque du code postal';