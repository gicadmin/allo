CREATE TABLE phenix.location_shipping_containers (
  lsc_id NUMBER(15) NOT NULL,
  lsc_container_id NUMBER(12),
  lsc_suffix VARCHAR2(1 BYTE),
  lsc_loc_shipping_dock_code VARCHAR2(12 BYTE) NOT NULL,
  lsc_loc_code VARCHAR2(12 BYTE),
  lsc_pmh_id NUMBER(15) NOT NULL,
  lsc_loaded_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT lsc_loaded_switch_ck CHECK (LSC_LOADED_SWITCH IN (0,1)),
  lsc_invoiced_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT lsc_invoiced_switch_ck CHECK (LSC_INVOICED_SWITCH IN (0, 1)),
  lsc_selected_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT lsc_selected_switch_ck CHECK (LSC_SELECTED_SWITCH IN (0, 1)),
  lsc_temp_shh_id NUMBER(15),
  CONSTRAINT lsc_pk PRIMARY KEY (lsc_id),
  CONSTRAINT lsc_loc_fk FOREIGN KEY (lsc_loc_code) REFERENCES phenix.locations (loc_code),
  CONSTRAINT lsc_loc_shipping_dock_fk FOREIGN KEY (lsc_loc_shipping_dock_code) REFERENCES phenix.locations (loc_code),
  CONSTRAINT lsc_pmh_fk FOREIGN KEY (lsc_pmh_id) REFERENCES phenix.pick_mission_headers (pmh_id),
  CONSTRAINT lsc_temp_shh_fk FOREIGN KEY (lsc_temp_shh_id) REFERENCES phenix.shipment_headers (shh_id)
);
COMMENT ON TABLE phenix.location_shipping_containers IS 'Table utilisée pour identifier les conteneurs ou les identifiants transférés au quai d''expédition';
COMMENT ON COLUMN phenix.location_shipping_containers.lsc_id IS 'Indique l''identifiant unique de la table';
COMMENT ON COLUMN phenix.location_shipping_containers.lsc_container_id IS 'Indique le code du conteneur';
COMMENT ON COLUMN phenix.location_shipping_containers.lsc_suffix IS 'Indique le suffixe d''identifiant';
COMMENT ON COLUMN phenix.location_shipping_containers.lsc_loc_shipping_dock_code IS 'Indique le code de la localisation du quai d''expédition du destinataire  ';
COMMENT ON COLUMN phenix.location_shipping_containers.lsc_loc_code IS 'Indique le code de la localisation où se trouve le conteneur ';
COMMENT ON COLUMN phenix.location_shipping_containers.lsc_pmh_id IS 'Indique le numéro de la mission de cueillette';
COMMENT ON COLUMN phenix.location_shipping_containers.lsc_loaded_switch IS 'Indique si le conteneur est chargé dans un camion';
COMMENT ON COLUMN phenix.location_shipping_containers.lsc_invoiced_switch IS 'Indique si le conteneur est déjà facturé';
COMMENT ON COLUMN phenix.location_shipping_containers.lsc_selected_switch IS 'Indique si le conteneur déjà facturé a été sélectionné sur un nouveau quai d''expédition';
COMMENT ON COLUMN phenix.location_shipping_containers.lsc_temp_shh_id IS 'Indique si le numéro d''expédition dont ce conteneur devait faire partie avant d''être laisser dans l''entrepôt (seulement temporaire)';