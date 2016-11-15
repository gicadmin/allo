CREATE OR REPLACE PACKAGE phenix.TBL_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  transaction_by_lot%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_tbl_id                         IN         transaction_by_lot.tbl_id%TYPE,
  p_tbl_rec                        OUT NOCOPY transaction_by_lot%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_tbl_id                         IN         transaction_by_lot.tbl_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_tbl_id                         IN         transaction_by_lot.tbl_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_tbl_id                         IN         transaction_by_lot.tbl_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_tbl_id                         IN         transaction_by_lot.tbl_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_tbl_id                         IN         transaction_by_lot.tbl_id%TYPE);


FUNCTION INSERT_FUNC(
  p_tbl_type                  IN         transaction_by_lot.tbl_type%TYPE,
  p_tbl_bar_code              IN         transaction_by_lot.tbl_bar_code%TYPE,
  p_tbl_prd_code              IN         transaction_by_lot.tbl_prd_code%TYPE,
  p_tbl_weight                IN         transaction_by_lot.tbl_weight%TYPE,
  p_tbl_date                  IN         transaction_by_lot.tbl_date%TYPE,
  p_tbl_type_date             IN         transaction_by_lot.tbl_type_date%TYPE,
  p_tbl_upc_code              IN         transaction_by_lot.tbl_upc_code%TYPE                   DEFAULT NULL,
  p_tbl_num_serial            IN         transaction_by_lot.tbl_num_serial%TYPE                 DEFAULT NULL,
  p_tbl_order_code            IN         transaction_by_lot.tbl_order_code%TYPE                 DEFAULT NULL,
  p_tbl_pick_code             IN         transaction_by_lot.tbl_pick_code%TYPE                  DEFAULT NULL,
  p_tbl_temperature           IN         transaction_by_lot.tbl_temperature%TYPE                DEFAULT NULL,
  p_tbl_establishment         IN         transaction_by_lot.tbl_establishment%TYPE              DEFAULT NULL,
  p_tbl_pallet_number         IN         transaction_by_lot.tbl_pallet_number%TYPE              DEFAULT NULL,
  p_tbl_id_origin             IN         transaction_by_lot.tbl_id_origin%TYPE                  DEFAULT NULL,
  p_tbl_recipe_number         IN         transaction_by_lot.tbl_recipe_number%TYPE              DEFAULT NULL,
  p_tbl_customer_order_number IN         transaction_by_lot.tbl_customer_order_number%TYPE      DEFAULT NULL,
  p_tbl_loc_code              IN         transaction_by_lot.tbl_loc_code%TYPE                   DEFAULT NULL,
  p_tbl_creation_date         IN         transaction_by_lot.tbl_creation_date%TYPE              DEFAULT SYSDATE ,
  p_tbl_use_code              IN         transaction_by_lot.tbl_use_code%TYPE                   DEFAULT 99999 ,
  p_tbl_modification_date     IN         transaction_by_lot.tbl_modification_date%TYPE          DEFAULT SYSDATE )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY transaction_by_lot%ROWTYPE)
RETURN NUMBER;

END TBL_PACK;
/