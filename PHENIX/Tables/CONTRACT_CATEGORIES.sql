CREATE TABLE phenix.contract_categories (
  coca_code NUMBER(10) NOT NULL,
  coca_description VARCHAR2(30 BYTE) NOT NULL,
  coca_alt_description VARCHAR2(30 BYTE),
  coca_commitment_type VARCHAR2(4 BYTE) NOT NULL CONSTRAINT coca_commitment_ck CHECK ( COCA_COMMITMENT_TYPE IN ('DOLL', 'ELEM') ),
  CONSTRAINT coca_pk PRIMARY KEY (coca_code)
);
COMMENT ON TABLE phenix.contract_categories IS 'Table des catégories des contrats';
COMMENT ON COLUMN phenix.contract_categories.coca_code IS 'Indique le numéro de la catégorie pour les contrats';
COMMENT ON COLUMN phenix.contract_categories.coca_description IS ' Indique la description de la catégorie pour les contrats';
COMMENT ON COLUMN phenix.contract_categories.coca_alt_description IS 'Indique la description alternative de la catégorie pour les contrats';
COMMENT ON COLUMN phenix.contract_categories.coca_commitment_type IS 'Indique l''engagement du contrat pour la catégorie (dollars ou éléments)';