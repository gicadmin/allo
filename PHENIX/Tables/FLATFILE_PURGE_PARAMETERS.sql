CREATE TABLE phenix.flatfile_purge_parameters (
  ffp_directory VARCHAR2(30 BYTE) NOT NULL,
  ffp_purge_months NUMBER(3) DEFAULT 12 NOT NULL,
  ffp_delete_months NUMBER(3) DEFAULT 1 NOT NULL,
  CONSTRAINT ffp_directory_pk PRIMARY KEY (ffp_directory)
);
COMMENT ON TABLE phenix.flatfile_purge_parameters IS 'Table utilisée pour la purge des fichiers d''interface';
COMMENT ON COLUMN phenix.flatfile_purge_parameters.ffp_directory IS 'Nom du répertoire';
COMMENT ON COLUMN phenix.flatfile_purge_parameters.ffp_purge_months IS 'Indique le nombre de mois que l''on conserve les fichiers non compressés dans le répertoire';
COMMENT ON COLUMN phenix.flatfile_purge_parameters.ffp_delete_months IS 'Indique le nombre de mois que les fichiers compressés sont conservés dans le répertoire';