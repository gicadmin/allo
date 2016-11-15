CREATE TABLE phenix.sales_register_trans_details (
  srtd_id NUMBER(15) NOT NULL,
  srtd_srth_id NUMBER(15) NOT NULL,
  srtd_amount NUMBER(7,2) NOT NULL,
  srtd_tty_code VARCHAR2(4 BYTE) NOT NULL,
  srtd_authorisation_number VARCHAR2(20 BYTE),
  srtd_post_dated_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT srtd_post_dated_switch_ck CHECK (SRTD_POST_DATED_SWITCH IN (0,1)),
  srtd_in_accpac_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT srtd_in_accpac_switch_ck CHECK (SRTD_IN_ACCPAC_SWITCH IN (0,1)),
  srtd_change_amount NUMBER(7,2) DEFAULT 0 NOT NULL,
  srtd_rounding_amount NUMBER(7,2) DEFAULT 0 NOT NULL,
  srtd_credit_note_reference NUMBER(15),
  srtd_balance_amount NUMBER(10,2) DEFAULT 0 NOT NULL,
  CONSTRAINT srtd_pk PRIMARY KEY (srtd_id),
  CONSTRAINT srtd_credit_note_reference_fk FOREIGN KEY (srtd_credit_note_reference) REFERENCES phenix.invoice_headers (inh_id),
  CONSTRAINT srtd_srth_id_fk FOREIGN KEY (srtd_srth_id) REFERENCES phenix.sales_register_trans_headers (srth_id) ON DELETE CASCADE,
  CONSTRAINT srtd_tty_code_fk FOREIGN KEY (srtd_tty_code) REFERENCES phenix.tender_types (tty_code)
);
COMMENT ON TABLE phenix.sales_register_trans_details IS 'Table des details de transactions de la caisse';
COMMENT ON COLUMN phenix.sales_register_trans_details.srtd_id IS 'Identifiant de la table';
COMMENT ON COLUMN phenix.sales_register_trans_details.srtd_srth_id IS 'Indique le code de la transaction';
COMMENT ON COLUMN phenix.sales_register_trans_details.srtd_amount IS 'Indique le montant de type de transaction';
COMMENT ON COLUMN phenix.sales_register_trans_details.srtd_tty_code IS 'Indique le methode de payement';
COMMENT ON COLUMN phenix.sales_register_trans_details.srtd_authorisation_number IS 'Indique le code d’autorisation pour payement debit ou credit';
COMMENT ON COLUMN phenix.sales_register_trans_details.srtd_post_dated_switch IS 'Indique si le chèque est post daté ou pas';
COMMENT ON COLUMN phenix.sales_register_trans_details.srtd_in_accpac_switch IS 'Indique que la transaction est posté dans accpac';
COMMENT ON COLUMN phenix.sales_register_trans_details.srtd_change_amount IS 'Indique le change que on a donné au client';
COMMENT ON COLUMN phenix.sales_register_trans_details.srtd_rounding_amount IS 'Indique l’arrondi que on a fait sur le montant argent comptant';
COMMENT ON COLUMN phenix.sales_register_trans_details.srtd_credit_note_reference IS 'Indique le numéro de la note de crédit';
COMMENT ON COLUMN phenix.sales_register_trans_details.srtd_balance_amount IS 'Indique le montant de la balance à payer avant l''application du paiement';