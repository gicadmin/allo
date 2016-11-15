CREATE OR REPLACE PACKAGE phenix.WMS_GENERATE_OVERSTOCK_PACK IS

--fonction pour modifier les outstanding_mission qui vont chercher dans la réserve (palette complète etc..)
FUNCTION GEN_OVERSTOCK_MISSION_FUNC(
	p_whs_picking_code		IN	VARCHAR2,
	p_whs_delivery_code		IN	VARCHAR2
)
RETURN PLS_INTEGER;

FUNCTION VALIDATE_PICKING_LOC_FUNC(
  p_inv_prf_prd_code IN inventories.inv_prf_prd_code%TYPE,
  p_inv_prf_fmt_code IN inventories.inv_prf_fmt_code%TYPE,
  p_inv_expiry_date  IN inventories.inv_expiry_date%TYPE,
  p_lty_whs_code     IN location_types.lty_whs_code%TYPE
) RETURN BOOLEAN;

FUNCTION EXIST_CUR_REPLENISMENT_FUNC(
  p_red_prf_prd_code  IN replenishment_details.red_prf_prd_code%TYPE,
  p_red_prf_fmt_code  IN replenishment_details.red_prf_fmt_code%TYPE,
  p_red_to_loc_code   IN replenishment_details.red_to_loc_code%TYPE
) RETURN BOOLEAN;

END WMS_GENERATE_OVERSTOCK_PACK;
/