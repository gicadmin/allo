CREATE TABLE phenix.customer_histories (
  cush_cus_code NUMBER(10) NOT NULL,
  cush_start_date DATE NOT NULL,
  cush_end_date DATE NOT NULL,
  cush_cus_reb_whouse_avr_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cush_cus_reb_whouse_avr_swi_ck CHECK (CUSH_CUS_REB_WHOUSE_AVR_SWITCH IN (0,1)),
  cush_cus_reb_drop_avr_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cush_cus_reb_drop_avr_swi_ck CHECK (CUSH_CUS_REB_DROP_AVR_SWITCH IN (0,1)),
  cush_cus_reb_drop_terms_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cush_cus_reb_drop_terms_swi_ck CHECK (CUSH_CUS_REB_DROP_TERMS_SWITCH IN (0,1)),
  cush_cus_transport_alloc_perc NUMBER(6,3),
  cush_cus_whouse_vol_alloc_perc NUMBER(6,3) NOT NULL,
  cush_cus_drop_vol_alloc_perc NUMBER(6,3) NOT NULL,
  cush_cus_growth_alloc_percent NUMBER(6,3) NOT NULL,
  cush_cus_additional_alloc_perc NUMBER(6,3) NOT NULL,
  cush_cus_internal_admin_perc NUMBER(6,3) NOT NULL,
  CONSTRAINT cush_pk PRIMARY KEY (cush_cus_code,cush_start_date,cush_end_date),
  CONSTRAINT cush_cus_fk FOREIGN KEY (cush_cus_code) REFERENCES phenix.customers (cus_code) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.customer_histories IS 'Table des historiques';
COMMENT ON COLUMN phenix.customer_histories.cush_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.customer_histories.cush_start_date IS 'Indique la date debut';
COMMENT ON COLUMN phenix.customer_histories.cush_end_date IS 'Indique la date fin';
COMMENT ON COLUMN phenix.customer_histories.cush_cus_reb_whouse_avr_switch IS 'Indique si le client a droit aux rabais volume trimestriels sur les ventes de l''entrepôt';
COMMENT ON COLUMN phenix.customer_histories.cush_cus_reb_drop_avr_switch IS 'Indique si le client a droit aux rabais volume trimestriels sur les drops';
COMMENT ON COLUMN phenix.customer_histories.cush_cus_reb_drop_terms_switch IS 'Indique si le client a droit aux rabais volume trimestriels sur les termes des drops';
COMMENT ON COLUMN phenix.customer_histories.cush_cus_transport_alloc_perc IS 'Indique le pourcentage de l''allocation de transport donné au client??';
COMMENT ON COLUMN phenix.customer_histories.cush_cus_whouse_vol_alloc_perc IS 'Indique le pourcentage d''allocation volume des ventes entrepôt';
COMMENT ON COLUMN phenix.customer_histories.cush_cus_drop_vol_alloc_perc IS 'Indique le pourcentage d''allocation volume des ventes drop';
COMMENT ON COLUMN phenix.customer_histories.cush_cus_growth_alloc_percent IS 'Indique le pourcentage d''allocation de croissance';
COMMENT ON COLUMN phenix.customer_histories.cush_cus_additional_alloc_perc IS 'Indique le pourcentage d''allocation additionnel (marque privée)';
COMMENT ON COLUMN phenix.customer_histories.cush_cus_internal_admin_perc IS 'Indique le frais d''administration interne pour les programmes de remise';