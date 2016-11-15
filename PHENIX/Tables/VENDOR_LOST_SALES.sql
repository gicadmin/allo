CREATE TABLE phenix.vendor_lost_sales (
  vls_id NUMBER(15) NOT NULL,
  vls_vss_id NUMBER(15) NOT NULL,
  vls_shr_code NUMBER(3) NOT NULL,
  vls_lost_sales_quantity NUMBER(8) DEFAULT 0 NOT NULL,
  vls_lost_sales_weight NUMBER(8) DEFAULT 0 NOT NULL,
  vls_lost_sales_amount NUMBER(12,2) DEFAULT 0,
  CONSTRAINT vls_pk PRIMARY KEY (vls_id),
  CONSTRAINT vls_vss_id_fk FOREIGN KEY (vls_vss_id) REFERENCES phenix.vendor_stats_summaries (vss_id)
);
COMMENT ON COLUMN phenix.vendor_lost_sales.vls_id IS 'Identifiant unique';
COMMENT ON COLUMN phenix.vendor_lost_sales.vls_vss_id IS 'Code de statistique d''inventaire';
COMMENT ON COLUMN phenix.vendor_lost_sales.vls_shr_code IS 'Code des explications des "À court"';
COMMENT ON COLUMN phenix.vendor_lost_sales.vls_lost_sales_quantity IS 'Quantité vendues perdues';
COMMENT ON COLUMN phenix.vendor_lost_sales.vls_lost_sales_weight IS 'Poids vendues perdues';
COMMENT ON COLUMN phenix.vendor_lost_sales.vls_lost_sales_amount IS 'Montant perdu';