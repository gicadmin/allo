CREATE OR REPLACE PACKAGE phenix.RNR_OPERATION_PACK IS

PROCEDURE EXPORT_PROC(
  p_delivery_date        IN         customer_order_details.cod_project_delivery_date%TYPE,
  p_rou_type             IN         routes.rou_type%TYPE);

FUNCTION GET_XDOCK_CODE_FUNC(
  p_rou_code             IN         routes.rou_code%TYPE)
RETURN cross_docks.cdk_code%TYPE;

END RNR_OPERATION_PACK;
/