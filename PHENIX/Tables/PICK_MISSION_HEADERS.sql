CREATE TABLE phenix.pick_mission_headers (
  pmh_id NUMBER(15) NOT NULL,
  pmh_cus_code NUMBER(10),
  pmh_rou_code NUMBER(5),
  pmh_route_position NUMBER(7,2),
  pmh_route_date DATE,
  pmh_whz_code VARCHAR2(2 BYTE),
  pmh_status VARCHAR2(10 BYTE) NOT NULL CONSTRAINT pmh_status_ck CHECK (pmh_status IN ('RTW', 'GEN', 'RTP', 'PIC', 'TRA', 'CLS')),
  pmh_selected_switch NUMBER(1) DEFAULT 0 NOT NULL,
  pmh_use_completion_code NUMBER(5),
  pmh_use_picker_code NUMBER(5),
  pmh_number_of_packages NUMBER(5),
  pmh_ven_code NUMBER(5),
  pmh_type VARCHAR2(1 BYTE) NOT NULL CONSTRAINT pmh_type_ck CHECK (PMH_TYPE IN ('C','V')),
  pmh_counter_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT pmh_counter_switch_ck CHECK (pmh_counter_switch IN (0,1)),
  pmh_container_reprint_date DATE,
  pmh_start_date DATE,
  pmh_container_id NUMBER(12),
  pmh_container_quantity NUMBER(1),
  pmh_loaded_on_truck_switch NUMBER(1) DEFAULT 0 NOT NULL,
  pmh_whs_picking_code VARCHAR2(2 BYTE) NOT NULL,
  pmh_whs_delivery_code VARCHAR2(2 BYTE) NOT NULL,
  pmh_overstock_switch NUMBER(1) DEFAULT 0 NOT NULL,
  pmh_pco_id NUMBER(15),
  pmh_pal_mission_complet_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT pmh_pal_mission_complet_swi_ck CHECK (PMH_PAL_MISSION_COMPLET_SWITCH IN (0, 1)),
  pmh_liquidation_switch NUMBER(1) DEFAULT 0 NOT NULL,
  pmh_prw_whz_code VARCHAR2(2 BYTE),
  pmh_pco_destination_id NUMBER(15),
  pmh_pickup_loc_code VARCHAR2(12 BYTE),
  CONSTRAINT pmh_cus_ven_ck CHECK ( ((PMH_TYPE = 'C' and PMH_CUS_CODE is not null and PMH_VEN_CODE IS NULL)
 or (PMH_TYPE = 'V' and PMH_CUS_CODE is null and PMH_VEN_CODE IS not NULL)  )),
  CONSTRAINT pmh_pk PRIMARY KEY (pmh_id),
  CONSTRAINT pmh_uk UNIQUE (pmh_container_id) USING INDEX (CREATE INDEX phenix.pmh_container_id_i ON phenix.pick_mission_headers(pmh_container_id)    ),
  CONSTRAINT pmh_cus_fk FOREIGN KEY (pmh_cus_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT pmh_pco_destination_id_fk FOREIGN KEY (pmh_pco_destination_id) REFERENCES phenix.pallet_consolidations (pco_id),
  CONSTRAINT pmh_pco_fk FOREIGN KEY (pmh_pco_id) REFERENCES phenix.pallet_consolidations (pco_id),
  CONSTRAINT pmh_pickup_loc_code_fk FOREIGN KEY (pmh_pickup_loc_code) REFERENCES phenix.locations (loc_code) ON DELETE SET NULL,
  CONSTRAINT pmh_prw_whz_code_fk FOREIGN KEY (pmh_prw_whz_code) REFERENCES phenix.warehouse_zones (whz_code),
  CONSTRAINT pmh_rou_fk FOREIGN KEY (pmh_rou_code) REFERENCES phenix.routes (rou_code),
  CONSTRAINT pmh_use_completion_code_fk FOREIGN KEY (pmh_use_completion_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT pmh_use_picker_code_fk FOREIGN KEY (pmh_use_picker_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT pmh_ven_code_fk FOREIGN KEY (pmh_ven_code) REFERENCES phenix.vendors (ven_code),
  CONSTRAINT pmh_whs_delivery_fk FOREIGN KEY (pmh_whs_delivery_code) REFERENCES phenix.warehouses (whs_code),
  CONSTRAINT pmh_whs_picking_fk FOREIGN KEY (pmh_whs_picking_code) REFERENCES phenix.warehouses (whs_code),
  CONSTRAINT pmh_whz_fk FOREIGN KEY (pmh_whz_code) REFERENCES phenix.warehouse_zones (whz_code)
);
COMMENT ON TABLE phenix.pick_mission_headers IS 'En-tête de la mission de cueillette';
COMMENT ON COLUMN phenix.pick_mission_headers.pmh_id IS 'Indique le numéro de la mission (ID)';
COMMENT ON COLUMN phenix.pick_mission_headers.pmh_cus_code IS 'Indique le numéro du client de la mission';
COMMENT ON COLUMN phenix.pick_mission_headers.pmh_rou_code IS 'Indique le code de route de la mission';
COMMENT ON COLUMN phenix.pick_mission_headers.pmh_route_position IS 'Indique la position du client sur la route';
COMMENT ON COLUMN phenix.pick_mission_headers.pmh_route_date IS 'Indique la date de la route';
COMMENT ON COLUMN phenix.pick_mission_headers.pmh_whz_code IS 'Indique le code de la zone d''entreposage de la mission';
COMMENT ON COLUMN phenix.pick_mission_headers.pmh_status IS 'Indique le statut de la mission de cueillette';
COMMENT ON COLUMN phenix.pick_mission_headers.pmh_selected_switch IS 'Indique si cette mission de cueillette est incluse dans la génération de la vague';
COMMENT ON COLUMN phenix.pick_mission_headers.pmh_use_completion_code IS 'Indique le code de l''utilisateur ayant fermé la mission';
COMMENT ON COLUMN phenix.pick_mission_headers.pmh_use_picker_code IS 'Indique le code de l''utilisateur ayant effectué la cueillette';
COMMENT ON COLUMN phenix.pick_mission_headers.pmh_number_of_packages IS 'Indique le nombre de colis compris dans cette mission';
COMMENT ON COLUMN phenix.pick_mission_headers.pmh_ven_code IS 'Indique le code du fournisseur';
COMMENT ON COLUMN phenix.pick_mission_headers.pmh_type IS 'Indique si la mission de cueillette est une cueillette ou un retour fournisseur';
COMMENT ON COLUMN phenix.pick_mission_headers.pmh_counter_switch IS 'Indique si c''est une mission pour une commande comptoir';
COMMENT ON COLUMN phenix.pick_mission_headers.pmh_container_reprint_date IS 'Indique la date/heure lorsque l''étiquette du conteneur a été réimprimé';
COMMENT ON COLUMN phenix.pick_mission_headers.pmh_start_date IS 'Indique la date/heure de l''ouverture de la mission';
COMMENT ON COLUMN phenix.pick_mission_headers.pmh_container_id IS 'Indique le numéro d''étiquette du conteneur pour la mission';
COMMENT ON COLUMN phenix.pick_mission_headers.pmh_container_quantity IS 'Indique le nombre d''étiquettes du conteneur pour la mission';
COMMENT ON COLUMN phenix.pick_mission_headers.pmh_loaded_on_truck_switch IS 'Indique si la mission est chargée dans le camion';
COMMENT ON COLUMN phenix.pick_mission_headers.pmh_whs_picking_code IS 'Indique à partir de quel entrepôt la mission sera cueillie';
COMMENT ON COLUMN phenix.pick_mission_headers.pmh_whs_delivery_code IS 'Indique à partir de quel entrepôt la mission sera expédiée';
COMMENT ON COLUMN phenix.pick_mission_headers.pmh_overstock_switch IS 'Indique si le mission est une mission des localisations de réserves.';
COMMENT ON COLUMN phenix.pick_mission_headers.pmh_pco_id IS 'Indique le numéro de la palette où a été cueillie la mission';
COMMENT ON COLUMN phenix.pick_mission_headers.pmh_pal_mission_complet_switch IS 'Indique que cette mission, dans le contexte des cueillettes par palette, est complétée, mais la palette ne l''est pas encore';
COMMENT ON COLUMN phenix.pick_mission_headers.pmh_liquidation_switch IS 'Indique si cette mission contient des transactions à cueillir dans des localisations de liquidation';
COMMENT ON COLUMN phenix.pick_mission_headers.pmh_prw_whz_code IS 'Indique le code de la zone d''entreposage du produit dans l''entrepôt';
COMMENT ON COLUMN phenix.pick_mission_headers.pmh_pco_destination_id IS 'Indique le numéro de la palette de destination de la mission';
COMMENT ON COLUMN phenix.pick_mission_headers.pmh_pickup_loc_code IS 'Indique le code de la localisation pour le ramassage de la mission par le parent';