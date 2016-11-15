CREATE OR REPLACE PACKAGE phenix.INTERSECTION_PACK IS

PROCEDURE RESET_EXPORT_PROC;
PROCEDURE RESET_IMPORT_PROC;

PROCEDURE EXPORT_PROC(
  p_delivery_date      IN  customer_order_details.cod_project_delivery_date%TYPE,
  p_whs_delivery_code  IN  warehouses.whs_code%TYPE DEFAULT NULL
);

PROCEDURE IMPORT_PROC(
  p_delivery_date  IN  customer_order_details.cod_project_delivery_date%TYPE
);

PROCEDURE INSERT_IMPORT_PROC(
  p_rio_location_id    IN  roadnet_imp_orders.rio_location_id%TYPE,
  p_rio_location_type  IN  roadnet_imp_orders.rio_location_type%TYPE,
  p_rio_route          IN  roadnet_imp_orders.rio_route%TYPE,
  p_rio_position       IN  roadnet_imp_orders.rio_position%TYPE,
  p_rio_priority       IN  roadnet_imp_orders.rio_priority%TYPE,
  p_rio_delivery_date  IN  roadnet_imp_orders.rio_delivery_date%TYPE,
  p_rio_truck_code     IN  roadnet_imp_orders.rio_truck_code%TYPE  DEFAULT NULL
);

PROCEDURE CHECK_MODULE_PROC(
  p_whs_picking_code IN warehouses.whs_code%TYPE
);

PROCEDURE SET_MODULE_EXECUTING_PROC (
  p_mes_mon_code IN module_execution_status.mes_mon_code%TYPE,
  p_mes_whs_code IN module_execution_status.mes_whs_code%TYPE,
  p_mes_sid_id   IN module_execution_status.mes_sid_id%TYPE
);

PROCEDURE SET_MODULE_IDLE_PROC(
  p_mes_mon_code IN module_execution_status.mes_mon_code%TYPE,
  p_mes_whs_code IN module_execution_status.mes_whs_code%TYPE
);

END INTERSECTION_PACK;
/