CREATE TABLE phenix.weekly_customer_stats (
  wcs_cus_code NUMBER(10) NOT NULL,
  wcs_fcw_fca_year NUMBER(4) NOT NULL,
  wcs_fcw_fca_period NUMBER(2) NOT NULL,
  wcs_fcw_week NUMBER(2) NOT NULL,
  wcs_sum_sales NUMBER(10,2) NOT NULL,
  wcs_sum_costs NUMBER(10,2) NOT NULL,
  wcs_projected_sales NUMBER(10,2) NOT NULL,
  wcs_sum_deliv_charge NUMBER(10,2) NOT NULL,
  wcs_nb_deliveries NUMBER(2) NOT NULL,
  CONSTRAINT wcs_pk PRIMARY KEY (wcs_cus_code,wcs_fcw_fca_year,wcs_fcw_fca_period,wcs_fcw_week),
  CONSTRAINT wcs_cus_fk FOREIGN KEY (wcs_cus_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT wcs_fcw_fk FOREIGN KEY (wcs_fcw_fca_year,wcs_fcw_fca_period,wcs_fcw_week) REFERENCES phenix.fiscal_calendar_weeks (fcw_fca_year,fcw_fca_period,fcw_week)
);
COMMENT ON TABLE phenix.weekly_customer_stats IS 'Table contenant le sommaire des transactions de produit par semaine';
COMMENT ON COLUMN phenix.weekly_customer_stats.wcs_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.weekly_customer_stats.wcs_fcw_fca_year IS 'Indique l''année du calendrier fiscal';
COMMENT ON COLUMN phenix.weekly_customer_stats.wcs_fcw_fca_period IS 'Indique la période du calendrier fiscal';
COMMENT ON COLUMN phenix.weekly_customer_stats.wcs_fcw_week IS 'Indique la semaine du calendrier fiscal';
COMMENT ON COLUMN phenix.weekly_customer_stats.wcs_sum_sales IS 'Indique le total des ventes de la semaine';
COMMENT ON COLUMN phenix.weekly_customer_stats.wcs_sum_costs IS 'Indique le total des coûts de la semaine';
COMMENT ON COLUMN phenix.weekly_customer_stats.wcs_projected_sales IS 'Indique le total des ventes qui ont été projetées à l''avance pour la semaine';
COMMENT ON COLUMN phenix.weekly_customer_stats.wcs_sum_deliv_charge IS 'Indique le total des charges de livraison de la semaine';
COMMENT ON COLUMN phenix.weekly_customer_stats.wcs_nb_deliveries IS 'Indique le nombre de livraisons de la semaine';