CREATE TABLE phenix.route_shipment_conditions (
  rsc_id NUMBER(15) NOT NULL,
  rsc_rsh_id NUMBER(15) NOT NULL,
  rsc_whc_code VARCHAR2(2 BYTE) NOT NULL,
  rsc_truck_temperature NUMBER(4,1) NOT NULL,
  CONSTRAINT rsc_pk PRIMARY KEY (rsc_id),
  CONSTRAINT rsc_rsh_whc_uk UNIQUE (rsc_rsh_id,rsc_whc_code),
  CONSTRAINT rsc_rsh_fk FOREIGN KEY (rsc_rsh_id) REFERENCES phenix.route_shipments (rsh_id) ON DELETE CASCADE,
  CONSTRAINT rsc_whc_fk FOREIGN KEY (rsc_whc_code) REFERENCES phenix.warehouse_conditions (whc_code)
);
COMMENT ON TABLE phenix.route_shipment_conditions IS 'Table des informations par conditions d''entreposage pour un chargement';
COMMENT ON COLUMN phenix.route_shipment_conditions.rsc_id IS 'Indique l''identifiant des informations de chargement par condition d''entreposage';
COMMENT ON COLUMN phenix.route_shipment_conditions.rsc_rsh_id IS 'Indique le numéro du chargement';
COMMENT ON COLUMN phenix.route_shipment_conditions.rsc_whc_code IS 'Indique la condition d''entreposage du camion lors du chargement';
COMMENT ON COLUMN phenix.route_shipment_conditions.rsc_truck_temperature IS 'Indique la température du camion de livraison pour la condition d''entreposage lors du chargement';