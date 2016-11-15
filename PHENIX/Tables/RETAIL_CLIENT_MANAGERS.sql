CREATE TABLE phenix.retail_client_managers (
  rcm_code NUMBER(5) NOT NULL,
  rcm_name VARCHAR2(30 BYTE) NOT NULL,
  CONSTRAINT rcm_pk PRIMARY KEY (rcm_code)
);
COMMENT ON TABLE phenix.retail_client_managers IS 'Cette table contient les personnes responsables des détaillants';
COMMENT ON COLUMN phenix.retail_client_managers.rcm_code IS 'Numéro de la personne responsable du détaillant';
COMMENT ON COLUMN phenix.retail_client_managers.rcm_name IS 'Nom de la personne responsable du détaillant';