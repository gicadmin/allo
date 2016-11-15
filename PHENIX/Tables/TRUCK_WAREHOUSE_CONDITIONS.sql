CREATE TABLE phenix.truck_warehouse_conditions (
  twc_id NUMBER(15) NOT NULL,
  twc_trk_code VARCHAR2(8 BYTE) NOT NULL,
  twc_whc_code VARCHAR2(2 BYTE) NOT NULL,
  CONSTRAINT twc_pk PRIMARY KEY (twc_id),
  CONSTRAINT twc_trk_whc_uk UNIQUE (twc_trk_code,twc_whc_code) USING INDEX (CREATE INDEX phenix.twc_trk_whc_uk ON phenix.truck_warehouse_conditions(twc_trk_code,twc_whc_code)    ),
  CONSTRAINT twc_trk_fk FOREIGN KEY (twc_trk_code) REFERENCES phenix.trucks (trk_code),
  CONSTRAINT twc_whc_fk FOREIGN KEY (twc_whc_code) REFERENCES phenix.warehouse_conditions (whc_code)
);
COMMENT ON COLUMN phenix.truck_warehouse_conditions.twc_id IS 'Indique l''identifiant de la condition d''entreposage du camion de livraison';
COMMENT ON COLUMN phenix.truck_warehouse_conditions.twc_trk_code IS 'Indique le code du camion de livraison';
COMMENT ON COLUMN phenix.truck_warehouse_conditions.twc_whc_code IS 'Indique la condition d''entreposage du camion de livraison';