CREATE OR REPLACE PACKAGE phenix.RIO_OPERATION_PACK IS

PROCEDURE IMPORT_PROC(
  p_delivery_date  IN  customer_order_details.cod_project_delivery_date%TYPE
);

PROCEDURE RESET_PROC;

END RIO_OPERATION_PACK;
/