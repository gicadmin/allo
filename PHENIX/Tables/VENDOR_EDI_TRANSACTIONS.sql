CREATE TABLE phenix.vendor_edi_transactions (
  vet_ven_code NUMBER(5) NOT NULL,
  vet_edi_code NUMBER(3) NOT NULL,
  vet_direction_flag VARCHAR2(2 BYTE) NOT NULL CONSTRAINT vet_direction_flag_ck CHECK (VET_DIRECTION_FLAG IN ('IN', 'OU', 'BO')),
  CONSTRAINT vet_pk PRIMARY KEY (vet_ven_code,vet_edi_code),
  CONSTRAINT vet_edi_fk FOREIGN KEY (vet_edi_code) REFERENCES phenix.edi_transactions (edi_code),
  CONSTRAINT vet_ven_fk FOREIGN KEY (vet_ven_code) REFERENCES phenix.vendors (ven_code) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.vendor_edi_transactions IS 'Indique les types de transaction EDI disponible pour un fournisseur';
COMMENT ON COLUMN phenix.vendor_edi_transactions.vet_ven_code IS 'Numéro du fournisseur';
COMMENT ON COLUMN phenix.vendor_edi_transactions.vet_edi_code IS 'Numéro de transaction EDI';
COMMENT ON COLUMN phenix.vendor_edi_transactions.vet_direction_flag IS 'Indique si la transaction est entrante ou sortante';