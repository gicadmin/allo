CREATE OR REPLACE PACKAGE phenix.SCOD_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  shopping_cart_order_details%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_scod_id                        IN         shopping_cart_order_details.scod_id%TYPE,
  p_scod_rec                       OUT NOCOPY shopping_cart_order_details%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_scod_id                        IN         shopping_cart_order_details.scod_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_scod_id                        IN         shopping_cart_order_details.scod_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_scod_id                        IN         shopping_cart_order_details.scod_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_scod_id                        IN         shopping_cart_order_details.scod_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_scod_id                        IN         shopping_cart_order_details.scod_id%TYPE);


FUNCTION INSERT_FUNC(
  p_scod_scoh_id           IN         shopping_cart_order_details.scod_scoh_id%TYPE,
  p_scod_prf_prd_code      IN         shopping_cart_order_details.scod_prf_prd_code%TYPE,
  p_scod_prf_fmt_code      IN         shopping_cart_order_details.scod_prf_fmt_code%TYPE,
  p_scod_desired_quantity  IN         shopping_cart_order_details.scod_desired_quantity%TYPE       DEFAULT NULL,
  p_scod_desired_weight    IN         shopping_cart_order_details.scod_desired_weight%TYPE         DEFAULT NULL,
  p_scod_ordered_quantity  IN         shopping_cart_order_details.scod_ordered_quantity%TYPE       DEFAULT NULL,
  p_scod_ordered_weight    IN         shopping_cart_order_details.scod_ordered_weight%TYPE         DEFAULT NULL,
  p_scod_message           IN         shopping_cart_order_details.scod_message%TYPE                DEFAULT NULL,
  p_scod_creation_date     IN         shopping_cart_order_details.scod_creation_date%TYPE          DEFAULT SYSDATE ,
  p_scod_modification_date IN         shopping_cart_order_details.scod_modification_date%TYPE      DEFAULT SYSDATE )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY shopping_cart_order_details%ROWTYPE)
RETURN NUMBER;

END SCOD_PACK;
/