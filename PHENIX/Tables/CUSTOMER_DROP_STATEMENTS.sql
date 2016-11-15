CREATE TABLE phenix.customer_drop_statements (
  cds_vds_id NUMBER(15) NOT NULL,
  cds_cus_code NUMBER(10) NOT NULL,
  cds_reference_number VARCHAR2(15 BYTE) NOT NULL,
  cds_cost_amount NUMBER(10,2) NOT NULL,
  cds_credit_switch NUMBER(1) NOT NULL CONSTRAINT cds_credit_switch_ck CHECK (CDS_CREDIT_SWITCH IN (0, 1)),
  cds_ap_federal_tax NUMBER(8,2) NOT NULL,
  cds_ap_provincial_tax NUMBER(8,2) NOT NULL,
  cds_tobacco_tax NUMBER(8,2) NOT NULL,
  cds_inh_id NUMBER(15),
  cds_reference_date DATE,
  cds_sales_amount NUMBER(10,2) NOT NULL,
  cds_ap_discount_amount NUMBER(8,2) NOT NULL,
  cds_ar_discount_amount NUMBER(8,2) NOT NULL,
  cds_ar_federal_tax NUMBER(8,2) NOT NULL,
  cds_ar_provincial_tax NUMBER(8,2) NOT NULL,
  cds_rcl_id NUMBER(6),
  cds_cigar_tax NUMBER(8,2) DEFAULT 0 NOT NULL,
  cds_retail_client_inh_id NUMBER(15),
  cds_vta_rebate_percent_used NUMBER(6,3),
  cds_ar_surcharge_amount NUMBER(7,2),
  cds_use_code NUMBER(5),
  cds_ar_sales_federal_tax NUMBER(8,2) NOT NULL,
  cds_ar_sales_provincial_tax NUMBER(8,2) NOT NULL,
  cds_ar_surch_federal_tax NUMBER(5,2),
  cds_ar_surch_provincial_tax NUMBER(5,2),
  CONSTRAINT cds_pk PRIMARY KEY (cds_vds_id,cds_cus_code,cds_reference_number),
  CONSTRAINT cds_cus_fk FOREIGN KEY (cds_cus_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT cds_inh_fk FOREIGN KEY (cds_inh_id) REFERENCES phenix.invoice_headers (inh_id),
  CONSTRAINT cds_rcl_id_fk FOREIGN KEY (cds_rcl_id) REFERENCES phenix.retail_clients (rcl_id),
  CONSTRAINT cds_retail_client_inh_fk FOREIGN KEY (cds_retail_client_inh_id) REFERENCES phenix.invoice_headers (inh_id),
  CONSTRAINT cds_use_code_fk FOREIGN KEY (cds_use_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT cds_vds_fk FOREIGN KEY (cds_vds_id) REFERENCES phenix.vendor_drop_statements (vds_id)
);
COMMENT ON TABLE phenix.customer_drop_statements IS 'Détail de la facture fournisseur drop pour chaque client';
COMMENT ON COLUMN phenix.customer_drop_statements.cds_vds_id IS 'Numéro de facture drop fournisseur';
COMMENT ON COLUMN phenix.customer_drop_statements.cds_cus_code IS 'Numéro de client';
COMMENT ON COLUMN phenix.customer_drop_statements.cds_reference_number IS 'Numéro de référence du document de réception du client';
COMMENT ON COLUMN phenix.customer_drop_statements.cds_cost_amount IS 'Montant du coûtant';
COMMENT ON COLUMN phenix.customer_drop_statements.cds_credit_switch IS 'Détermine si le drop est un crédit';
COMMENT ON COLUMN phenix.customer_drop_statements.cds_ap_federal_tax IS 'Montant de taxe fédéral à l''achat';
COMMENT ON COLUMN phenix.customer_drop_statements.cds_ap_provincial_tax IS 'Montant de taxe provincial';
COMMENT ON COLUMN phenix.customer_drop_statements.cds_tobacco_tax IS 'Indique le montant total de taxes tabac (n''inclus pas la taxe cigare)';
COMMENT ON COLUMN phenix.customer_drop_statements.cds_inh_id IS 'Numéro de la facture';
COMMENT ON COLUMN phenix.customer_drop_statements.cds_reference_date IS 'Date de référence du document de réception du client';
COMMENT ON COLUMN phenix.customer_drop_statements.cds_sales_amount IS 'Montant de vente';
COMMENT ON COLUMN phenix.customer_drop_statements.cds_ap_discount_amount IS 'Montant d''escompte à l''achat';
COMMENT ON COLUMN phenix.customer_drop_statements.cds_ar_discount_amount IS 'Montant d''escompte à l''achat';
COMMENT ON COLUMN phenix.customer_drop_statements.cds_ar_federal_tax IS 'Montant de taxe fédéral à la vente';
COMMENT ON COLUMN phenix.customer_drop_statements.cds_ar_provincial_tax IS 'Montant de taxe fédéral à la vente';
COMMENT ON COLUMN phenix.customer_drop_statements.cds_rcl_id IS 'Code de détaillant';
COMMENT ON COLUMN phenix.customer_drop_statements.cds_cigar_tax IS 'Indique le montant total de taxes cigares inclus dans les détails de la facture indirecte';
COMMENT ON COLUMN phenix.customer_drop_statements.cds_retail_client_inh_id IS 'Indique le numéro de facture du détaillant';
COMMENT ON COLUMN phenix.customer_drop_statements.cds_vta_rebate_percent_used IS 'Indique le pourcentage de rabais utilisé pour la facture au détaillant (partenariat)';
COMMENT ON COLUMN phenix.customer_drop_statements.cds_ar_surcharge_amount IS 'Indique le montant de la surcharge du client';
COMMENT ON COLUMN phenix.customer_drop_statements.cds_use_code IS 'Indique le code de l''usager qui a modifié la surcharge';