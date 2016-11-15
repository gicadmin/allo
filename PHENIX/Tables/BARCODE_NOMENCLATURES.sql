CREATE TABLE phenix.barcode_nomenclatures (
  bcn_id NUMBER(15) NOT NULL,
  bcn_bcc_code NUMBER(5) NOT NULL,
  bcn_bct_code NUMBER(5) NOT NULL,
  bcn_start_position NUMBER(3) NOT NULL,
  bcn_length NUMBER(3) NOT NULL,
  bcn_nb_decimal NUMBER(1) DEFAULT 0 NOT NULL,
  bcn_ai VARCHAR2(5 BYTE),
  CONSTRAINT bcn_pk PRIMARY KEY (bcn_id) USING INDEX (CREATE UNIQUE INDEX phenix.bcn_pk_i ON phenix.barcode_nomenclatures(bcn_id)    ),
  CONSTRAINT bcn_uk UNIQUE (bcn_bcc_code,bcn_bct_code) USING INDEX (CREATE UNIQUE INDEX phenix.bcn_uk_i ON phenix.barcode_nomenclatures(bcn_bcc_code,bcn_bct_code)    ),
  CONSTRAINT bcn_bcc_fk FOREIGN KEY (bcn_bcc_code) REFERENCES phenix.barcode_components (bcc_code),
  CONSTRAINT bcn_bct_fk FOREIGN KEY (bcn_bct_code) REFERENCES phenix.barcode_types (bct_code)
);
COMMENT ON TABLE phenix.barcode_nomenclatures IS 'Table des nomenclatures des composantes des codes à barre';
COMMENT ON COLUMN phenix.barcode_nomenclatures.bcn_id IS 'Indique l''identifiant de la nomenclature de la composante du code à barre';
COMMENT ON COLUMN phenix.barcode_nomenclatures.bcn_bcc_code IS 'Indique le code de la composante du code à barre';
COMMENT ON COLUMN phenix.barcode_nomenclatures.bcn_bct_code IS 'Indique le code du type du code à barre';
COMMENT ON COLUMN phenix.barcode_nomenclatures.bcn_start_position IS 'Indique la position de départ du code à barre';
COMMENT ON COLUMN phenix.barcode_nomenclatures.bcn_length IS 'Indique la longueur du code à barre';
COMMENT ON COLUMN phenix.barcode_nomenclatures.bcn_nb_decimal IS 'Indique le nombre de décimal';
COMMENT ON COLUMN phenix.barcode_nomenclatures.bcn_ai IS 'Indique l''identifiant d''application de la composante du code à barre';