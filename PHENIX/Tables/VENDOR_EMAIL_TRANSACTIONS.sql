CREATE TABLE phenix.vendor_email_transactions (
  vmt_id NUMBER(15) NOT NULL,
  vmt_ven_code NUMBER(5) NOT NULL,
  vmt_report_type VARCHAR2(2 BYTE) NOT NULL CONSTRAINT vmt_report_type_ck CHECK (vmt_report_type IN ('BF', 'CF', 'CN', 'VC', 'VD', 'VB', 'VR', 'VA', 'DD', 'RD', 'VG', 'VI', 'PT', 'RC', 'VT', 'OA', 'OR', 'VM', 'RF','VS')),
  vmt_email VARCHAR2(100 BYTE) NOT NULL,
  CONSTRAINT vmt_id_pk PRIMARY KEY (vmt_id) USING INDEX (CREATE INDEX phenix.vmt_id_pk_i ON phenix.vendor_email_transactions(vmt_id)    ),
  CONSTRAINT vmt_ven_code_fk FOREIGN KEY (vmt_ven_code) REFERENCES phenix.vendors (ven_code) ON DELETE CASCADE
);
COMMENT ON COLUMN phenix.vendor_email_transactions.vmt_id IS 'Identifiant unique';
COMMENT ON COLUMN phenix.vendor_email_transactions.vmt_ven_code IS 'Code du fournisseur';
COMMENT ON COLUMN phenix.vendor_email_transactions.vmt_report_type IS 'Indique le type de transaction';
COMMENT ON COLUMN phenix.vendor_email_transactions.vmt_email IS 'Courriel';