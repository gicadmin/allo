CREATE TABLE phenix.ber8159_route_shipments (
  rsh_id NUMBER(15) NOT NULL,
  rsh_open_switch NUMBER(1) NOT NULL,
  rsh_shipment_type VARCHAR2(2 BYTE) NOT NULL,
  rsh_trk_code VARCHAR2(8 BYTE) NOT NULL,
  rsh_start_date DATE NOT NULL,
  rsh_end_date DATE,
  rsh_rdh_rou_code NUMBER(5),
  rsh_rdh_route_date DATE NOT NULL,
  rsh_rgc_code NUMBER(3),
  rsh_whs_code VARCHAR2(2 BYTE) NOT NULL,
  rsh_created_by_use_code NUMBER(5) NOT NULL,
  rsh_closed_by_use_code NUMBER(5),
  rsh_tkc_code NUMBER(3)
);