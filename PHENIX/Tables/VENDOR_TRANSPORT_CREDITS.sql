CREATE TABLE phenix.vendor_transport_credits (
  vcr_id NUMBER(15) NOT NULL,
  vcr_ven_code NUMBER(5) NOT NULL,
  vcr_cus_code NUMBER(10) NOT NULL,
  vcr_cus_billed_code NUMBER(10) NOT NULL,
  vcr_vtt_id NUMBER(15),
  vcr_vtr_id NUMBER(15) NOT NULL,
  vcr_weight NUMBER(8,3),
  vcr_weight_uom VARCHAR2(3 BYTE),
  vcr_number_of_packages NUMBER(7),
  vcr_number_of_pallets NUMBER(7) NOT NULL,
  vcr_value NUMBER(7,2) NOT NULL,
  vcr_message VARCHAR2(100 BYTE),
  vcr_invoiced_trans_amount NUMBER(7,2) NOT NULL,
  vcr_invoiced_fuel_amount NUMBER(7,2) NOT NULL,
  vcr_federal_tax_rate NUMBER(6,3) DEFAULT 0 NOT NULL,
  vcr_provincial_tax_rate NUMBER(6,3) DEFAULT 0 NOT NULL,
  vcr_vts_code VARCHAR2(10 BYTE) NOT NULL,
  vcr_debit_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT vcr_debit_switch_ck CHECK (vcr_debit_switch IN (0, 1)),
  vcr_minimum_charge NUMBER(7,2) NOT NULL,
  vcr_inh_id NUMBER(15),
  vcr_reference_number VARCHAR2(15 BYTE),
  vcr_tct_code NUMBER(3) NOT NULL,
  vcr_whs_code VARCHAR2(2 BYTE) NOT NULL,
  vcr_vcr_id NUMBER(15),
  vcr_fuel_federal_tax_rate NUMBER(6,3) DEFAULT 0 NOT NULL,
  vcr_fuel_provincial_tax_rate NUMBER(6,3) DEFAULT 0 NOT NULL,
  CONSTRAINT vcr_pk PRIMARY KEY (vcr_id),
  CONSTRAINT vcr_cus_billed_code_fk FOREIGN KEY (vcr_cus_billed_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT vcr_cus_code_fk FOREIGN KEY (vcr_cus_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT vcr_inh_id_fk FOREIGN KEY (vcr_inh_id) REFERENCES phenix.invoice_headers (inh_id),
  CONSTRAINT vcr_tct_code_fk FOREIGN KEY (vcr_tct_code) REFERENCES phenix.transport_credit_types (tct_code),
  CONSTRAINT vcr_vcr_id_fk FOREIGN KEY (vcr_vcr_id) REFERENCES phenix.vendor_transport_credits (vcr_id),
  CONSTRAINT vcr_ven_code_fk FOREIGN KEY (vcr_ven_code) REFERENCES phenix.vendors (ven_code),
  CONSTRAINT vcr_vtr_id_fk FOREIGN KEY (vcr_vtr_id) REFERENCES phenix.vendor_transport_agreements (vtr_id),
  CONSTRAINT vcr_vts_code_fk FOREIGN KEY (vcr_vts_code) REFERENCES phenix.vendor_transport_service_types (vts_code),
  CONSTRAINT vcr_vtt_id_fk FOREIGN KEY (vcr_vtt_id) REFERENCES phenix.vendor_transport_transactions (vtt_id),
  CONSTRAINT vcr_whs_code_fk FOREIGN KEY (vcr_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.vendor_transport_credits IS 'Table utilisée pour les crédits de transport';
COMMENT ON COLUMN phenix.vendor_transport_credits.vcr_id IS 'Indique le numéro unique (ID) de la table';
COMMENT ON COLUMN phenix.vendor_transport_credits.vcr_ven_code IS 'Indique le code du fournisseur des produits livrés';
COMMENT ON COLUMN phenix.vendor_transport_credits.vcr_cus_code IS 'Indique le code du client livré';
COMMENT ON COLUMN phenix.vendor_transport_credits.vcr_cus_billed_code IS 'Indique le code du client facturé pour le transport';
COMMENT ON COLUMN phenix.vendor_transport_credits.vcr_vtt_id IS 'Indique le lien avec la transaction originale';
COMMENT ON COLUMN phenix.vendor_transport_credits.vcr_vtr_id IS 'Indique le code de la spécification de transport utilisée';
COMMENT ON COLUMN phenix.vendor_transport_credits.vcr_weight IS 'Indique le poids de la livraison';
COMMENT ON COLUMN phenix.vendor_transport_credits.vcr_weight_uom IS 'Indique l''unité de mesure du poids';
COMMENT ON COLUMN phenix.vendor_transport_credits.vcr_number_of_packages IS 'Indique le nombre de colis';
COMMENT ON COLUMN phenix.vendor_transport_credits.vcr_number_of_pallets IS 'Indique le nombre de palettes';
COMMENT ON COLUMN phenix.vendor_transport_credits.vcr_value IS 'Indique la valeur de la livraison';
COMMENT ON COLUMN phenix.vendor_transport_credits.vcr_message IS 'Indique le message';
COMMENT ON COLUMN phenix.vendor_transport_credits.vcr_invoiced_trans_amount IS 'Indique le montant facturé';
COMMENT ON COLUMN phenix.vendor_transport_credits.vcr_invoiced_fuel_amount IS 'Indique le montant de carburant facturé';
COMMENT ON COLUMN phenix.vendor_transport_credits.vcr_federal_tax_rate IS 'Indique le taux de taxe fédérale appliqué à la facturation';
COMMENT ON COLUMN phenix.vendor_transport_credits.vcr_provincial_tax_rate IS 'Indique le taux de taxe provinciale appliqué à la facturation';
COMMENT ON COLUMN phenix.vendor_transport_credits.vcr_vts_code IS 'Indique le code du type de transport';
COMMENT ON COLUMN phenix.vendor_transport_credits.vcr_debit_switch IS 'Indique si la ligne est un débit';
COMMENT ON COLUMN phenix.vendor_transport_credits.vcr_minimum_charge IS 'Indique la valeur minimum à facturer';
COMMENT ON COLUMN phenix.vendor_transport_credits.vcr_inh_id IS 'Indique le numéro de facture associé à ce transport';
COMMENT ON COLUMN phenix.vendor_transport_credits.vcr_reference_number IS 'Indique le numéro de référence';
COMMENT ON COLUMN phenix.vendor_transport_credits.vcr_tct_code IS 'Indique le numéro du type de crédit';
COMMENT ON COLUMN phenix.vendor_transport_credits.vcr_whs_code IS 'Indique le code de l''entrepôt';
COMMENT ON COLUMN phenix.vendor_transport_credits.vcr_vcr_id IS 'Indique l''identifiant du débit relié à ce crédit';
COMMENT ON COLUMN phenix.vendor_transport_credits.vcr_fuel_federal_tax_rate IS 'Indique le taux de taxe fÃ©dÃ©rale sur le carburant appliquÃ© Ã  la facturation';
COMMENT ON COLUMN phenix.vendor_transport_credits.vcr_fuel_provincial_tax_rate IS 'Indique le taux de taxe provinciale sur le carburant appliquÃ© Ã  la facturation';