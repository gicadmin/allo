CREATE TABLE phenix.routes (
  rou_code NUMBER(5) NOT NULL,
  rou_day NUMBER(1) NOT NULL CONSTRAINT rou_day_ck CHECK (ROU_DAY IN (2, 6, 5, 9, 7, 8, 3, 4, 1)),
  rou_description VARCHAR2(30 BYTE) NOT NULL,
  rou_trk_code VARCHAR2(8 BYTE),
  rou_alt_description VARCHAR2(30 BYTE),
  rou_active_switch NUMBER(1) NOT NULL CONSTRAINT rou_active_switch_ck CHECK (ROU_ACTIVE_SWITCH IN (0, 1)),
  rou_type VARCHAR2(2 BYTE) DEFAULT 'RG' NOT NULL CONSTRAINT rou_type_ck CHECK (ROU_TYPE IN ('RG', 'SP', 'PM')),
  rou_priority_code NUMBER(2),
  rou_whs_delivery_code VARCHAR2(2 BYTE) NOT NULL,
  rou_pmo_code NUMBER(3),
  rou_default_loc_dock_code VARCHAR2(12 BYTE),
  rou_rgc_code NUMBER(3),
  rou_order_cutoff_time VARCHAR2(5 BYTE),
  CONSTRAINT rou_pk PRIMARY KEY (rou_code),
  CONSTRAINT rou_default_loc_dock_fk FOREIGN KEY (rou_default_loc_dock_code) REFERENCES phenix.locations (loc_code),
  CONSTRAINT rou_pmo_fk FOREIGN KEY (rou_pmo_code) REFERENCES phenix.pallet_models (pmo_code),
  CONSTRAINT rou_rgc_fk FOREIGN KEY (rou_rgc_code) REFERENCES phenix.route_grouping_codes (rgc_code),
  CONSTRAINT rou_trk_fk FOREIGN KEY (rou_trk_code) REFERENCES phenix.trucks (trk_code),
  CONSTRAINT rou_whs_delivery_fk FOREIGN KEY (rou_whs_delivery_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.routes IS 'Routes de livraison';
COMMENT ON COLUMN phenix.routes.rou_code IS 'Numéro de route';
COMMENT ON COLUMN phenix.routes.rou_day IS 'Jour de la route';
COMMENT ON COLUMN phenix.routes.rou_description IS 'Description';
COMMENT ON COLUMN phenix.routes.rou_trk_code IS 'Numéro de camion';
COMMENT ON COLUMN phenix.routes.rou_alt_description IS 'Description alternative';
COMMENT ON COLUMN phenix.routes.rou_active_switch IS 'Indique si la route est active';
COMMENT ON COLUMN phenix.routes.rou_type IS 'Indique le type de la route';
COMMENT ON COLUMN phenix.routes.rou_priority_code IS 'Indique la priorité de la route';
COMMENT ON COLUMN phenix.routes.rou_whs_delivery_code IS 'Indique à partir de quel entrepôt part cette route';
COMMENT ON COLUMN phenix.routes.rou_pmo_code IS 'Indique le modèle de palettisation qui sera appliqué à la route';
COMMENT ON COLUMN phenix.routes.rou_default_loc_dock_code IS 'Indique le quai d''expédition par défaut qui sera utilisé pour cette route';
COMMENT ON COLUMN phenix.routes.rou_rgc_code IS 'Indique si la route est liée à un regroupement de routes';
COMMENT ON COLUMN phenix.routes.rou_order_cutoff_time IS 'Indique l''heure de tombée pour les commandes des clients assignés à cette route.  Format (HH:MM)';