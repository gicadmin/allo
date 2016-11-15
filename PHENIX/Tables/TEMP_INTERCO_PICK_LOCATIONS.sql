CREATE GLOBAL TEMPORARY TABLE phenix.temp_interco_pick_locations (
  tipl_trh_whs_from_code VARCHAR2(2 BYTE) NOT NULL,
  tipl_trd_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  tipl_trd_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  tipl_prd_ven_code NUMBER(5) NOT NULL,
  tipl_prd_description VARCHAR2(45 BYTE) NOT NULL,
  tipl_prd_short_description VARCHAR2(15 BYTE) NOT NULL,
  tipl_vpd_code VARCHAR2(15 BYTE) NOT NULL,
  tipl_vpd_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  tipl_prf_description VARCHAR2(30 BYTE) NOT NULL,
  tipl_loc_code VARCHAR2(12 BYTE) NOT NULL
)
ON COMMIT DELETE ROWS;
COMMENT ON TABLE phenix.temp_interco_pick_locations IS 'Table temporaire des localisations de cueillettes des Interco';
COMMENT ON COLUMN phenix.temp_interco_pick_locations.tipl_trh_whs_from_code IS 'Indique le code de l''entrepôt';
COMMENT ON COLUMN phenix.temp_interco_pick_locations.tipl_trd_prf_prd_code IS 'Indique le code de produit';
COMMENT ON COLUMN phenix.temp_interco_pick_locations.tipl_trd_prf_fmt_code IS 'Indique le code de format';
COMMENT ON COLUMN phenix.temp_interco_pick_locations.tipl_prd_ven_code IS 'Indique le code du manufacturier';
COMMENT ON COLUMN phenix.temp_interco_pick_locations.tipl_prd_description IS 'Indique la description du produit';
COMMENT ON COLUMN phenix.temp_interco_pick_locations.tipl_prd_short_description IS 'Indique la description courte du produit';
COMMENT ON COLUMN phenix.temp_interco_pick_locations.tipl_vpd_code IS 'Indique le code de produit du manufacturier';
COMMENT ON COLUMN phenix.temp_interco_pick_locations.tipl_vpd_prf_fmt_code IS 'Indique le format du manufacturier';
COMMENT ON COLUMN phenix.temp_interco_pick_locations.tipl_prf_description IS 'Indique l''empaquetage du format manufacturier';
COMMENT ON COLUMN phenix.temp_interco_pick_locations.tipl_loc_code IS 'Indique le code de la localisation';