CREATE OR REPLACE PACKAGE phenix.TPRD_OPERATION_PACK AS

G_language VARCHAR2(5) := NULL;

FUNCTION GET_LANGUAGE_FUNC
RETURN VARCHAR2;

FUNCTION LOAD_CUSTOMER_PROFILE_FUNC(
  p_cus_code               IN customers.cus_code%TYPE,
  p_ven_code               IN vendors.ven_code%TYPE,
  p_cus_delivery_date      IN DATE,
  p_language               IN VARCHAR2,
  p_apply_blue_line_switch IN NUMBER,
  p_from_row               IN NUMBER,
  p_to_row                 IN NUMBER,
  p_order_by               IN VARCHAR2,
  p_search_string          IN VARCHAR2
)
RETURN NUMBER;

FUNCTION LOAD_CUSTOMER_PROFILE_FUNC(
  p_cus_code               IN customers.cus_code%TYPE,
  p_cus_delivery_date      IN DATE,
  p_language               IN VARCHAR2,
  p_apply_blue_line_switch IN NUMBER,
  p_from_row               IN NUMBER,
  p_to_row                 IN NUMBER,
  p_order_by               IN VARCHAR2,
  p_search_string          IN VARCHAR2
)
RETURN NUMBER;

FUNCTION LOAD_CATALOG_FUNC(
  p_cus_code               IN customers.cus_code%TYPE,
  p_ven_code               IN vendors.ven_code%TYPE,
  p_cus_delivery_date      IN DATE,
  p_language               IN VARCHAR2,
  p_apply_blue_line_switch IN NUMBER,
  p_from_row               IN NUMBER,
  p_to_row                 IN NUMBER,
  p_order_by               IN VARCHAR2,
  p_search_string          IN VARCHAR2
)
RETURN NUMBER;

FUNCTION LOAD_CATALOG_FUNC(
  p_cus_code               IN customers.cus_code%TYPE,
  p_cus_delivery_date      IN DATE,
  p_language               IN VARCHAR2,
  p_apply_blue_line_switch IN NUMBER,
  p_from_row               IN NUMBER,
  p_to_row                 IN NUMBER,
  p_order_by               IN VARCHAR2,
  p_search_string          IN VARCHAR2
)
RETURN NUMBER;

FUNCTION LOAD_SHOPPING_LIST_FUNC(
  p_dlh_id                 IN display_list_headers.dlh_id%TYPE,
  p_cus_code               IN customers.cus_code%TYPE,
  p_cus_delivery_date      IN DATE,
  p_language               IN VARCHAR2,
  p_apply_blue_line_switch IN NUMBER,
  p_from_row               IN NUMBER,
  p_to_row                 IN NUMBER,
  p_order_by               IN VARCHAR2,
  p_search_string          IN VARCHAR2
)
RETURN NUMBER;

FUNCTION LOAD_CHANGED_REG_TO_SP_FUNC(
  p_cus_code               IN customers.cus_code%TYPE,
  p_cus_delivery_date      IN DATE,
  p_language               IN VARCHAR2,
  p_apply_blue_line_switch IN NUMBER,
  p_from_row               IN NUMBER,
  p_to_row                 IN NUMBER,
  p_order_by               IN VARCHAR2,
  p_search_string          IN VARCHAR2
)
RETURN NUMBER;

FUNCTION LOAD_CHANGED_SP_TO_REG_FUNC(
  p_cus_code               IN customers.cus_code%TYPE,
  p_cus_delivery_date      IN DATE,
  p_language               IN VARCHAR2,
  p_apply_blue_line_switch IN NUMBER,
  p_from_row               IN NUMBER,
  p_to_row                 IN NUMBER,
  p_order_by               IN VARCHAR2,
  p_search_string          IN VARCHAR2
)
RETURN NUMBER;

FUNCTION LOAD_NEW_PRODUCTS_FUNC(
  p_cus_code               IN customers.cus_code%TYPE,
  p_cus_delivery_date      IN DATE,
  p_language               IN VARCHAR2,
  p_apply_blue_line_switch IN NUMBER,
  p_from_row               IN NUMBER,
  p_to_row                 IN NUMBER,
  p_order_by               IN VARCHAR2,
  p_search_string          IN VARCHAR2
)
RETURN NUMBER;

FUNCTION LOAD_DELETED_PRODUCTS_FUNC(
  p_cus_code               IN customers.cus_code%TYPE,
  p_cus_delivery_date      IN DATE,
  p_language               IN VARCHAR2,
  p_apply_blue_line_switch IN NUMBER,
  p_from_row               IN NUMBER,
  p_to_row                 IN NUMBER,
  p_order_by               IN VARCHAR2,
  p_search_string          IN VARCHAR2
)
RETURN NUMBER;

FUNCTION LOAD_PRE_DELETED_PRODUCTS_FUNC(
  p_cus_code               IN customers.cus_code%TYPE,
  p_cus_delivery_date      IN DATE,
  p_language               IN VARCHAR2,
  p_apply_blue_line_switch IN NUMBER,
  p_from_row               IN NUMBER,
  p_to_row                 IN NUMBER,
  p_order_by               IN VARCHAR2,
  p_search_string          IN VARCHAR2
)
RETURN NUMBER;

FUNCTION LOAD_SHOPPING_CART_FUNC(
  p_scoh_id                IN shopping_cart_order_headers.scoh_id%TYPE,
  p_cus_code               IN customers.cus_code%TYPE,
  p_cus_delivery_date      IN DATE,
  p_language               IN VARCHAR2,
  p_apply_blue_line_switch IN NUMBER,
  p_from_row               IN NUMBER,
  p_to_row                 IN NUMBER,
  p_order_by               IN VARCHAR2,
  p_search_string          IN VARCHAR2
)
RETURN NUMBER;

FUNCTION LOAD_FAST_ENTRY_FUNC(
  p_cus_code               IN customers.cus_code%TYPE,
  p_ven_code               IN vendors.ven_code%TYPE,
  p_cus_delivery_date      IN DATE,
  p_language               IN VARCHAR2,
  p_apply_blue_line_switch IN NUMBER,
  p_from_row               IN NUMBER,
  p_to_row                 IN NUMBER,
  p_search_string          IN VARCHAR2
)
RETURN NUMBER;

END TPRD_OPERATION_PACK;
/