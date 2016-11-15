CREATE OR REPLACE PACKAGE phenix.PCI_PRODUCT_PACK IS

FUNCTION FIND_AVAILABLE_INCL_COD_FUNC(
 p_prd_code                  IN product_formats.prf_prd_code%TYPE,
 p_fmt_code                  IN product_formats.prf_fmt_code%TYPE,
 p_whs_delivery_code         IN warehouses.whs_code%TYPE,
 p_whs_picking_code          IN warehouses.whs_code%TYPE,
 p_cod_project_delivery_date IN DATE,
 p_sales_type                IN VARCHAR2 DEFAULT 'REG'
)
RETURN NUMBER;

PROCEDURE GET_PRICE_PROC(
  p_sprf_prd_code            IN  VARCHAR2,
  p_sprf_fmt_code            IN  VARCHAR2,
  p_ncus_code                IN  NUMBER,
  p_delivery_date            IN  DATE,
  p_nprf_price               OUT NUMBER,
  p_nselling_retail          OUT NUMBER,
  p_npricing_source          OUT VARCHAR2,
  p_npromotion_amount        OUT NUMBER,
  p_npromotion_type          OUT NUMBER,
  p_promotional_item_switch  OUT NUMBER,
  p_approx_fmt_selling_price OUT NUMBER,
  p_approx_fmt_savings       OUT NUMBER
);

PROCEDURE FIND_SALES_TAX_PROC(
  p_prd_code        IN  products.prd_code%TYPE,
  p_whs_code        IN  warehouses.whs_code%TYPE,
  p_cus_code        IN  customers.cus_code%TYPE,
  p_sale_price      IN  NUMBER,
  p_prov_tax_amount OUT NUMBER,
  p_fed_tax_amount  OUT NUMBER,
  p_prov_tax_rate   OUT NUMBER,
  p_fed_tax_rate    OUT NUMBER,
  p_tax_transport   IN  VARCHAR2 DEFAULT NULL
);

FUNCTION VALIDATE_QTY_DATE_FUNC(
  p_prd_code                    IN products.prd_code%TYPE,
  p_fmt_code                    IN formats.fmt_code%TYPE,
  p_whs_code                    IN warehouses.whs_code%TYPE,
  p_cus_code                    IN customers.cus_code%TYPE,
  p_delivery_date               IN DATE,
  p_ven_next_delivery_date      OUT DATE,
  p_ven_next_delivery_code      OUT NUMBER,
  p_cutoff_time                 OUT VARCHAR2,
  p_cutoff_date                 OUT DATE,
  p_ven_next_delivery_date_orig OUT DATE
)
RETURN BOOLEAN;

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

FUNCTION FIND_INFINITE_INVENTORY_FUNC(
  p_prd_code  IN VARCHAR2,
  p_fmt_code  IN VARCHAR2,
  p_whs_code  IN VARCHAR2
)
RETURN NUMBER;

END PCI_PRODUCT_PACK;
/