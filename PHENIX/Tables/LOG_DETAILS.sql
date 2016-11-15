CREATE TABLE phenix.log_details (
  lod_id NUMBER(15) NOT NULL,
  lod_loh_id NUMBER(15) NOT NULL,
  lod_line_number NUMBER(6),
  lod_message VARCHAR2(2000 BYTE),
  lod_error VARCHAR2(1000 BYTE),
  lod_creation_date DATE DEFAULT SYSDATE NOT NULL,
  CONSTRAINT lod_pk PRIMARY KEY (lod_id),
  CONSTRAINT lod_loh_fk FOREIGN KEY (lod_loh_id) REFERENCES phenix.log_headers (loh_id) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.log_details IS 'Contient les informations des lignes traitées';
COMMENT ON COLUMN phenix.log_details.lod_id IS 'Numéro de l''identifiant';
COMMENT ON COLUMN phenix.log_details.lod_loh_id IS 'Numéro de l''identifiant de la table LOG_HEADERS';
COMMENT ON COLUMN phenix.log_details.lod_line_number IS 'Numéro de ligne';
COMMENT ON COLUMN phenix.log_details.lod_message IS 'Message informatif';
COMMENT ON COLUMN phenix.log_details.lod_error IS 'Erreur sur la ligne';