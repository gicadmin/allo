CREATE TABLE phenix.security_groups (
  sgr_code VARCHAR2(30 BYTE) NOT NULL,
  sgr_description VARCHAR2(30 BYTE) NOT NULL,
  sgr_alt_description VARCHAR2(30 BYTE),
  CONSTRAINT sgp_pk PRIMARY KEY (sgr_code)
);
COMMENT ON TABLE phenix.security_groups IS 'Liste des groupes de sécurité';
COMMENT ON COLUMN phenix.security_groups.sgr_code IS 'Code du groupe de sécurité';
COMMENT ON COLUMN phenix.security_groups.sgr_description IS 'Description du groupe de sécurité';
COMMENT ON COLUMN phenix.security_groups.sgr_alt_description IS 'Description alternative de l''option du menu';