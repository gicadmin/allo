CREATE OR REPLACE PACKAGE phenix.PRF_OPERATION_PACK IS

--La fonction permet de retourner si le code UPC du produit est unique ou non
FUNCTION VALIDATE_UPC_EXIST_FUNC(
	p_prd_code IN VARCHAR2,
	p_upc_code IN VARCHAR2
)
RETURN NUMBER;

--GIC2217 fonction pour valider que la nouvelle conversion est un multiple de celles déjà existantes
FUNCTION VALIDATE_CONVERSION_FUNC(
	p_prd_code 								IN VARCHAR2,
	p_operation_flag 					IN VARCHAR2,
	p_conversion_to_validate 	IN NUMBER,
	p_fmt_code_to_validate		IN VARCHAR2 DEFAULT NULL
)
RETURN NUMBER;

--Procédure appelée pendant la facturation et ailleurs. (CUSTOMER_INVOICING_PROC) Calcul le coûtant d'un produit format
FUNCTION GET_PRF_COST_PRICE_FUNC(
  p_prd_definition 	IN VARCHAR2,
  p_prd_code 				IN VARCHAR2,          -- cod_prf_prd_code,
  p_fmt_code 				IN VARCHAR2,          -- cod_prf_fmt_code,
  p_inv_fmt_code 		IN VARCHAR2,          -- ormat d'inventaire (pesé si facturé au poids.. sinon, c'est linventaire solide)
  p_tob_tax 				IN NUMBER,            -- Prf_tobacco_tax,
  p_amount 					IN NUMBER             -- Prd_average_list) prd_average_list,
)
RETURN NUMBER;

PROCEDURE CALCUL_AVERAGE_DIMENSIONS(
   p_whs_code    IN  VARCHAR2,
	 p_pof_code    IN  NUMBER,
	 p_prf_height  OUT NUMBER,
	 p_prf_width   OUT NUMBER,
	 p_prf_length  OUT NUMBER
);

PROCEDURE UPDATE_PRF_CUBISCAN_PROC(
  p_prf_prd_code			              IN product_formats.prf_prd_code%TYPE,
  p_prf_fmt_code                    IN product_formats.prf_fmt_code%TYPE,
  p_prf_height                      IN product_formats.prf_height%TYPE,
  p_prf_width      	                IN product_formats.prf_width%TYPE,
  p_prf_length                      IN product_formats.prf_length%TYPE,
  p_prf_purchase_weight             IN product_formats.prf_purchase_weight%TYPE,
  p_prf_upc_code                    IN product_formats.prf_upc_code%TYPE,
  p_prf_attrib_last_update_date     IN product_formats.prf_attribute_last_update_date%TYPE
  ) ;

 FUNCTION LOCK_PRF_FUNC(
	p_prf_prd_code			IN product_formats.prf_prd_code%TYPE,
  p_prf_fmt_code      IN product_formats.prf_fmt_code%TYPE
)
RETURN BOOLEAN;

PROCEDURE UPDATE_UPC_CODE_PROC(
  p_prf_prd_code  IN product_formats.prf_prd_code%TYPE,
  p_prf_fmt_code  IN product_formats.prf_fmt_code%TYPE,
  p_new_upc_code  IN product_formats.prf_upc_code%TYPE
);

PROCEDURE GET_DISPLAY_INFO_PROC(
  p_prd_code           IN  products.prd_code%TYPE,
  p_fmt_code           IN  formats.fmt_code%TYPE,
  p_language           IN  VARCHAR2 ,
  p_prd_description    OUT products.prd_description%TYPE,
  p_short_description  OUT products.prd_short_description%TYPE,
  p_brn_description    OUT brand_names.brn_description%TYPE,
  p_prf_description    OUT product_formats.prf_description%TYPE,
  p_fmt_short_code     OUT formats.fmt_short_code%TYPE
);

