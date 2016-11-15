CREATE TABLE phenix.tender_types (
  tty_code VARCHAR2(4 BYTE) NOT NULL,
  tty_description VARCHAR2(30 BYTE) NOT NULL,
  tty_differed_payment_switch NUMBER(1) NOT NULL CONSTRAINT tty_differed_payment_swi_ck CHECK (TTY_DIFFERED_PAYMENT_SWITCH IN (0, 1)),
  tty_alt_description VARCHAR2(30 BYTE),
  CONSTRAINT tty_pk PRIMARY KEY (tty_code)
);
COMMENT ON TABLE phenix.tender_types IS 'Table contenant les différentes méthodes de paiement pour les commandes "Payer et emporter"';
COMMENT ON COLUMN phenix.tender_types.tty_code IS 'Indique le code du type de paiement';
COMMENT ON COLUMN phenix.tender_types.tty_description IS 'Indique la description du type de paiement';
COMMENT ON COLUMN phenix.tender_types.tty_differed_payment_switch IS 'Indique si ce type de paiement est différé';
COMMENT ON COLUMN phenix.tender_types.tty_alt_description IS 'Indique la description alternative du type de paiement';