CREATE TABLE phenix.pallet_transaction_details (
  ptd_id NUMBER(15) NOT NULL,
  ptd_pth_id NUMBER(15) NOT NULL,
  ptd_in_out_code VARCHAR2(1 BYTE) NOT NULL CONSTRAINT ptd_in_out_code_ck CHECK (PTD_IN_OUT_CODE IN ('I', 'O')),
  ptd_pal_code NUMBER(3) NOT NULL,
  ptd_quantity NUMBER(6) NOT NULL,
  ptd_ptb_id NUMBER(15),
  CONSTRAINT ptd_pk PRIMARY KEY (ptd_id),
  CONSTRAINT ptd_pal_code_fk FOREIGN KEY (ptd_pal_code) REFERENCES phenix.pallet_types (pal_code),
  CONSTRAINT ptd_ptb_fk FOREIGN KEY (ptd_ptb_id) REFERENCES phenix.pallet_transaction_balances (ptb_id),
  CONSTRAINT ptd_pth_id_fk FOREIGN KEY (ptd_pth_id) REFERENCES phenix.pallet_transaction_headers (pth_id) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.pallet_transaction_details IS 'Cette table contient les détails des transactions de palettes';
COMMENT ON COLUMN phenix.pallet_transaction_details.ptd_id IS 'Numéro de détail de transaction de palettes';
COMMENT ON COLUMN phenix.pallet_transaction_details.ptd_pth_id IS 'Numéro de la transaction';
COMMENT ON COLUMN phenix.pallet_transaction_details.ptd_in_out_code IS 'Indique si on envoie cette transaction ou si on la reçoit';
COMMENT ON COLUMN phenix.pallet_transaction_details.ptd_pal_code IS 'Type de palette';
COMMENT ON COLUMN phenix.pallet_transaction_details.ptd_quantity IS 'Quantité';
COMMENT ON COLUMN phenix.pallet_transaction_details.ptd_ptb_id IS 'Indique l''ID de sommaire attaché a cette ligne de transaction';