CREATE TABLE phenix.vendor_transport_agreements (
  vtr_id NUMBER(15) NOT NULL,
  vtr_whs_code VARCHAR2(2 BYTE) NOT NULL,
  vtr_ven_code NUMBER(5) NOT NULL,
  vtr_vts_code VARCHAR2(10 BYTE) NOT NULL,
  vtr_created_date DATE DEFAULT SYSDATE NOT NULL,
  vtr_start_date DATE NOT NULL,
  vtr_end_date DATE NOT NULL,
  vtr_frequency NUMBER(3) NOT NULL,
  vtr_cus_code NUMBER(10) NOT NULL,
  vtr_invoicing_method VARCHAR2(3 BYTE) NOT NULL CONSTRAINT vtr_invoicing_method_ck CHECK (VTR_INVOICING_METHOD IN ('FIX', 'KIL', 'LBS', 'PAL', 'PKG', 'VAL', 'NCH','PER')),
  vtr_fixed_amount NUMBER(7,2) NOT NULL,
  vtr_fsg_code NUMBER(5),
  vtr_message VARCHAR2(100 BYTE),
  vtr_minimum_charge NUMBER(7,2) NOT NULL,
  vtr_min_charge_method VARCHAR2(3 BYTE) NOT NULL CONSTRAINT vtr_min_charge_method_ck CHECK (VTR_MIN_CHARGE_METHOD IN ('ADD', 'REP', 'N/A')),
  vtr_min_charge_grouping VARCHAR2(3 BYTE) NOT NULL CONSTRAINT vtr_min_charge_grouping_ck CHECK (VTR_MIN_CHARGE_GROUPING IN ('STP', 'TRN', 'CUS', 'N/A')),
  vtr_last_invoiced_date DATE,
  vtr_expired_switch NUMBER DEFAULT 0 NOT NULL CONSTRAINT vtr_expired_switch_ck CHECK (VTR_EXPIRED_SWITCH IN (0, 1)),
  vtr_validate_to_invoice_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT vtr_validate_to_invoice_swi_ck CHECK (VTR_VALIDATE_TO_INVOICE_SWITCH IN (0, 1)),
  vtr_average_package_volume NUMBER(10,3) NOT NULL,
  CONSTRAINT vtr_pk PRIMARY KEY (vtr_id),
  CONSTRAINT vtr_cus_code_fk FOREIGN KEY (vtr_cus_code) REFERENCES phenix.customers (cus_code) ON DELETE CASCADE,
  CONSTRAINT vtr_fsg_code_fk FOREIGN KEY (vtr_fsg_code) REFERENCES phenix.fuel_surcharge_grids (fsg_code),
  CONSTRAINT vtr_ven_code_fk FOREIGN KEY (vtr_ven_code) REFERENCES phenix.vendors (ven_code) ON DELETE CASCADE,
  CONSTRAINT vtr_vts_code_fk FOREIGN KEY (vtr_vts_code) REFERENCES phenix.vendor_transport_service_types (vts_code),
  CONSTRAINT vtr_whs_code_fk FOREIGN KEY (vtr_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.vendor_transport_agreements IS 'Table utilisée pour garder les spécifications des ententes de transports';
COMMENT ON COLUMN phenix.vendor_transport_agreements.vtr_id IS 'Indique le numéro unique (ID) de la table';
COMMENT ON COLUMN phenix.vendor_transport_agreements.vtr_whs_code IS 'Indique le code de l''entrepôt';
COMMENT ON COLUMN phenix.vendor_transport_agreements.vtr_ven_code IS 'Indique le code du fournisseur';
COMMENT ON COLUMN phenix.vendor_transport_agreements.vtr_vts_code IS 'Indique le code du type de transport';
COMMENT ON COLUMN phenix.vendor_transport_agreements.vtr_created_date IS 'Indique la date de création de l''entente';
COMMENT ON COLUMN phenix.vendor_transport_agreements.vtr_start_date IS 'Indique la date de début de l''entente';
COMMENT ON COLUMN phenix.vendor_transport_agreements.vtr_end_date IS 'Indique la date de fin de l''entente';
COMMENT ON COLUMN phenix.vendor_transport_agreements.vtr_frequency IS 'Indique la fréquence de facturation (nombre de jour)';
COMMENT ON COLUMN phenix.vendor_transport_agreements.vtr_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.vendor_transport_agreements.vtr_invoicing_method IS 'Indique la méthode de facturation';
COMMENT ON COLUMN phenix.vendor_transport_agreements.vtr_fixed_amount IS 'Indique le montant fixe';
COMMENT ON COLUMN phenix.vendor_transport_agreements.vtr_fsg_code IS 'Indique la grille de surcharge carburant';
COMMENT ON COLUMN phenix.vendor_transport_agreements.vtr_message IS 'Indique le message';
COMMENT ON COLUMN phenix.vendor_transport_agreements.vtr_minimum_charge IS 'Indique la charge minimum';
COMMENT ON COLUMN phenix.vendor_transport_agreements.vtr_min_charge_method IS 'Indique si la charge minimale remplacera le montant de la transaction ou si elle sera cumulée';
COMMENT ON COLUMN phenix.vendor_transport_agreements.vtr_min_charge_grouping IS 'Indique le regroupement à utiliser pour la charge minimum';
COMMENT ON COLUMN phenix.vendor_transport_agreements.vtr_last_invoiced_date IS 'Indique la dernière date de facturation des transports';
COMMENT ON COLUMN phenix.vendor_transport_agreements.vtr_expired_switch IS 'Indique si l''entente est terminée';
COMMENT ON COLUMN phenix.vendor_transport_agreements.vtr_validate_to_invoice_switch IS 'Indique si les transactions de transport sont facturées automatiquement';
COMMENT ON COLUMN phenix.vendor_transport_agreements.vtr_average_package_volume IS 'Indique le volume de défaut pour les transactions de transport';