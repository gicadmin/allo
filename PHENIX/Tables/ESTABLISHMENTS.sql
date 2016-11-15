CREATE TABLE phenix.establishments (
  est_code VARCHAR2(7 BYTE) NOT NULL,
  est_name VARCHAR2(30 BYTE) NOT NULL,
  est_alt_name VARCHAR2(30 BYTE),
  CONSTRAINT est_pk PRIMARY KEY (est_code) USING INDEX (CREATE UNIQUE INDEX phenix.est_pk_i ON phenix.establishments(est_code)    )
);
COMMENT ON TABLE phenix.establishments IS 'Table des établissements';
COMMENT ON COLUMN phenix.establishments.est_code IS 'Indique le code de l''établissement';
COMMENT ON COLUMN phenix.establishments.est_name IS 'Indique le nom de l''établissement';
COMMENT ON COLUMN phenix.establishments.est_alt_name IS 'Indique le nom alternatif de l''établissement';