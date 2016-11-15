CREATE TABLE phenix.account_statement_headers (
  ash_id NUMBER(15) NOT NULL,
  ash_accpac_id NUMBER(15) NOT NULL,
  ash_cus_code NUMBER(10) NOT NULL,
  ash_cus_term_description VARCHAR2(60 BYTE),
  ash_generation_date DATE NOT NULL,
  ash_communication_date DATE,
  ash_current_amount NUMBER(10,2) NOT NULL,
  ash_past_due_8_14_amount NUMBER(10,2) NOT NULL,
  ash_past_due_15_21_amount NUMBER(10,2) NOT NULL,
  ash_past_due_over_21_amount NUMBER(10,2) NOT NULL,
  ash_recipient_code NUMBER(8),
  CONSTRAINT ash_pk PRIMARY KEY (ash_id),
  CONSTRAINT ash_uk UNIQUE (ash_accpac_id,ash_cus_code),
  CONSTRAINT ash_cus_fk FOREIGN KEY (ash_cus_code) REFERENCES phenix.customers (cus_code)
);
COMMENT ON TABLE phenix.account_statement_headers IS 'Table utilisée pour l''entête des etats de compte servant à la génération du rapport de l''etat de compte du client ';
COMMENT ON COLUMN phenix.account_statement_headers.ash_id IS 'Indique l''identifiant unique de la table';
COMMENT ON COLUMN phenix.account_statement_headers.ash_accpac_id IS 'Indique l''identifiant de la table ACCPAC';
COMMENT ON COLUMN phenix.account_statement_headers.ash_cus_code IS 'Indique le numéro du client';
COMMENT ON COLUMN phenix.account_statement_headers.ash_cus_term_description IS 'Indique la description du terme du client';
COMMENT ON COLUMN phenix.account_statement_headers.ash_generation_date IS 'Indique la date de génération de l''etat de compte';
COMMENT ON COLUMN phenix.account_statement_headers.ash_communication_date IS 'Indique la date d''envoi ou d''impression de l''etat de compte';
COMMENT ON COLUMN phenix.account_statement_headers.ash_current_amount IS 'Indique le montant dû en retard de 1 à 7 jours';
COMMENT ON COLUMN phenix.account_statement_headers.ash_past_due_8_14_amount IS 'Indique le montant dû en retard de 8 à 14 jours';
COMMENT ON COLUMN phenix.account_statement_headers.ash_past_due_15_21_amount IS 'Indique le montant dû en retard de 15 à 21 jours';
COMMENT ON COLUMN phenix.account_statement_headers.ash_past_due_over_21_amount IS 'Indique le montant dû en retard de plus que 21 jours';
COMMENT ON COLUMN phenix.account_statement_headers.ash_recipient_code IS 'Indique le code destinataire du client';