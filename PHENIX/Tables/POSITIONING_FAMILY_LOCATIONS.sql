CREATE TABLE phenix.positioning_family_locations (
  pfl_id NUMBER(15) NOT NULL,
  pfl_whs_code VARCHAR2(2 BYTE),
  pfl_pof_code NUMBER(2),
  pfl_rac_code VARCHAR2(1 BYTE),
  pfl_loc_code VARCHAR2(12 BYTE),
  pfl_empty_loc_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT pfl_empty_loc_switch_ck CHECK (PFL_EMPTY_LOC_SWITCH IN (0,1)),
  pfl_hold_loc_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT pfl_hold_loc_switch_ck CHECK (PFL_HOLD_LOC_SWITCH IN (0,1)),
  pfl_position_skip_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT pfl_position_skip_switch_ck CHECK (PFL_POSITION_SKIP_SWITCH IN (0,1)),
  pfl_pfp_id NUMBER(15),
  CONSTRAINT pfl_pk PRIMARY KEY (pfl_id)
);
COMMENT ON COLUMN phenix.positioning_family_locations.pfl_id IS 'Sert de clé primaire à la table.';
COMMENT ON COLUMN phenix.positioning_family_locations.pfl_whs_code IS 'Indique le code de l''entrepôt.';
COMMENT ON COLUMN phenix.positioning_family_locations.pfl_pof_code IS 'Indique le code du positonnement de la famille.';
COMMENT ON COLUMN phenix.positioning_family_locations.pfl_rac_code IS 'Indique le type de rayonnage.';
COMMENT ON COLUMN phenix.positioning_family_locations.pfl_loc_code IS 'Indique le code de la localisation.';
COMMENT ON COLUMN phenix.positioning_family_locations.pfl_empty_loc_switch IS 'Indique que cette localisation a été réservée comme étant une localisation vide.';
COMMENT ON COLUMN phenix.positioning_family_locations.pfl_hold_loc_switch IS 'Indique que la localisation est en état retenu (non disponible).';
COMMENT ON COLUMN phenix.positioning_family_locations.pfl_position_skip_switch IS 'Indique que cette localisation est considérée comme faisant partie de la précédente.';
COMMENT ON COLUMN phenix.positioning_family_locations.pfl_pfp_id IS 'Contient le numéro d''enregistrement de positionning_family_products qui a été proposé par l''algorithme de postionnement.';