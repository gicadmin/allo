CREATE OR REPLACE PACKAGE phenix.SCOD_OPERATION_PACK AS

FUNCTION CREATE_FUNC(
  p_scod_scoh_id           IN  shopping_cart_order_details.scod_scoh_id%TYPE,
  p_scod_prf_prd_code      IN  shopping_cart_order_details.scod_prf_prd_code%TYPE,
  p_scod_prf_fmt_code      IN  shopping_cart_order_details.scod_prf_fmt_code%TYPE,
  p_scod_desired_quantity  IN  shopping_cart_order_details.scod_desired_quantity%TYPE,
  p_scod_desired_weight    IN  shopping_cart_order_details.scod_desired_weight%TYPE,
  p_scod_ordered_quantity  IN  shopping_cart_order_details.scod_ordered_quantity%TYPE,
  p_scod_ordered_weight    IN  shopping_cart_order_details.scod_ordered_weight%TYPE,
  p_scod_message           IN  shopping_cart_order_details.scod_message%TYPE
)
RETURN NUMBER;

FUNCTION UPDATE_FUNC(
  p_scod_id                IN  shopping_cart_order_details.scod_id%TYPE,
  p_scod_desired_quantity  IN  shopping_cart_order_details.scod_desired_quantity%TYPE,
  p_scod_desired_weight    IN  shopping_cart_order_details.scod_desired_weight%TYPE,
  p_scod_ordered_quantity  IN  shopping_cart_order_details.scod_ordered_quantity%TYPE,
  p_scod_ordered_weight    IN  shopping_cart_order_details.scod_ordered_weight%TYPE,
  p_scod_message           IN  shopping_cart_order_details.scod_message%TYPE
)
RETURN NUMBER;

END SCOD_OPERATION_PACK;
/