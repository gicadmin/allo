CREATE TABLE phenix."ROLES" (
  rol_code VARCHAR2(15 BYTE) NOT NULL,
  rol_description VARCHAR2(30 BYTE) NOT NULL,
  rol_alt_description VARCHAR2(30 BYTE),
  CONSTRAINT rol_pk PRIMARY KEY (rol_code)
);
COMMENT ON TABLE phenix."ROLES" IS 'Rôles d''accès de l''application';
COMMENT ON COLUMN phenix."ROLES".rol_code IS 'Numéro du rôle';
COMMENT ON COLUMN phenix."ROLES".rol_description IS 'Description';
COMMENT ON COLUMN phenix."ROLES".rol_alt_description IS 'Description alternative';