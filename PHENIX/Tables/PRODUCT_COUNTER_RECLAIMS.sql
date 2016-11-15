CREATE TABLE phenix.product_counter_reclaims (
  pcr_id NUMBER(15) NOT NULL,
  pcr_vendor_amount NUMBER(7,2) NOT NULL,
  pcr_telemarketer_amount NUMBER(7,2) NOT NULL,
  pcr_salesman_amount NUMBER(7,2) NOT NULL,
  pcr_original_pct_id NUMBER(15) NOT NULL,
  pcr_pct_id NUMBER(15),
  pcr_vbd_id NUMBER(15),
  pcr_cod_coh_id NUMBER(15),
  pcr_cod_line_number NUMBER(4),
  pcr_cad_id NUMBER(15),
  pcr_admin_amount NUMBER(7,2) DEFAULT 0 NOT NULL,
  CONSTRAINT pcr_pk PRIMARY KEY (pcr_id),
  CONSTRAINT pcr_cad_fk FOREIGN KEY (pcr_cad_id) REFERENCES phenix.customer_adjustment_details (cad_id),
  CONSTRAINT pcr_cod_fk FOREIGN KEY (pcr_cod_coh_id,pcr_cod_line_number) REFERENCES phenix.customer_order_details (cod_coh_id,cod_line_number),
  CONSTRAINT pcr_pct_fk FOREIGN KEY (pcr_pct_id) REFERENCES phenix.product_counters (pct_id),
  CONSTRAINT pcr_vbd_fk FOREIGN KEY (pcr_vbd_id) REFERENCES phenix.vendor_billing_details (vbd_id)
);
COMMENT ON TABLE phenix.product_counter_reclaims IS 'Table pour les réclamations des compteurs';
COMMENT ON COLUMN phenix.product_counter_reclaims.pcr_id IS 'Indique l''identifiant unique';
COMMENT ON COLUMN phenix.product_counter_reclaims.pcr_vendor_amount IS 'Indique le montant de réclamation au fournisseur';
COMMENT ON COLUMN phenix.product_counter_reclaims.pcr_telemarketer_amount IS 'Indique le montant à payer au télévendeur';
COMMENT ON COLUMN phenix.product_counter_reclaims.pcr_salesman_amount IS 'Indique le montant à conserver pour le vendeur';
COMMENT ON COLUMN phenix.product_counter_reclaims.pcr_original_pct_id IS 'Indique l''identifiant unique du compteur de produit originale';
COMMENT ON COLUMN phenix.product_counter_reclaims.pcr_pct_id IS 'Indique l''identifiant unique du compteur de produit.';
COMMENT ON COLUMN phenix.product_counter_reclaims.pcr_vbd_id IS 'Indique le numéro de ligne de la facture de l''entente fournisseur';
COMMENT ON COLUMN phenix.product_counter_reclaims.pcr_cod_coh_id IS 'Indique l''identifiant unique d''une commande client';
COMMENT ON COLUMN phenix.product_counter_reclaims.pcr_cod_line_number IS 'Indique la ligne d''une commande client';
COMMENT ON COLUMN phenix.product_counter_reclaims.pcr_cad_id IS 'Indique l''identifiant unique d''un ajustement client';
COMMENT ON COLUMN phenix.product_counter_reclaims.pcr_admin_amount IS 'Indique le montant concervé pour l''administration ';