CREATE GLOBAL TEMPORARY TABLE phenix.temporary_mission_zones (
  tmz_whz_code VARCHAR2(2 BYTE),
  tmz_whz_description VARCHAR2(30 BYTE),
  tmz_selected_zone_switch NUMBER(1),
  tmz_use_code NUMBER(5)
)
ON COMMIT PRESERVE ROWS;
COMMENT ON TABLE phenix.temporary_mission_zones IS 'Table utilisée dans la sélection des zones pour l''enquête des missions de cueillette';
COMMENT ON COLUMN phenix.temporary_mission_zones.tmz_whz_code IS 'Indique le code de la zone d''entrepôt';
COMMENT ON COLUMN phenix.temporary_mission_zones.tmz_whz_description IS 'Indique la description de la zone d''entrepôt';
COMMENT ON COLUMN phenix.temporary_mission_zones.tmz_selected_zone_switch IS 'Indique si la zone d''entrepôt est sélectionnée';
COMMENT ON COLUMN phenix.temporary_mission_zones.tmz_use_code IS 'Indique le code de l''utilisateur qui sélectionne ces zones d''entrepôt';