CREATE TABLE phenix.ber8159_routes (
  rou_code NUMBER(5) NOT NULL,
  rou_day NUMBER(1) NOT NULL,
  rou_description VARCHAR2(30 BYTE) NOT NULL,
  rou_trk_code VARCHAR2(8 BYTE),
  rou_alt_description VARCHAR2(30 BYTE),
  rou_active_switch NUMBER(1) NOT NULL,
  rou_type VARCHAR2(2 BYTE) NOT NULL,
  rou_priority_code NUMBER(2),
  rou_whs_delivery_code VARCHAR2(2 BYTE) NOT NULL,
  rou_pmo_code NUMBER(3),
  rou_default_loc_dock_code VARCHAR2(12 BYTE),
  rou_rgc_code NUMBER(3),
  rou_order_cutoff_time VARCHAR2(5 BYTE)
);