CREATE TABLE phenix.form_security (
  fse_id NUMBER NOT NULL,
  fse_fbi_id NUMBER NOT NULL,
  fse_sgr_code VARCHAR2(30 BYTE) NOT NULL,
  fse_security_read_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT fse_security_read_switch_ck CHECK (FSE_SECURITY_READ_SWITCH IN (0, 1)),
  CONSTRAINT fse_fbi_sgr_uk UNIQUE (fse_fbi_id,fse_sgr_code),
  CONSTRAINT fse_id_pk PRIMARY KEY (fse_id),
  CONSTRAINT fse_fbi_id_fk FOREIGN KEY (fse_fbi_id) REFERENCES phenix.form_block_items (fbi_id),
  CONSTRAINT fse_sgr_code_fk FOREIGN KEY (fse_sgr_code) REFERENCES phenix.security_groups (sgr_code)
);
COMMENT ON TABLE phenix.form_security IS 'Contient les différents niveaux de sécurité des items (Forms) des options Phenix';
COMMENT ON COLUMN phenix.form_security.fse_id IS 'Identifiant de la sécurité relié à l''item de l''option Phenix';
COMMENT ON COLUMN phenix.form_security.fse_fbi_id IS 'Identifiant de l''item relié à une option Phenix';
COMMENT ON COLUMN phenix.form_security.fse_sgr_code IS 'Code du groupe de sécurité';
COMMENT ON COLUMN phenix.form_security.fse_security_read_switch IS 'Sécurité d''accès à l''item de l''option Phenix';