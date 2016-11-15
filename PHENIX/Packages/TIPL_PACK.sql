CREATE OR REPLACE PACKAGE phenix.TIPL_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  temp_interco_pick_locations%ROWTYPE);


PROCEDURE INSERT_PROC(
  p_tipl_trh_whs_from_code     IN         temp_interco_pick_locations.tipl_trh_whs_from_code%TYPE,
  p_tipl_trd_prf_prd_code      IN         temp_interco_pick_locations.tipl_trd_prf_prd_code%TYPE,
  p_tipl_trd_prf_fmt_code      IN         temp_interco_pick_locations.tipl_trd_prf_fmt_code%TYPE,
  p_tipl_prd_ven_code          IN         temp_interco_pick_locations.tipl_prd_ven_code%TYPE,
  p_tipl_prd_description       IN         temp_interco_pick_locations.tipl_prd_description%TYPE,
  p_tipl_prd_short_description IN         temp_interco_pick_locations.tipl_prd_short_description%TYPE,
  p_tipl_vpd_code              IN         temp_interco_pick_locations.tipl_vpd_code%TYPE,
  p_tipl_vpd_prf_fmt_code      IN         temp_interco_pick_locations.tipl_vpd_prf_fmt_code%TYPE,
  p_tipl_prf_description       IN         temp_interco_pick_locations.tipl_prf_description%TYPE,
  p_tipl_loc_code              IN         temp_interco_pick_locations.tipl_loc_code%TYPE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY temp_interco_pick_locations%ROWTYPE);

END TIPL_PACK;
/