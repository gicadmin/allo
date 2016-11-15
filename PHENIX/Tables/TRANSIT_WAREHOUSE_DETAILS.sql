CREATE TABLE phenix.transit_warehouse_details (
  twd_pmh_id NUMBER NOT NULL,
  twd_twh_plh_id NUMBER NOT NULL,
  CONSTRAINT twd_pk PRIMARY KEY (twd_pmh_id,twd_twh_plh_id),
  CONSTRAINT twd_pmh_id_fk FOREIGN KEY (twd_pmh_id) REFERENCES phenix.pick_mission_headers (pmh_id) ON DELETE CASCADE,
  CONSTRAINT twd_twh_fk FOREIGN KEY (twd_twh_plh_id) REFERENCES phenix.transit_warehouse_headers (twh_plh_id) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.transit_warehouse_details IS 'Détail de transite entre les entrepôts';
COMMENT ON COLUMN phenix.transit_warehouse_details.twd_pmh_id IS 'Indique le numéro de mission';
COMMENT ON COLUMN phenix.transit_warehouse_details.twd_twh_plh_id IS 'Indique le numéro de bon de ceuillette';