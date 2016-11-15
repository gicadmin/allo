CREATE TABLE phenix.retail_clients (
  rcl_id NUMBER(15) NOT NULL,
  rcl_nac_client_code VARCHAR2(10 BYTE),
  rcl_name VARCHAR2(30 BYTE) NOT NULL,
  rcl_address VARCHAR2(45 BYTE) NOT NULL,
  rcl_city VARCHAR2(30 BYTE) NOT NULL,
  rcl_prv_code VARCHAR2(2 BYTE) NOT NULL,
  rcl_postal_code VARCHAR2(10 BYTE) NOT NULL,
  rcl_email VARCHAR2(100 BYTE),
  rcl_telephone NUMBER(11) NOT NULL,
  rcl_fax_number NUMBER(11),
  rcl_contact_name VARCHAR2(30 BYTE) NOT NULL,
  rcl_message VARCHAR2(100 BYTE),
  rcl_naz_nac_code NUMBER(4),
  rcl_naz_zone_code NUMBER(3),
  rcl_qty_code NUMBER(5),
  rcl_open_quotation_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT rcl_open_quotation_switch_ck CHECK (RCL_OPEN_QUOTATION_SWITCH IN (0, 1)),
  rcl_creation_date DATE DEFAULT sysdate NOT NULL,
  rcl_modification_date DATE DEFAULT sysdate NOT NULL,
  rcl_deletion_date DATE,
  rcl_rlt_code NUMBER(5),
  rcl_rcm_code NUMBER(5),
  rcl_owner_type VARCHAR2(1 BYTE) DEFAULT 'I' NOT NULL CONSTRAINT rcl_owner_type_ck CHECK (RCL_OWNER_TYPE IN ('A','C','F','I','D')),
  rcl_terms VARCHAR2(6 BYTE),
  CONSTRAINT rcl_national_account_ck CHECK ((RCL_NAZ_NAC_CODE IS NULL AND RCL_NAZ_ZONE_CODE IS NULL AND RCL_NAC_CLIENT_CODE is null) OR
(RCL_NAZ_NAC_CODE IS NOT NULL AND RCL_NAZ_ZONE_CODE IS NOT NULL and RCL_NAC_CLIENT_CODE is not null)),
  CONSTRAINT rcl_national_account_uk UNIQUE (rcl_naz_nac_code,rcl_nac_client_code),
  CONSTRAINT rcl_pk PRIMARY KEY (rcl_id),
  CONSTRAINT rcl_naz_fk FOREIGN KEY (rcl_naz_nac_code,rcl_naz_zone_code) REFERENCES phenix.national_account_zones (naz_nac_code,naz_zone_code),
  CONSTRAINT rcl_prv_fk FOREIGN KEY (rcl_prv_code) REFERENCES phenix.provinces (prv_code),
  CONSTRAINT rcl_qty_fk FOREIGN KEY (rcl_qty_code) REFERENCES phenix.quotation_types (qty_code),
  CONSTRAINT rcl_rcm_fk FOREIGN KEY (rcl_rcm_code) REFERENCES phenix.retail_client_managers (rcm_code),
  CONSTRAINT rcl_rlt_fk FOREIGN KEY (rcl_rlt_code) REFERENCES phenix.retail_client_territories (rlt_code)
);
COMMENT ON TABLE phenix.retail_clients IS 'Détaillants';
COMMENT ON COLUMN phenix.retail_clients.rcl_id IS 'Code de détaillant';
COMMENT ON COLUMN phenix.retail_clients.rcl_nac_client_code IS 'Code du client du compte national';
COMMENT ON COLUMN phenix.retail_clients.rcl_name IS 'Nom du détaillant';
COMMENT ON COLUMN phenix.retail_clients.rcl_address IS 'Adresse du détaillant';
COMMENT ON COLUMN phenix.retail_clients.rcl_city IS 'Ville du détaillant';
COMMENT ON COLUMN phenix.retail_clients.rcl_prv_code IS 'Province du détaillant';
COMMENT ON COLUMN phenix.retail_clients.rcl_postal_code IS 'Code postal du détaillant';
COMMENT ON COLUMN phenix.retail_clients.rcl_email IS 'Couriel du détaillant';
COMMENT ON COLUMN phenix.retail_clients.rcl_telephone IS 'Numéro de téléphone du détaillant';
COMMENT ON COLUMN phenix.retail_clients.rcl_fax_number IS 'Numéro de télécopieur du détaillant';
COMMENT ON COLUMN phenix.retail_clients.rcl_contact_name IS 'Nom du contact';
COMMENT ON COLUMN phenix.retail_clients.rcl_message IS 'Message';
COMMENT ON COLUMN phenix.retail_clients.rcl_naz_nac_code IS 'Indique le compte national du detaillant';
COMMENT ON COLUMN phenix.retail_clients.rcl_naz_zone_code IS 'Indique la zone du compte national du detaillant';
COMMENT ON COLUMN phenix.retail_clients.rcl_qty_code IS 'Indique le type de soumission du detaillant';
COMMENT ON COLUMN phenix.retail_clients.rcl_open_quotation_switch IS 'Indique si le detaillant a une soumission ouverte ou fermée';
COMMENT ON COLUMN phenix.retail_clients.rcl_creation_date IS 'Date de la création du détaillant';
COMMENT ON COLUMN phenix.retail_clients.rcl_modification_date IS 'Date de la dernière modification du détaillant';
COMMENT ON COLUMN phenix.retail_clients.rcl_deletion_date IS 'Date de suppression du détaillant';
COMMENT ON COLUMN phenix.retail_clients.rcl_rlt_code IS 'Territoire associé au détaillant';
COMMENT ON COLUMN phenix.retail_clients.rcl_rcm_code IS 'Personne responsable du détaillant';
COMMENT ON COLUMN phenix.retail_clients.rcl_owner_type IS 'Types de détaillant';
COMMENT ON COLUMN phenix.retail_clients.rcl_terms IS 'Indique le code du terme pris dans ACCPAC';