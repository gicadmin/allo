CREATE TABLE phenix.route_dates (
  rod_rdh_route_date DATE NOT NULL,
  rod_rdh_rou_code NUMBER(5) NOT NULL,
  rod_cus_code NUMBER(10) NOT NULL,
  rod_position NUMBER(7,2) NOT NULL,
  rod_transport_only_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT rod_transport_only_switch_ck CHECK (ROD_TRANSPORT_ONLY_SWITCH IN (0, 1)),
  CONSTRAINT rod_pk PRIMARY KEY (rod_rdh_route_date,rod_rdh_rou_code,rod_cus_code),
  CONSTRAINT rod_cus_fk FOREIGN KEY (rod_cus_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT rod_rdh_fk FOREIGN KEY (rod_rdh_route_date,rod_rdh_rou_code) REFERENCES phenix.route_date_headers (rdh_route_date,rdh_rou_code)
);
COMMENT ON COLUMN phenix.route_dates.rod_rdh_route_date IS 'Date de la route';
COMMENT ON COLUMN phenix.route_dates.rod_rdh_rou_code IS 'Code de route';
COMMENT ON COLUMN phenix.route_dates.rod_cus_code IS 'Code client';
COMMENT ON COLUMN phenix.route_dates.rod_position IS 'Position du client';
COMMENT ON COLUMN phenix.route_dates.rod_transport_only_switch IS 'Indique si ce client est sur la route pour des services de transport seulement';