CREATE TABLE phenix.stat_tracking_category_formats (
  scf_id NUMBER(15) NOT NULL,
  scf_stc_stt_code VARCHAR2(6 BYTE),
  scf_stc_code VARCHAR2(6 BYTE),
  scf_fmt_code VARCHAR2(7 BYTE),
  scf_format_label VARCHAR2(3 BYTE),
  CONSTRAINT scf_pk PRIMARY KEY (scf_id),
  CONSTRAINT scf_uk UNIQUE (scf_stc_stt_code,scf_stc_code,scf_fmt_code),
  CONSTRAINT scf_fmt_fk FOREIGN KEY (scf_fmt_code) REFERENCES phenix.formats (fmt_code),
  CONSTRAINT scf_stc_fk FOREIGN KEY (scf_stc_stt_code,scf_stc_code) REFERENCES phenix.statistics_tracking_categories (stc_stt_code,stc_code)
);
COMMENT ON TABLE phenix.stat_tracking_category_formats IS 'Table de suivis des statistiques des categories format';
COMMENT ON COLUMN phenix.stat_tracking_category_formats.scf_id IS 'Indique l''identifiant unique de la table';
COMMENT ON COLUMN phenix.stat_tracking_category_formats.scf_stc_stt_code IS 'Indique le code du type des statistiques de suivis';
COMMENT ON COLUMN phenix.stat_tracking_category_formats.scf_stc_code IS 'Indique le code de la catégorie des statistiques de suivis';
COMMENT ON COLUMN phenix.stat_tracking_category_formats.scf_fmt_code IS 'Indique le code du format';
COMMENT ON COLUMN phenix.stat_tracking_category_formats.scf_format_label IS 'Indique l''étiquette associée au format';