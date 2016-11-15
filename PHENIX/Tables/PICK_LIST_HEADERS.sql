CREATE TABLE phenix.pick_list_headers (
  plh_id NUMBER(15) NOT NULL,
  plh_delivery_rou_code NUMBER(5),
  plh_cus_code NUMBER(10) NOT NULL,
  plh_use_code NUMBER(5) NOT NULL,
  plh_date_generated DATE NOT NULL,
  plh_position NUMBER(7,2),
  plh_picker_use_code NUMBER(5),
  plh_date_printed DATE DEFAULT SYSDATE NOT NULL,
  plh_include_in_route_switch NUMBER(1) NOT NULL CONSTRAINT plh_include_in_route_switch_ck CHECK (PLH_INCLUDE_IN_ROUTE_SWITCH IN (0, 1)),
  plh_rou_type VARCHAR2(2 BYTE) CONSTRAINT plh_rou_type_ck CHECK (PLH_ROU_TYPE IS NULL OR
PLH_ROU_TYPE IN ('RG', 'SP', 'PM')),
  plh_number_of_packages NUMBER(4),
  plh_status VARCHAR2(3 BYTE) DEFAULT 'IPR' NOT NULL CONSTRAINT plh_status_ck CHECK (PLH_STATUS IN ('OPN', 'IPR', 'SHR', 'RTI', 'CLS')),
  plh_loc_shipping_dock_code VARCHAR2(12 BYTE),
  plh_whs_delivery_code VARCHAR2(2 BYTE) NOT NULL,
  plh_whs_picking_code VARCHAR2(2 BYTE) NOT NULL,
  plh_shorts_checked_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT plh_shorts_checked_switch_ck CHECK (PLH_SHORTS_CHECKED_SWITCH IN (0, 1)),
  CONSTRAINT plh_pk PRIMARY KEY (plh_id),
  CONSTRAINT plh_cus_fk FOREIGN KEY (plh_cus_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT plh_picker_use_fk FOREIGN KEY (plh_picker_use_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT plh_rou_fk FOREIGN KEY (plh_delivery_rou_code) REFERENCES phenix.routes (rou_code),
  CONSTRAINT plh_use_fk FOREIGN KEY (plh_use_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT plh_whs_delivery_fk FOREIGN KEY (plh_whs_delivery_code) REFERENCES phenix.warehouses (whs_code),
  CONSTRAINT plh_whs_picking_fk FOREIGN KEY (plh_whs_picking_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.pick_list_headers IS 'Entête bon de cueillette';
COMMENT ON COLUMN phenix.pick_list_headers.plh_id IS 'Numéro de bon de ceuillette';
COMMENT ON COLUMN phenix.pick_list_headers.plh_delivery_rou_code IS 'Numéro de route';
COMMENT ON COLUMN phenix.pick_list_headers.plh_cus_code IS 'Numéro du client';
COMMENT ON COLUMN phenix.pick_list_headers.plh_use_code IS 'Numéro de l''usager';
COMMENT ON COLUMN phenix.pick_list_headers.plh_date_generated IS 'Date générée';
COMMENT ON COLUMN phenix.pick_list_headers.plh_position IS 'Indique la position dans la route';
COMMENT ON COLUMN phenix.pick_list_headers.plh_picker_use_code IS 'Numéro du client';
COMMENT ON COLUMN phenix.pick_list_headers.plh_date_printed IS 'Date d''impression';
COMMENT ON COLUMN phenix.pick_list_headers.plh_include_in_route_switch IS 'Indique si le document de cueillette est sur une route';
COMMENT ON COLUMN phenix.pick_list_headers.plh_rou_type IS 'Indique le type de la route';
COMMENT ON COLUMN phenix.pick_list_headers.plh_number_of_packages IS 'Nombre de colis';
COMMENT ON COLUMN phenix.pick_list_headers.plh_status IS 'Indique le statut de la demande de cueillette';
COMMENT ON COLUMN phenix.pick_list_headers.plh_loc_shipping_dock_code IS 'Indique le quai d''expédition';
COMMENT ON COLUMN phenix.pick_list_headers.plh_whs_delivery_code IS 'Indique le code de l''entrepôt de livraison';
COMMENT ON COLUMN phenix.pick_list_headers.plh_whs_picking_code IS 'Indique le code de l''entrepôt de cueillette';
COMMENT ON COLUMN phenix.pick_list_headers.plh_shorts_checked_switch IS 'Indique si la demande de cueillette a déjà été valider pour les ruptures de marchandise';