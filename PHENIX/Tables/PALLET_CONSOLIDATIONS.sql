CREATE TABLE phenix.pallet_consolidations (
  pco_id NUMBER(15) NOT NULL,
  pco_type VARCHAR2(1 BYTE) NOT NULL CONSTRAINT pco_type_ck CHECK (PCO_TYPE IN ('M', 'T')),
  pco_pick_status VARCHAR2(3 BYTE) NOT NULL CONSTRAINT pco_pick_status_ck CHECK (PCO_PICK_STATUS IN ('RTP', 'PIC', 'TRA', 'CLS')),
  pco_load_status VARCHAR2(2 BYTE) NOT NULL CONSTRAINT pco_load_status_ck CHECK (PCO_LOAD_STATUS IN ('NA', 'RL', 'TK', 'TC', 'RT', 'CL')),
  pco_selected_switch NUMBER(1) NOT NULL CONSTRAINT pco_selected_switch_ck CHECK (PCO_SELECTED_SWITCH IN (0, 1)),
  pco_overstock_switch NUMBER(1) NOT NULL CONSTRAINT pco_overstock_switch_ck CHECK (PCO_OVERSTOCK_SWITCH IN (0, 1)),
  pco_whs_picking_code VARCHAR2(2 BYTE) NOT NULL,
  pco_whs_delivery_code VARCHAR2(2 BYTE) NOT NULL,
  pco_meter_expected_volume NUMBER(10,3) NOT NULL,
  pco_meter_picked_volume NUMBER(10,3),
  pco_rdh_route_date DATE,
  pco_rdh_rou_code NUMBER(5),
  pco_pallet_method VARCHAR2(1 BYTE) NOT NULL CONSTRAINT pco_pallet_method_ck CHECK (PCO_PALLET_METHOD IN ('L', 'T')),
  pco_whz_code VARCHAR2(2 BYTE) NOT NULL,
  pco_sequence_per_zone NUMBER(3) NOT NULL,
  pco_pal_code NUMBER(3),
  pco_truck_rsh_id NUMBER(15),
  pco_truck_position_in_truck NUMBER(3),
  pco_truck_level_in_truck NUMBER(1) CONSTRAINT pco_truck_level_in_truck_ck CHECK (PCO_TRUCK_LEVEL_IN_TRUCK IN (1, 2, 3)),
  pco_route_rsh_id NUMBER(15),
  pco_route_position_in_truck NUMBER(3),
  pco_route_level_in_truck NUMBER(1) CONSTRAINT pco_route_level_in_truck_ck CHECK (PCO_ROUTE_LEVEL_IN_TRUCK IN (1, 2, 3)),
  pco_use_picker_code NUMBER(5),
  pco_start_date DATE,
  pco_truck_use_code NUMBER(5),
  pco_route_use_code NUMBER(5),
  pco_creation_date DATE DEFAULT SYSDATE NOT NULL,
  pco_transport_min_position NUMBER(7,2),
  pco_transport_max_position NUMBER(7,2),
  pco_split_by_mission_flag VARCHAR2(1 BYTE) DEFAULT 'Q' NOT NULL CONSTRAINT pco_split_by_mission_flag_ck CHECK (PCO_SPLIT_BY_MISSION_FLAG IN ('Q', 'Y', 'N')),
  pco_use_completion_code NUMBER(5),
  pco_second_wave_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT pco_second_wave_switch_ck CHECK (PCO_SECOND_WAVE_SWITCH IN (0, 1)),
  pco_transfer_pco_id NUMBER(15),
  pco_prw_whz_code VARCHAR2(2 BYTE),
  pco_manual_switch NUMBER(1) DEFAULT 0 NOT NULL,
  CONSTRAINT pco_pick_status_cls_ck CHECK ((
 		(PCO_PICK_STATUS IN ('TRA', 'CLS') AND PCO_METER_PICKED_VOLUME IS NOT NULL AND PCO_USE_PICKER_CODE IS NOT NULL)
 	OR
 		(PCO_PICK_STATUS NOT IN ('TRA', 'CLS'))
 	)),
  CONSTRAINT pco_route_ck CHECK (
 	(
 		(PCO_ROUTE_RSH_ID IS NULL AND PCO_ROUTE_POSITION_IN_TRUCK IS NULL AND PCO_ROUTE_LEVEL_IN_TRUCK IS NULL)
 	OR
 		(PCO_ROUTE_RSH_ID IS NOT NULL AND PCO_ROUTE_POSITION_IN_TRUCK IS NULL AND PCO_ROUTE_LEVEL_IN_TRUCK IS NULL)
 	OR
 		(PCO_ROUTE_RSH_ID IS NOT NULL AND PCO_ROUTE_POSITION_IN_TRUCK IS NOT NULL AND PCO_ROUTE_LEVEL_IN_TRUCK IS NOT NULL)
 	)
 ),
  CONSTRAINT pco_truck_ck CHECK (
 	(
 		(PCO_TRUCK_RSH_ID IS NULL AND PCO_TRUCK_POSITION_IN_TRUCK IS NULL AND PCO_TRUCK_LEVEL_IN_TRUCK IS NULL)
 	OR
 		(PCO_TRUCK_RSH_ID IS NOT NULL AND PCO_TRUCK_POSITION_IN_TRUCK IS NULL AND PCO_TRUCK_LEVEL_IN_TRUCK IS NULL)
 	OR
 		(PCO_TRUCK_RSH_ID IS NOT NULL AND PCO_TRUCK_POSITION_IN_TRUCK IS NOT NULL AND PCO_TRUCK_LEVEL_IN_TRUCK IS NOT NULL)
 	)
 ),
  CONSTRAINT pco_type_t_ck CHECK (
 	(
 		(PCO_TYPE = 'T' AND PCO_PICK_STATUS = 'CLS' AND PCO_OVERSTOCK_SWITCH = 0 AND PCO_PALLET_METHOD = 'T' AND PCO_TRANSPORT_MIN_POSITION IS NOT NULL AND PCO_TRANSPORT_MAX_POSITION IS NOT NULL)
 	OR
 		(PCO_TYPE = 'M' AND PCO_TRANSPORT_MIN_POSITION IS NULL AND PCO_TRANSPORT_MAX_POSITION IS NULL)
 	)
 ),
  CONSTRAINT pco_pk PRIMARY KEY (pco_id),
  CONSTRAINT pco_pal_fk FOREIGN KEY (pco_pal_code) REFERENCES phenix.pallet_types (pal_code),
  CONSTRAINT pco_prw_whz_code_fk FOREIGN KEY (pco_prw_whz_code) REFERENCES phenix.warehouse_zones (whz_code),
  CONSTRAINT pco_rdh_fk FOREIGN KEY (pco_rdh_route_date,pco_rdh_rou_code) REFERENCES phenix.route_date_headers (rdh_route_date,rdh_rou_code) ON DELETE SET NULL,
  CONSTRAINT pco_route_rsh_fk FOREIGN KEY (pco_route_rsh_id) REFERENCES phenix.route_shipments (rsh_id),
  CONSTRAINT pco_route_use_fk FOREIGN KEY (pco_route_use_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT pco_transfer_pco_fk FOREIGN KEY (pco_transfer_pco_id) REFERENCES phenix.pallet_consolidations (pco_id),
  CONSTRAINT pco_truck_rsh_fk FOREIGN KEY (pco_truck_rsh_id) REFERENCES phenix.route_shipments (rsh_id),
  CONSTRAINT pco_truck_use_fk FOREIGN KEY (pco_truck_use_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT pco_use_completion_code_fk FOREIGN KEY (pco_use_completion_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT pco_use_picker_fk FOREIGN KEY (pco_use_picker_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT pco_whs_delivery_fk FOREIGN KEY (pco_whs_delivery_code) REFERENCES phenix.warehouses (whs_code),
  CONSTRAINT pco_whs_picking_fk FOREIGN KEY (pco_whs_picking_code) REFERENCES phenix.warehouses (whs_code),
  CONSTRAINT pco_whz_fk FOREIGN KEY (pco_whz_code) REFERENCES phenix.warehouse_zones (whz_code)
);
COMMENT ON TABLE phenix.pallet_consolidations IS 'Table des palettes consolidées';
COMMENT ON COLUMN phenix.pallet_consolidations.pco_id IS 'Indique le numéro de la palette';
COMMENT ON COLUMN phenix.pallet_consolidations.pco_type IS 'Indique le type de la palette (Missions ou Transport)';
COMMENT ON COLUMN phenix.pallet_consolidations.pco_pick_status IS 'Indique le statut de cueillette de la palette';
COMMENT ON COLUMN phenix.pallet_consolidations.pco_load_status IS 'Indique le statut de chargement de la palette';
COMMENT ON COLUMN phenix.pallet_consolidations.pco_selected_switch IS 'Indique si la palette est sélectionnée';
COMMENT ON COLUMN phenix.pallet_consolidations.pco_overstock_switch IS 'Indique si la palette est une palette des localisations de réserves';
COMMENT ON COLUMN phenix.pallet_consolidations.pco_whs_picking_code IS 'Indique le code de l''entrepôt où la palette est cueillie';
COMMENT ON COLUMN phenix.pallet_consolidations.pco_whs_delivery_code IS 'Indique le code de l''entrepôt où la palette est expédiée';
COMMENT ON COLUMN phenix.pallet_consolidations.pco_meter_expected_volume IS 'Indique le volume à cueillir, en mètre cube';
COMMENT ON COLUMN phenix.pallet_consolidations.pco_meter_picked_volume IS 'Indique le volume qui a été cueilli, en mètre cube';
COMMENT ON COLUMN phenix.pallet_consolidations.pco_rdh_route_date IS 'Indique la date de la route';
COMMENT ON COLUMN phenix.pallet_consolidations.pco_rdh_rou_code IS 'Indique le code de route de la palette';
COMMENT ON COLUMN phenix.pallet_consolidations.pco_pallet_method IS 'Indique la méthode de palettisation utilisée lors de la cueillette (En Couche / En Tour)';
COMMENT ON COLUMN phenix.pallet_consolidations.pco_whz_code IS 'Indique le code de la zone d''entreposage mission de la palette';
COMMENT ON COLUMN phenix.pallet_consolidations.pco_sequence_per_zone IS 'Indique la séquence de la palette dans sa zone d''entreposage mission';
COMMENT ON COLUMN phenix.pallet_consolidations.pco_pal_code IS 'Indique le type de palette utilisé';
COMMENT ON COLUMN phenix.pallet_consolidations.pco_truck_rsh_id IS 'Indique le numéro du chargement par camion (s''il y en a eu un)';
COMMENT ON COLUMN phenix.pallet_consolidations.pco_truck_position_in_truck IS 'Indique la position de la palette dans le camion lors du chargement par camion (s''il y en a eu un)';
COMMENT ON COLUMN phenix.pallet_consolidations.pco_truck_level_in_truck IS 'Indique le niveau de la palette dans le camion lors du chargement par camion (s''il y en a eu un)';
COMMENT ON COLUMN phenix.pallet_consolidations.pco_route_rsh_id IS 'Indique le numéro du chargement par route';
COMMENT ON COLUMN phenix.pallet_consolidations.pco_route_position_in_truck IS 'Indique la position de la palette dans le camion lors du chargement par route';
COMMENT ON COLUMN phenix.pallet_consolidations.pco_route_level_in_truck IS 'Indique le niveau de la palette dans le camion lors du chargement par route';
COMMENT ON COLUMN phenix.pallet_consolidations.pco_use_picker_code IS 'Indique le code de l''utilisateur ayant effectué la cueillette de la palette';
COMMENT ON COLUMN phenix.pallet_consolidations.pco_start_date IS 'Indique la date/heure de l''ouverture de la palette';
COMMENT ON COLUMN phenix.pallet_consolidations.pco_truck_use_code IS 'Indique le code de l''utilisateur ayant chargé la palette lors du chargement par camion (s''il y en a eu un)';
COMMENT ON COLUMN phenix.pallet_consolidations.pco_route_use_code IS 'Indique le code de l''utilisateur ayant chargé la palette lors du chargement par route';
COMMENT ON COLUMN phenix.pallet_consolidations.pco_creation_date IS 'Indique la date de création de la palette';
COMMENT ON COLUMN phenix.pallet_consolidations.pco_transport_min_position IS 'Indique la position minimum incluse dans la palette de transport';
COMMENT ON COLUMN phenix.pallet_consolidations.pco_transport_max_position IS 'Indique la position maximum incluse dans la palette de transport';
COMMENT ON COLUMN phenix.pallet_consolidations.pco_split_by_mission_flag IS 'Indique si la palette est séparée par missions pour la cueillette';
COMMENT ON COLUMN phenix.pallet_consolidations.pco_use_completion_code IS 'Indique le code de l''utilisateur ayant fermé la palette';
COMMENT ON COLUMN phenix.pallet_consolidations.pco_second_wave_switch IS 'Indique si la palette concerne une deuxième vague';
COMMENT ON COLUMN phenix.pallet_consolidations.pco_transfer_pco_id IS 'Indique le numéro de palette sur laquelle les missions ont été transférées';
COMMENT ON COLUMN phenix.pallet_consolidations.pco_prw_whz_code IS 'Indique le code de la zone d''entreposage du produit dans l''entrepôt';
COMMENT ON COLUMN phenix.pallet_consolidations.pco_manual_switch IS 'Indique si la palette a été générée manuellement';