CREATE TABLE phenix.contacts_last_passwords (
  clp_id NUMBER(15) NOT NULL,
  clp_con_id NUMBER(5) NOT NULL,
  clp_con_password VARCHAR2(30 BYTE) NOT NULL,
  clp_changed_date DATE NOT NULL,
  CONSTRAINT clp_pk PRIMARY KEY (clp_id),
  CONSTRAINT clp_con_fk FOREIGN KEY (clp_con_id) REFERENCES phenix.contacts ("CON_ID") ON DELETE CASCADE
);
COMMENT ON TABLE phenix.contacts_last_passwords IS 'Table contenant les historiques des mots de passe d''un contact';
COMMENT ON COLUMN phenix.contacts_last_passwords.clp_id IS 'Indique l''identifiant unique de la table ';
COMMENT ON COLUMN phenix.contacts_last_passwords.clp_con_id IS 'Indique le code du contact ';
COMMENT ON COLUMN phenix.contacts_last_passwords.clp_con_password IS 'Indique le mot de passe du contact ';
COMMENT ON COLUMN phenix.contacts_last_passwords.clp_changed_date IS 'Indique la date de saisie du mot de passe ';