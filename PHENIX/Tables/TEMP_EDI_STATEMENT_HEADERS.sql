CREATE GLOBAL TEMPORARY TABLE phenix.temp_edi_statement_headers (
  tesh_id NUMBER(15) NOT NULL,
  tesh_whs_code VARCHAR2(2 BYTE),
  tesh_segment_type VARCHAR2(3 BYTE) NOT NULL,
  tesh_partner_code VARCHAR2(15 BYTE),
  tesh_sender_id_qualifier VARCHAR2(2 BYTE),
  tesh_sender_id VARCHAR2(15 BYTE),
  tesh_receiver_id_qualifier VARCHAR2(2 BYTE),
  tesh_receiver_id VARCHAR2(15 BYTE),
  tesh_statement_date DATE,
  tesh_statement_number VARCHAR2(16 BYTE),
  tesh_federal_tax_number VARCHAR2(30 BYTE),
  tesh_provincial_tax_number VARCHAR2(30 BYTE),
  CONSTRAINT tesh_pk PRIMARY KEY (tesh_id)
)
ON COMMIT DELETE ROWS;
COMMENT ON TABLE phenix.temp_edi_statement_headers IS 'Table des entêtes des transactions edi';
COMMENT ON COLUMN phenix.temp_edi_statement_headers.tesh_id IS 'Identifiant de la table';
COMMENT ON COLUMN phenix.temp_edi_statement_headers.tesh_whs_code IS 'Indique le code de l''enttepôt';
COMMENT ON COLUMN phenix.temp_edi_statement_headers.tesh_segment_type IS 'Indique l''dentification du type de segment (RecordId)';
COMMENT ON COLUMN phenix.temp_edi_statement_headers.tesh_partner_code IS 'Indique le partnerCode';
COMMENT ON COLUMN phenix.temp_edi_statement_headers.tesh_sender_id_qualifier IS 'Indique le qualificatif du code d''émetteur (sender - WebEdi)';
COMMENT ON COLUMN phenix.temp_edi_statement_headers.tesh_sender_id IS 'Indique le Code de l''émetteur (sender - WebEdi)';
COMMENT ON COLUMN phenix.temp_edi_statement_headers.tesh_receiver_id_qualifier IS 'Indique le qualificatif du code du destinataire (receiver - WebEdi)';
COMMENT ON COLUMN phenix.temp_edi_statement_headers.tesh_receiver_id IS 'Indique le code du destinataire (receiver - WebEdi)';
COMMENT ON COLUMN phenix.temp_edi_statement_headers.tesh_statement_date IS 'Indique la date de l''état de compte';
COMMENT ON COLUMN phenix.temp_edi_statement_headers.tesh_statement_number IS 'Indique le numéro de l''état de compte';
COMMENT ON COLUMN phenix.temp_edi_statement_headers.tesh_federal_tax_number IS 'Indique le numéro de taxe fédéral sur les produits et services (ou harmonisé)';
COMMENT ON COLUMN phenix.temp_edi_statement_headers.tesh_provincial_tax_number IS 'Indique le numéro de taxe provinciale sur les produits et services ';