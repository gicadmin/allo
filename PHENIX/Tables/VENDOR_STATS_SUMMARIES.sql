CREATE TABLE phenix.vendor_stats_summaries (
  vss_id NUMBER(15) NOT NULL,
  vss_ven_code NUMBER(5) NOT NULL,
  vss_use_code NUMBER(5) NOT NULL,
  vss_year NUMBER(4) NOT NULL,
  vss_period NUMBER(2) NOT NULL,
  vss_week NUMBER(1) NOT NULL,
  vss_inventory_quantity NUMBER(8) DEFAULT 0 NOT NULL,
  vss_inventory_weight NUMBER(11,3) DEFAULT 0 NOT NULL,
  vss_inventory_amount NUMBER(12,2) DEFAULT 0,
  CONSTRAINT vss_pk PRIMARY KEY (vss_id),
  CONSTRAINT vss_use_code_fk FOREIGN KEY (vss_use_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT vss_ven_code_fk FOREIGN KEY (vss_ven_code) REFERENCES phenix.vendors (ven_code)
);
COMMENT ON COLUMN phenix.vendor_stats_summaries.vss_id IS 'Identifiant unique';
COMMENT ON COLUMN phenix.vendor_stats_summaries.vss_ven_code IS 'Code du fournisseur';
COMMENT ON COLUMN phenix.vendor_stats_summaries.vss_use_code IS 'Code de l''usager';
COMMENT ON COLUMN phenix.vendor_stats_summaries.vss_year IS 'Année fiscal';
COMMENT ON COLUMN phenix.vendor_stats_summaries.vss_period IS 'Période de l''année fiscal';
COMMENT ON COLUMN phenix.vendor_stats_summaries.vss_week IS 'Semaine de la période';
COMMENT ON COLUMN phenix.vendor_stats_summaries.vss_inventory_quantity IS 'Quantité en inventaire';
COMMENT ON COLUMN phenix.vendor_stats_summaries.vss_inventory_weight IS 'Poids en inventaire';
COMMENT ON COLUMN phenix.vendor_stats_summaries.vss_inventory_amount IS 'Montant en inventaire';