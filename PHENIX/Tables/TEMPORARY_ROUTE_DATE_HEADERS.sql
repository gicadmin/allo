CREATE TABLE phenix.temporary_route_date_headers (
  tdh_route_date DATE NOT NULL,
  tdh_rou_code NUMBER(5) NOT NULL,
  tdh_route_trk_code VARCHAR2(8 BYTE),
  tdh_use_code NUMBER(5),
  tdh_use_aide_code NUMBER(5),
  tdh_route_loc_dock_code VARCHAR2(12 BYTE),
  CONSTRAINT tdh_pk PRIMARY KEY (tdh_route_date,tdh_rou_code) USING INDEX (CREATE INDEX phenix.tdh_pk ON phenix.temporary_route_date_headers(tdh_route_date,tdh_rou_code)    ),
  CONSTRAINT tdh_route_trk_fk FOREIGN KEY (tdh_route_trk_code) REFERENCES phenix.trucks (trk_code),
  CONSTRAINT tdh_rou_fk FOREIGN KEY (tdh_rou_code) REFERENCES phenix.routes (rou_code),
  CONSTRAINT tdh_use_aide_fk FOREIGN KEY (tdh_use_aide_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT tdh_use_fk FOREIGN KEY (tdh_use_code) REFERENCES phenix."USERS" (use_code)
);