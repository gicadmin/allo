CREATE TABLE phenix.national_account_groups (
  nag_nac_code NUMBER(4) NOT NULL,
  nag_code VARCHAR2(6 BYTE) NOT NULL,
  nag_description VARCHAR2(30 BYTE) NOT NULL,
  nag_alt_description VARCHAR2(30 BYTE),
  nag_rcm_code NUMBER(5),
  nag_synchronization_id NUMBER(15),
  nag_unique_index NUMBER(15),
  CONSTRAINT nag_pk PRIMARY KEY (nag_nac_code,nag_code),
  CONSTRAINT nag_nac_fk FOREIGN KEY (nag_nac_code) REFERENCES phenix.national_accounts (nac_code),
  CONSTRAINT nag_rcm_fk FOREIGN KEY (nag_rcm_code) REFERENCES phenix.retail_client_managers (rcm_code)
);
COMMENT ON TABLE phenix.national_account_groups IS 'Groupes des comptes nationaux';
COMMENT ON COLUMN phenix.national_account_groups.nag_nac_code IS 'Code du compte national';
COMMENT ON COLUMN phenix.national_account_groups.nag_code IS 'Code du groupe';
COMMENT ON COLUMN phenix.national_account_groups.nag_description IS 'Description';
COMMENT ON COLUMN phenix.national_account_groups.nag_alt_description IS 'Description alternative';
COMMENT ON COLUMN phenix.national_account_groups.nag_rcm_code IS 'Personne responsable du groupe du compte national';
COMMENT ON COLUMN phenix.national_account_groups.nag_synchronization_id IS 'Identifiant de synchronization';
COMMENT ON COLUMN phenix.national_account_groups.nag_unique_index IS 'Identifiant unique';