CREATE TABLE phenix.stat_customer_transports (
  sct_fcw_fca_year NUMBER(4) NOT NULL,
  sct_fcw_fca_period NUMBER(2) NOT NULL,
  sct_fcw_week NUMBER(2) NOT NULL,
  sct_cus_code NUMBER(10) NOT NULL,
  sct_whs_delivery_code VARCHAR2(2 BYTE) NOT NULL,
  sct_sum_transp_amount NUMBER NOT NULL,
  sct_sum_transp_fuel_amount NUMBER NOT NULL,
  CONSTRAINT sct_pk PRIMARY KEY (sct_fcw_fca_year,sct_fcw_fca_period,sct_fcw_week,sct_cus_code,sct_whs_delivery_code) USING INDEX (CREATE UNIQUE INDEX phenix.sct_pk_i ON phenix.stat_customer_transports(sct_fcw_fca_year,sct_fcw_fca_period,sct_fcw_week,sct_cus_code,sct_whs_delivery_code)    )
);
COMMENT ON COLUMN phenix.stat_customer_transports.sct_fcw_fca_year IS 'Indique l''année de la statistique';
COMMENT ON COLUMN phenix.stat_customer_transports.sct_fcw_fca_period IS 'Indique la période de la statistique';
COMMENT ON COLUMN phenix.stat_customer_transports.sct_fcw_week IS 'Indique la semaine de la statistique';
COMMENT ON COLUMN phenix.stat_customer_transports.sct_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.stat_customer_transports.sct_whs_delivery_code IS 'Indique l''entrepôt de livraison';
COMMENT ON COLUMN phenix.stat_customer_transports.sct_sum_transp_amount IS 'Indique les revenus de transport générés pour livrer à ce client';
COMMENT ON COLUMN phenix.stat_customer_transports.sct_sum_transp_fuel_amount IS 'Indique les frais de carburant facturés pour livrer à ce client';