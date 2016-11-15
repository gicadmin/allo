CREATE OR REPLACE PACKAGE phenix.SCOH_OPERATION_PACK AS

FUNCTION CREATE_FUNC(
  p_scoh_order_ref_number      IN shopping_cart_order_headers.scoh_order_ref_number%TYPE,
  p_scoh_cus_code              IN shopping_cart_order_headers.scoh_cus_code%TYPE,
  p_scoh_ause_id               IN shopping_cart_order_headers.scoh_ause_id%TYPE,
  p_scoh_project_delivery_date IN shopping_cart_order_headers.scoh_project_delivery_date%TYPE,
  p_scoh_status                IN shopping_cart_order_headers.scoh_status%TYPE,
  p_scoh_message               IN shopping_cart_order_headers.scoh_message%TYPE,
  p_scoh_customer_order_number IN shopping_cart_order_headers.scoh_customer_order_number%TYPE
)
RETURN NUMBER;

FUNCTION UPDATE_FUNC(
  p_scoh_id                    IN shopping_cart_order_headers.scoh_id%TYPE,
  p_scoh_order_ref_number      IN shopping_cart_order_headers.scoh_order_ref_number%TYPE,
  p_scoh_project_delivery_date IN shopping_cart_order_headers.scoh_project_delivery_date%TYPE,
  p_scoh_status                IN shopping_cart_order_headers.scoh_status%TYPE,
  p_scoh_message               IN shopping_cart_order_headers.scoh_message%TYPE,
  p_scoh_customer_order_number IN shopping_cart_order_headers.scoh_customer_order_number%TYPE
)
RETURN NUMBER;

PROCEDURE PURGE_PROC(
  p_max_items IN NUMBER
);

END SCOH_OPERATION_PACK;
/