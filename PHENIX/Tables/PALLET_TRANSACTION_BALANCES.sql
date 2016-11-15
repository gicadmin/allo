CREATE TABLE phenix.pallet_transaction_balances (
  ptb_id NUMBER(15) NOT NULL,
  ptb_fca_year NUMBER(4) NOT NULL,
  ptb_fca_period NUMBER(2) NOT NULL,
  ptb_whs_code VARCHAR2(2 BYTE) NOT NULL,
  ptb_pal_code NUMBER(3) NOT NULL,
  ptb_car_code NUMBER(5),
  ptb_ven_code NUMBER(5),
  ptb_cus_code NUMBER(10),
  ptb_open_balance NUMBER(6) DEFAULT 0 NOT NULL,
  ptb_close_balance NUMBER(6) DEFAULT 0 NOT NULL,
  ptb_invoiced_quantity NUMBER(6) DEFAULT 0 NOT NULL,
  ptb_inh_id NUMBER(15),
  ptb_federal_tax_amount NUMBER(8,2) DEFAULT 0 NOT NULL,
  ptb_provincial_tax_amount NUMBER(8,2) DEFAULT 0 NOT NULL,
  ptb_unit_cost NUMBER(6,2) DEFAULT 0 NOT NULL,
  ptb_extended_cost NUMBER(8,2) DEFAULT 0 NOT NULL,
  ptb_last_date_consolidated DATE,
  CONSTRAINT ptb_cus_ven_car_ck CHECK (
 	(
 		(PTB_CUS_CODE IS NULL AND PTB_VEN_CODE IS NULL AND PTB_CAR_CODE IS NULL)
 		OR
 		(PTB_CUS_CODE IS NOT NULL AND PTB_VEN_CODE IS NULL AND PTB_CAR_CODE IS NULL)
 		OR
 		(PTB_CUS_CODE IS NULL AND PTB_VEN_CODE IS NOT NULL AND PTB_CAR_CODE IS NULL)
 		OR
 		(PTB_CUS_CODE IS NULL AND PTB_VEN_CODE IS NULL AND PTB_CAR_CODE IS NOT NULL)
 		)
 	),
  CONSTRAINT ptb_pk PRIMARY KEY (ptb_id),
  CONSTRAINT ptb_uk UNIQUE (ptb_fca_year,ptb_fca_period,ptb_whs_code,ptb_pal_code,ptb_car_code,ptb_cus_code,ptb_ven_code),
  CONSTRAINT ptb_car_fk FOREIGN KEY (ptb_car_code) REFERENCES phenix.carriers (car_code),
  CONSTRAINT ptb_cus_fk FOREIGN KEY (ptb_cus_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT ptb_fca_fk FOREIGN KEY (ptb_fca_year,ptb_fca_period) REFERENCES phenix.fiscal_calendars (fca_year,fca_period),
  CONSTRAINT ptb_inh_fk FOREIGN KEY (ptb_inh_id) REFERENCES phenix.invoice_headers (inh_id),
  CONSTRAINT ptb_pal_fk FOREIGN KEY (ptb_pal_code) REFERENCES phenix.pallet_types (pal_code),
  CONSTRAINT ptb_ven_fk FOREIGN KEY (ptb_ven_code) REFERENCES phenix.vendors (ven_code),
  CONSTRAINT ptb_whs_fk FOREIGN KEY (ptb_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.pallet_transaction_balances IS 'Table pour les informations générales  de la balance pour les transactions de pallettes';
COMMENT ON COLUMN phenix.pallet_transaction_balances.ptb_id IS 'Indique la Clé primaire de la table';
COMMENT ON COLUMN phenix.pallet_transaction_balances.ptb_fca_year IS 'Indique l''année du calendrier fiscal';
COMMENT ON COLUMN phenix.pallet_transaction_balances.ptb_fca_period IS 'Indique la période du calendrier fiscal';
COMMENT ON COLUMN phenix.pallet_transaction_balances.ptb_whs_code IS 'Indique le type de palette concerné par la transaction de palette';
COMMENT ON COLUMN phenix.pallet_transaction_balances.ptb_car_code IS 'Indique le Code du transporteur';
COMMENT ON COLUMN phenix.pallet_transaction_balances.ptb_ven_code IS 'Indique le Code du fournisseur';
COMMENT ON COLUMN phenix.pallet_transaction_balances.ptb_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.pallet_transaction_balances.ptb_open_balance IS 'Indique la Balance en début de la période (balnnce de fin de de la période précedente)';
COMMENT ON COLUMN phenix.pallet_transaction_balances.ptb_close_balance IS 'Indique la Balance à la fin de la période';
COMMENT ON COLUMN phenix.pallet_transaction_balances.ptb_invoiced_quantity IS 'Indique la quantité facturée';
COMMENT ON COLUMN phenix.pallet_transaction_balances.ptb_inh_id IS 'Indique le numéro de facture';
COMMENT ON COLUMN phenix.pallet_transaction_balances.ptb_federal_tax_amount IS 'Indique le Montant de la taxe fédérale';
COMMENT ON COLUMN phenix.pallet_transaction_balances.ptb_provincial_tax_amount IS 'Indique le Montant de la taxe provinciale';
COMMENT ON COLUMN phenix.pallet_transaction_balances.ptb_unit_cost IS 'Indique le prix unitaire de la palette';
COMMENT ON COLUMN phenix.pallet_transaction_balances.ptb_extended_cost IS 'Indique le montant total de la facture';
COMMENT ON COLUMN phenix.pallet_transaction_balances.ptb_last_date_consolidated IS 'Indique la date de consolidation';