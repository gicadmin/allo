CREATE TABLE phenix.weekly_product_summaries (
  wps_fcw_fca_year NUMBER(4) NOT NULL,
  wps_fcw_fca_period NUMBER(2) NOT NULL,
  wps_fcw_week NUMBER(2) NOT NULL,
  wps_prw_prd_code VARCHAR2(10 BYTE) NOT NULL,
  wps_prw_whs_code VARCHAR2(2 BYTE) NOT NULL,
  wps_start_on_hand NUMBER(10,3) NOT NULL,
  wps_receipts NUMBER(10,3) NOT NULL,
  wps_vendor_returns NUMBER(10,3) NOT NULL,
  wps_sales NUMBER(10,3) NOT NULL,
  wps_credits NUMBER(10,3) NOT NULL,
  wps_inventory_counts NUMBER(10,3) NOT NULL,
  wps_transformations NUMBER(10,3) NOT NULL,
  CONSTRAINT wps_pk PRIMARY KEY (wps_fcw_fca_year,wps_fcw_fca_period,wps_fcw_week,wps_prw_prd_code,wps_prw_whs_code),
  CONSTRAINT wps_fcw_fk FOREIGN KEY (wps_fcw_fca_year,wps_fcw_fca_period,wps_fcw_week) REFERENCES phenix.fiscal_calendar_weeks (fcw_fca_year,fcw_fca_period,fcw_week),
  CONSTRAINT wps_prw_fk FOREIGN KEY (wps_prw_prd_code,wps_prw_whs_code) REFERENCES phenix.product_warehouses (prw_prd_code,prw_whs_code)
);
COMMENT ON TABLE phenix.weekly_product_summaries IS 'Table contenant le sommaire des transactions de produit par semaine';
COMMENT ON COLUMN phenix.weekly_product_summaries.wps_fcw_fca_year IS 'Indique l''année du calendrier fiscal';
COMMENT ON COLUMN phenix.weekly_product_summaries.wps_fcw_fca_period IS 'Indique la période du calendrier fiscal';
COMMENT ON COLUMN phenix.weekly_product_summaries.wps_fcw_week IS 'Indique la semaine du calendrier fiscal';
COMMENT ON COLUMN phenix.weekly_product_summaries.wps_prw_prd_code IS 'Indique le code de produit';
COMMENT ON COLUMN phenix.weekly_product_summaries.wps_prw_whs_code IS 'Indique le code de l''entrepôt';
COMMENT ON COLUMN phenix.weekly_product_summaries.wps_start_on_hand IS 'Indique l''inventaire du début de la semaine';
COMMENT ON COLUMN phenix.weekly_product_summaries.wps_receipts IS 'Indique les réceptions de la semaine';
COMMENT ON COLUMN phenix.weekly_product_summaries.wps_vendor_returns IS 'Indique les retours fournisseurs de la semaine';
COMMENT ON COLUMN phenix.weekly_product_summaries.wps_sales IS 'Indique les ventes de la semaine';
COMMENT ON COLUMN phenix.weekly_product_summaries.wps_credits IS 'Indique les crédits clients de la semaine';
COMMENT ON COLUMN phenix.weekly_product_summaries.wps_inventory_counts IS 'Indique les décomptes inventaire de la semaine';
COMMENT ON COLUMN phenix.weekly_product_summaries.wps_transformations IS 'Indique les transformations de produit de la semaine';