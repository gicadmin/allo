CREATE OR REPLACE PACKAGE phenix.RSC_OPERATION_PACK AS

FUNCTION IS_RSC_EXISTS_FOR_RSH_FUNC(
  p_rsc_rsh_id  IN route_shipment_conditions.rsc_rsh_id%TYPE
) RETURN BOOLEAN;

FUNCTION INSERT_RSC_FUNC(
  p_rsc_rsh_id            IN route_shipment_conditions.rsc_rsh_id%TYPE,
  p_rsc_whc_code          IN route_shipment_conditions.rsc_whc_code%TYPE,
  p_rsc_truck_temperature IN route_shipment_conditions.rsc_truck_temperature%TYPE)
RETURN NUMBER;

END RSC_OPERATION_PACK;
/