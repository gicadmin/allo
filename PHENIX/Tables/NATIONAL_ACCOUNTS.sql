CREATE TABLE phenix.national_accounts (
  nac_code NUMBER(4) NOT NULL,
  nac_description VARCHAR2(30 BYTE) NOT NULL,
  nac_alt_description VARCHAR2(30 BYTE),
  nac_admin_method VARCHAR2(1 BYTE) NOT NULL CONSTRAINT nac_admin_method_ck CHECK (NAC_ADMIN_METHOD IN ('P', 'S')),
  nac_product_identifier VARCHAR2(1 BYTE) NOT NULL CONSTRAINT nac_product_identifier_ck CHECK (NAC_PRODUCT_IDENTIFIER IN ('D', 'B')),
  nac_address VARCHAR2(45 BYTE) NOT NULL,
  nac_city VARCHAR2(30 BYTE) NOT NULL,
  nac_prv_code VARCHAR2(2 BYTE) NOT NULL,
  nac_postal_code VARCHAR2(10 BYTE) NOT NULL,
  nac_telephone NUMBER(11),
  nac_fax NUMBER(11),
  nac_contact_name VARCHAR2(30 BYTE),
  nac_email VARCHAR2(100 BYTE),
  nac_include_car_amount_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT nac_include_car_amount_swi_ck CHECK (NAC_INCLUDE_CAR_AMOUNT_SWITCH IN (0, 1)),
  nac_synchronization_id NUMBER(15),
  nac_prd_check_digit_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT nac_prd_check_digit_sw_ck CHECK (NAC_PRD_CHECK_DIGIT_SWITCH IN (0,1)),
  CONSTRAINT nac_prd_ident_check_digit_ck CHECK (
((NAC_PRODUCT_IDENTIFIER='D' AND NAC_PRD_CHECK_DIGIT_SWITCH=0) OR (NAC_PRODUCT_IDENTIFIER='B'))
),
  CONSTRAINT nac_pk PRIMARY KEY (nac_code),
  CONSTRAINT nac_prv_fk FOREIGN KEY (nac_prv_code) REFERENCES phenix.provinces (prv_code)
);
COMMENT ON TABLE phenix.national_accounts IS 'Comptes nationaux';
COMMENT ON COLUMN phenix.national_accounts.nac_code IS 'Numéro du compte national';
COMMENT ON COLUMN phenix.national_accounts.nac_description IS 'Description';
COMMENT ON COLUMN phenix.national_accounts.nac_alt_description IS 'Description alternative';
COMMENT ON COLUMN phenix.national_accounts.nac_admin_method IS 'Méthode de calcul du "cost plus"';
COMMENT ON COLUMN phenix.national_accounts.nac_product_identifier IS 'Identifie la provenance du code de produit';
COMMENT ON COLUMN phenix.national_accounts.nac_address IS 'Indique l''adresse du compte national';
COMMENT ON COLUMN phenix.national_accounts.nac_city IS 'Indique la ville du compte national';
COMMENT ON COLUMN phenix.national_accounts.nac_prv_code IS 'Indique la province du compte national';
COMMENT ON COLUMN phenix.national_accounts.nac_postal_code IS 'Indique le code postal du compte national';
COMMENT ON COLUMN phenix.national_accounts.nac_telephone IS 'Indique le numéro de téléphone du compte national';
COMMENT ON COLUMN phenix.national_accounts.nac_fax IS 'Indique le numéro de télécopieur du compte national';
COMMENT ON COLUMN phenix.national_accounts.nac_contact_name IS 'Indique le nom du contact du compte national';
COMMENT ON COLUMN phenix.national_accounts.nac_email IS 'Indique l''adresse générale de courriel pour le compte national';
COMMENT ON COLUMN phenix.national_accounts.nac_include_car_amount_switch IS 'Indique si le montant servant au count et recount est inclus quand la promotion est appliquée sur le NAC';
COMMENT ON COLUMN phenix.national_accounts.nac_synchronization_id IS 'Identifiant de synchronization';
COMMENT ON COLUMN phenix.national_accounts.nac_prd_check_digit_switch IS 'Indique si le produit comporte un caractère de vérification';