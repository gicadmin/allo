CREATE GLOBAL TEMPORARY TABLE phenix.temp_accpac_postings (
  tap_ar_ap_flag VARCHAR2(2 BYTE) NOT NULL CONSTRAINT tap_ar_ap_flag_ck CHECK (tap_ar_ap_flag IN ('AR', 'AP')),
  tap_ven_code VARCHAR2(12 BYTE),
  tap_cus_code VARCHAR2(12 BYTE),
  tap_posting_type VARCHAR2(2 BYTE),
  tap_document_id VARCHAR2(16 BYTE),
  tap_reference VARCHAR2(22 BYTE),
  tap_date DATE,
  tap_trans_description VARCHAR2(30 BYTE),
  tap_distribution_code VARCHAR2(6 BYTE),
  tap_gl_transaction_amount NUMBER(12,2),
  tap_federal_tax NUMBER(12,2),
  tap_provincial_tax NUMBER(12,2),
  tap_invoice_total NUMBER(12,2),
  tap_gl_account VARCHAR2(45 BYTE),
  tap_gl_description VARCHAR2(30 BYTE)
)
ON COMMIT DELETE ROWS;
COMMENT ON TABLE phenix.temp_accpac_postings IS 'Table temporaire utilisée pour la validation des postings d''ACCPAC';
COMMENT ON COLUMN phenix.temp_accpac_postings.tap_ar_ap_flag IS 'Indique si la transaction est à payer ou à recevoir (AP, AR)';
COMMENT ON COLUMN phenix.temp_accpac_postings.tap_ven_code IS 'Indique le code fournisseur';
COMMENT ON COLUMN phenix.temp_accpac_postings.tap_cus_code IS 'Indique le code client';
COMMENT ON COLUMN phenix.temp_accpac_postings.tap_posting_type IS 'Indique le type du rapport';
COMMENT ON COLUMN phenix.temp_accpac_postings.tap_document_id IS 'Indique le numéro de document relié au rapport';
COMMENT ON COLUMN phenix.temp_accpac_postings.tap_reference IS 'Indique le numéro de référence du document';
COMMENT ON COLUMN phenix.temp_accpac_postings.tap_date IS 'Indique la date du document relié au rapport';
COMMENT ON COLUMN phenix.temp_accpac_postings.tap_trans_description IS 'Indique la description de la transaction';
COMMENT ON COLUMN phenix.temp_accpac_postings.tap_distribution_code IS 'Indique le code de distribution (maison mère)';
COMMENT ON COLUMN phenix.temp_accpac_postings.tap_gl_transaction_amount IS 'Indique le montant de la transaction pour ce compte grand livre';
COMMENT ON COLUMN phenix.temp_accpac_postings.tap_federal_tax IS 'Indique le total de la TPS ou TVH';
COMMENT ON COLUMN phenix.temp_accpac_postings.tap_provincial_tax IS 'Indique le total de la TVQ';
COMMENT ON COLUMN phenix.temp_accpac_postings.tap_invoice_total IS 'Indique le total du document incluant les taxes';
COMMENT ON COLUMN phenix.temp_accpac_postings.tap_gl_account IS 'Indique le compte grand livre pour la transaction';
COMMENT ON COLUMN phenix.temp_accpac_postings.tap_gl_description IS 'Indique la description du compte grand livre';