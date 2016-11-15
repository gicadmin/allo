CREATE TABLE phenix.discount_types (
  dit_code NUMBER(3) NOT NULL,
  dit_description VARCHAR2(30 BYTE) NOT NULL,
  dit_alt_description VARCHAR2(30 BYTE),
  dit_federal_tax_flag VARCHAR2(1 BYTE) NOT NULL CONSTRAINT dit_federal_tax_flag_ck CHECK (DIT_FEDERAL_TAX_FLAG IN ('T', 'N', 'P')),
  dit_provincial_tax_flag VARCHAR2(1 BYTE) NOT NULL CONSTRAINT dit_provincial_tax_flag_ck CHECK (DIT_PROVINCIAL_TAX_FLAG IN ('T', 'N', 'P')),
  CONSTRAINT dit_pk PRIMARY KEY (dit_code)
);
COMMENT ON TABLE phenix.discount_types IS 'Type d''escomptes';
COMMENT ON COLUMN phenix.discount_types.dit_code IS 'Numéro d''escompte';
COMMENT ON COLUMN phenix.discount_types.dit_description IS 'Description';
COMMENT ON COLUMN phenix.discount_types.dit_alt_description IS 'Description alternative';
COMMENT ON COLUMN phenix.discount_types.dit_federal_tax_flag IS 'Indique si la taxe fédérale est applicable';
COMMENT ON COLUMN phenix.discount_types.dit_provincial_tax_flag IS 'Indique si la taxe provinciale est applicable';