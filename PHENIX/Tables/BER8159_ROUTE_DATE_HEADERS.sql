CREATE TABLE phenix.ber8159_route_date_headers (
  rdh_route_date DATE NOT NULL,
  rdh_rou_code NUMBER(5) NOT NULL,
  rdh_status VARCHAR2(2 BYTE) NOT NULL,
  rdh_route_loc_dock_code VARCHAR2(12 BYTE),
  rdh_route_trk_code VARCHAR2(8 BYTE),
  rdh_use_code NUMBER(5),
  rdh_use_aide_code NUMBER(5)
);