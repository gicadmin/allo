CREATE TABLE phenix.module_names (
  mon_code VARCHAR2(30 BYTE) NOT NULL,
  mon_description VARCHAR2(30 BYTE) NOT NULL,
  mon_alt_description VARCHAR2(30 BYTE),
  CONSTRAINT mon_pk PRIMARY KEY (mon_code)
);
COMMENT ON TABLE phenix.module_names IS 'Indique la table des noms des modules';
COMMENT ON COLUMN phenix.module_names.mon_code IS 'Indique le nom du module ';
COMMENT ON COLUMN phenix.module_names.mon_description IS 'Indique la description du module ';
COMMENT ON COLUMN phenix.module_names.mon_alt_description IS 'Indique la description alternative du module ';