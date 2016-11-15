CREATE OR REPLACE PACKAGE phenix.ROD_OPERATION_PACK IS

FUNCTION DOES_ROD_EXISTS_FOR_CUS_FUNC(
  p_coh_cus_code   IN  customer_order_headers.coh_cus_code%TYPE,
  p_delivery_date  IN  DATE,
  p_rou_type       IN  routes.rou_type%TYPE,
  p_rou_found_code OUT NUMBER
)
RETURN BOOLEAN;

PROCEDURE PURGE_PROC(
  p_rod_cus_code IN route_dates.rod_cus_code%TYPE
);

END ROD_OPERATION_PACK;
/