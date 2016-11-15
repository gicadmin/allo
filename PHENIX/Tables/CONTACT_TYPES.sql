CREATE TABLE phenix.contact_types (
  cty_code VARCHAR2(3 BYTE) NOT NULL,
  cty_description VARCHAR2(30 BYTE) NOT NULL,
  cty_alt_description VARCHAR2(30 BYTE),
  CONSTRAINT cty_pk PRIMARY KEY (cty_code)
);
COMMENT ON TABLE phenix.contact_types IS 'Types de contacts';
COMMENT ON COLUMN phenix.contact_types.cty_code IS 'Numéro de classification des contacts';
COMMENT ON COLUMN phenix.contact_types.cty_description IS 'Description';
COMMENT ON COLUMN phenix.contact_types.cty_alt_description IS 'Description allternative';