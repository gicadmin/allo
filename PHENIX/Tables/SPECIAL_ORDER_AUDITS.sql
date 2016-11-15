CREATE TABLE phenix.special_order_audits (
  soa_id NUMBER(15) NOT NULL,
  soa_date DATE NOT NULL,
  soa_cod_coh_id NUMBER(15) NOT NULL,
  soa_cod_line_number NUMBER(4) NOT NULL,
  soa_pod_poh_id NUMBER(15),
  soa_pod_line_number NUMBER(4),
  soa_use_code NUMBER(5) NOT NULL,
  soa_cancelled_quantity NUMBER(7),
  soa_cancelled_weight NUMBER(9,3),
  CONSTRAINT soa_pk PRIMARY KEY (soa_id),
  CONSTRAINT soa_cod_fk FOREIGN KEY (soa_cod_coh_id,soa_cod_line_number) REFERENCES phenix.customer_order_details (cod_coh_id,cod_line_number) ON DELETE CASCADE,
  CONSTRAINT soa_pod_fk FOREIGN KEY (soa_pod_poh_id,soa_pod_line_number) REFERENCES phenix.purchase_order_details (pod_poh_id,pod_line_number) ON DELETE CASCADE,
  CONSTRAINT soa_use_fk FOREIGN KEY (soa_use_code) REFERENCES phenix."USERS" (use_code)
);
COMMENT ON TABLE phenix.special_order_audits IS 'Contient les commandes spéciales annulées';
COMMENT ON COLUMN phenix.special_order_audits.soa_id IS 'Identifiant de la table';
COMMENT ON COLUMN phenix.special_order_audits.soa_date IS 'Date de l''audit';
COMMENT ON COLUMN phenix.special_order_audits.soa_cod_coh_id IS 'Numéro de la commande client';
COMMENT ON COLUMN phenix.special_order_audits.soa_cod_line_number IS 'Numéro de la ligne de la commande client';
COMMENT ON COLUMN phenix.special_order_audits.soa_pod_poh_id IS 'Numéro de la commande fournisseur';
COMMENT ON COLUMN phenix.special_order_audits.soa_pod_line_number IS 'Numéro de ligne de la commande fournisseur';
COMMENT ON COLUMN phenix.special_order_audits.soa_use_code IS 'Code usager';
COMMENT ON COLUMN phenix.special_order_audits.soa_cancelled_quantity IS 'Quantity cancellé';
COMMENT ON COLUMN phenix.special_order_audits.soa_cancelled_weight IS 'Poids cancellé';