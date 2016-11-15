CREATE OR REPLACE PACKAGE phenix.LAUZON_INVENTORY_PACK AS

FUNCTION INSERT_TRACE_FUNC(
  p_tbl_bar_code              IN transaction_by_lot.tbl_bar_code%TYPE,
  p_tbl_type                  IN transaction_by_lot.tbl_type%TYPE,
  p_tbl_prd_code              IN transaction_by_lot.tbl_prd_code%TYPE,
  p_tbl_weight                IN transaction_by_lot.tbl_weight%TYPE,
  p_tbl_date                  IN transaction_by_lot.tbl_date%TYPE,
  p_tbl_type_date             IN transaction_by_lot.tbl_type_date%TYPE,
  p_tbl_upc_code              IN transaction_by_lot.tbl_upc_code%TYPE               DEFAULT NULL,
  p_tbl_num_serial            IN transaction_by_lot.tbl_num_serial%TYPE             DEFAULT NULL,
  p_tbl_order_code            IN transaction_by_lot.tbl_order_code%TYPE             DEFAULT NULL,
  p_tbl_pick_code             IN transaction_by_lot.tbl_pick_code%TYPE              DEFAULT NULL,
  p_tbl_temperature           IN transaction_by_lot.tbl_temperature%TYPE            DEFAULT NULL,
  p_tbl_establishment         IN transaction_by_lot.tbl_establishment%TYPE          DEFAULT NULL,
  p_tbl_use_code              IN transaction_by_lot.tbl_use_code%TYPE               DEFAULT 99999,
  p_tbl_id_origin             IN transaction_by_lot.tbl_id_origin%TYPE              DEFAULT NULL,
  p_tbl_pallet_number         IN transaction_by_lot.tbl_pallet_number%TYPE          DEFAULT NULL,
  p_tbl_recipe_number         IN transaction_by_lot.tbl_recipe_number%TYPE          DEFAULT NULL,
  p_tbl_customer_order_number IN transaction_by_lot.tbl_customer_order_number%TYPE  DEFAULT NULL,
  p_tbl_loc_code              IN transaction_by_lot.tbl_loc_code%TYPE               DEFAULT NULL,
  p_tbl_creation_date         IN transaction_by_lot.tbl_creation_date%TYPE          DEFAULT SYSDATE
)
RETURN NUMBER;

PROCEDURE DECODE_BAR_CODE_PROC(
  p_tbl_bar_code       IN  transaction_by_lot.tbl_bar_code%TYPE,
  p_tbl_establishment  IN  transaction_by_lot.tbl_establishment%TYPE,
  p_tbl_upc_code       OUT transaction_by_lot.tbl_upc_code%TYPE,
  p_tbl_weight         OUT transaction_by_lot.tbl_weight%TYPE,
  p_tbl_date           OUT transaction_by_lot.tbl_date%TYPE,
  p_tbl_type_date      OUT transaction_by_lot.tbl_type_date%TYPE,
  p_tbl_num_serial     OUT transaction_by_lot.tbl_num_serial%TYPE
);

FUNCTION EXIST_RECEPTION_FUNC(
  p_tbl_bar_code        IN  transaction_by_lot.tbl_bar_code%TYPE,
  p_tbl_id              OUT transaction_by_lot.tbl_id%TYPE,
  p_tbl_prd_code        OUT transaction_by_lot.tbl_prd_code%TYPE,
  p_tbl_date            OUT transaction_by_lot.tbl_date%TYPE,
  p_tbl_type_date       OUT transaction_by_lot.tbl_type_date%TYPE,
  p_tbl_pallet_number   OUT transaction_by_lot.tbl_pallet_number%TYPE,
  p_tbl_weight_leftover OUT NUMBER
)
RETURN NUMBER;

FUNCTION HAS_CONSUMP_NOT_WEIGHTED_FUNC(
  p_tbl_bar_code IN transaction_by_lot.tbl_bar_code%TYPE
)
RETURN NUMBER;

FUNCTION GET_INFO_PALLET_FUNC(
  p_tbl_pallet_number   IN  transaction_by_lot.tbl_pallet_number%TYPE,
  p_sum_cases           OUT NUMBER,
  p_sum_weight_leftover OUT NUMBER
)
RETURN NUMBER;

PROCEDURE CONSUME_PALLET_PROC(
  p_tbl_pallet_number IN transaction_by_lot.tbl_pallet_number%TYPE,
  p_tbl_use_code      IN transaction_by_lot.tbl_use_code%TYPE,
  p_tbl_loc_code      IN transaction_by_lot.tbl_loc_code%TYPE  --LAU615
);

FUNCTION UPDATE_PALLET_NUMBER_FUNC(
  p_tbl_id            IN transaction_by_lot.tbl_id%TYPE,
  p_tbl_pallet_number IN transaction_by_lot.tbl_pallet_number%TYPE
)
RETURN NUMBER;

FUNCTION UPDATE_WEIGHT_FUNC(
  p_tbl_bar_code IN transaction_by_lot.tbl_bar_code%TYPE,
  p_tbl_type     IN transaction_by_lot.tbl_type%TYPE,
  p_tbl_weight   IN transaction_by_lot.tbl_weight%TYPE
)
RETURN NUMBER;

END LAUZON_INVENTORY_PACK;
/