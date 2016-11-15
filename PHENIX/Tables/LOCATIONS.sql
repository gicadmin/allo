CREATE TABLE phenix.locations (
  loc_code VARCHAR2(12 BYTE) NOT NULL,
  loc_lty_code NUMBER(5) NOT NULL,
  loc_alt_code VARCHAR2(12 BYTE),
  loc_depth NUMBER(8,3) NOT NULL,
  loc_width NUMBER(8,3) NOT NULL,
  loc_height NUMBER(8,3) NOT NULL,
  loc_hold_switch NUMBER(1) NOT NULL CONSTRAINT loc_hold_switch_ck CHECK (loc_hold_switch IN (0, 1)),
  loc_validation_code VARCHAR2(2 BYTE),
  loc_direction_up_switch NUMBER(1) DEFAULT 1 NOT NULL,
  loc_last_count_date DATE,
  loc_door_validation_code VARCHAR2(25 BYTE),
  loc_rac_code VARCHAR2(1 BYTE),
  loc_pof_code NUMBER(2),
  loc_order VARCHAR2(1 BYTE) CONSTRAINT loc_order_ck CHECK (loc_order IN ('A','D')),
  loc_position_skip_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT loc_position_skip_switch_ck CHECK (LOC_POSITION_SKIP_SWITCH IN (0,1)),
  CONSTRAINT loc_pk PRIMARY KEY (loc_code),
  CONSTRAINT loc_lty_fk FOREIGN KEY (loc_lty_code) REFERENCES phenix.location_types (lty_code),
  CONSTRAINT loc_pof_fk FOREIGN KEY (loc_pof_code) REFERENCES phenix.positioning_families (pof_code),
  CONSTRAINT loc_rac_fk FOREIGN KEY (loc_rac_code) REFERENCES phenix.racking_types (rac_code)
);
COMMENT ON TABLE phenix.locations IS 'La table des localisations est utilisée pour maintenir les caractéristiques propres à la localisation peu importe le produit a l''intérieur';
COMMENT ON COLUMN phenix.locations.loc_code IS 'Numéro de la localisation';
COMMENT ON COLUMN phenix.locations.loc_lty_code IS 'Type de la localisation';
COMMENT ON COLUMN phenix.locations.loc_alt_code IS 'Numéro de la localisation alternative pour les "racks" à gravité';
COMMENT ON COLUMN phenix.locations.loc_depth IS 'Indique la profondeur de la localisation (en centimètres)';
COMMENT ON COLUMN phenix.locations.loc_width IS 'Indique largeur de la localisation (en centimètres)';
COMMENT ON COLUMN phenix.locations.loc_height IS 'Indique la hauteur de la localisation (en centimètres)';
COMMENT ON COLUMN phenix.locations.loc_hold_switch IS 'Indique si la localisation est en état retenu (non disponible)';
COMMENT ON COLUMN phenix.locations.loc_validation_code IS 'Indique le code de validation';
COMMENT ON COLUMN phenix.locations.loc_direction_up_switch IS 'Indique si une mission doit être ouverte avant de pourvoir la fermer';
COMMENT ON COLUMN phenix.locations.loc_last_count_date IS 'Indique la date du dernier décompte dans la localisation';
COMMENT ON COLUMN phenix.locations.loc_door_validation_code IS 'Indique le code d''identification du quai d''expédition';
COMMENT ON COLUMN phenix.locations.loc_rac_code IS 'Indique le type de rayonnage utilisé pour cette localisation';
COMMENT ON COLUMN phenix.locations.loc_pof_code IS 'Indique le code de la famille de positionnement';
COMMENT ON COLUMN phenix.locations.loc_order IS 'Indique l''ordre de placement des produits croissant ou décroissant';
COMMENT ON COLUMN phenix.locations.loc_position_skip_switch IS 'Indique si le processus de positionnement devrait ignorer cet localisation.
Utiliser quand une localisation est de double grandeur, donc considérée comme faisant parti de la localisation voisine.';