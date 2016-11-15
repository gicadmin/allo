CREATE TABLE phenix.location_types (
  lty_code NUMBER(5) NOT NULL,
  lty_description VARCHAR2(30 BYTE) NOT NULL,
  lty_alt_description VARCHAR2(30 BYTE),
  lty_whz_code VARCHAR2(2 BYTE) NOT NULL,
  lty_infinite_inventory_switch NUMBER(1) NOT NULL CONSTRAINT lty_infinite_inventory_swit_ck CHECK (LTY_INFINITE_INVENTORY_SWITCH IN (0,1)),
  lty_prn_id NUMBER(15),
  lty_damage_switch NUMBER(1) NOT NULL CONSTRAINT lty_damage_switch_ck CHECK (LTY_DAMAGE_SWITCH IN (0,1)),
  lty_overstock_switch NUMBER(1) NOT NULL CONSTRAINT lty_overstock_switch_ck CHECK (LTY_OVERSTOCK_SWITCH IN (0,1)),
  lty_receiving_dock_switch NUMBER(1) NOT NULL CONSTRAINT lty_receiving_dock_switch_ck CHECK (LTY_RECEIVING_DOCK_SWITCH IN (0, 1)),
  lty_shipping_dock_switch NUMBER(1) NOT NULL CONSTRAINT lty_shipping_dock_switch_ck CHECK (LTY_SHIPPING_DOCK_SWITCH IN (0, 1)),
  lty_transit_switch NUMBER(1) NOT NULL CONSTRAINT lty_transit_switch_ck CHECK (LTY_TRANSIT_SWITCH IN (0,1)),
  lty_one_product_switch NUMBER(1) NOT NULL CONSTRAINT lty_one_product_switch_ck CHECK (LTY_ONE_PRODUCT_SWITCH IN (0,1)),
  lty_whs_code VARCHAR2(2 BYTE) NOT NULL,
  lty_spec_order_switch NUMBER(1) NOT NULL CONSTRAINT lty_spec_order_switch_ck CHECK (LTY_SPEC_ORDER_SWITCH IN (0,1)),
  lty_no_count_switch NUMBER(1) NOT NULL CONSTRAINT lty_no_count_switch_ck CHECK (LTY_NO_COUNT_SWITCH IN (0,1)),
  lty_picking_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT lty_picking_switch_ck CHECK (LTY_PICKING_SWITCH IN (0,1)),
  lty_width NUMBER(8,3) DEFAULT 1.000 NOT NULL,
  lty_height NUMBER(8,3) DEFAULT 1.000 NOT NULL,
  lty_depth NUMBER(8,3) DEFAULT 1.000 NOT NULL,
  lty_first_location VARCHAR2(12 BYTE) NOT NULL,
  lty_last_location VARCHAR2(12 BYTE) NOT NULL,
  lty_dedicated_locations_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT lty_dedicated_locations_sw_ck CHECK (LTY_DEDICATED_LOCATIONS_SWITCH IN (0,1)),
  lty_zone_characters NUMBER(2),
  lty_alley_characters NUMBER(2),
  lty_bay_characters NUMBER(2),
  lty_level_characters NUMBER(2),
  lty_position_characters NUMBER(2),
  lty_depth_characters NUMBER(2),
  lty_cash_and_carry_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT lty_cash_and_carry_swi_ck CHECK (LTY_CASH_AND_CARRY_SWITCH IN (0, 1)),
  lty_zone_check_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT lty_zone_check_switch_ck CHECK (LTY_ZONE_CHECK_SWITCH IN (0,1)),
  lty_alley_check_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT lty_alley_check_switch_ck CHECK (LTY_ALLEY_CHECK_SWITCH IN (0,1)),
  lty_bay_check_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT lty_bay_check_switch_ck CHECK (LTY_BAY_CHECK_SWITCH IN (0,1)),
  lty_level_check_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT lty_level_check_switch_ck CHECK (LTY_LEVEL_CHECK_SWITCH IN (0,1)),
  lty_position_check_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT lty_position_check_switch_ck CHECK (LTY_POSITION_CHECK_SWITCH IN (0,1)),
  lty_depth_check_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT lty_depth_check_switch_ck CHECK (LTY_DEPTH_CHECK_SWITCH IN (0,1)),
  lty_minimum_fill_percentage NUMBER(6,3) DEFAULT 0 NOT NULL,
  lty_drive_in_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT lty_drive_in_switch_ck CHECK (LTY_DRIVE_IN_SWITCH IN (0,1)),
  lty_drive_in_max_pallets NUMBER(2),
  lty_user_location_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT lty_user_location_switch_ck CHECK (LTY_USER_LOCATION_SWITCH IN (0,1)),
  lty_push_back_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT lty_push_back_switch_ck CHECK (LTY_PUSH_BACK_SWITCH IN (0,1)),
  lty_unique_pick_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT lty_unique_pick_switch_ck CHECK (LTY_UNIQUE_PICK_SWITCH IN (0,1)),
  lty_replacement_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT lty_replacement_switch_ck CHECK (LTY_REPLACEMENT_SWITCH IN (0,1)),
  lty_interco_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT lty_interco_switch_ck CHECK (lty_interco_switch IN (0,1)),
  lty_whs_destination_code VARCHAR2(2 BYTE),
  lty_rac_code VARCHAR2(1 BYTE),
  lty_pof_code NUMBER(2),
  lty_liquidation_switch NUMBER(1) DEFAULT 0 NOT NULL,
  lty_vna_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT lty_vna_switch_ck CHECK (LTY_VNA_SWITCH IN (0,1)),
  CONSTRAINT lty_pk PRIMARY KEY (lty_code),
  CONSTRAINT lty_pof_fk FOREIGN KEY (lty_pof_code) REFERENCES phenix.positioning_families (pof_code),
  CONSTRAINT lty_prn_fk FOREIGN KEY (lty_prn_id) REFERENCES phenix.printers (prn_id),
  CONSTRAINT lty_rac_fk FOREIGN KEY (lty_rac_code) REFERENCES phenix.racking_types (rac_code),
  CONSTRAINT lty_whs_destination_fk FOREIGN KEY (lty_whs_destination_code) REFERENCES phenix.warehouses (whs_code),
  CONSTRAINT lty_whs_fk FOREIGN KEY (lty_whs_code) REFERENCES phenix.warehouses (whs_code),
  CONSTRAINT lty_whz_fk FOREIGN KEY (lty_whz_code) REFERENCES phenix.warehouse_zones (whz_code)
);
COMMENT ON TABLE phenix.location_types IS 'La table des types de localisations est utilisée pour définir les différents types de localisations';
COMMENT ON COLUMN phenix.location_types.lty_code IS 'Type de localisation';
COMMENT ON COLUMN phenix.location_types.lty_description IS 'Description du type localisation';
COMMENT ON COLUMN phenix.location_types.lty_alt_description IS 'Description alternative';
COMMENT ON COLUMN phenix.location_types.lty_whz_code IS 'Zone d''entreposage des localisations de ce type';
COMMENT ON COLUMN phenix.location_types.lty_infinite_inventory_switch IS 'Indique si les localisations de ce type peuvent tomber en inventaire négatif';
COMMENT ON COLUMN phenix.location_types.lty_prn_id IS 'Indique l''imprimante par défaut';
COMMENT ON COLUMN phenix.location_types.lty_damage_switch IS 'Indique si les localisations de ce type sont utilisées pour entreposer des produits endommagés';
COMMENT ON COLUMN phenix.location_types.lty_overstock_switch IS 'Indique si les localisations de ce type sont utilisées pour garder les produits en réserve';
COMMENT ON COLUMN phenix.location_types.lty_receiving_dock_switch IS 'Indique le quai de réception';
COMMENT ON COLUMN phenix.location_types.lty_shipping_dock_switch IS 'Indique le quai d''expédition';
COMMENT ON COLUMN phenix.location_types.lty_transit_switch IS 'Indique si les localisations de ce type sont des localisations logiques et non physique';
COMMENT ON COLUMN phenix.location_types.lty_one_product_switch IS 'Indique si les localisations de ce type sont limitées à un produit à la fois';
COMMENT ON COLUMN phenix.location_types.lty_whs_code IS 'Code de l''entrepôt';
COMMENT ON COLUMN phenix.location_types.lty_spec_order_switch IS 'Indique si les localisations de ce type sont utilisées pour des commandes spéciales';
COMMENT ON COLUMN phenix.location_types.lty_no_count_switch IS 'Indique si les localisations de ce type sont exclues des décomptes d''inventaire';
COMMENT ON COLUMN phenix.location_types.lty_picking_switch IS 'Indique si les localisations de ce type sont utilisées pour la cueillette';
COMMENT ON COLUMN phenix.location_types.lty_width IS 'Largeur';
COMMENT ON COLUMN phenix.location_types.lty_height IS 'Hauteur';
COMMENT ON COLUMN phenix.location_types.lty_depth IS 'Profondeur';
COMMENT ON COLUMN phenix.location_types.lty_first_location IS 'Indique la première localisation de ce type';
COMMENT ON COLUMN phenix.location_types.lty_last_location IS 'Indique la dernière localisation de ce type';
COMMENT ON COLUMN phenix.location_types.lty_dedicated_locations_switch IS 'Indique que les localisations sont spécifiques à un produit même si l''inventaire est à 0';
COMMENT ON COLUMN phenix.location_types.lty_zone_characters IS 'Indique le nombre de caractères pour la zone d''entrepôt';
COMMENT ON COLUMN phenix.location_types.lty_alley_characters IS 'Indique le nombre de caractères pour l''allée';
COMMENT ON COLUMN phenix.location_types.lty_bay_characters IS 'Indique le nombre de caractères pour la baie';
COMMENT ON COLUMN phenix.location_types.lty_level_characters IS 'Indique le nombre de caractères pour le niveau';
COMMENT ON COLUMN phenix.location_types.lty_position_characters IS 'Indique le nombre de caractères pour la position';
COMMENT ON COLUMN phenix.location_types.lty_depth_characters IS 'Indique le nombre de caractères pour la profondeur';
COMMENT ON COLUMN phenix.location_types.lty_cash_and_carry_switch IS 'Indique si le type de localisation sert aux commandes "Payer et emporter"';
COMMENT ON COLUMN phenix.location_types.lty_zone_check_switch IS 'Indique si l''usager doit confirmer la zone';
COMMENT ON COLUMN phenix.location_types.lty_alley_check_switch IS 'Indique si l''usager doit confirmer l''allée';
COMMENT ON COLUMN phenix.location_types.lty_bay_check_switch IS 'Indique si l''usager doit confirmer la baie';
COMMENT ON COLUMN phenix.location_types.lty_level_check_switch IS 'Indique si l''usager doit confirmer le niveau';
COMMENT ON COLUMN phenix.location_types.lty_position_check_switch IS 'Indique si l''usager doit confirmer la position';
COMMENT ON COLUMN phenix.location_types.lty_depth_check_switch IS 'Indique si l''usager doit confirmer la profondeur';
COMMENT ON COLUMN phenix.location_types.lty_minimum_fill_percentage IS 'Indique le pourcentage minimum de la capacité de la localisation un produit doit avoir pour y être inséré';
COMMENT ON COLUMN phenix.location_types.lty_drive_in_switch IS 'Indique si ce type de localisation contient des palettier ouvert sur une face';
COMMENT ON COLUMN phenix.location_types.lty_drive_in_max_pallets IS 'Indique combien de palettes peut contenir les palettiers ouvert sur une face';
COMMENT ON COLUMN phenix.location_types.lty_user_location_switch IS 'Indique si les localisations de ce type sont des localisations d''utilisateur';
COMMENT ON COLUMN phenix.location_types.lty_push_back_switch IS 'Indique que ce type de localisation contient des palettiers à gravité inversée';
COMMENT ON COLUMN phenix.location_types.lty_unique_pick_switch IS 'Indique que les produits dans les localisations de ce type ne peuvent pas être dans une autre localisation de cueillette';
COMMENT ON COLUMN phenix.location_types.lty_replacement_switch IS 'Indique si les localisations de ce type contiennent des produits substitués';
COMMENT ON COLUMN phenix.location_types.lty_interco_switch IS 'Indique si les localisations de ce type sont utilisées pour l''interco';
COMMENT ON COLUMN phenix.location_types.lty_whs_destination_code IS 'Indique l''entrepôt de destination du quai d''expédition';
COMMENT ON COLUMN phenix.location_types.lty_rac_code IS 'Indique le type de rayonnage utilisé pour ce type de localisation';
COMMENT ON COLUMN phenix.location_types.lty_pof_code IS 'Indique le code de la famille de positionnement utilisé pour ce type de localisation';
COMMENT ON COLUMN phenix.location_types.lty_liquidation_switch IS 'Indique si cette type de localisations sert à entreposer des produits à liquidation';
COMMENT ON COLUMN phenix.location_types.lty_vna_switch IS 'Indique si les localisations de ce type sont des allées étroites';