CREATE OR REPLACE PACKAGE phenix.TWH_PACK IS

PROCEDURE INSERT_TWH_PROC(
	p_twh_plh_id             IN transit_warehouse_headers.twh_plh_id%TYPE,
	p_twh_date               IN transit_warehouse_headers.twh_date%TYPE,
	p_twh_whs_delivery_code  IN transit_warehouse_headers.twh_whs_delivery_code%TYPE,
	p_twh_whs_picking_code   IN transit_warehouse_headers.twh_whs_picking_code%TYPE,
	p_twh_cus_code           IN transit_warehouse_headers.twh_cus_code%TYPE,
	p_twh_rou_code           IN transit_warehouse_headers.twh_rou_code%TYPE,
	p_twh_rou_priority_code  IN transit_warehouse_headers.twh_rou_priority_code%TYPE,
	p_twh_status             IN transit_warehouse_headers.twh_status%TYPE,
	p_twh_transit_number     IN transit_warehouse_headers.twh_transit_number%TYPE,
	p_twh_invoice_switch     IN transit_warehouse_headers.twh_invoice_switch%TYPE,
	p_twh_rou_delivery_code  IN transit_warehouse_headers.twh_rou_delivery_code%TYPE,
	p_twh_rou_position       IN transit_warehouse_headers.twh_rou_position%TYPE,
	p_twh_use_code_send      IN transit_warehouse_headers.twh_use_code_send%TYPE	DEFAULT NULL,
	p_twh_date_send          IN transit_warehouse_headers.twh_date_send%TYPE			DEFAULT NULL,
	p_twh_use_code_close     IN transit_warehouse_headers.twh_use_code_close%TYPE	DEFAULT NULL,
	p_twh_date_close         IN transit_warehouse_headers.twh_date_close%TYPE			DEFAULT NULL
);

FUNCTION DO_TWH_EXISTS_FOR_PLH_FUNC(
	p_plh_id in pick_list_headers.plh_id%TYPE
)
RETURN BOOLEAN;

FUNCTION EXISTS_FOR_PLH_FUNC(
    p_plh_id            in pick_list_headers.plh_id%TYPE,
    p_not_twh_status    in TRANSIT_WAREHOUSE_HEADERS.TWH_STATUS%TYPE,
    p_equal             in VARCHAR2                                         DEFAULT 'Y')
RETURN BOOLEAN;


END TWH_PACK;
/