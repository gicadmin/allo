CREATE GLOBAL TEMPORARY TABLE phenix.six_weeks_summaries (
  sws_inh_cus_code NUMBER,
  sws_cus_name VARCHAR2(30 BYTE),
  sws_use_code NUMBER,
  sws_use_name VARCHAR2(62 BYTE),
  sws_prd_ven_code NUMBER,
  sws_ven_name VARCHAR2(30 BYTE),
  sws_inh_sale_price_in_for_per NUMBER,
  sws_inh_cost_price_in_for_per NUMBER,
  sws_inh_sale_price_dr_for_per NUMBER,
  sws_total_period NUMBER,
  sws_sales_week_current NUMBER,
  sws_sales_week_1 NUMBER,
  sws_sales_week_2 NUMBER,
  sws_sales_week_3 NUMBER,
  sws_sales_week_4 NUMBER,
  sws_sales_week_5 NUMBER,
  sws_cost_week_current NUMBER,
  sws_cost_week_1 NUMBER,
  sws_cost_week_2 NUMBER,
  sws_cost_week_3 NUMBER,
  sws_cost_week_4 NUMBER,
  sws_cost_week_5 NUMBER,
  sws_drop_week_current NUMBER,
  sws_drop_week_1 NUMBER,
  sws_drop_week_2 NUMBER,
  sws_drop_week_3 NUMBER,
  sws_drop_week_4 NUMBER,
  sws_drop_week_5 NUMBER,
  sws_pgr_major_code NUMBER,
  sws_pgr_description VARCHAR2(30 BYTE)
)
ON COMMIT PRESERVE ROWS;
COMMENT ON TABLE phenix.six_weeks_summaries IS 'Table utilisée pour le rapport de ventes avec les six dernières semaines';
COMMENT ON COLUMN phenix.six_weeks_summaries.sws_inh_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.six_weeks_summaries.sws_cus_name IS 'Indique le nom du client';
COMMENT ON COLUMN phenix.six_weeks_summaries.sws_use_code IS 'Indique le code du vendeur';
COMMENT ON COLUMN phenix.six_weeks_summaries.sws_use_name IS 'Indique le nom du vendeur';
COMMENT ON COLUMN phenix.six_weeks_summaries.sws_prd_ven_code IS 'Indique le code du manufacturier';
COMMENT ON COLUMN phenix.six_weeks_summaries.sws_ven_name IS 'Indique le nom du manufacturier';
COMMENT ON COLUMN phenix.six_weeks_summaries.sws_inh_sale_price_in_for_per IS 'Indique le total des ventes d''entrepôt pour la période';
COMMENT ON COLUMN phenix.six_weeks_summaries.sws_inh_cost_price_in_for_per IS 'Indique le total des coûts d''entrepôt pour la période';
COMMENT ON COLUMN phenix.six_weeks_summaries.sws_inh_sale_price_dr_for_per IS 'Indique le groupe des ventes indirectes pour la période';
COMMENT ON COLUMN phenix.six_weeks_summaries.sws_total_period IS 'Indique le total de la période';
COMMENT ON COLUMN phenix.six_weeks_summaries.sws_sales_week_current IS 'Indique les ventes d''entrepôt de la semaine courante';
COMMENT ON COLUMN phenix.six_weeks_summaries.sws_sales_week_1 IS 'Indique les ventes d''entrepôt de la semaine 1';
COMMENT ON COLUMN phenix.six_weeks_summaries.sws_sales_week_2 IS 'Indique les ventes d''entrepôt de la semaine 2';
COMMENT ON COLUMN phenix.six_weeks_summaries.sws_sales_week_3 IS 'Indique les ventes d''entrepôt de la semaine 3';
COMMENT ON COLUMN phenix.six_weeks_summaries.sws_sales_week_4 IS 'Indique les ventes d''entrepôt de la semaine 4';
COMMENT ON COLUMN phenix.six_weeks_summaries.sws_sales_week_5 IS 'Indique les ventes d''entrepôt de la semaine 5';
COMMENT ON COLUMN phenix.six_weeks_summaries.sws_cost_week_current IS 'Indique les coûts d''entrepôt de la semaine courante';
COMMENT ON COLUMN phenix.six_weeks_summaries.sws_cost_week_1 IS 'Indique les coûts d''entrepôt de la semaine 1';
COMMENT ON COLUMN phenix.six_weeks_summaries.sws_cost_week_2 IS 'Indique les coûts d''entrepôt de la semaine 2';
COMMENT ON COLUMN phenix.six_weeks_summaries.sws_cost_week_3 IS 'Indique les coûts d''entrepôt de la semaine 3';
COMMENT ON COLUMN phenix.six_weeks_summaries.sws_cost_week_4 IS 'Indique les coûts d''entrepôt de la semaine 4';
COMMENT ON COLUMN phenix.six_weeks_summaries.sws_cost_week_5 IS 'Indique les coûts d''entrepôt de la semaine 5';
COMMENT ON COLUMN phenix.six_weeks_summaries.sws_drop_week_current IS 'Indique le total de ventes indirectes de la semaine courante';
COMMENT ON COLUMN phenix.six_weeks_summaries.sws_drop_week_1 IS 'Indique le total de ventes indirectes de la semaine 1';
COMMENT ON COLUMN phenix.six_weeks_summaries.sws_drop_week_2 IS 'Indique le total de ventes indirectes de la semaine 2';
COMMENT ON COLUMN phenix.six_weeks_summaries.sws_drop_week_3 IS 'Indique le total de ventes indirectes de la semaine 3';
COMMENT ON COLUMN phenix.six_weeks_summaries.sws_drop_week_4 IS 'Indique le total de ventes indirectes de la semaine 4';
COMMENT ON COLUMN phenix.six_weeks_summaries.sws_drop_week_5 IS 'Indique le total de ventes indirectes de la semaine 5';
COMMENT ON COLUMN phenix.six_weeks_summaries.sws_pgr_major_code IS 'Indique le code du groupe majeur des ventes';
COMMENT ON COLUMN phenix.six_weeks_summaries.sws_pgr_description IS 'Indique la description du groupe majeur des ventes';