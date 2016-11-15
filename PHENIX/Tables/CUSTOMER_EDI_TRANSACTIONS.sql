CREATE TABLE phenix.customer_edi_transactions (
  cet_cus_code NUMBER(10) NOT NULL,
  cet_edi_code NUMBER(3) NOT NULL,
  cet_direction_flag VARCHAR2(2 BYTE) NOT NULL CONSTRAINT cet_direction_flag_ck CHECK (CET_DIRECTION_FLAG IN ('IN', 'OU', 'BO')),
  CONSTRAINT cet_edi_pk PRIMARY KEY (cet_edi_code,cet_cus_code),
  CONSTRAINT cet_cus_fk FOREIGN KEY (cet_cus_code) REFERENCES phenix.customers (cus_code) ON DELETE CASCADE,
  CONSTRAINT cet_edi_fk FOREIGN KEY (cet_edi_code) REFERENCES phenix.edi_transactions (edi_code)
);
COMMENT ON TABLE phenix.customer_edi_transactions IS 'Type de transaction EDI pour le client';
COMMENT ON COLUMN phenix.customer_edi_transactions.cet_cus_code IS 'Indique le code de client';
COMMENT ON COLUMN phenix.customer_edi_transactions.cet_edi_code IS 'Indique le code du type de transaction';
COMMENT ON COLUMN phenix.customer_edi_transactions.cet_direction_flag IS 'Indique le(s) droit(s) autorisé(s) concernant cette transaction EDI (Entrant, Entrant/Sortant, Sortant)';