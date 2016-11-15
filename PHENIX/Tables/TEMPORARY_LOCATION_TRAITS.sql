CREATE GLOBAL TEMPORARY TABLE phenix.temporary_location_traits (
  tlr_pmh_id VARCHAR2(15 BYTE),
  tlr_use_code NUMBER(5)
)
ON COMMIT PRESERVE ROWS;
COMMENT ON TABLE phenix.temporary_location_traits IS 'Table utilisée dans la package WMS_FIND_PACK pour chercher la localisation de reserve la plus proche pour les missions de cueillette';
COMMENT ON COLUMN phenix.temporary_location_traits.tlr_pmh_id IS 'Indique le numéro de la mission ';
COMMENT ON COLUMN phenix.temporary_location_traits.tlr_use_code IS 'Indique le code de l''utilisateur';