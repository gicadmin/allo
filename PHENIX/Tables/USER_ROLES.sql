CREATE TABLE phenix.user_roles (
  usr_use_code NUMBER(5) NOT NULL,
  usr_rol_code VARCHAR2(15 BYTE) NOT NULL,
  CONSTRAINT usr_pk PRIMARY KEY (usr_use_code,usr_rol_code),
  CONSTRAINT usr_rol_fk FOREIGN KEY (usr_rol_code) REFERENCES phenix."ROLES" (rol_code),
  CONSTRAINT usr_use_fk FOREIGN KEY (usr_use_code) REFERENCES phenix."USERS" (use_code) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.user_roles IS 'Roles permis pour un usager';
COMMENT ON COLUMN phenix.user_roles.usr_use_code IS 'Numéro de l''usager';
COMMENT ON COLUMN phenix.user_roles.usr_rol_code IS 'Numéro du rôle';