CREATE TABLE phenix.stat_customer_drops (
  scd_fcw_fca_year NUMBER(4) NOT NULL,
  scd_fcw_fca_period NUMBER(2) NOT NULL,
  scd_fcw_week NUMBER(2) NOT NULL,
  scd_cus_code NUMBER(10) NOT NULL,
  scd_ven_code NUMBER(5) NOT NULL,
  scd_inh_cash_and_carry_switch NUMBER(1) NOT NULL,
  scd_vds_details_switch NUMBER(1) NOT NULL,
  scd_sum_amount_credit_only NUMBER NOT NULL,
  scd_sum_amount_sales NUMBER NOT NULL,
  scd_sum_cost_bef_avr_terms NUMBER NOT NULL,
  scd_sum_ven_agreement_amount NUMBER NOT NULL,
  scd_sum_car_amount NUMBER NOT NULL,
  scd_sum_weight NUMBER,
  scd_sum_quantity NUMBER,
  scd_retailer_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT scd_retailer_switch_ck CHECK (SCD_RETAILER_SWITCH IN (0,1)),
  scd_include_in_stats_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT scd_include_in_stats_switch_ck CHECK (SCD_INCLUDE_IN_STATS_SWITCH IN (0,1)),
  scd_whs_code VARCHAR2(2 BYTE) NOT NULL,
  CONSTRAINT scd_pk PRIMARY KEY (scd_fcw_fca_year,scd_fcw_fca_period,scd_fcw_week,scd_whs_code,scd_cus_code,scd_ven_code,scd_inh_cash_and_carry_switch,scd_vds_details_switch,scd_retailer_switch,scd_include_in_stats_switch) USING INDEX (CREATE INDEX phenix.scd_pk ON phenix.stat_customer_drops(scd_fcw_fca_year,scd_fcw_fca_period,scd_fcw_week,scd_whs_code,scd_cus_code,scd_ven_code,scd_inh_cash_and_carry_switch,scd_vds_details_switch,scd_retailer_switch,scd_include_in_stats_switch)    ),
  CONSTRAINT scd_whs_fk FOREIGN KEY (scd_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON COLUMN phenix.stat_customer_drops.scd_retailer_switch IS 'Indique ce sommaire représente les livraisons directes détaillantes.';
COMMENT ON COLUMN phenix.stat_customer_drops.scd_include_in_stats_switch IS 'Indique ce sommaire est inclus dans les statistiques.';
COMMENT ON COLUMN phenix.stat_customer_drops.scd_whs_code IS 'Indique le code entrepôt de livraisons.';