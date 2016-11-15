CREATE TABLE phenix.ber8159_customer_dock_assignm (
  cda_id NUMBER(15) NOT NULL,
  cda_loc_code VARCHAR2(12 BYTE) NOT NULL,
  cda_cus_code NUMBER(10),
  cda_ven_code NUMBER(5),
  cda_possession_hour NUMBER(2),
  cda_possession_minute NUMBER(2),
  cda_ready_to_load_switch NUMBER(1) NOT NULL,
  cda_car_code NUMBER(5),
  cda_trk_code VARCHAR2(8 BYTE)
);