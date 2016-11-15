CREATE TABLE phenix.vendor_charge_posting_types (
  vcp_ven_code NUMBER(5) NOT NULL,
  vcp_vct_code VARCHAR2(2 BYTE) NOT NULL,
  vcp_vendor_charges_flag VARCHAR2(1 BYTE) NOT NULL CONSTRAINT vcp_vendor_charges_flag_ck CHECK (VCP_VENDOR_CHARGES_FLAG IN ('P', 'R')),
  vcp_gl_account VARCHAR2(40 BYTE),
  CONSTRAINT vcp_pk PRIMARY KEY (vcp_ven_code,vcp_vct_code),
  CONSTRAINT vcp_vct_fk FOREIGN KEY (vcp_vct_code) REFERENCES phenix.vendor_credit_types (vct_code) ON DELETE CASCADE,
  CONSTRAINT vcp_ven_fk FOREIGN KEY (vcp_ven_code) REFERENCES phenix.vendors (ven_code)
);
COMMENT ON COLUMN phenix.vendor_charge_posting_types.vcp_ven_code IS 'Indique le code de fournisseur concerné';
COMMENT ON COLUMN phenix.vendor_charge_posting_types.vcp_vct_code IS 'Indique le type de crédit concerné';
COMMENT ON COLUMN phenix.vendor_charge_posting_types.vcp_vendor_charges_flag IS 'Indique si la charge sera envoyé aux comptes à payer ou aux comptes à recevoir';
COMMENT ON COLUMN phenix.vendor_charge_posting_types.vcp_gl_account IS 'Indique le compte GL pour ce type de charge et ce fournisseur';