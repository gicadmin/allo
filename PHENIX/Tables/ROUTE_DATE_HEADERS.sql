CREATE TABLE phenix.route_date_headers (
  rdh_route_date DATE NOT NULL,
  rdh_rou_code NUMBER(5) NOT NULL,
  rdh_status VARCHAR2(2 BYTE) NOT NULL CONSTRAINT rdh_status_ck CHECK (RDH_STATUS IN ('NA', 'OP', 'CT', 'CR', 'CL')),
  rdh_route_loc_dock_code VARCHAR2(12 BYTE),
  rdh_route_trk_code VARCHAR2(8 BYTE),
  rdh_use_code NUMBER(5),
  rdh_use_aide_code NUMBER(5),
  CONSTRAINT rdh_pk PRIMARY KEY (rdh_route_date,rdh_rou_code) USING INDEX (CREATE INDEX phenix.rdh_pk ON phenix.route_date_headers(rdh_route_date,rdh_rou_code)    ),
  CONSTRAINT rdh_route_trk_fk FOREIGN KEY (rdh_route_trk_code) REFERENCES phenix.trucks (trk_code),
  CONSTRAINT rdh_rou_fk FOREIGN KEY (rdh_rou_code) REFERENCES phenix.routes (rou_code),
  CONSTRAINT rdh_use_aide_fk FOREIGN KEY (rdh_use_aide_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT rdh_use_fk FOREIGN KEY (rdh_use_code) REFERENCES phenix."USERS" (use_code)
);
COMMENT ON TABLE phenix.route_date_headers IS 'Table pour les informations générales d''une route pour une date précise';
COMMENT ON COLUMN phenix.route_date_headers.rdh_route_date IS 'Indique la date de la route';
COMMENT ON COLUMN phenix.route_date_headers.rdh_rou_code IS 'Indique le code de la route';
COMMENT ON COLUMN phenix.route_date_headers.rdh_status IS 'Indique le statut de la route';
COMMENT ON COLUMN phenix.route_date_headers.rdh_route_loc_dock_code IS 'Indique le quai d''expédition qui sera utilisé lors du chargement "par route"';
COMMENT ON COLUMN phenix.route_date_headers.rdh_route_trk_code IS 'Indique le camion qui sera utilisé lors du chargement "par route"';
COMMENT ON COLUMN phenix.route_date_headers.rdh_use_code IS 'Indique le code d''utilisateur du camionneur';
COMMENT ON COLUMN phenix.route_date_headers.rdh_use_aide_code IS 'Indique le code d''utilisateur de l''aide camionneur';