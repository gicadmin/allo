CREATE TABLE phenix.csc8833_location_shipping (
  lsc_id NUMBER(15) NOT NULL,
  lsc_container_id NUMBER(12),
  lsc_suffix VARCHAR2(1 BYTE),
  lsc_loc_shipping_dock_code VARCHAR2(12 BYTE) NOT NULL,
  lsc_loc_code VARCHAR2(12 BYTE),
  lsc_pmh_id NUMBER(15) NOT NULL,
  lsc_loaded_switch NUMBER(1) NOT NULL,
  lsc_invoiced_switch NUMBER(1) NOT NULL,
  lsc_selected_switch NUMBER(1) NOT NULL,
  lsc_temp_shh_id NUMBER(15)
);