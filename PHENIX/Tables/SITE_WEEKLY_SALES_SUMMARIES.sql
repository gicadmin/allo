CREATE TABLE phenix.site_weekly_sales_summaries (
  swss_id NUMBER(15) NOT NULL,
  swss_sit_code NUMBER(10) NOT NULL,
  swss_fcw_fca_year NUMBER(4) NOT NULL,
  swss_fcw_fca_period NUMBER(2) NOT NULL,
  swss_fcw_week NUMBER(2) NOT NULL,
  swss_type VARCHAR2(2 BYTE) NOT NULL CONSTRAINT ssws_type_ck CHECK ( SWSS_TYPE IN ('WH', 'DR') ),
  swss_coca_code NUMBER(10),
  swss_vgr_code NUMBER(5),
  swss_quantity_sold NUMBER(10,3),
  swss_amount_sold NUMBER(10,3),
  CONSTRAINT ssws_coca_vgr_ck CHECK ( (SWSS_VGR_CODE IS NULL AND SWSS_COCA_CODE IS NOT NULL) OR
        (SWSS_VGR_CODE IS NOT NULL AND SWSS_COCA_CODE IS NULL) OR
        (SWSS_VGR_CODE IS NULL AND SWSS_COCA_CODE IS NULL) ),
  CONSTRAINT swss_pk PRIMARY KEY (swss_id),
  CONSTRAINT swss_coca_fk FOREIGN KEY (swss_coca_code) REFERENCES phenix.contract_categories (coca_code),
  CONSTRAINT swss_fcw_fk FOREIGN KEY (swss_fcw_fca_year,swss_fcw_fca_period,swss_fcw_week) REFERENCES phenix.fiscal_calendar_weeks (fcw_fca_year,fcw_fca_period,fcw_week),
  CONSTRAINT swss_vgr_fk FOREIGN KEY (swss_vgr_code) REFERENCES phenix.vendor_groups (vgr_code)
);
COMMENT ON TABLE phenix.site_weekly_sales_summaries IS 'Table du sommaire des ventes par semaine des sites physiques';
COMMENT ON COLUMN phenix.site_weekly_sales_summaries.swss_id IS 'Indique l''identifiant du sommaire des ventes par semaine des sites physiques';
COMMENT ON COLUMN phenix.site_weekly_sales_summaries.swss_sit_code IS 'Indique le numéro du site physique pour les contrats';
COMMENT ON COLUMN phenix.site_weekly_sales_summaries.swss_fcw_fca_year IS 'Indique l''année fiscale';
COMMENT ON COLUMN phenix.site_weekly_sales_summaries.swss_fcw_fca_period IS 'Indique la période fiscale';
COMMENT ON COLUMN phenix.site_weekly_sales_summaries.swss_fcw_week IS 'Indique la semaine de la période fiscale';
COMMENT ON COLUMN phenix.site_weekly_sales_summaries.swss_type IS 'Indique si c''est une transaction entrepôt ou drop';
COMMENT ON COLUMN phenix.site_weekly_sales_summaries.swss_coca_code IS 'Indique le code de la catégorie de contrat';
COMMENT ON COLUMN phenix.site_weekly_sales_summaries.swss_vgr_code IS 'Indique le code du groupe de fournisseur';
COMMENT ON COLUMN phenix.site_weekly_sales_summaries.swss_quantity_sold IS 'Indique la quantité vendue en éléments';
COMMENT ON COLUMN phenix.site_weekly_sales_summaries.swss_amount_sold IS 'Indique le montant vendu en dollars';