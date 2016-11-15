CREATE TABLE phenix.user_program_roles (
  upr_id NUMBER(6) NOT NULL,
  upr_role_code VARCHAR2(15 BYTE) NOT NULL,
  upr_pro_id NUMBER(*,0) NOT NULL,
  CONSTRAINT upr_id_pk PRIMARY KEY (upr_id),
  CONSTRAINT upr_pro_id_fk FOREIGN KEY (upr_pro_id) REFERENCES phenix.programs (pro_id),
  CONSTRAINT upr_role_code_fk FOREIGN KEY (upr_role_code) REFERENCES phenix."ROLES" (rol_code)
);
COMMENT ON TABLE phenix.user_program_roles IS 'Table qui fait le lien entre les programmes et les rôles';
COMMENT ON COLUMN phenix.user_program_roles.upr_id IS 'Indique la clé unique de la table.';
COMMENT ON COLUMN phenix.user_program_roles.upr_role_code IS 'Indique le rôle qu''utilisateur peut avoir.';
COMMENT ON COLUMN phenix.user_program_roles.upr_pro_id IS 'Indique le code du programme.';