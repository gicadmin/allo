CREATE TABLE phenix.hazardous_materials (
  haz_code VARCHAR2(10 BYTE) NOT NULL,
  haz_description VARCHAR2(110 BYTE),
  haz_alt_description VARCHAR2(110 BYTE),
  haz_un_code NUMBER(4) NOT NULL,
  haz_ge_code VARCHAR2(5 BYTE) NOT NULL,
  haz_division_code VARCHAR2(5 BYTE) NOT NULL,
  haz_classe_code NUMBER(5) NOT NULL,
  CONSTRAINT haz_pk PRIMARY KEY (haz_code)
);
COMMENT ON TABLE phenix.hazardous_materials IS 'Indique la description des matières dangereuses';
COMMENT ON COLUMN phenix.hazardous_materials.haz_code IS 'Indique le code du danger de la matière dangereuse';
COMMENT ON COLUMN phenix.hazardous_materials.haz_description IS 'Indique la description de la matière dangereuse';
COMMENT ON COLUMN phenix.hazardous_materials.haz_alt_description IS 'Indique la description alternative de la matière dangereuse';
COMMENT ON COLUMN phenix.hazardous_materials.haz_un_code IS 'Indique le numéro d''identification propre à chaque matière dangereuse';
COMMENT ON COLUMN phenix.hazardous_materials.haz_ge_code IS 'Indique le groupe d''emballage pour connaître le niveau du danger de la matière dangereuse (les caractères permis sont : I,V,X)';
COMMENT ON COLUMN phenix.hazardous_materials.haz_division_code IS 'Indique la division de la matière dangereuse';
COMMENT ON COLUMN phenix.hazardous_materials.haz_classe_code IS 'Indique la classe de la matière dangereuse';