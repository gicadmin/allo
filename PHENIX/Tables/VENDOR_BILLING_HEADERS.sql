CREATE TABLE phenix.vendor_billing_headers (
  vbh_id NUMBER(15) NOT NULL,
  vbh_use_code NUMBER(5) NOT NULL,
  vbh_order_date DATE NOT NULL,
  vbh_reference_number VARCHAR2(15 BYTE),
  vbh_status VARCHAR2(1 BYTE) NOT NULL CONSTRAINT vbh_status_ck CHECK (VBH_STATUS IN ('O', 'P', 'R', 'F')),
  vbh_rma VARCHAR2(15 BYTE),
  vbh_credit_note VARCHAR2(15 BYTE),
  vbh_invoice_matching_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT vbh_invoice_matching_switch_ck CHECK (VBH_INVOICE_MATCHING_SWITCH in (0, 1)),
  vbh_message VARCHAR2(100 BYTE),
  vbh_whs_code VARCHAR2(2 BYTE) NOT NULL,
  vbh_original_vbh_id NUMBER(15) NOT NULL,
  vbh_ven_purchase_code NUMBER(5) NOT NULL,
  vbh_ven_payable_code NUMBER(5) NOT NULL,
  CONSTRAINT vbh_pk PRIMARY KEY (vbh_id),
  CONSTRAINT vbh_original_vbh_id_fk FOREIGN KEY (vbh_original_vbh_id) REFERENCES phenix.vendor_billing_headers (vbh_id),
  CONSTRAINT vbh_use_fk FOREIGN KEY (vbh_use_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT vbh_ven_payable_code_fk FOREIGN KEY (vbh_ven_payable_code) REFERENCES phenix.vendors (ven_code),
  CONSTRAINT vbh_ven_purchase_code_fk FOREIGN KEY (vbh_ven_purchase_code) REFERENCES phenix.vendors (ven_code),
  CONSTRAINT vbh_whs_code_fk FOREIGN KEY (vbh_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.vendor_billing_headers IS 'Entête des factures fournisseur';
COMMENT ON COLUMN phenix.vendor_billing_headers.vbh_id IS 'Numéro d''entête de facture fournisseur';
COMMENT ON COLUMN phenix.vendor_billing_headers.vbh_use_code IS 'Numéro de l''usager (Acheteur)';
COMMENT ON COLUMN phenix.vendor_billing_headers.vbh_order_date IS 'Date de commande';
COMMENT ON COLUMN phenix.vendor_billing_headers.vbh_reference_number IS 'Numéro de référence';
COMMENT ON COLUMN phenix.vendor_billing_headers.vbh_status IS 'Indique le statut de la charge fournisseur';
COMMENT ON COLUMN phenix.vendor_billing_headers.vbh_rma IS 'Indique le numéro RMA';
COMMENT ON COLUMN phenix.vendor_billing_headers.vbh_credit_note IS 'Indique le numéro de la note de crédit';
COMMENT ON COLUMN phenix.vendor_billing_headers.vbh_invoice_matching_switch IS 'Indique que la charge a été créer automatiquement par la réconciliation des comm. d''achats';
COMMENT ON COLUMN phenix.vendor_billing_headers.vbh_message IS 'Indique le message de la charge';
COMMENT ON COLUMN phenix.vendor_billing_headers.vbh_whs_code IS 'Indique quel entrepôt est utilisé pour la charge fournisseur';
COMMENT ON COLUMN phenix.vendor_billing_headers.vbh_original_vbh_id IS 'Indique le numéro original de la demande de charge ';
COMMENT ON COLUMN phenix.vendor_billing_headers.vbh_ven_purchase_code IS 'Indique le code fournisseur à l''achat';
COMMENT ON COLUMN phenix.vendor_billing_headers.vbh_ven_payable_code IS 'Indique le code fournisseur payable';