PROCEDURE GET_DISPLAY_INFO_PROC(
  p_prd_code           IN  products.prd_code%TYPE,
  p_fmt_code           IN  formats.fmt_code%TYPE,
  p_language           IN  VARCHAR2 ,
  p_prd_description    OUT products.prd_description%TYPE,
  p_short_description  OUT products.prd_short_description%TYPE,
  p_brn_description    OUT brand_names.brn_description%TYPE,
  p_prf_description    OUT product_formats.prf_description%TYPE,
  p_fmt_short_code     OUT formats.fmt_short_code%TYPE,
  p_ven_code           OUT vendors.ven_code%TYPE,
  p_ven_name           OUT vendors.ven_name%TYPE
);

PROCEDURE APPLY_COUNTER_TO_SELL_FMT_PROC(
  p_pct_prf_prd_code   IN product_counters.pct_prd_code%TYPE,
  p_pct_ctt_code       IN product_counters.pct_ctt_code%TYPE,
  p_pct_dollar_switch  IN product_counters.pct_dollar_switch%TYPE,
  p_pct_start_date     IN product_counters.pct_start_date%TYPE,
  p_pct_end_date       IN product_counters.pct_end_date%TYPE,
  p_pct_rebate_amount  IN product_counters.pct_rebate_amount%TYPE
);

FUNCTION COUNT_FMT_SELLABLE_FUNC(
  p_prf_prd_code  IN product_formats.prf_prd_code%TYPE
)RETURN NUMBER;

FUNCTION GET_PRD_FORMAT_CONVERSION_FUNC(
  p_prf_prd_code    IN product_formats.prf_prd_code%TYPE,
  p_prd_definition  IN products.prd_definition%TYPE,
  p_prf_fmt_code    IN product_formats.prf_fmt_code%TYPE
)RETURN NUMBER;

FUNCTION GET_BASE_FMT_FUNC(
  p_prd_code        IN product_formats.prf_prd_code%TYPE,
  p_prd_definition  IN products.prd_definition%TYPE
) RETURN VARCHAR2;

PROCEDURE PURGE_PROC(
  p_prf_prd_code IN product_formats.prf_prd_code%TYPE
);

FUNCTION HAS_PICK_LOCATION_FUNC (
    p_prf_prd_code        product_formats.prf_prd_code%TYPE,
    p_prf_fmt_code        product_formats.prf_fmt_code%TYPE,
    p_prw_whs_code        product_warehouses.prw_whs_code%TYPE
  ) RETURN BOOLEAN;


PROCEDURE GET_DISPLAY_INFO_PROC(
  p_prd_code           IN  products.prd_code%TYPE,
  p_fmt_code           IN  formats.fmt_code%TYPE,
  p_language           IN  VARCHAR2 ,
  p_prd_description    OUT products.prd_description%TYPE,
  p_prd_definition     OUT products.prd_definition%TYPE,
  p_brn_description    OUT brand_names.brn_description%TYPE,
  p_prf_description    OUT product_formats.prf_description%TYPE,
  p_fmt_short_code     OUT formats.fmt_short_code%TYPE,
  p_vpd_code           OUT vendor_products.vpd_code%TYPE,
  p_ven_code           OUT vendors.ven_code%TYPE,
  p_ven_name           OUT vendors.ven_name%TYPE
 );

FUNCTION COUNT_SELLABLE_FORMAT_FUNC(
  p_prf_prd_code IN product_formats.prf_prd_code%TYPE
)
RETURN NUMBER;

FUNCTION IS_VALID_AS_BASE_FMT_FUNC(
  p_prf_prd_code IN product_formats.prf_prd_code%TYPE
)
RETURN BOOLEAN;

FUNCTION GET_WEIGHT_BASE_FMT_FUNC(
  p_prf_prd_code IN product_formats.prf_prd_code%TYPE
)
RETURN VARCHAR2;

FUNCTION GET_SOLID_BASE_FMT_FUNC(
  p_prf_prd_code IN product_formats.prf_prd_code%TYPE
)
RETURN VARCHAR2;

FUNCTION IS_ALL_FORMATS_ARE_SAME_FUNC(
  p_prf_prd_code               IN product_formats.prf_prd_code%TYPE,
  p_fmt_weighted_format_switch IN formats.fmt_weighted_format_switch%TYPE
)
RETURN BOOLEAN;

FUNCTION COUNT_FORMAT_FUNC(
  p_prf_prd_code       IN product_formats.prf_prd_code%TYPE,
  p_prf_operation_flag IN product_formats.prf_operation_flag%TYPE
)
RETURN NUMBER;

