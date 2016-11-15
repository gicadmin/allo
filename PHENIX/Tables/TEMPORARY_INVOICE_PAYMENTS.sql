CREATE GLOBAL TEMPORARY TABLE phenix.temporary_invoice_payments (
  tip_tty_code VARCHAR2(4 BYTE) NOT NULL,
  tip_amount NUMBER(7,2) NOT NULL,
  tip_authorization_number VARCHAR2(20 BYTE),
  tip_credit_note_reference NUMBER(15),
  tip_post_dated_switch NUMBER(1) DEFAULT 0 NOT NULL,
  tip_change_amount NUMBER(7,2) DEFAULT 0 NOT NULL,
  tip_rounding_amount NUMBER(7,2) DEFAULT 0 NOT NULL
)
ON COMMIT PRESERVE ROWS;
COMMENT ON TABLE phenix.temporary_invoice_payments IS 'Table de paiements des factures';
COMMENT ON COLUMN phenix.temporary_invoice_payments.tip_tty_code IS 'Indique le type de paiement';
COMMENT ON COLUMN phenix.temporary_invoice_payments.tip_amount IS 'Indique le montant du paiement';
COMMENT ON COLUMN phenix.temporary_invoice_payments.tip_authorization_number IS 'Indique le code d''autorisation pour paiement débit ou crédit';
COMMENT ON COLUMN phenix.temporary_invoice_payments.tip_credit_note_reference IS 'Indique le numéro de la note de crédit (facture CN)';
COMMENT ON COLUMN phenix.temporary_invoice_payments.tip_post_dated_switch IS 'Indique s''il s''agit d''un type de paiement postdaté (chèque)';
COMMENT ON COLUMN phenix.temporary_invoice_payments.tip_change_amount IS 'Indique le montant de la monnaie remis au client (en argent comptant)';
COMMENT ON COLUMN phenix.temporary_invoice_payments.tip_rounding_amount IS 'Indique le montant de l''arrondissement, différence entre monnaie comptable et monnaie réelle remise au client (en argent comptant)';