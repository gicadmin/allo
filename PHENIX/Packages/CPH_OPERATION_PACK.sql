CREATE OR REPLACE PACKAGE phenix.CPH_OPERATION_PACK AS

PROCEDURE INSERT_CPH_PROC(
	p_cph_pmh_id               	IN console_pick_headers.cph_pmh_id%TYPE,
  p_cph_pmh_status            IN console_pick_headers.cph_pmh_status%TYPE,
  p_cph_pmh_type              IN console_pick_headers.cph_pmh_type%TYPE,
  p_cph_pmh_whs_picking_code  IN console_pick_headers.cph_pmh_whs_picking_code%TYPE,
	p_cph_pmh_whs_delivery_code IN console_pick_headers.cph_pmh_whs_delivery_code%TYPE,
	p_cph_pmh_cus_code          IN console_pick_headers.cph_pmh_cus_code%TYPE,
	p_cph_pmh_rou_code          IN console_pick_headers.cph_pmh_rou_code%TYPE,
	p_cph_pmh_route_date        IN console_pick_headers.cph_pmh_route_date%TYPE,
	p_cph_pmh_whz_code          IN console_pick_headers.cph_pmh_whz_code%TYPE,
	p_cph_pmh_ven_code          IN console_pick_headers.cph_pmh_ven_code%TYPE,
  p_cph_pmh_pco_id            IN console_pick_headers.cph_pmh_pco_id%TYPE,     --ber3036
	p_cph_pmh_prw_whz_code      IN         console_pick_headers.cph_pmh_prw_whz_code%TYPE,
	p_cph_pmh_counter_switch    IN console_pick_headers.cph_pmh_counter_switch%TYPE,
	p_cph_pmh_overstock_switch  IN console_pick_headers.cph_pmh_overstock_switch%TYPE
);
---------------------------------------------------------
PROCEDURE UPDATE_CPH_PROC(
	p_cph_pmh_id               	IN console_pick_headers.cph_pmh_id%TYPE,
	p_cph_pmh_cus_code          IN console_pick_headers.cph_pmh_cus_code%TYPE,
	p_cph_pmh_rou_code          IN console_pick_headers.cph_pmh_rou_code%TYPE,
	p_cph_pmh_route_date        IN console_pick_headers.cph_pmh_route_date%TYPE,
	p_cph_pmh_whz_code          IN console_pick_headers.cph_pmh_whz_code%TYPE,
	p_cph_pmh_status            IN console_pick_headers.cph_pmh_status%TYPE,
	p_cph_pmh_ven_code          IN console_pick_headers.cph_pmh_ven_code%TYPE,
	p_cph_pmh_type              IN console_pick_headers.cph_pmh_type%TYPE,
	p_cph_pmh_counter_switch    IN console_pick_headers.cph_pmh_counter_switch%TYPE,
	p_cph_pmh_whs_picking_code  IN console_pick_headers.cph_pmh_whs_picking_code%TYPE,
	p_cph_pmh_whs_delivery_code IN console_pick_headers.cph_pmh_whs_delivery_code%TYPE,
	p_cph_pmh_overstock_switch  IN console_pick_headers.cph_pmh_overstock_switch%TYPE,
	p_cph_pmh_pco_id            IN console_pick_headers.cph_pmh_pco_id%TYPE,     --ber3036
  p_cph_pmh_prw_whz_code      IN console_pick_headers.cph_pmh_prw_whz_code%TYPE --BER7171
);


END CPH_OPERATION_PACK;
/