CREATE TABLE phenix.sales_agreement_reclaims (
  sar_id NUMBER(15) NOT NULL,
  sar_vendor_reclaim_amount NUMBER(7,2) NOT NULL,
  sar_cod_coh_id NUMBER(15),
  sar_cod_line_number NUMBER(4),
  sar_cad_id NUMBER(15),
  sar_ved_id NUMBER(15),
  sar_admin_amount NUMBER(7,2),
  sar_original_ved_id NUMBER(15),
  sar_vbd_id NUMBER(15),
  CONSTRAINT sar_foreign_key_ck CHECK ((SAR_COD_COH_ID is NULL and
SAR_COD_LINE_NUMBER is NULL and
SAR_CAD_ID is not NULL) or
(SAR_COD_COH_ID is not NULL and
SAR_COD_LINE_NUMBER is not NULL and
SAR_CAD_ID is NULL)),
  CONSTRAINT sar_pk PRIMARY KEY (sar_id),
  CONSTRAINT sar_cad_fk FOREIGN KEY (sar_cad_id) REFERENCES phenix.customer_adjustment_details (cad_id),
  CONSTRAINT sar_cod_fk FOREIGN KEY (sar_cod_coh_id,sar_cod_line_number) REFERENCES phenix.customer_order_details (cod_coh_id,cod_line_number),
  CONSTRAINT sar_vbd_fk FOREIGN KEY (sar_vbd_id) REFERENCES phenix.vendor_billing_details (vbd_id) ON DELETE CASCADE,
  CONSTRAINT sar_ved_fk FOREIGN KEY (sar_ved_id) REFERENCES phenix.vendor_agreement_details (ved_id)
);
COMMENT ON TABLE phenix.sales_agreement_reclaims IS 'Contient le montant de réclamation fournisseur d''une ligne de commande ou d''ajustement provenant d''un client';
COMMENT ON COLUMN phenix.sales_agreement_reclaims.sar_id IS 'Identifiant unique de la table';
COMMENT ON COLUMN phenix.sales_agreement_reclaims.sar_vendor_reclaim_amount IS 'Montant de réclamation';
COMMENT ON COLUMN phenix.sales_agreement_reclaims.sar_cod_coh_id IS 'Identifiant unique d''une commande client';
COMMENT ON COLUMN phenix.sales_agreement_reclaims.sar_cod_line_number IS 'Ligne d''une commande client';
COMMENT ON COLUMN phenix.sales_agreement_reclaims.sar_cad_id IS 'Identifiant unique d''un ajustement client';
COMMENT ON COLUMN phenix.sales_agreement_reclaims.sar_ved_id IS 'Identifiant unique d''un entente fournisseur';
COMMENT ON COLUMN phenix.sales_agreement_reclaims.sar_admin_amount IS 'Indique le montant administratif de la soumission ';
COMMENT ON COLUMN phenix.sales_agreement_reclaims.sar_original_ved_id IS 'Indique l''identifiant unique de l''entente fournisseur originale';
COMMENT ON COLUMN phenix.sales_agreement_reclaims.sar_vbd_id IS 'Indique le numéro de ligne de la facture de l''entente fournisseur';