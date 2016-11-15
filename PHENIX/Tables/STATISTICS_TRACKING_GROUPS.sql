CREATE TABLE phenix.statistics_tracking_groups (
  stg_stt_code VARCHAR2(6 BYTE) NOT NULL,
  stg_code VARCHAR2(10 BYTE) NOT NULL,
  stg_description VARCHAR2(30 BYTE) NOT NULL,
  stg_alt_description VARCHAR2(30 BYTE),
  CONSTRAINT stg_pk PRIMARY KEY (stg_stt_code,stg_code),
  CONSTRAINT stg_stt_fk FOREIGN KEY (stg_stt_code) REFERENCES phenix.statistics_tracking_types (stt_code)
);
COMMENT ON TABLE phenix.statistics_tracking_groups IS 'Table utilisée pour le regroupement des clients du ficher de statistiques';
COMMENT ON COLUMN phenix.statistics_tracking_groups.stg_stt_code IS 'Indique le code du type des statistiques';
COMMENT ON COLUMN phenix.statistics_tracking_groups.stg_code IS 'Indique le code de regroupement des clients dans ce fichier de statistiques';
COMMENT ON COLUMN phenix.statistics_tracking_groups.stg_description IS 'Indique la description du regroupement des clients dans ce fichier de statistiques';
COMMENT ON COLUMN phenix.statistics_tracking_groups.stg_alt_description IS 'Indique la description alternative du regroupement des clients dans ce fichier de statistiques';