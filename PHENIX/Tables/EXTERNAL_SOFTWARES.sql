CREATE TABLE phenix.external_softwares (
  exs_code NUMBER(3) NOT NULL,
  exs_active_switch NUMBER(1) NOT NULL CONSTRAINT exs_active_switch_ck CHECK (EXS_ACTIVE_SWITCH IN (0, 1)),
  exs_description VARCHAR2(45 BYTE) NOT NULL,
  exs_path VARCHAR2(240 BYTE) NOT NULL,
  exs_type VARCHAR2(3 BYTE) NOT NULL CONSTRAINT exs_type_ck CHECK (EXS_TYPE
IN ('WMS', 'APS', 'GLS', 'FAX', 'MSI', 'ARS', 'LAP', 'ROU', 'POS',
'EDI')),
  exs_alt_description VARCHAR2(45 BYTE),
  CONSTRAINT exs_pk PRIMARY KEY (exs_code)
);
COMMENT ON TABLE phenix.external_softwares IS 'Applications externes';
COMMENT ON COLUMN phenix.external_softwares.exs_code IS 'Code de l''application';
COMMENT ON COLUMN phenix.external_softwares.exs_active_switch IS 'Indique si l''applicattion est utilisée dans l''environnement présent';
COMMENT ON COLUMN phenix.external_softwares.exs_description IS 'Description';
COMMENT ON COLUMN phenix.external_softwares.exs_path IS 'Chemin logique de l''application';
COMMENT ON COLUMN phenix.external_softwares.exs_type IS 'Type d''application';
COMMENT ON COLUMN phenix.external_softwares.exs_alt_description IS 'Description alternative';