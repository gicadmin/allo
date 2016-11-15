CREATE TABLE phenix.menu_security (
  mse_mni_code VARCHAR2(30 BYTE) NOT NULL,
  mse_sgr_code VARCHAR2(30 BYTE) NOT NULL,
  mse_security_level VARCHAR2(15 BYTE),
  CONSTRAINT mse_pk PRIMARY KEY (mse_mni_code,mse_sgr_code),
  CONSTRAINT mse_mni_fk FOREIGN KEY (mse_mni_code) REFERENCES phenix.menu_items (mni_code),
  CONSTRAINT mse_sgp_fk FOREIGN KEY (mse_sgr_code) REFERENCES phenix.security_groups (sgr_code)
);
COMMENT ON TABLE phenix.menu_security IS 'Contient les différents niveaux de sécurité des options du menu';
COMMENT ON COLUMN phenix.menu_security.mse_mni_code IS 'Code de l''option de menu';
COMMENT ON COLUMN phenix.menu_security.mse_sgr_code IS 'Code du groupe de sécurité';
COMMENT ON COLUMN phenix.menu_security.mse_security_level IS 'Niveau de sécurité';