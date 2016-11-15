CREATE TABLE phenix.user_last_passwords (
  ulp_id NUMBER(15) NOT NULL,
  ulp_use_code NUMBER(5) NOT NULL,
  ulp_use_password VARCHAR2(30 BYTE) NOT NULL,
  ulp_changed_date DATE NOT NULL,
  CONSTRAINT ulp_pk PRIMARY KEY (ulp_id),
  CONSTRAINT ulp_use_fk FOREIGN KEY (ulp_use_code) REFERENCES phenix."USERS" (use_code) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.user_last_passwords IS 'Table utilisé pour garder un historique des anciens mot de passe pour les usagers';
COMMENT ON COLUMN phenix.user_last_passwords.ulp_id IS 'Indique l''identifiant unique de la table';
COMMENT ON COLUMN phenix.user_last_passwords.ulp_use_code IS 'Indique le code de l''usager';
COMMENT ON COLUMN phenix.user_last_passwords.ulp_use_password IS 'Indique le mot de passe de l''usager';
COMMENT ON COLUMN phenix.user_last_passwords.ulp_changed_date IS 'Indique la date de saisi du mot de passe';