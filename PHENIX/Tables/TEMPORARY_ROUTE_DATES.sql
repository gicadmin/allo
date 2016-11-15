CREATE TABLE phenix.temporary_route_dates (
  trd_route_date DATE NOT NULL,
  trd_rou_code NUMBER(5) NOT NULL,
  trd_cus_code NUMBER(10) NOT NULL,
  trd_position NUMBER(7,2),
  trd_includes_transport_switch NUMBER(1) DEFAULT 0 NOT NULL,
  CONSTRAINT trd_route_pk PRIMARY KEY (trd_route_date,trd_rou_code,trd_cus_code),
  CONSTRAINT trd_cus_fk FOREIGN KEY (trd_cus_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT trd_rou_fk FOREIGN KEY (trd_rou_code) REFERENCES phenix.routes (rou_code),
  CONSTRAINT trd_tdh_fk FOREIGN KEY (trd_route_date,trd_rou_code) REFERENCES phenix.temporary_route_date_headers (tdh_route_date,tdh_rou_code)
);
COMMENT ON TABLE phenix.temporary_route_dates IS 'Table permettant de garder les informations des routes prévues mais n''ayant pas été générées encore (ni les demandes de cueillette, ni les routes)';
COMMENT ON COLUMN phenix.temporary_route_dates.trd_route_date IS 'Indique la date de route';
COMMENT ON COLUMN phenix.temporary_route_dates.trd_rou_code IS 'Indique le code de la route';
COMMENT ON COLUMN phenix.temporary_route_dates.trd_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.temporary_route_dates.trd_position IS 'Indique la position du client sur la route';
COMMENT ON COLUMN phenix.temporary_route_dates.trd_includes_transport_switch IS 'Indique si cette route inclus des transports';