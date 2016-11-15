CREATE TABLE phenix.match_headers (
  mah_ap_invoice_number NUMBER(15) NOT NULL,
  mah_ven_code NUMBER(5) NOT NULL,
  mah_adjustment NUMBER(10,3) NOT NULL,
  mah_date DATE NOT NULL,
  mah_lock_switch NUMBER(1) NOT NULL CONSTRAINT mah_lock_switch_ck CHECK (MAH_LOCK_SWITCH IN (0, 1)),
  mah_reference_number VARCHAR2(22 BYTE) NOT NULL,
  mah_source VARCHAR2(1 BYTE) NOT NULL CONSTRAINT mah_source_ck CHECK (MAH_SOURCE in ('I', 'S')),
  mah_status VARCHAR2(2 BYTE) NOT NULL CONSTRAINT mah_status_ck CHECK (MAH_STATUS IN ('OP', 'CL', 'RA')),
  mah_terms VARCHAR2(6 BYTE),
  mah_transport_cost NUMBER(7,2) NOT NULL,
  mah_use_code NUMBER(5),
  mah_message VARCHAR2(100 BYTE),
  mah_use_lock_code NUMBER(5),
  mah_federal_tax_total NUMBER(9,2) NOT NULL,
  mah_provincial_tax_total NUMBER(9,2) NOT NULL,
  mah_purchase_total NUMBER(9,2) NOT NULL,
  mah_indirect_delivery_switch NUMBER(1) DEFAULT 0 NOT NULL,
  mah_original_rebill_number VARCHAR2(22 BYTE),
  mah_whs_code VARCHAR2(2 BYTE) NOT NULL,
  mah_discount NUMBER(9,2) DEFAULT 0 NOT NULL,
  mah_taxable_charge NUMBER(9,2) DEFAULT 0 NOT NULL,
  mah_not_taxable_charge NUMBER(9,2) DEFAULT 0 NOT NULL,
  CONSTRAINT mah_pk PRIMARY KEY (mah_ap_invoice_number),
  CONSTRAINT mah_use_fk FOREIGN KEY (mah_use_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT mah_use_lock_fk FOREIGN KEY (mah_use_lock_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT mah_ven_fk FOREIGN KEY (mah_ven_code) REFERENCES phenix.vendors (ven_code),
  CONSTRAINT mah_whs_fk FOREIGN KEY (mah_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.match_headers IS 'Contient les informations pour l''entête pour la marchandise reçue';
COMMENT ON COLUMN phenix.match_headers.mah_ap_invoice_number IS 'Numéro de la facture des comptes payables';
COMMENT ON COLUMN phenix.match_headers.mah_ven_code IS 'Code fournisseur';
COMMENT ON COLUMN phenix.match_headers.mah_adjustment IS 'Montant de l''ajustement de l''opération';
COMMENT ON COLUMN phenix.match_headers.mah_date IS 'Date de l''opération';
COMMENT ON COLUMN phenix.match_headers.mah_lock_switch IS 'Indique le record est utilisé par un autre usager';
COMMENT ON COLUMN phenix.match_headers.mah_reference_number IS 'Numéro de facture du fournisseur';
COMMENT ON COLUMN phenix.match_headers.mah_source IS 'Source de la transaction';
COMMENT ON COLUMN phenix.match_headers.mah_status IS 'Indique le status des réconciliation des commandes d''achats';
COMMENT ON COLUMN phenix.match_headers.mah_terms IS 'Code du terme';
COMMENT ON COLUMN phenix.match_headers.mah_transport_cost IS 'Coût de transport';
COMMENT ON COLUMN phenix.match_headers.mah_use_code IS 'Code usager';
COMMENT ON COLUMN phenix.match_headers.mah_message IS 'Message pour l''entête des marchandises reçcues';
COMMENT ON COLUMN phenix.match_headers.mah_use_lock_code IS 'Code usager qui block accès à l''enregistrement';
COMMENT ON COLUMN phenix.match_headers.mah_federal_tax_total IS 'Montant total de la taxe fédérale';
COMMENT ON COLUMN phenix.match_headers.mah_provincial_tax_total IS 'Montant total de la taxe provinciale';
COMMENT ON COLUMN phenix.match_headers.mah_purchase_total IS 'Montant total des achats';
COMMENT ON COLUMN phenix.match_headers.mah_indirect_delivery_switch IS 'Indique si la facture est pour une livraison indirecte';
COMMENT ON COLUMN phenix.match_headers.mah_original_rebill_number IS 'Indique le numéro de facture original du fournisseur';
COMMENT ON COLUMN phenix.match_headers.mah_whs_code IS 'Indique l''entrepôt de la marchandise reçue';
COMMENT ON COLUMN phenix.match_headers.mah_discount IS 'Indique le montant d''escompte';
COMMENT ON COLUMN phenix.match_headers.mah_taxable_charge IS 'Indique le montant des charges taxables ';
COMMENT ON COLUMN phenix.match_headers.mah_not_taxable_charge IS 'Indique le montant des charges non taxables ';