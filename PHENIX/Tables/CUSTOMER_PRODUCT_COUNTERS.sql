CREATE TABLE phenix.customer_product_counters (
  cpc_id NUMBER(15) NOT NULL,
  cpc_ctt_code NUMBER(3) NOT NULL,
  cpc_cus_code NUMBER(10) NOT NULL,
  cpc_last_balance_dollars NUMBER(7,2) DEFAULT 0 NOT NULL,
  cpc_last_balance_points NUMBER(5) DEFAULT 0 NOT NULL,
  cpc_last_balance_date DATE,
  CONSTRAINT cpc_pk PRIMARY KEY (cpc_id),
  CONSTRAINT cpc_ctt_fk FOREIGN KEY (cpc_ctt_code) REFERENCES phenix.counter_types (ctt_code) ON DELETE CASCADE,
  CONSTRAINT cpc_cus_fk FOREIGN KEY (cpc_cus_code) REFERENCES phenix.customers (cus_code)
);
COMMENT ON TABLE phenix.customer_product_counters IS 'Table de jonction entre les clients et les types de compteurs';
COMMENT ON COLUMN phenix.customer_product_counters.cpc_id IS 'Identifiant de la table';
COMMENT ON COLUMN phenix.customer_product_counters.cpc_ctt_code IS 'Type de compteur';
COMMENT ON COLUMN phenix.customer_product_counters.cpc_cus_code IS 'Client';
COMMENT ON COLUMN phenix.customer_product_counters.cpc_last_balance_dollars IS 'Indique le solde en dollars';
COMMENT ON COLUMN phenix.customer_product_counters.cpc_last_balance_points IS 'Indique le solde en points';
COMMENT ON COLUMN phenix.customer_product_counters.cpc_last_balance_date IS 'Indique la date du dernier calcul du solde';