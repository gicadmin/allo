CREATE TABLE phenix.route_shipments (
  rsh_id NUMBER(15) NOT NULL,
  rsh_open_switch NUMBER(1) NOT NULL CONSTRAINT rsh_open_switch_ck CHECK (RSH_OPEN_SWITCH IN (0, 1)),
  rsh_shipment_type VARCHAR2(2 BYTE) NOT NULL CONSTRAINT rsh_shipment_type_ck CHECK (RSH_SHIPMENT_TYPE IN ('TK', 'RT')),
  rsh_trk_code VARCHAR2(8 BYTE) NOT NULL,
  rsh_start_date DATE NOT NULL,
  rsh_end_date DATE,
  rsh_rdh_rou_code NUMBER(5),
  rsh_rdh_route_date DATE NOT NULL,
  rsh_rgc_code NUMBER(3),
  rsh_whs_code VARCHAR2(2 BYTE) NOT NULL,
  rsh_created_by_use_code NUMBER(5) NOT NULL,
  rsh_closed_by_use_code NUMBER(5),
  rsh_tkc_code NUMBER(3),
  CONSTRAINT rsh_type_rou_or_rgc_ck CHECK (
 	(
 	  (RSH_SHIPMENT_TYPE = 'TK' AND RSH_RGC_CODE IS NOT NULL AND RSH_RDH_ROU_CODE IS NULL)
 		OR
 		(RSH_SHIPMENT_TYPE = 'RT' AND RSH_RDH_ROU_CODE IS NOT NULL AND RSH_RGC_CODE IS NULL)
 	)
 ),
  CONSTRAINT rsh_pk PRIMARY KEY (rsh_id) USING INDEX (CREATE INDEX phenix.rsh_pk ON phenix.route_shipments(rsh_id)    ),
  CONSTRAINT rsh_closed_by_use_fk FOREIGN KEY (rsh_closed_by_use_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT rsh_created_by_use_fk FOREIGN KEY (rsh_created_by_use_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT rsh_rgc_fk FOREIGN KEY (rsh_rgc_code) REFERENCES phenix.route_grouping_codes (rgc_code),
  CONSTRAINT rsh_tkc_fk FOREIGN KEY (rsh_tkc_code) REFERENCES phenix.truck_cleanliness (tkc_code),
  CONSTRAINT rsh_trk_fk FOREIGN KEY (rsh_trk_code) REFERENCES phenix.trucks (trk_code),
  CONSTRAINT rsh_whs_fk FOREIGN KEY (rsh_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.route_shipments IS 'Table pour les chargements';
COMMENT ON COLUMN phenix.route_shipments.rsh_id IS 'Indique le numéro du chargement';
COMMENT ON COLUMN phenix.route_shipments.rsh_open_switch IS 'Indique si le chargement est encore ouvert';
COMMENT ON COLUMN phenix.route_shipments.rsh_shipment_type IS 'Indique le type de chargement: par camion ou par route';
COMMENT ON COLUMN phenix.route_shipments.rsh_trk_code IS 'Indique le code du camion pour le chargement';
COMMENT ON COLUMN phenix.route_shipments.rsh_start_date IS 'Indique la date de début du chargement';
COMMENT ON COLUMN phenix.route_shipments.rsh_end_date IS 'Indique la date de fin du chargement';
COMMENT ON COLUMN phenix.route_shipments.rsh_rdh_rou_code IS 'Indique le code de la route impliqué dans le chargement (pour les chargements par route seulement)';
COMMENT ON COLUMN phenix.route_shipments.rsh_rdh_route_date IS 'Indique la date de route impliquée dans le chargement';
COMMENT ON COLUMN phenix.route_shipments.rsh_rgc_code IS 'Indique le regroupement de route impliqué dans le chargement (pour les chargements par camion seulement)';
COMMENT ON COLUMN phenix.route_shipments.rsh_whs_code IS 'Indique dans quel entrepôt a lieu le chargement';
COMMENT ON COLUMN phenix.route_shipments.rsh_created_by_use_code IS 'Indique le code de l''utilisateur qui a créé le chargement';
COMMENT ON COLUMN phenix.route_shipments.rsh_closed_by_use_code IS 'Indique le code de l''utilisateur qui a fermé le chargement';
COMMENT ON COLUMN phenix.route_shipments.rsh_tkc_code IS 'Indique la propreté du camion de livraison lors du chargement';