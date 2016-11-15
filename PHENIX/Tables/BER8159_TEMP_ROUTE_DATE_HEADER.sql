CREATE TABLE phenix.ber8159_temp_route_date_header (
  tdh_route_date DATE NOT NULL,
  tdh_rou_code NUMBER(5) NOT NULL,
  tdh_route_trk_code VARCHAR2(8 BYTE),
  tdh_use_code NUMBER(5),
  tdh_use_aide_code NUMBER(5),
  tdh_route_loc_dock_code VARCHAR2(12 BYTE)
);