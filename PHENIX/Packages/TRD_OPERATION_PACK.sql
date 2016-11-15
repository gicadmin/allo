CREATE OR REPLACE PACKAGE phenix.TRD_OPERATION_PACK AS

FUNCTION DOES_TRD_EXISTS_FOR_CUS_FUNC(
  p_coh_cus_code   IN  customer_order_headers.coh_cus_code%TYPE,
  p_rou_type       IN  routes.rou_type%TYPE,
  p_delivery_date  IN  DATE
)
RETURN BOOLEAN;

PROCEDURE SET_CUS_ROUTE_TO_ORPHANS_PROC(
  p_trd_route_date IN temporary_route_dates.trd_route_date%TYPE,
  p_trd_rou_code   IN temporary_route_dates.trd_rou_code%TYPE,
  p_trd_cus_code   IN temporary_route_dates.trd_cus_code%TYPE
);

PROCEDURE PURGE_PROC(
  p_trd_cus_code IN temporary_route_dates.trd_cus_code%TYPE
);

END TRD_OPERATION_PACK;
/