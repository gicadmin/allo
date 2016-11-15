CREATE TABLE phenix.account_statement_details (
  asd_id NUMBER(15) NOT NULL,
  asd_ash_id NUMBER(15) NOT NULL,
  asd_invoice_number VARCHAR2(15 BYTE) NOT NULL,
  asd_invoice_date DATE NOT NULL,
  asd_invoice_type VARCHAR2(2 BYTE) NOT NULL CONSTRAINT asd_invoice_type_ck CHECK (ASD_INVOICE_TYPE IN ('FA','CN','DR','DB','PA','BL','TR','TC','CM')),
  asd_balance_due_amount NUMBER(10,2) NOT NULL,
  asd_federal_tax_amount NUMBER(10,2) NOT NULL,
  asd_provincial_tax_amount NUMBER(10,2) NOT NULL,
  asd_partial_payment_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT asd_partial_payment_switch_ck CHECK (ASD_PARTIAL_PAYMENT_SWITCH IN (0,1)),
  asd_due_date DATE NOT NULL,
  CONSTRAINT asd_pk PRIMARY KEY (asd_id),
  CONSTRAINT asd_ash_fk FOREIGN KEY (asd_ash_id) REFERENCES phenix.account_statement_headers (ash_id)
);
COMMENT ON TABLE phenix.account_statement_details IS 'Table utilisée pour les des etats de compte servant à la génération du rapport de l''etat de compte du client ';
COMMENT ON COLUMN phenix.account_statement_details.asd_id IS 'Indique l''identifiant unique de la table';
COMMENT ON COLUMN phenix.account_statement_details.asd_ash_id IS 'Indique l''identifiant de l''entête de la table parent';
COMMENT ON COLUMN phenix.account_statement_details.asd_invoice_number IS 'Indique le numéro de facture';
COMMENT ON COLUMN phenix.account_statement_details.asd_invoice_date IS 'Indique la date de la facture';
COMMENT ON COLUMN phenix.account_statement_details.asd_invoice_type IS 'Indique le type de la facture';
COMMENT ON COLUMN phenix.account_statement_details.asd_balance_due_amount IS 'Indique le montant dû pour la facture';
COMMENT ON COLUMN phenix.account_statement_details.asd_federal_tax_amount IS 'Indique le montant de la taxe fédérale';
COMMENT ON COLUMN phenix.account_statement_details.asd_provincial_tax_amount IS 'Indique le montant de la taxe provinciale';
COMMENT ON COLUMN phenix.account_statement_details.asd_partial_payment_switch IS 'Indique si la facture a été partiellement payée';
COMMENT ON COLUMN phenix.account_statement_details.asd_due_date IS 'Indique la date d''échéance de la facture';