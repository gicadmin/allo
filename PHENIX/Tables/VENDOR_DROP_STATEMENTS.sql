CREATE TABLE phenix.vendor_drop_statements (
  vds_id NUMBER(15) NOT NULL,
  vds_ven_code NUMBER(5) NOT NULL,
  vds_edi_switch NUMBER(1) NOT NULL CONSTRAINT vds_edi_switch_ck CHECK (VDS_EDI_SWITCH IN (0, 1)),
  vds_reference_number VARCHAR2(16 BYTE) NOT NULL,
  vds_status VARCHAR2(1 BYTE) NOT NULL CONSTRAINT vds_status_ck CHECK (VDS_STATUS IN ('O', 'C')),
  vds_invoice_date DATE,
  vds_ven_ap_code NUMBER(5) NOT NULL,
  vds_customer_details_switch NUMBER(1) NOT NULL CONSTRAINT vds_customer_details_switch_ck CHECK (VDS_CUSTOMER_DETAILS_SWITCH IN (0, 1)),
  vds_include_in_stats_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT vds_include_in_stats_swi_ck CHECK (VDS_INCLUDE_IN_STATS_SWITCH IN (0, 1)),
  vds_message VARCHAR2(100 BYTE),
  vds_810_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT vds_810_switch_ck CHECK (VDS_810_SWITCH in (0, 1)),
  vds_in_process_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT vds_in_process_switch_ck CHECK (VDS_IN_PROCESS_SWITCH IN (0, 1)),
  vds_whs_code VARCHAR2(2 BYTE) NOT NULL,
  CONSTRAINT vds_pk PRIMARY KEY (vds_id),
  CONSTRAINT vds_ven_ap_fk FOREIGN KEY (vds_ven_ap_code) REFERENCES phenix.vendors (ven_code),
  CONSTRAINT vds_ven_fk FOREIGN KEY (vds_ven_code) REFERENCES phenix.vendors (ven_code),
  CONSTRAINT vds_whs_fk FOREIGN KEY (vds_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.vendor_drop_statements IS 'Facture fournisseur du drop';
COMMENT ON COLUMN phenix.vendor_drop_statements.vds_id IS 'Numéro de facture "DROP"';
COMMENT ON COLUMN phenix.vendor_drop_statements.vds_ven_code IS 'Numéro du fournisseur';
COMMENT ON COLUMN phenix.vendor_drop_statements.vds_edi_switch IS 'Indique si la citation a été envoyer par EDI';
COMMENT ON COLUMN phenix.vendor_drop_statements.vds_reference_number IS 'Numéro de facture du fournisseur';
COMMENT ON COLUMN phenix.vendor_drop_statements.vds_status IS 'Status du documents "drop" du fournisseur';
COMMENT ON COLUMN phenix.vendor_drop_statements.vds_invoice_date IS 'Date de la réception de la facture';
COMMENT ON COLUMN phenix.vendor_drop_statements.vds_ven_ap_code IS 'Code du fournisseur payable';
COMMENT ON COLUMN phenix.vendor_drop_statements.vds_customer_details_switch IS 'Indique si la transaction contient des détails clients';
COMMENT ON COLUMN phenix.vendor_drop_statements.vds_include_in_stats_switch IS 'Indique si la commande fait partie des statistiques';
COMMENT ON COLUMN phenix.vendor_drop_statements.vds_message IS 'Message de la commande DROP';
COMMENT ON COLUMN phenix.vendor_drop_statements.vds_810_switch IS 'Indique si provient d''une transaction EDI de type facture (810).  Sinon, provient d''une transaction EDI etat de compte (882).';
COMMENT ON COLUMN phenix.vendor_drop_statements.vds_in_process_switch IS 'Indique que la transaction est présentement en train d''être facturée';
COMMENT ON COLUMN phenix.vendor_drop_statements.vds_whs_code IS 'Indique l''entrepôt associé à la transaction ';