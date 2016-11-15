CREATE OR REPLACE PACKAGE phenix.PRF_PACK IS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  product_formats%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_prf_prd_code                   IN         product_formats.prf_prd_code%TYPE,
  p_prf_fmt_code                   IN         product_formats.prf_fmt_code%TYPE,
  p_prf_rec                        OUT NOCOPY product_formats%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_prf_prd_code                   IN         product_formats.prf_prd_code%TYPE,
  p_prf_fmt_code                   IN         product_formats.prf_fmt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_prf_prd_code                   IN         product_formats.prf_prd_code%TYPE,
  p_prf_fmt_code                   IN         product_formats.prf_fmt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_prf_prd_code                   IN         product_formats.prf_prd_code%TYPE,
  p_prf_fmt_code                   IN         product_formats.prf_fmt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_prf_prd_code                   IN         product_formats.prf_prd_code%TYPE,
  p_prf_fmt_code                   IN         product_formats.prf_fmt_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_prf_prd_code                   IN         product_formats.prf_prd_code%TYPE,
  p_prf_fmt_code                   IN         product_formats.prf_fmt_code%TYPE);


PROCEDURE INSERT_PROC(
  p_prf_prd_code                   IN         product_formats.prf_prd_code%TYPE,
  p_prf_fmt_code                   IN         product_formats.prf_fmt_code%TYPE,
  p_prf_conversion_to_base         IN         product_formats.prf_conversion_to_base%TYPE,
  p_prf_description                IN         product_formats.prf_description%TYPE,
  p_prf_height                     IN         product_formats.prf_height%TYPE,
  p_prf_inner_weight               IN         product_formats.prf_inner_weight%TYPE,
  p_prf_length                     IN         product_formats.prf_length%TYPE,
  p_prf_operation_flag             IN         product_formats.prf_operation_flag%TYPE,
  p_prf_price                      IN         product_formats.prf_price%TYPE,
  p_prf_profit_percent             IN         product_formats.prf_profit_percent%TYPE,
  p_prf_purchase_weight            IN         product_formats.prf_purchase_weight%TYPE,
  p_prf_sellable_format_switch     IN         product_formats.prf_sellable_format_switch%TYPE,
  p_prf_width                      IN         product_formats.prf_width%TYPE,
  p_prf_cns_code                   IN         product_formats.prf_cns_code%TYPE                        DEFAULT NULL,
  p_prf_upc_code                   IN         product_formats.prf_upc_code%TYPE                        DEFAULT NULL,
  p_prf_surcharge                  IN         product_formats.prf_surcharge%TYPE                       DEFAULT NULL,
  p_prf_message                    IN         product_formats.prf_message%TYPE                         DEFAULT NULL,
  p_prf_remote_code                IN         product_formats.prf_remote_code%TYPE                     DEFAULT NULL,
  p_prf_number_of_items            IN         product_formats.prf_number_of_items%TYPE                 DEFAULT NULL,
  p_prf_elimination_date           IN         product_formats.prf_elimination_date%TYPE                DEFAULT NULL,
  p_prf_minimum_sale_price         IN         product_formats.prf_minimum_sale_price%TYPE              DEFAULT NULL,
  p_prf_attribute_last_update_da   IN         product_formats.prf_attribute_last_update_date%TYPE      DEFAULT NULL,
  p_prf_approb_last_update_date    IN         product_formats.prf_approb_last_update_date%TYPE         DEFAULT NULL,
  p_prf_surcharge_percent          IN         product_formats.prf_surcharge_percent%TYPE               DEFAULT NULL,
  p_prf_tobacco_tax                IN         product_formats.prf_tobacco_tax%TYPE                     DEFAULT 0 ,
  p_prf_creation_date              IN         product_formats.prf_creation_date%TYPE                   DEFAULT SYSDATE ,
  p_prf_modification_date          IN         product_formats.prf_modification_date%TYPE               DEFAULT SYSDATE ,
  p_prf_sales_multiple             IN         product_formats.prf_sales_multiple%TYPE                  DEFAULT 1 ,
  p_prf_pre_print_required_switc   IN         product_formats.prf_pre_print_required_switch%TYPE       DEFAULT 0 ,
  p_prf_discount_switch            IN         product_formats.prf_discount_switch%TYPE                 DEFAULT 1 ,
  p_prf_only_one_pick_wght_switc   IN         product_formats.prf_only_one_pick_wght_switch%TYPE       DEFAULT 0 ,
  p_prf_cash_n_carry_only_switch   IN         product_formats.prf_cash_n_carry_only_switch%TYPE        DEFAULT 0 ,
  p_prf_fragile_switch             IN         product_formats.prf_fragile_switch%TYPE                  DEFAULT 0 ,
  p_prf_repack_required_switch     IN         product_formats.prf_repack_required_switch%TYPE          DEFAULT 0 ,
  p_prf_liter                      IN         product_formats.prf_liter%TYPE                           DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY product_formats%ROWTYPE);

