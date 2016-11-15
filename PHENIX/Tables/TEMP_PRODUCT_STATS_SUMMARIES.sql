CREATE TABLE phenix.temp_product_stats_summaries (
  tss_id NUMBER(15) NOT NULL,
  tss_prd_code VARCHAR2(10 BYTE) NOT NULL,
  tss_pricing_source VARCHAR2(2 BYTE) NOT NULL,
  tss_cost_price NUMBER(10,2) NOT NULL,
  tss_sale_price NUMBER(10,2) NOT NULL,
  tss_invoice_quantity NUMBER(7),
  tss_invoice_weight NUMBER(9,3),
  tss_lost_quantity NUMBER(7),
  tss_lost_weight NUMBER(9,3),
  tss_pty_code NUMBER(3),
  tss_date DATE NOT NULL,
  tss_inventory_switch NUMBER(1) NOT NULL CONSTRAINT tss_inventory_switch_ck CHECK (tss_inventory_switch IN (0,1)),
  tss_whs_code VARCHAR2(2 BYTE) NOT NULL,
  CONSTRAINT tss_pk PRIMARY KEY (tss_id),
  CONSTRAINT tss_prd_fk FOREIGN KEY (tss_prd_code) REFERENCES phenix.products (prd_code),
  CONSTRAINT tss_pty_fk FOREIGN KEY (tss_pty_code) REFERENCES phenix.promotion_types (pty_code),
  CONSTRAINT tss_whs_fk FOREIGN KEY (tss_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.temp_product_stats_summaries IS 'Table temporaire utilisée pour la maj des statistisques des produits';
COMMENT ON COLUMN phenix.temp_product_stats_summaries.tss_prd_code IS 'Indique le produit';
COMMENT ON COLUMN phenix.temp_product_stats_summaries.tss_pricing_source IS 'Indique la source du prix';
COMMENT ON COLUMN phenix.temp_product_stats_summaries.tss_cost_price IS 'Indique le le coutant total de la ligne (coutant * (qté ou poids))';
COMMENT ON COLUMN phenix.temp_product_stats_summaries.tss_sale_price IS 'Indique le vendant total de la ligne (vendant * (qté ou poids))';
COMMENT ON COLUMN phenix.temp_product_stats_summaries.tss_invoice_quantity IS 'Indique le poids facturé (déjà converti en format d''inventaire pesé )';
COMMENT ON COLUMN phenix.temp_product_stats_summaries.tss_lost_quantity IS 'Indique la quantité perdue (déjà convertie en format dinventaire solide)';
COMMENT ON COLUMN phenix.temp_product_stats_summaries.tss_lost_weight IS 'Indique le poids perdu (déjà converti en format d''inventaire pesé)';
COMMENT ON COLUMN phenix.temp_product_stats_summaries.tss_pty_code IS 'Indique le type de promotion ';
COMMENT ON COLUMN phenix.temp_product_stats_summaries.tss_date IS 'Indique la date';
COMMENT ON COLUMN phenix.temp_product_stats_summaries.tss_inventory_switch IS 'Indique si l''inventaire est affecté ';
COMMENT ON COLUMN phenix.temp_product_stats_summaries.tss_whs_code IS 'Indique l entrepôt concerné par les statistiques';