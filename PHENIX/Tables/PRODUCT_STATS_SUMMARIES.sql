CREATE TABLE phenix.product_stats_summaries (
  pss_prd_code VARCHAR2(10 BYTE) NOT NULL,
  pss_period NUMBER(2) NOT NULL,
  pss_week NUMBER(1) NOT NULL CONSTRAINT pss_week_ck CHECK ((PSS_WEEK >= 1 and
PSS_WEEK <=5)),
  pss_year NUMBER(4) NOT NULL,
  pss_prebook_cost NUMBER(10,2) NOT NULL,
  pss_prebook_retail NUMBER(10,2) NOT NULL,
  pss_promo_cost NUMBER(10,2) NOT NULL,
  pss_promo_retail NUMBER(10,2) NOT NULL,
  pss_regular_cost NUMBER(10,2) NOT NULL,
  pss_regular_retail NUMBER(10,2) NOT NULL,
  pss_lost_quantity NUMBER(7),
  pss_lost_weight NUMBER(9,3),
  pss_prebook_quantity NUMBER(7),
  pss_prebook_weight NUMBER(9,3),
  pss_promo_quantity NUMBER(7),
  pss_promo_weight NUMBER(9,3),
  pss_regular_quantity NUMBER(7),
  pss_regular_weight NUMBER(9,3),
  pss_exceptional_cost NUMBER(10,2) NOT NULL,
  pss_exceptional_retail NUMBER(10,2) NOT NULL,
  pss_exceptional_quantity NUMBER(7),
  pss_exceptional_weight NUMBER(9,3),
  pss_whs_code VARCHAR2(2 BYTE) NOT NULL,
  pss_incoming_interco_quantity NUMBER(7),
  pss_incoming_interco_weight NUMBER(9,3),
  pss_incoming_interco_retail NUMBER(10,2) DEFAULT 0,
  pss_incoming_interco_cost NUMBER(10,2) DEFAULT 0,
  pss_outgoing_interco_quantity NUMBER(7),
  pss_outgoing_interco_weight NUMBER(9,3),
  pss_outgoing_interco_retail NUMBER(10,2) DEFAULT 0,
  pss_outgoing_interco_cost NUMBER(10,2) DEFAULT 0,
  CONSTRAINT pss_pk PRIMARY KEY (pss_prd_code,pss_year,pss_period,pss_week,pss_whs_code),
  CONSTRAINT pss_prd_fk FOREIGN KEY (pss_prd_code) REFERENCES phenix.products (prd_code),
  CONSTRAINT pss_whs_fk FOREIGN KEY (pss_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.product_stats_summaries IS 'Sommaire des statistiques de produit';
COMMENT ON COLUMN phenix.product_stats_summaries.pss_prd_code IS 'Code produit';
COMMENT ON COLUMN phenix.product_stats_summaries.pss_period IS 'Période de la statistique';
COMMENT ON COLUMN phenix.product_stats_summaries.pss_week IS 'Semaine de la statistique';
COMMENT ON COLUMN phenix.product_stats_summaries.pss_year IS 'Année de la statistique';
COMMENT ON COLUMN phenix.product_stats_summaries.pss_prebook_cost IS 'Coûtant des ventes "prebooks"';
COMMENT ON COLUMN phenix.product_stats_summaries.pss_prebook_retail IS 'Prix des ventes "prebooks"';
COMMENT ON COLUMN phenix.product_stats_summaries.pss_promo_cost IS 'Coûtant des ventes promotionnelles';
COMMENT ON COLUMN phenix.product_stats_summaries.pss_promo_retail IS 'Prix des ventes promotionnelles';
COMMENT ON COLUMN phenix.product_stats_summaries.pss_regular_cost IS 'Coûtant des ventes régulière';
COMMENT ON COLUMN phenix.product_stats_summaries.pss_regular_retail IS 'Prix des ventes régulière';
COMMENT ON COLUMN phenix.product_stats_summaries.pss_lost_quantity IS 'Quantité des ventes perdues';
COMMENT ON COLUMN phenix.product_stats_summaries.pss_lost_weight IS 'Poids des ventes perdues';
COMMENT ON COLUMN phenix.product_stats_summaries.pss_prebook_quantity IS 'Quantité des ventes "prebook"';
COMMENT ON COLUMN phenix.product_stats_summaries.pss_prebook_weight IS 'Poids des ventes  "prebook"';
COMMENT ON COLUMN phenix.product_stats_summaries.pss_promo_quantity IS 'Quantité des ventes en promotion';
COMMENT ON COLUMN phenix.product_stats_summaries.pss_promo_weight IS 'Poids des ventes en promotion';
COMMENT ON COLUMN phenix.product_stats_summaries.pss_regular_quantity IS 'Quantité des ventes régulières';
COMMENT ON COLUMN phenix.product_stats_summaries.pss_regular_weight IS 'Poids des ventes régulières';
COMMENT ON COLUMN phenix.product_stats_summaries.pss_exceptional_cost IS 'Coûtant des ventes exceptionelles';
COMMENT ON COLUMN phenix.product_stats_summaries.pss_exceptional_retail IS 'Prix des ventes exceptionelles';
COMMENT ON COLUMN phenix.product_stats_summaries.pss_exceptional_quantity IS 'Quantité des ventes exceptionelles';
COMMENT ON COLUMN phenix.product_stats_summaries.pss_exceptional_weight IS 'Poids des ventes exceptionelles';
COMMENT ON COLUMN phenix.product_stats_summaries.pss_whs_code IS 'Indique le code de l''entrepôt';
COMMENT ON COLUMN phenix.product_stats_summaries.pss_incoming_interco_quantity IS 'Indique la quantité de la marchandise  qui a fait l''objet de transferts entrants interco reçues';
COMMENT ON COLUMN phenix.product_stats_summaries.pss_incoming_interco_weight IS 'Indique le poids de la marchandise qui a fait l''objet de transferts entrants interco reçues';
COMMENT ON COLUMN phenix.product_stats_summaries.pss_incoming_interco_retail IS 'Indique le prix des ventes de la marchandise  qui a fait l''objet de transferts entrants interco reçues';
COMMENT ON COLUMN phenix.product_stats_summaries.pss_incoming_interco_cost IS 'Indique le coût de la marchandise  qui a fait l''objet de transferts entrants interco reçues';
COMMENT ON COLUMN phenix.product_stats_summaries.pss_outgoing_interco_quantity IS 'Indique la quantité de la marchandise qui a fait l''objet de transferts sortants interco reçues';
COMMENT ON COLUMN phenix.product_stats_summaries.pss_outgoing_interco_weight IS 'Indique le poids de la marchandise qui a fait l''objet de transferts sortants interco reçues';
COMMENT ON COLUMN phenix.product_stats_summaries.pss_outgoing_interco_retail IS 'Indique le prix des ventes de la marchandise qui a fait l''objet de transferts sortants interco reçues';
COMMENT ON COLUMN phenix.product_stats_summaries.pss_outgoing_interco_cost IS 'Indique le coût de la marchandise qui a fait l''objet de transferts sortants interco reçues';