CREATE TABLE phenix.customer_order_transactions (
  cot_cod_coh_id NUMBER(15) NOT NULL,
  cot_cod_line_number NUMBER(4) NOT NULL,
  cot_line_number NUMBER(4) NOT NULL,
  cot_delivery_date DATE NOT NULL,
  cot_federal_tax_rate NUMBER(6,3) NOT NULL,
  cot_line_type VARCHAR2(3 BYTE) NOT NULL CONSTRAINT cot_line_type_ck CHECK (COT_LINE_TYPE
IN ('REG', 'COU', 'DEL', 'FRE', 'KIT', 'REP', 'SUB', 'TIC')),
  cot_provincial_tax_rate NUMBER(6,3) NOT NULL,
  cot_spiff_amount NUMBER(9,2) NOT NULL,
  cot_inh_id NUMBER(15),
  cot_plh_id NUMBER(15),
  cot_invoice_line_number NUMBER(4),
  cot_invoice_quantity NUMBER(7),
  cot_invoice_weight NUMBER(9,3),
  cot_pick_line_number NUMBER(4),
  cot_pick_quantity NUMBER(7),
  cot_pick_weight NUMBER(9,3),
  cot_car_inh_id NUMBER(15),
  cot_freegood_inh_id NUMBER(15),
  cot_invoiced_ext_price NUMBER(10,2) DEFAULT 0 NOT NULL,
  cot_use_code NUMBER(5),
  cot_reconciliations_date DATE,
  cot_admin_surcharge_amount NUMBER(7,2) DEFAULT 0 NOT NULL,
  cot_invoiced_ext_surcharge NUMBER(10,2) DEFAULT 0 NOT NULL,
  CONSTRAINT cot_reconciliations_date_ck CHECK ((cot_use_code is null AND cot_reconciliations_date is null) OR (cot_use_code is not null AND cot_reconciliations_date is not null)),
  CONSTRAINT cot_pk PRIMARY KEY (cot_cod_coh_id,cot_cod_line_number,cot_line_number),
  CONSTRAINT cot_car_inh_fk FOREIGN KEY (cot_car_inh_id) REFERENCES phenix.invoice_headers (inh_id),
  CONSTRAINT cot_cod_fk FOREIGN KEY (cot_cod_coh_id,cot_cod_line_number) REFERENCES phenix.customer_order_details (cod_coh_id,cod_line_number),
  CONSTRAINT cot_freegood_inh_id_fk FOREIGN KEY (cot_freegood_inh_id) REFERENCES phenix.invoice_headers (inh_id),
  CONSTRAINT cot_inh_fk FOREIGN KEY (cot_inh_id) REFERENCES phenix.invoice_headers (inh_id),
  CONSTRAINT cot_plh_fk FOREIGN KEY (cot_plh_id) REFERENCES phenix.pick_list_headers (plh_id),
  CONSTRAINT cot_use_fk FOREIGN KEY (cot_use_code) REFERENCES phenix."USERS" (use_code)
);
COMMENT ON TABLE phenix.customer_order_transactions IS 'Lignes de transactions d''une commande client';
COMMENT ON COLUMN phenix.customer_order_transactions.cot_cod_coh_id IS 'Numéro de la commande';
COMMENT ON COLUMN phenix.customer_order_transactions.cot_cod_line_number IS 'Numéro de ligne de la commande';
COMMENT ON COLUMN phenix.customer_order_transactions.cot_line_number IS 'Numéro de ligne de la transaction';
COMMENT ON COLUMN phenix.customer_order_transactions.cot_delivery_date IS 'Date de livraison';
COMMENT ON COLUMN phenix.customer_order_transactions.cot_federal_tax_rate IS 'Taux de la taxe fédérale';
COMMENT ON COLUMN phenix.customer_order_transactions.cot_line_type IS 'Type de la ligne de transaction';
COMMENT ON COLUMN phenix.customer_order_transactions.cot_provincial_tax_rate IS 'Taux de la taxe fédérale';
COMMENT ON COLUMN phenix.customer_order_transactions.cot_spiff_amount IS 'Montant de "spiff"';
COMMENT ON COLUMN phenix.customer_order_transactions.cot_inh_id IS 'Numéro de la facture';
COMMENT ON COLUMN phenix.customer_order_transactions.cot_plh_id IS 'Numéro de cueillette';
COMMENT ON COLUMN phenix.customer_order_transactions.cot_invoice_line_number IS 'Numéro de ligne de la facture';
COMMENT ON COLUMN phenix.customer_order_transactions.cot_invoice_quantity IS 'Quantité facturée';
COMMENT ON COLUMN phenix.customer_order_transactions.cot_invoice_weight IS 'Poids facturée';
COMMENT ON COLUMN phenix.customer_order_transactions.cot_pick_line_number IS 'Numéro de ligne de la liste de cueillette';
COMMENT ON COLUMN phenix.customer_order_transactions.cot_pick_quantity IS 'Quantité cueillie';
COMMENT ON COLUMN phenix.customer_order_transactions.cot_pick_weight IS 'Poids cueilli';
COMMENT ON COLUMN phenix.customer_order_transactions.cot_car_inh_id IS 'Indique le numéro de facture où le compteur a été refacturé';
COMMENT ON COLUMN phenix.customer_order_transactions.cot_freegood_inh_id IS 'Indique le numéro de facture ''VG'' utilisé pour refacturer la gratuité offerte au client.';
COMMENT ON COLUMN phenix.customer_order_transactions.cot_invoiced_ext_price IS 'Indique le montant facturé à la ligne, qté * prix vendant ou poids * prix vendant, arrondi toujours vers le haut, à deux décimales';
COMMENT ON COLUMN phenix.customer_order_transactions.cot_use_code IS 'Code utilisateur qui a valider la ligne de commande en lien avec l''écran d''enquête de ventes et profits';
COMMENT ON COLUMN phenix.customer_order_transactions.cot_reconciliations_date IS 'Date de validation de la ligne de commande en lien avec l''écran d''enquête de ventes et profits';
COMMENT ON COLUMN phenix.customer_order_transactions.cot_admin_surcharge_amount IS 'Indique le montant des frais d''administration (surcharge sur bas de facture)';
COMMENT ON COLUMN phenix.customer_order_transactions.cot_invoiced_ext_surcharge IS 'Indique le montant facturé à la ligne, qté * surcharge ou poids * surcharge, arrondi toujours vers le haut, à deux décimales';