FUNCTION GET_PRF_FUNC(
  p_prf_prd_code        IN VARCHAR2,
  p_prf_fmt_code        IN VARCHAR2,
  p_product_formats_rec OUT NOCOPY product_formats%ROWTYPE
)
RETURN PLS_INTEGER;

FUNCTION LOCK_ALL_PRF_FOR_PRD_FUNC(
  p_prd_code IN VARCHAR2
)
RETURN BOOLEAN;

PROCEDURE GET_PRF_CONVERSION_PROC(
  p_prd_code                IN VARCHAR2,
  p_fmt_code                IN VARCHAR2,
  p_prf_conversion_to_base  OUT NUMBER,
  p_prf_operation_flag      OUT VARCHAR2
);

PROCEDURE GET_PRF_PRICES_PROC(
  p_prd_code                IN VARCHAR2,
  p_fmt_code                IN VARCHAR2,
  p_prf_profit_percent      OUT NUMBER,
  p_prf_price               OUT NUMBER,
  p_prf_tobacco_tax         OUT NUMBER,
  p_prf_minimum_sale_price  OUT NUMBER
);

PROCEDURE GET_PRF_PRICE_PROC(
  p_prd_code                IN VARCHAR2,
  p_fmt_code                IN VARCHAR2,
  p_prf_price               OUT NUMBER
);

FUNCTION GET_PRODUCT_FORMAT_UPCS_FUNC (   --ajouter par Rostom
  p_prd_code IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION GET_MAX_SALE_MULTIPLE(
  p_prd_code  IN VARCHAR2,
  p_fmt_code  IN VARCHAR2,
  p_value     IN NUMBER
)
RETURN NUMBER;

FUNCTION FIND_PRF_NB_OF_ITEMS_FUNC(
  p_prd_code IN VARCHAR2,
  p_fmt_code IN VARCHAR2
)
RETURN NUMBER;

FUNCTION GET_GREATEST_SELLABLE_FMT_FUNC( --CSC3036
  p_prd_code  IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION GET_SMALLEST_SELLABLE_FMT_FUNC( --CSC3036
  p_prd_code  IN VARCHAR2
)
RETURN VARCHAR2;

--fonction pour trouver le rapport de conversion entre deux formats d'un même produit
FUNCTION FORMAT_CONVERSION_FUNC(
  p_prd_code        IN  VARCHAR2,
  p_from_fmt_code   IN  VARCHAR2,
  p_to_fmt_code     IN  VARCHAR2
)
RETURN NUMBER;

FUNCTION FIND_PRF_DESCRIPTION_FUNC(
  p_prf_prd_code IN VARCHAR2,
  p_prf_fmt_code IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION GET_PRD_SALES_FORMAT_FUNC(
  p_prd_code    IN VARCHAR2,
  p_from        IN NUMBER DEFAULT 1,
  p_to          IN NUMBER DEFAULT 1,
  p_separateur  IN VARCHAR2 DEFAULT ''
)
RETURN VARCHAR2;

FUNCTION GET_SALES_FORMAT_WITH_FMT_FUNC(
  p_prd_code          IN VARCHAR2,
  p_pgr_sales_format  IN NUMBER,
  p_from              IN NUMBER,
  p_to                IN NUMBER,
  p_separateur        IN VARCHAR2,
  p_choice            IN NUMBER DEFAULT 0  --EFE271
)
RETURN VARCHAR2;

END PRF_PACK;
/