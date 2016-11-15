CREATE TABLE phenix.vendor_billing_details (
  vbd_id NUMBER(15) NOT NULL,
  vbd_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  vbd_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  vbd_consignment_switch NUMBER(1) NOT NULL CONSTRAINT vbd_consignment_switch_ck CHECK (VBD_CONSIGNMENT_SWITCH IN (0, 1)),
  vbd_federal_tax_rate NUMBER(6,3) NOT NULL,
  vbd_provincial_tax_rate NUMBER(6,3) NOT NULL,
  vbd_dit_code NUMBER(3),
  vbd_inh_id NUMBER(15),
  vbd_mad_mah_ap_invoice_number NUMBER(15),
  vbd_mad_line_number NUMBER(6),
  vbd_vbd_id NUMBER(15),
  vbd_vbh_id NUMBER(15),
  vbd_vct_code VARCHAR2(2 BYTE),
  vbd_header_line_number NUMBER(6),
  vbd_invoice_line_number NUMBER(6),
  vbd_billed_cost NUMBER(7,2),
  vbd_billed_quantity NUMBER(7),
  vbd_billed_retail NUMBER(7,2),
  vbd_billed_weight NUMBER(8,3),
  vbd_original_retail NUMBER(7,2),
  vbd_original_cost NUMBER(7,2),
  vbd_requested_quantity NUMBER(7),
  vbd_requested_weight NUMBER(8,3),
  vbd_surcharge NUMBER(7,2),
  vbd_tobacco_tax NUMBER(6,2) NOT NULL,
  vbd_vph_id NUMBER(15),
  vbd_pick_line_number NUMBER,
  vbd_approval_status VARCHAR2(1 BYTE) NOT NULL CONSTRAINT vbd_approval_status_ck CHECK (VBD_APPROVAL_STATUS IN ('A', 'P', 'R', 'W', 'M')),
  vbd_ven_code NUMBER(5),
  vbd_source_description VARCHAR2(30 BYTE),
  vbd_reference_description VARCHAR2(30 BYTE),
  vbd_damaged_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT vbd_damaged_switch_ck CHECK (VBD_DAMAGED_SWITCH IN (1,0)),
  vbd_from_date DATE,
  vbd_to_date DATE,
  vbd_pty_code NUMBER(3),
  vbd_message VARCHAR2(100 BYTE),
  vbd_whs_code VARCHAR2(2 BYTE) NOT NULL,
  vbd_admin_amount NUMBER(7,2) DEFAULT 0 NOT NULL,
  vbd_invoiced_ext_price NUMBER(10,2) DEFAULT 0 NOT NULL,
  vbd_invoiced_ext_admin NUMBER(10,2) DEFAULT 0 NOT NULL,
  vbd_vsi_code NUMBER(10),
  CONSTRAINT vbd_dit_ven_ck CHECK ((VBD_DIT_CODE is not NULL and
VBD_VEN_CODE is not NULL) or
(VBD_DIT_CODE is NULL and
VBD_VEN_CODE is NULL)),
  CONSTRAINT vbd_header_ck CHECK ((VBD_VBH_ID is not NULL and
VBD_HEADER_LINE_NUMBER is not NULL) or
(VBD_VBH_ID is NULL and
VBD_HEADER_LINE_NUMBER is NULL)),
  CONSTRAINT vbd_invoice_ck CHECK ((VBD_INH_ID is not NULL and
VBD_INVOICE_LINE_NUMBER is not NULL) or
(VBD_INH_ID is NULL and
VBD_INVOICE_LINE_NUMBER is NULL)),
  CONSTRAINT vbd_pick_validation_ck CHECK ((VBD_VPH_ID is NULL and
VBD_PICK_LINE_NUMBER is NULL) or
(VBD_VPH_ID is not NULL and
VBD_PICK_LINE_NUMBER is not NULL)),
  CONSTRAINT vbd_pk PRIMARY KEY (vbd_id),
  CONSTRAINT vbd_dit_fk FOREIGN KEY (vbd_dit_code) REFERENCES phenix.discount_types (dit_code),
  CONSTRAINT vbd_inh_fk FOREIGN KEY (vbd_inh_id) REFERENCES phenix.invoice_headers (inh_id),
  CONSTRAINT vbd_mad_fk FOREIGN KEY (vbd_mad_mah_ap_invoice_number,vbd_mad_line_number) REFERENCES phenix.match_details (mad_mah_ap_invoice_number,mad_line_number),
  CONSTRAINT vbd_prf_fk FOREIGN KEY (vbd_prf_prd_code,vbd_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code),
  CONSTRAINT vbd_pty_code_fk FOREIGN KEY (vbd_pty_code) REFERENCES phenix.promotion_types (pty_code),
  CONSTRAINT vbd_vbd_fk FOREIGN KEY (vbd_vbd_id) REFERENCES phenix.vendor_billing_details (vbd_id),
  CONSTRAINT vbd_vbh_fk FOREIGN KEY (vbd_vbh_id) REFERENCES phenix.vendor_billing_headers (vbh_id),
  CONSTRAINT vbd_vct_fk FOREIGN KEY (vbd_vct_code) REFERENCES phenix.vendor_credit_types (vct_code),
  CONSTRAINT vbd_ven_fk FOREIGN KEY (vbd_ven_code) REFERENCES phenix.vendors (ven_code),
  CONSTRAINT vbd_vph_fk FOREIGN KEY (vbd_vph_id) REFERENCES phenix.vendor_pick_headers (vph_id),
  CONSTRAINT vbd_vsi_fk FOREIGN KEY (vbd_vsi_code) REFERENCES phenix.vendor_sales_incentives (vsi_code),
  CONSTRAINT vbd_whs_code_fk FOREIGN KEY (vbd_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.vendor_billing_details IS 'Ligne de détail de d''une facture fournisseur';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_id IS 'Numéro de la clé primaire';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_prf_prd_code IS 'Code produit';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_prf_fmt_code IS 'Code format';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_consignment_switch IS 'Indique si il y a consigne';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_federal_tax_rate IS 'Taxe fédérale';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_provincial_tax_rate IS 'Taxe provinciale';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_dit_code IS 'Type d''escompte';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_inh_id IS 'Numéro de la facture';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_mad_mah_ap_invoice_number IS 'Numéro de l''entête de la marchandise reçue';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_mad_line_number IS 'Numéro de ligne de détail  de la marchandise reçue';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_vbd_id IS 'Numéro de l''identifiant de la table parent';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_vbh_id IS 'Identifiant de l''entête';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_vct_code IS 'Numéro du type de crédit';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_header_line_number IS 'Numéro de ligne de l''entête';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_invoice_line_number IS 'Numéro de la ligne de la facture';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_billed_cost IS 'Coûtant facturé';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_billed_quantity IS 'Quantité facturée';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_billed_retail IS 'Prix de vente facturé';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_billed_weight IS 'Poids facturé';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_original_retail IS 'Prix de vente original';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_original_cost IS 'Coûtant original';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_requested_quantity IS 'Quantité demandée';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_requested_weight IS 'Poids demandé';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_surcharge IS 'Surcharge';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_tobacco_tax IS 'Taxe tabac';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_vph_id IS 'Idenfiant des entêtes des bons de cueillette';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_pick_line_number IS 'Numéro de ligne du bon de cueillette';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_approval_status IS 'Statut d''approbation';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_ven_code IS 'Indique le code du fournisseur initial qui donnait l''escompte';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_source_description IS 'Description originale ';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_reference_description IS 'Description reférée par la facture ';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_damaged_switch IS 'Indique si la charge est causée par un produit endommagé';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_from_date IS 'Indique la date de début de l''application de la charge';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_to_date IS 'Indique la date de fin de l''application de la charge';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_pty_code IS 'Indique le type de promotion';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_message IS 'Indique le message du détail de la charge';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_whs_code IS 'Indique quel entrepôt est utilisé pour la ligne de facture fournisseur';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_admin_amount IS 'Indique le montant de frais d''administration sur les charges fournisseurs';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_invoiced_ext_price IS 'Indique le montant facturé à la ligne, qté * prix vendant ou poids * prix vendant, arrondi toujours vers le haut, à deux décimales';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_invoiced_ext_admin IS 'Indique l''admin facturé à la ligne, qté * admin ou poids * admin, arrondi toujours vers le haut, à deux décimales';
COMMENT ON COLUMN phenix.vendor_billing_details.vbd_vsi_code IS 'Indique le code de la prime fournisseur à la vente';