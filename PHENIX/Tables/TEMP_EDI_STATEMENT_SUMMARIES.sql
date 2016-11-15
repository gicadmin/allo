CREATE GLOBAL TEMPORARY TABLE phenix.temp_edi_statement_summaries (
  tess_id NUMBER(15) NOT NULL,
  tess_tesh_id NUMBER(15),
  tess_segment_type VARCHAR2(3 BYTE) NOT NULL,
  tess_statement_total NUMBER(8,2),
  CONSTRAINT tess_pk PRIMARY KEY (tess_id)
)
ON COMMIT DELETE ROWS;
COMMENT ON TABLE phenix.temp_edi_statement_summaries IS 'Table des sommaires des transactions EDI';
COMMENT ON COLUMN phenix.temp_edi_statement_summaries.tess_id IS 'Indique l''identifiant de la table';
COMMENT ON COLUMN phenix.temp_edi_statement_summaries.tess_tesh_id IS 'Indique l''identifiant du header';
COMMENT ON COLUMN phenix.temp_edi_statement_summaries.tess_segment_type IS 'Indique le type de segment';
COMMENT ON COLUMN phenix.temp_edi_statement_summaries.tess_statement_total IS 'Indique le totatl de tous les détails';