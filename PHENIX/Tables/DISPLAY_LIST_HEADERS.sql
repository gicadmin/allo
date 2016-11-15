CREATE TABLE phenix.display_list_headers (
  dlh_id NUMBER(15) NOT NULL,
  dlh_description VARCHAR2(30 BYTE) NOT NULL,
  dlh_alt_description VARCHAR2(30 BYTE),
  dlh_cus_code NUMBER(10),
  dlh_ven_code NUMBER(5),
  dlh_upro_id NUMBER(15),
  dlh_creation_date DATE DEFAULT SYSDATE NOT NULL,
  dlh_modification_date DATE DEFAULT SYSDATE NOT NULL,
  CONSTRAINT dlh_cus_ven_upro_ck CHECK (
(DLH_CUS_CODE IS NOT NULL AND DLH_VEN_CODE IS NULL AND DLH_UPRO_ID IS NULL) OR
(DLH_VEN_CODE IS NOT NULL AND DLH_CUS_CODE IS NULL AND DLH_UPRO_ID IS NULL) OR
(DLH_UPRO_ID  IS NOT NULL AND DLH_CUS_CODE IS NULL AND DLH_VEN_CODE IS NULL )),
  CONSTRAINT dlh_pk PRIMARY KEY (dlh_id),
  CONSTRAINT dlh_cus_fk FOREIGN KEY (dlh_cus_code) REFERENCES phenix.customers (cus_code) ON DELETE CASCADE,
  CONSTRAINT dlh_upro_fk FOREIGN KEY (dlh_upro_id) REFERENCES phenix.user_profiles (upro_id) ON DELETE CASCADE,
  CONSTRAINT dlh_ven_fk FOREIGN KEY (dlh_ven_code) REFERENCES phenix.vendors (ven_code) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.display_list_headers IS 'Table des listes d''entete';
COMMENT ON COLUMN phenix.display_list_headers.dlh_id IS 'Indique l''identifiant de la table';
COMMENT ON COLUMN phenix.display_list_headers.dlh_description IS 'Indique le nom de la liste';
COMMENT ON COLUMN phenix.display_list_headers.dlh_alt_description IS 'Indique le nom alternatif de la liste';
COMMENT ON COLUMN phenix.display_list_headers.dlh_cus_code IS 'Indique le code client ';
COMMENT ON COLUMN phenix.display_list_headers.dlh_ven_code IS 'Indique le code fournisseur';
COMMENT ON COLUMN phenix.display_list_headers.dlh_upro_id IS 'Indique le code de l''utilisateur d''application';
COMMENT ON COLUMN phenix.display_list_headers.dlh_creation_date IS 'Indique la date de création';
COMMENT ON COLUMN phenix.display_list_headers.dlh_modification_date IS 'Indique la date de modification';