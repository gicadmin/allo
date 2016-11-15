CREATE OR REPLACE PACKAGE phenix.SCOH_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  shopping_cart_order_headers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_scoh_id                        IN         shopping_cart_order_headers.scoh_id%TYPE,
  p_scoh_rec                       OUT NOCOPY shopping_cart_order_headers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_scoh_id                        IN         shopping_cart_order_headers.scoh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_scoh_id                        IN         shopping_cart_order_headers.scoh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_scoh_id                        IN         shopping_cart_order_headers.scoh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_scoh_id                        IN         shopping_cart_order_headers.scoh_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_scoh_id                        IN         shopping_cart_order_headers.scoh_id%TYPE);


FUNCTION INSERT_FUNC(
  p_scoh_order_ref_number      IN         shopping_cart_order_headers.scoh_order_ref_number%TYPE,
  p_scoh_cus_code              IN         shopping_cart_order_headers.scoh_cus_code%TYPE,
  p_scoh_ause_id               IN         shopping_cart_order_headers.scoh_ause_id%TYPE,
  p_scoh_project_delivery_date IN         shopping_cart_order_headers.scoh_project_delivery_date%TYPE,
  p_scoh_status                IN         shopping_cart_order_headers.scoh_status%TYPE,
  p_scoh_message               IN         shopping_cart_order_headers.scoh_message%TYPE                    DEFAULT NULL,
  p_scoh_customer_order_number IN         shopping_cart_order_headers.scoh_customer_order_number%TYPE      DEFAULT NULL,
  p_scoh_creation_date         IN         shopping_cart_order_headers.scoh_creation_date%TYPE              DEFAULT SYSDATE ,
  p_scoh_modification_date     IN         shopping_cart_order_headers.scoh_modification_date%TYPE          DEFAULT SYSDATE )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY shopping_cart_order_headers%ROWTYPE)
RETURN NUMBER;

END SCOH_PACK;
/