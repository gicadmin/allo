CREATE TABLE phenix.miscellaneous_charge_details (
  mcd_id NUMBER(15) NOT NULL,
  mcd_mch_id NUMBER(15) NOT NULL,
  mcd_mct_code NUMBER(3) NOT NULL,
  mcd_retail_amount NUMBER(10,2) NOT NULL,
  mcd_federal_tax_amount NUMBER(8,2) NOT NULL,
  mcd_provincial_tax_amount NUMBER(8,2) NOT NULL,
  mcd_automatic_switch NUMBER(1) NOT NULL CONSTRAINT mcd_automatic_switch_ck CHECK (MCD_AUTOMATIC_SWITCH IN (0,1)),
  mcd_reference_number VARCHAR2(15 BYTE),
  mcd_message VARCHAR2(100 BYTE),
  mcd_inh_id NUMBER(15),
  CONSTRAINT mcd_pk PRIMARY KEY (mcd_id) USING INDEX (CREATE UNIQUE INDEX phenix.mcd_pk_i ON phenix.miscellaneous_charge_details(mcd_id)    ),
  CONSTRAINT mcd_inh_fk FOREIGN KEY (mcd_inh_id) REFERENCES phenix.invoice_headers (inh_id),
  CONSTRAINT mcd_mch_fk FOREIGN KEY (mcd_mch_id) REFERENCES phenix.miscellaneous_charge_headers (mch_id),
  CONSTRAINT mcd_mct_fk FOREIGN KEY (mcd_mct_code) REFERENCES phenix.miscellaneous_charge_types (mct_code)
);
COMMENT ON TABLE phenix.miscellaneous_charge_details IS 'Table des charges diverses';
COMMENT ON COLUMN phenix.miscellaneous_charge_details.mcd_id IS 'Indique l''identifiant de la charge';
COMMENT ON COLUMN phenix.miscellaneous_charge_details.mcd_mch_id IS 'Indique l''en-tête de la charge';
COMMENT ON COLUMN phenix.miscellaneous_charge_details.mcd_mct_code IS 'Indique le type de charge';
COMMENT ON COLUMN phenix.miscellaneous_charge_details.mcd_retail_amount IS 'Indique le montant de vente';
COMMENT ON COLUMN phenix.miscellaneous_charge_details.mcd_federal_tax_amount IS 'Indique le montant de la taxe fédérale';
COMMENT ON COLUMN phenix.miscellaneous_charge_details.mcd_provincial_tax_amount IS 'Indique le montant de la taxe provinciale';
COMMENT ON COLUMN phenix.miscellaneous_charge_details.mcd_automatic_switch IS 'Indique si la charge a été générée automatiquement à partir des charges récurrentes';
COMMENT ON COLUMN phenix.miscellaneous_charge_details.mcd_reference_number IS 'Indique le numéro de référence';
COMMENT ON COLUMN phenix.miscellaneous_charge_details.mcd_message IS 'Indique le message optionnel';
COMMENT ON COLUMN phenix.miscellaneous_charge_details.mcd_inh_id IS 'Indique le numéro de facture de la charge';