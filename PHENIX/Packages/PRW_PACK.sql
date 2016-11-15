CREATE OR REPLACE PACKAGE phenix.PRW_PACK IS

PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  product_warehouses%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_prw_prd_code                   IN         product_warehouses.prw_prd_code%TYPE,
  p_prw_whs_code                   IN         product_warehouses.prw_whs_code%TYPE,
  p_prw_rec                        OUT NOCOPY product_warehouses%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_prw_prd_code                   IN         product_warehouses.prw_prd_code%TYPE,
  p_prw_whs_code                   IN         product_warehouses.prw_whs_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_prw_prd_code                   IN         product_warehouses.prw_prd_code%TYPE,
  p_prw_whs_code                   IN         product_warehouses.prw_whs_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_prw_prd_code                   IN         product_warehouses.prw_prd_code%TYPE,
  p_prw_whs_code                   IN         product_warehouses.prw_whs_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_prw_prd_code                   IN         product_warehouses.prw_prd_code%TYPE,
  p_prw_whs_code                   IN         product_warehouses.prw_whs_code%TYPE);


PROCEDURE INSERT_PROC(
  p_prw_prd_code                  IN         product_warehouses.prw_prd_code%TYPE,
  p_prw_whs_code                  IN         product_warehouses.prw_whs_code%TYPE,
  p_prw_items_per_pallet          IN         product_warehouses.prw_items_per_pallet%TYPE,
  p_prw_items_per_row             IN         product_warehouses.prw_items_per_row%TYPE,
  p_prw_shr_code                  IN         product_warehouses.prw_shr_code%TYPE,
  p_prw_purchasable_switch        IN         product_warehouses.prw_purchasable_switch%TYPE,
  p_prw_sellable_switch           IN         product_warehouses.prw_sellable_switch%TYPE,
  p_prw_whz_code                  IN         product_warehouses.prw_whz_code%TYPE,
  p_prw_warehouse_product_code    IN         product_warehouses.prw_warehouse_product_code%TYPE         DEFAULT NULL,
  p_prw_round_per_pallet_percent  IN         product_warehouses.prw_round_per_pallet_percent%TYPE       DEFAULT NULL,
  p_prw_round_per_row_percent     IN         product_warehouses.prw_round_per_row_percent%TYPE          DEFAULT NULL,
  p_prw_replenish_nb_of_week      IN         product_warehouses.prw_replenish_nb_of_week%TYPE           DEFAULT NULL,
  p_prw_replenish_coefficient     IN         product_warehouses.prw_replenish_coefficient%TYPE          DEFAULT 0 ,
  p_prw_replenish_point           IN         product_warehouses.prw_replenish_point%TYPE                DEFAULT 0 ,
  p_prw_replenish_quantity        IN         product_warehouses.prw_replenish_quantity%TYPE             DEFAULT 0 ,
  p_prw_added_transp_amount       IN         product_warehouses.prw_added_transp_amount%TYPE            DEFAULT 0 ,
  p_prw_pickable_switch           IN         product_warehouses.prw_pickable_switch%TYPE                DEFAULT 0 ,
  p_prw_federal_display_switch    IN         product_warehouses.prw_federal_display_switch%TYPE         DEFAULT 0 ,
  p_prw_federal_tax_switch        IN         product_warehouses.prw_federal_tax_switch%TYPE             DEFAULT 0 ,
  p_prw_provincial_display_switc  IN         product_warehouses.prw_provincial_display_switch%TYPE      DEFAULT 0 ,
  p_prw_provincial_tax_switch     IN         product_warehouses.prw_provincial_tax_switch%TYPE          DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY product_warehouses%ROWTYPE);

-----------------------------------------------------------------------------------------------
-- Ajuster les fonctions / procédures ci-dessous afin de ne plus les utiliser au fil du temps
-- Les fonctions ci-haut doivent être considérées à la place
-- Déplacer les traitements dans un package OPERATION au besoin
-----------------------------------------------------------------------------------------------

FUNCTION LOCK_PRW_FUNC(
	p_prd_code 	IN VARCHAR2,
	p_whs_code	IN VARCHAR2
)
RETURN BOOLEAN;

PROCEDURE GET_PRW_ADDED_TRANSP_PROC(
	p_prd_code 									IN VARCHAR2,
	p_whs_code									IN VARCHAR2,
	p_prw_added_transp_amount		OUT NUMBER
);

FUNCTION FIND_ITEMS_PER_PALLET_FUNC(
	p_prd_code	IN VARCHAR2,
	p_whs_code	IN VARCHAR2	--ber1436
)
RETURN NUMBER;

FUNCTION GET_MAX_QTY_PER_PALLET_FUNC(
	p_prd_code	IN VARCHAR2,
	p_fmt_code	IN VARCHAR2,
	p_whs_code	IN VARCHAR2	--ber1436
)
RETURN NUMBER;

FUNCTION FIND_ITEMS_PER_ROW_FUNC(
	p_prd_code	IN VARCHAR2,
	p_whs_code	IN VARCHAR2	--ber1436
)
RETURN NUMBER;

PROCEDURE FIND_PRW_TAX_INFO_PROC(
   p_prd_code                   IN  VARCHAR2,
	 p_whs_code                   IN  VARCHAR2,
	 p_prw_federal_tax_switch     OUT NUMBER,
	 p_prw_provincial_tax_switch  OUT NUMBER
);

END PRW_PACK;
/