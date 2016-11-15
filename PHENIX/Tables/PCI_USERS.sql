CREATE TABLE phenix.pci_users (
  pus_id NUMBER(15) NOT NULL,
  pus_first_name VARCHAR2(30 BYTE),
  pus_last_name VARCHAR2(30 BYTE),
  pus_title VARCHAR2(80 BYTE),
  pus_email VARCHAR2(80 BYTE) NOT NULL,
  pus_password VARCHAR2(30 BYTE),
  pus_last_connection_date DATE,
  pus_active_switch NUMBER(1) NOT NULL CONSTRAINT pus_active_switch_ck CHECK (PUS_ACTIVE_SWITCH IN (0, 1)),
  pus_first_connection_switch NUMBER(1) NOT NULL CONSTRAINT pus_first_connection_switch_ck CHECK (PUS_FIRST_CONNECTION_SWITCH IN (0, 1)),
  pus_creation_date DATE DEFAULT SYSDATE NOT NULL,
  pus_modification_date DATE DEFAULT SYSDATE NOT NULL,
  pus_use_code NUMBER(5),
  CONSTRAINT pus_email_uk UNIQUE (pus_email),
  CONSTRAINT pus_pk PRIMARY KEY (pus_id) USING INDEX (CREATE UNIQUE INDEX phenix.pus_pk_i ON phenix.pci_users(pus_id)    ),
  CONSTRAINT pus_use_fk FOREIGN KEY (pus_use_code) REFERENCES phenix."USERS" (use_code)
);
COMMENT ON TABLE phenix.pci_users IS 'Table des utilisateurs de PCI';
COMMENT ON COLUMN phenix.pci_users.pus_id IS 'Indique l''identifiant unique';
COMMENT ON COLUMN phenix.pci_users.pus_first_name IS 'Indique le nom ';
COMMENT ON COLUMN phenix.pci_users.pus_last_name IS 'Indique le prenom ';
COMMENT ON COLUMN phenix.pci_users.pus_title IS 'Indique la description du titre ';
COMMENT ON COLUMN phenix.pci_users.pus_email IS 'Indique le email ';
COMMENT ON COLUMN phenix.pci_users.pus_password IS 'Indique le mot de passe';
COMMENT ON COLUMN phenix.pci_users.pus_last_connection_date IS 'Indique la date de derniere connexion ';
COMMENT ON COLUMN phenix.pci_users.pus_active_switch IS 'Indique l''utilisateur est actif ';
COMMENT ON COLUMN phenix.pci_users.pus_first_connection_switch IS 'Indique si c''est une premiere connexion de l''utilisateur ';
COMMENT ON COLUMN phenix.pci_users.pus_creation_date IS 'Indique la date de creation';
COMMENT ON COLUMN phenix.pci_users.pus_modification_date IS 'Indique la date de modification';
COMMENT ON COLUMN phenix.pci_users.pus_use_code IS 'Numéro de l''usager phenix';