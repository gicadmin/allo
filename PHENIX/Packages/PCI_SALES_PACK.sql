CREATE OR REPLACE PACKAGE phenix.PCI_SALES_PACK AS

FUNCTION CREATE_SCOH_FUNC(
  p_scoh_order_ref_number      IN shopping_cart_order_headers.scoh_order_ref_number%TYPE,
  p_scoh_cus_code              IN shopping_cart_order_headers.scoh_cus_code%TYPE,
  p_scoh_ause_id               IN shopping_cart_order_headers.scoh_ause_id%TYPE,
  p_scoh_project_delivery_date IN shopping_cart_order_headers.scoh_project_delivery_date%TYPE,
  p_scoh_status                IN shopping_cart_order_headers.scoh_status%TYPE,
  p_scoh_message               IN shopping_cart_order_headers.scoh_message%TYPE,
  p_scoh_customer_order_number IN shopping_cart_order_headers.scoh_customer_order_number%TYPE
)
RETURN NUMBER;

FUNCTION UPDATE_SCOH_FUNC(
  p_scoh_id                    IN shopping_cart_order_headers.scoh_id%TYPE,
  p_scoh_order_ref_number      IN shopping_cart_order_headers.scoh_order_ref_number%TYPE,
  p_scoh_project_delivery_date IN shopping_cart_order_headers.scoh_project_delivery_date%TYPE,
  p_scoh_status                IN shopping_cart_order_headers.scoh_status%TYPE,
  p_scoh_message               IN shopping_cart_order_headers.scoh_message%TYPE,
  p_scoh_customer_order_number IN shopping_cart_order_headers.scoh_customer_order_number%TYPE
)
RETURN NUMBER;

FUNCTION DELETE_SCOH_FUNC(
  p_scoh_id IN shopping_cart_order_headers.scoh_id%TYPE
)
RETURN NUMBER;

FUNCTION CREATE_SCOD_FUNC(
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

FUNCTION UPDATE_SCOD_FUNC(
  p_scod_id                IN  shopping_cart_order_details.scod_id%TYPE,
  p_scod_desired_quantity  IN  shopping_cart_order_details.scod_desired_quantity%TYPE,
  p_scod_desired_weight    IN  shopping_cart_order_details.scod_desired_weight%TYPE,
  p_scod_ordered_quantity  IN  shopping_cart_order_details.scod_ordered_quantity%TYPE,
  p_scod_ordered_weight    IN  shopping_cart_order_details.scod_ordered_weight%TYPE,
  p_scod_message           IN  shopping_cart_order_details.scod_message%TYPE
)
RETURN NUMBER;

FUNCTION DELETE_SCOD_FUNC(
  p_scod_id IN shopping_cart_order_details.scod_id%TYPE
)
RETURN NUMBER;

FUNCTION GET_ORDER_RGF_NUMBER_FUNC
RETURN NUMBER;

PROCEDURE TRANSFER_ORDER_FILE_PROC(
  p_elements        IN INTEGER,
  p_files_clob      IN CLOB,
  p_from_directory  IN VARCHAR2,
  p_to_directory    IN VARCHAR2,
  p_ftp_server_name IN VARCHAR2,
  p_ftp_port        IN NUMBER,
  p_ftp_user        IN VARCHAR2,
  p_ftp_password    IN VARCHAR2
);

END PCI_SALES_PACK;
/