FUNCTION GET_APPROX_PRICE_FUNC(
  p_prf_prd_code      IN product_formats.prf_prd_code%TYPE,
  p_prf_fmt_code      IN product_formats.prf_fmt_code%TYPE,
  p_prf_inner_weight  IN product_formats.prf_inner_weight%TYPE
)
RETURN NUMBER;

FUNCTION GET_PRICE_FUNC(
  p_prf_prd_code               IN product_formats.prf_prd_code%TYPE,
  p_prf_conversion_to_base     IN product_formats.prf_conversion_to_base%TYPE,
  p_fmt_weighted_format_switch IN formats.fmt_weighted_format_switch%TYPE
)
RETURN NUMBER;

FUNCTION GET_WEIGHED_APPROX_PRICE_FUNC(
  p_prf_prd_code               IN product_formats.prf_prd_code%TYPE,
  p_prf_fmt_code               IN product_formats.prf_fmt_code%TYPE,
  p_prf_inner_weight           IN product_formats.prf_inner_weight%TYPE,
  p_prf_tobacco_tax            IN product_formats.prf_tobacco_tax%TYPE,
  p_prf_conversion_to_base     IN product_formats.prf_conversion_to_base%TYPE,
  p_prf_operation_flag         IN product_formats.prf_operation_flag%TYPE,
  p_fmt_weighted_format_switch IN formats.fmt_weighted_format_switch%TYPE
)
RETURN NUMBER;

FUNCTION GET_GREATEST_FMT_FUNC(
  p_prf_prd_code IN product_formats.prf_prd_code%TYPE
)
RETURN VARCHAR2;

FUNCTION GET_LOWEST_FMT_FUNC(
  p_prf_prd_code IN product_formats.prf_prd_code%TYPE
)
RETURN VARCHAR2;

FUNCTION FORMAT_UPC_FUNC(
  p_upc_code   IN VARCHAR2,
  p_max_length IN NUMBER DEFAULT 12
)
RETURN VARCHAR2;

FUNCTION FORMAT_CONVERSION_FUNC(
  p_prd_code        IN  VARCHAR2,
  p_from_fmt_code   IN  VARCHAR2,
  p_to_fmt_code     IN  VARCHAR2
)
RETURN NUMBER;

PROCEDURE CALCULATE_APPROX_VALUES_PROC(
  p_prf_prd_code          IN product_formats.prf_prd_code%TYPE,
  p_prf_fmt_code          IN product_formats.prf_fmt_code%TYPE,
  p_original_retail       IN NUMBER,
  p_selling_retail        IN NUMBER,
  p_approx_original_price OUT NUMBER,
  p_approx_selling_price  OUT NUMBER,
  p_approx_savings        OUT NUMBER
);

FUNCTION EXISTS_FUNC(
  p_prf_prd_code       IN product_formats.prf_prd_code%TYPE,
  p_prf_fmt_code       IN product_formats.prf_fmt_code%TYPE,
  p_prf_operation_flag IN product_formats.prf_operation_flag%TYPE
)
RETURN BOOLEAN;

PROCEDURE CHECK_MULTIPLIED_FORMAT_PROC(
  p_prf_prd_code IN product_formats.prf_prd_code%TYPE,
  p_prf_fmt_code IN product_formats.prf_fmt_code%TYPE
);

FUNCTION IS_MANY_FMT_FOR_DISCOUNT_FUNC(
  p_prf_prd_code IN product_formats.prf_prd_code%TYPE,
  p_cud_cus_code IN customer_discounts.cud_cus_code%TYPE,
  p_cud_id       IN customer_discounts.cud_id%TYPE
)
RETURN BOOLEAN;

FUNCTION IS_MANY_FMT_FOR_DISCOUNT_FUNC(
  p_prf_prd_code IN product_formats.prf_prd_code%TYPE,
  p_cud_dgt_code IN customer_discounts.cud_dgt_code%TYPE,
  p_cud_id       IN customer_discounts.cud_id%TYPE
)
RETURN BOOLEAN;

END PRF_OPERATION_PACK;
/