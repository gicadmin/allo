CREATE TABLE phenix.statistics_tracking_categories (
  stc_stt_code VARCHAR2(6 BYTE) NOT NULL,
  stc_code VARCHAR2(6 BYTE) NOT NULL,
  stc_description VARCHAR2(30 BYTE) NOT NULL,
  stc_alt_description VARCHAR2(30 BYTE),
  stc_tax_rate NUMBER(7,4),
  CONSTRAINT stc_pk PRIMARY KEY (stc_stt_code,stc_code),
  CONSTRAINT stc_stt_fk FOREIGN KEY (stc_stt_code) REFERENCES phenix.statistics_tracking_types (stt_code) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.statistics_tracking_categories IS 'Catégories des statistiques de suivis';
COMMENT ON COLUMN phenix.statistics_tracking_categories.stc_stt_code IS 'Code du type des statistiques de suivis';
COMMENT ON COLUMN phenix.statistics_tracking_categories.stc_code IS 'Code unique de la table';
COMMENT ON COLUMN phenix.statistics_tracking_categories.stc_description IS 'Description';
COMMENT ON COLUMN phenix.statistics_tracking_categories.stc_alt_description IS 'Description alternative';
COMMENT ON COLUMN phenix.statistics_tracking_categories.stc_tax_rate IS 'Indique le taux de taxation, pour les produits tabac assignés à cette categorie.';