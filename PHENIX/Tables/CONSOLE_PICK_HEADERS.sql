CREATE TABLE phenix.console_pick_headers (
  cph_pmh_id NUMBER(15) NOT NULL,
  cph_pmh_cus_code NUMBER(10),
  cph_pmh_rou_code NUMBER(5),
  cph_pmh_route_date DATE,
  cph_pmh_whz_code VARCHAR2(2 BYTE),
  cph_pmh_status VARCHAR2(10 BYTE) NOT NULL,
  cph_pmh_ven_code NUMBER(5),
  cph_pmh_type VARCHAR2(1 BYTE) NOT NULL,
  cph_pmh_counter_switch NUMBER(1) DEFAULT 0 NOT NULL,
  cph_pmh_whs_picking_code VARCHAR2(2 BYTE) NOT NULL,
  cph_pmh_whs_delivery_code VARCHAR2(2 BYTE) NOT NULL,
  cph_pmh_overstock_switch NUMBER(1) DEFAULT 0 NOT NULL,
  cph_pmh_pco_id NUMBER(15),
  cph_pmh_prw_whz_code VARCHAR2(2 BYTE),
  CONSTRAINT cph_pmh_pk PRIMARY KEY (cph_pmh_id)
);
COMMENT ON COLUMN phenix.console_pick_headers.cph_pmh_pco_id IS 'Indique le numéro de la palette où a été cueillie la mission';
COMMENT ON COLUMN phenix.console_pick_headers.cph_pmh_prw_whz_code IS 'Indique le code de la zone d''entreposage du produit dans l''entrepôt';