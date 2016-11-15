CREATE TABLE phenix.invoice_headers (
  inh_id NUMBER(15) NOT NULL,
  inh_cus_code NUMBER(10),
  inh_type VARCHAR2(2 BYTE) NOT NULL CONSTRAINT inh_type_ck CHECK (inh_type IN ('IN', 'DR', 'CN', 'DN', 'VC', 'VD', 'VB', 'VR', 'VA', 'BF', 'CF', 'DD', 'PR', 'TR', 'TC', 'VG', 'VI', 'PT', 'VT', 'RC', 'OA', 'VM', 'CM','VS')),
  inh_delivery_charge NUMBER(7,2) NOT NULL,
  inh_federal_tax_total NUMBER(8,2) NOT NULL,
  inh_invoice_date DATE NOT NULL,
  inh_package_total NUMBER(8) NOT NULL,
  inh_ticket_charges NUMBER(7,2) NOT NULL,
  inh_use_code NUMBER(5),
  inh_cost_price_total NUMBER(10,2) NOT NULL,
  inh_print_switch NUMBER(1) NOT NULL CONSTRAINT inh_print_switch_ck CHECK (INH_PRINT_SWITCH IN (0, 1)),
  inh_provincial_tax_total NUMBER(8,2) NOT NULL,
  inh_sale_price_total NUMBER(10,2) NOT NULL,
  inh_bank_cash_date DATE,
  inh_cigarette_shipped NUMBER(6),
  inh_reference_number VARCHAR2(15 BYTE),
  inh_ven_code NUMBER(5),
  inh_route_date DATE,
  inh_cus_invoiced_code NUMBER(10),
  inh_ven_invoice_for_code NUMBER(5),
  inh_asc_id NUMBER(15),
  inh_cash_and_carry_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT inh_cash_and_carry_swi_ck CHECK (INH_CASH_AND_CARRY_SWITCH IN (0, 1)),
  inh_tty_code VARCHAR2(4 BYTE),
  inh_rct_code NUMBER(3),
  inh_message VARCHAR2(100 BYTE),
  inh_rcl_id NUMBER(6),
  inh_surcharge_amount NUMBER(7,2),
  inh_stats_calculated_date DATE,
  inh_offinv_vol_reb_percent NUMBER(6,3) DEFAULT 0 NOT NULL,
  inh_offinv_vol_reb_amount NUMBER(7,2) DEFAULT 0 NOT NULL,
  inh_archived_date DATE,
  inh_creation_date DATE DEFAULT sysdate NOT NULL,
  inh_provincial_tax_rate NUMBER(6,3) DEFAULT 0 NOT NULL,
  inh_federal_tax_rate NUMBER(6,3) DEFAULT 0 NOT NULL,
  inh_compounded_tax_switch NUMBER(1) DEFAULT 0 NOT NULL,
  inh_crdh_id NUMBER(15),
  inh_bf_flip_switch NUMBER(1) DEFAULT 0 CONSTRAINT inh_bf_flip_switch_ck CHECK (INH_BF_FLIP_SWITCH IN (0,1)),
  CONSTRAINT inh_rcl_ck CHECK (
		(INH_RCL_ID is not NULL and INH_RCT_CODE is not NULL) or
	  (INH_RCL_ID is NULL and INH_RCT_CODE is NULL)),
  CONSTRAINT inh_vendor_customer_ck CHECK (
	(inh_cus_code IS NOT NULL AND inh_ven_code IS NULL AND inh_rcl_id   IS NULL AND inh_type NOT IN ('CF', 'BF')) OR
  (inh_ven_code IS NOT NULL AND inh_cus_code IS NULL AND inh_rcl_id   IS NULL AND inh_type NOT IN ('CF', 'BF')) OR
  (inh_rcl_id   IS NOT NULL AND inh_cus_code IS NULL AND inh_ven_code IS NULL AND inh_type NOT IN ('CF', 'BF')) OR
  (inh_cus_code IS NOT NULL AND inh_ven_code IS NOT NULL AND inh_type IN ('CF', 'BF') AND inh_rcl_id IS NULL)),
  CONSTRAINT inh_ven_invoice_for_code_ck CHECK (
    (inh_type NOT IN ('VD', 'VB', 'VR', 'VA', 'VC','BF', 'CF', 'DD', 'VG','VI','RC', 'OA', 'VM','VS') AND inh_ven_invoice_for_code IS  NULL)
        OR (inh_type IN ('VD', 'VB', 'VR', 'VA', 'VC','BF', 'CF', 'DD', 'VG','VI','RC', 'OA', 'VT', 'VM', 'PT','VS') AND inh_ven_invoice_for_code IS NOT NULL)
     ),
  CONSTRAINT inh_pk PRIMARY KEY (inh_id),
  CONSTRAINT inh_acs_fk FOREIGN KEY (inh_asc_id) REFERENCES phenix.account_statements (asc_id),
  CONSTRAINT inh_crdh_fk FOREIGN KEY (inh_crdh_id) REFERENCES phenix.customer_route_docum_headers (crdh_id),
  CONSTRAINT inh_cus_fk FOREIGN KEY (inh_cus_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT inh_cus_invoiced_fk FOREIGN KEY (inh_cus_invoiced_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT inh_rcl_fk FOREIGN KEY (inh_rcl_id) REFERENCES phenix.retail_clients (rcl_id),
  CONSTRAINT inh_rct_fk FOREIGN KEY (inh_rct_code) REFERENCES phenix.retail_client_types (rct_code),
  CONSTRAINT inh_tty_fk FOREIGN KEY (inh_tty_code) REFERENCES phenix.tender_types (tty_code),
  CONSTRAINT inh_use_fk FOREIGN KEY (inh_use_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT inh_ven_fk FOREIGN KEY (inh_ven_code) REFERENCES phenix.vendors (ven_code),
  CONSTRAINT inh_ven_invoice_for_fk FOREIGN KEY (inh_ven_invoice_for_code) REFERENCES phenix.vendors (ven_code)
);
COMMENT ON TABLE phenix.invoice_headers IS 'Entête de la facture';
COMMENT ON COLUMN phenix.invoice_headers.inh_id IS 'Numéro de la facture';
COMMENT ON COLUMN phenix.invoice_headers.inh_cus_code IS 'Numéro de client';
COMMENT ON COLUMN phenix.invoice_headers.inh_type IS 'Type de facture';
COMMENT ON COLUMN phenix.invoice_headers.inh_delivery_charge IS 'Charge de la livraison';
COMMENT ON COLUMN phenix.invoice_headers.inh_federal_tax_total IS 'Montant de taxe fédérale';
COMMENT ON COLUMN phenix.invoice_headers.inh_invoice_date IS 'Date de la facturation';
COMMENT ON COLUMN phenix.invoice_headers.inh_package_total IS 'Nombre de paquets envoyés';
COMMENT ON COLUMN phenix.invoice_headers.inh_ticket_charges IS 'Frais des étiquettes';
COMMENT ON COLUMN phenix.invoice_headers.inh_use_code IS 'Numéro de l''usager';
COMMENT ON COLUMN phenix.invoice_headers.inh_cost_price_total IS 'Coût total de la marchandise';
COMMENT ON COLUMN phenix.invoice_headers.inh_print_switch IS 'Indique si la facture a été imprimé';
COMMENT ON COLUMN phenix.invoice_headers.inh_provincial_tax_total IS 'Montant de taxe provinciale';
COMMENT ON COLUMN phenix.invoice_headers.inh_sale_price_total IS 'Montant total';
COMMENT ON COLUMN phenix.invoice_headers.inh_bank_cash_date IS 'Date de l''encaissement banquaire';
COMMENT ON COLUMN phenix.invoice_headers.inh_cigarette_shipped IS 'Nombre de cartons de cigarettes';
COMMENT ON COLUMN phenix.invoice_headers.inh_reference_number IS 'Numéro de commande d''achat du client';
COMMENT ON COLUMN phenix.invoice_headers.inh_ven_code IS 'Numéro du fournisseur facturé';
COMMENT ON COLUMN phenix.invoice_headers.inh_route_date IS 'Date de la facture';
COMMENT ON COLUMN phenix.invoice_headers.inh_cus_invoiced_code IS 'Code client facturé';
COMMENT ON COLUMN phenix.invoice_headers.inh_ven_invoice_for_code IS 'Code fournisseur';
COMMENT ON COLUMN phenix.invoice_headers.inh_asc_id IS 'Information relié à une transaction 882 EDI';
COMMENT ON COLUMN phenix.invoice_headers.inh_cash_and_carry_switch IS 'Indique si la facture concerne une commande "Payer et emporter"';
COMMENT ON COLUMN phenix.invoice_headers.inh_tty_code IS 'Indique le type de paiement utilisé pour la facture (s''applique seulement aux factures "Payer et emporter")';
COMMENT ON COLUMN phenix.invoice_headers.inh_rct_code IS 'Indique le type de détaillant';
COMMENT ON COLUMN phenix.invoice_headers.inh_message IS 'Indique le message de la facture';
COMMENT ON COLUMN phenix.invoice_headers.inh_rcl_id IS 'Indique le code du détaillant';
COMMENT ON COLUMN phenix.invoice_headers.inh_surcharge_amount IS 'Indique les frais d''administration ';
COMMENT ON COLUMN phenix.invoice_headers.inh_stats_calculated_date IS 'Indique la date où la facture a été calculé dans les statistiques pour les rapports';
COMMENT ON COLUMN phenix.invoice_headers.inh_offinv_vol_reb_percent IS 'Indique le pourcentage utilisé pour calculer les rabais volume sur facture';
COMMENT ON COLUMN phenix.invoice_headers.inh_offinv_vol_reb_amount IS 'Indique le montant de rabais volume sur facture';
COMMENT ON COLUMN phenix.invoice_headers.inh_provincial_tax_rate IS 'Indique le taux de taxe provinciale utilisé au moment de la facturation';
COMMENT ON COLUMN phenix.invoice_headers.inh_federal_tax_rate IS 'Indique le taux de taxe fdérale utilisé au moment de la facturation';
COMMENT ON COLUMN phenix.invoice_headers.inh_compounded_tax_switch IS 'Indique Indique si les taxes sont consolidée su moment de la facturation';
COMMENT ON COLUMN phenix.invoice_headers.inh_crdh_id IS 'Indique le numero du sommaire lors de l''impression des documents de routes';
COMMENT ON COLUMN phenix.invoice_headers.inh_bf_flip_switch IS 'Indique si cette facture a été régénérer par une facture BF ou CF reçu par EDI';