CREATE TABLE phenix.edi_transactions (
  edi_code NUMBER(3) NOT NULL,
  edi_description VARCHAR2(30 BYTE) NOT NULL,
  edi_alt_description VARCHAR2(30 BYTE),
  CONSTRAINT edi_pk PRIMARY KEY (edi_code)
);
COMMENT ON TABLE phenix.edi_transactions IS 'Type de transaction EDI';
COMMENT ON COLUMN phenix.edi_transactions.edi_code IS 'Numéro de transaction EDI';
COMMENT ON COLUMN phenix.edi_transactions.edi_description IS 'Description';
COMMENT ON COLUMN phenix.edi_transactions.edi_alt_description IS 'Description alternative';