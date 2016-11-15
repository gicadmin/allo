CREATE OR REPLACE PACKAGE phenix.PGR_PACK AS

PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  product_groups%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pgr_code                       IN         product_groups.pgr_code%TYPE,
  p_pgr_rec                        OUT NOCOPY product_groups%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pgr_code                       IN         product_groups.pgr_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pgr_code                       IN         product_groups.pgr_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_pgr_code                       IN         product_groups.pgr_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pgr_code                       IN         product_groups.pgr_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pgr_code                       IN         product_groups.pgr_code%TYPE);


PROCEDURE INSERT_PROC(
  p_pgr_code                       IN         product_groups.pgr_code%TYPE,
  p_pgr_description                IN         product_groups.pgr_description%TYPE,
  p_pgr_commission_percent         IN         product_groups.pgr_commission_percent%TYPE,
  p_pgr_price_change_switch        IN         product_groups.pgr_price_change_switch%TYPE,
  p_pgr_tobacco_switch             IN         product_groups.pgr_tobacco_switch%TYPE,
  p_pgr_updt_by_broker_switch      IN         product_groups.pgr_updt_by_broker_switch%TYPE,
  p_pgr_sales_format               IN         product_groups.pgr_sales_format%TYPE,
  p_pgr_invoice_counter_switch     IN         product_groups.pgr_invoice_counter_switch%TYPE,
  p_pgr_alt_description            IN         product_groups.pgr_alt_description%TYPE                 DEFAULT NULL,
  p_pgr_maximum_profit_percent     IN         product_groups.pgr_maximum_profit_percent%TYPE          DEFAULT NULL,
  p_pgr_minimum_profit_percent     IN         product_groups.pgr_minimum_profit_percent%TYPE          DEFAULT NULL,
  p_pgr_min_telemark_prof_percen   IN         product_groups.pgr_min_telemark_prof_percent%TYPE       DEFAULT NULL,
  p_pgr_max_telemark_prof_percen   IN         product_groups.pgr_max_telemark_prof_percent%TYPE       DEFAULT NULL,
  p_pgr_coca_code                  IN         product_groups.pgr_coca_code%TYPE                       DEFAULT NULL,
  p_pgr_auto_adjustment_switch     IN         product_groups.pgr_auto_adjustment_switch%TYPE          DEFAULT 0 ,
  p_pgr_tobacco_inv_counter_swit   IN         product_groups.pgr_tobacco_inv_counter_switch%TYPE      DEFAULT 0 ,
  p_pgr_report_counter_switch      IN         product_groups.pgr_report_counter_switch%TYPE           DEFAULT 0 ,
  p_pgr_growth_percentage          IN         product_groups.pgr_growth_percentage%TYPE               DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY product_groups%ROWTYPE);

-----------------------------------------------------------------------------------------------
-- Ajuster les fonctions / procédures ci-dessous afin de ne plus les utiliser au fil du temps
-- Les fonctions ci-haut doivent être considérées à la place
-- Déplacer les traitements dans un package OPERATION au besoin
-----------------------------------------------------------------------------------------------

FUNCTION FIND_AUTO_ADJUST_SWITCH_FUNC(
	p_pgr_code IN NUMBER
)
RETURN NUMBER;

FUNCTION FIND_PGR_DESCRIPTION_FUNC(
	p_pgr_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

FUNCTION EXTRACT_LEVEL_GROUP_FUNC(
	p_pgr_code IN product_groups.pgr_code%TYPE
)
RETURN NUMBER;

PROCEDURE GET_PROFIT_RANGE_PROC(
	p_prd_code 								IN VARCHAR2,
	p_minimun_profit_percent 	OUT NUMBER,
	p_maximun_profit_percent 	OUT NUMBER,
  p_ctr_profit_range        IN VARCHAR2 DEFAULT 'T' --BER7084
);

FUNCTION FIND_PRD_SALES_FORMAT_FUNC(
	p_prd_code IN products.prd_code%TYPE
)
RETURN VARCHAR2;

END PGR_PACK;
/