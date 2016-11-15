CREATE GLOBAL TEMPORARY TABLE phenix.temp_edi_statement_details (
  tesd_id NUMBER(15) NOT NULL,
  tesd_tesh_id NUMBER(15),
  tesd_whs_code VARCHAR2(2 BYTE),
  tesd_segment_type VARCHAR2(3 BYTE) NOT NULL,
  tesd_invoice_number VARCHAR2(16 BYTE),
  tesd_invoice_date DATE,
  tesd_client_code VARCHAR2(10 BYTE),
  tesd_customer_code VARCHAR2(10 BYTE),
  tesd_federal_tax NUMBER(8,2),
  tesd_provincial_tax NUMBER(8,2),
  tesd_invoice_total NUMBER(8,2),
  CONSTRAINT tesd_pk PRIMARY KEY (tesd_id)
)
ON COMMIT DELETE ROWS;
COMMENT ON TABLE phenix.temp_edi_statement_details IS 'Table des détails des transactions EDI';
COMMENT ON COLUMN phenix.temp_edi_statement_details.tesd_id IS 'Indique l''identifiant de la table';
COMMENT ON COLUMN phenix.temp_edi_statement_details.tesd_tesh_id IS 'Indique l''identifiant du header';
COMMENT ON COLUMN phenix.temp_edi_statement_details.tesd_whs_code IS 'Indique le code d’entrepôt';
COMMENT ON COLUMN phenix.temp_edi_statement_details.tesd_segment_type IS 'Indique le type de segment';
COMMENT ON COLUMN phenix.temp_edi_statement_details.tesd_invoice_number IS 'Indique le numéro de facture au détaillant';
COMMENT ON COLUMN phenix.temp_edi_statement_details.tesd_invoice_date IS 'Indique la date de la facture au détaillant';
COMMENT ON COLUMN phenix.temp_edi_statement_details.tesd_client_code IS 'Indique le code du détaillant';
COMMENT ON COLUMN phenix.temp_edi_statement_details.tesd_customer_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.temp_edi_statement_details.tesd_federal_tax IS 'Indique la taxe fédérale';
COMMENT ON COLUMN phenix.temp_edi_statement_details.tesd_provincial_tax IS 'Indique la taxe provinciale';
COMMENT ON COLUMN phenix.temp_edi_statement_details.tesd_invoice_total IS 'Indique le montant total de la facture incluant les taxes';