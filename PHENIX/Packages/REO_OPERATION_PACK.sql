CREATE OR REPLACE PACKAGE phenix.REO_OPERATION_PACK IS

FUNCTION get_export_date_func(
  p_session                             IN  VARCHAR2 DEFAULT '1')
  RETURN date;

FUNCTION get_route_type_func(
  p_session                             IN  VARCHAR2 DEFAULT '1')
  RETURN varchar2;

PROCEDURE RESET_PROC;

PROCEDURE EXPORT_PROC(
  p_delivery_date        IN         customer_order_details.cod_project_delivery_date%TYPE,
  p_from_route           IN         routes.rou_code%TYPE,
  p_to_route             IN         routes.rou_code%TYPE,
  p_rou_type             IN         routes.rou_type%TYPE,
  p_orphans              IN         number,
  p_whs_delivery_code    IN         warehouses.whs_code%TYPE      DEFAULT NULL);

END REO_OPERATION_PACK;
/