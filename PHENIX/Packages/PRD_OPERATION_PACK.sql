CREATE OR REPLACE PACKAGE phenix.PRD_OPERATION_PACK IS

FUNCTION GET_PRD_EXPIRY_DATE_FUNC(  --à mettre dans PRD_OPERATION_PACK...
  p_prd_code        IN VARCHAR2,
  p_date_to_convert IN VARCHAR2,
  p_expiry_date     OUT NOCOPY DATE
)
RETURN PLS_INTEGER;

PROCEDURE ACTIVATE_PRODUCT_PROC(
  p_log_id        IN NUMBER,
  p_nb_activated  OUT NUMBER,
  p_locked_lines  OUT NUMBER,
  p_error_lines   OUT NUMBER
);

PROCEDURE PRODUCT_SET_DELETE_PROC(
  p_log_id              IN NUMBER,
  p_nb_lines            OUT NUMBER,
  p_nb_line_spec        OUT NUMBER,
  p_promo_deleted       OUT NUMBER,
  p_error_lines         OUT NUMBER,
  p_sale_skip_lines     OUT NUMBER,    --BER3670
  p_inv_skip_lines      OUT NUMBER,
  p_purchase_skip_lines OUT NUMBER,
  p_rma_skip_lines      OUT NUMBER,
  p_timeline_skip_lines OUT NUMBER
);

PROCEDURE PRODUCT_ACTIVATION_PROC(
  p_log_id      IN NUMBER,
  p_nb_actif    OUT NUMBER,
  p_nb_inactif  OUT NUMBER,
  p_nb_error    OUT NUMBER
);

--BER98 Remplacer le paramétre du fichier de log par numéro du log de la table
PROCEDURE UPDATE_PRODUCT_STATUS_PROC(
  p_prd_code    IN VARCHAR2,
  p_prd_status  IN VARCHAR2,
  p_prd_special_order_switch    IN NUMBER, --CVI2534
  p_log_id      IN NUMBER,
  p_old_status  IN VARCHAR2,  --pour les logs
  p_from_module IN VARCHAR2   --pour les logs
);

--BER2020 Envoyer un rapport au responsable de l'entrepôt si le produit ne possède pas de localisation de cueillette
--        Vérifie tous les entrepôts relié au produit
FUNCTION SEND_LOCATION_TO_CREATE_FUNC(
  p_prd_code products.prd_code%TYPE,
  p_use_code users.use_code%TYPE,
  p_language VARCHAR2 DEFAULT 'FR'
) RETURN NUMBER;

PROCEDURE GET_PRD_PGR_LEVEL_PROC(
  p_prd_code     IN     products.prd_code%TYPE,
  p_prd_pgr_code IN OUT products.prd_pgr_code%TYPE,
  p_pgr_level_1  OUT    products.prd_pgr_code%TYPE,
  p_pgr_level_2  OUT    products.prd_pgr_code%TYPE,
  p_pgr_level_3  OUT    products.prd_pgr_code%TYPE
);
PROCEDURE GET_PURCH_PRICE_FORMAT_PROC(
  p_prd_code        IN products.prd_code%TYPE,
  p_fmt_code        OUT formats.fmt_code%TYPE,
  p_fmt_description OUT formats.fmt_description%TYPE
);

FUNCTION HAS_MANY_FMT_DISPONIBLES_FUNC (
  p_prd_code IN products.prd_code%TYPE
)
RETURN BOOLEAN;

FUNCTION GET_MIN_MAX_FMT_FUNC (
  p_prd_code IN products.prd_code%TYPE,
  p_tri      IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION GET_COUNT_MIN_MAX_FMT_FUNC (
  p_prd_code IN products.prd_code%TYPE
)
RETURN NUMBER;

FUNCTION FIND_BRN_MANUF_FUNC(
  p_prd_code IN VARCHAR2,
  p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

PROCEDURE GET_DISPLAY_INFO_PROC(
  p_prd_code           IN  products.prd_code%TYPE,
  p_language           IN  VARCHAR2 ,
  p_prd_description    OUT products.prd_description%TYPE,
  p_short_description  OUT products.prd_short_description%TYPE,
  p_brn_description    OUT brand_names.brn_description%TYPE
) ;

PROCEDURE GET_DISPLAY_INFO_PROC(
  p_prd_code           IN  products.prd_code%TYPE,
  p_language           IN  VARCHAR2 ,
  p_prd_description    OUT products.prd_description%TYPE,
  p_short_description  OUT products.prd_short_description%TYPE,
  p_brn_description    OUT brand_names.brn_description%TYPE,
  p_ven_code           OUT vendors.ven_code%TYPE,
  p_ven_name           OUT vendors.ven_name%TYPE
);

FUNCTION GET_PRD_AVG_FUNC(
  p_prd_code                  IN products.prd_code%TYPE,
  p_ctr_interco_posting_cost  IN control.ctr_interco_posting_cost%TYPE
)RETURN NUMBER;


FUNCTION GET_DEFINITION_DESC_FUNC(
  p_prd_code        IN products.prd_code%TYPE,
  p_lang            IN VARCHAR2 DEFAULT 'F',
  p_prd_definition  IN products.prd_definition%TYPE DEFAULT NULL
)RETURN VARCHAR2;

FUNCTION FIND_PRD_COST_FUNC(
  p_prd_code  IN products.prd_code%TYPE,
  p_cost_type IN NUMBER
) RETURN NUMBER;

PROCEDURE PURGE_PROC(
  p_prd_code IN products.prd_code%TYPE
);

PROCEDURE PURGE_PROC(
  p_nb_days_to_keep IN NUMBER,
  p_max_items       IN NUMBER
);

FUNCTION COUNT_SUBST_REPLAC_FUNC(
  p_prd_code IN products.prd_code%TYPE
)
RETURN NUMBER;

PROCEDURE CUT_SUBST_REPLAC_LINKS_PROC(
  p_prd_code IN products.prd_code%TYPE
);

PROCEDURE UPDATE_PRODUCT_PROC(
  p_prd_code                IN products.prd_code%TYPE,
  p_prd_ven_code            IN products.prd_ven_code%TYPE,
  p_prd_multi_vendor_switch IN products.prd_multi_vendor_switch%TYPE,
  p_prd_broker_switch       IN products.prd_broker_switch%TYPE,
  p_ven_code                IN vendors.ven_code%TYPE
);

PROCEDURE UPDATE_PRODUCT_BROKER_PROC(
  p_prd_code                IN products.prd_code%TYPE,
  p_prd_ven_code            IN products.prd_ven_code%TYPE,
  p_prd_multi_vendor_switch IN products.prd_multi_vendor_switch%TYPE,
  p_ven_code                IN vendors.ven_code%TYPE,
  p_broker_vendor_id        IN control.ctr_broker_vendor_id%TYPE
);

FUNCTION GET_NEXT_PRODUCT_FUNC
RETURN VARCHAR2;

FUNCTION GET_NEXT_PRODUCT_FUNC(
  p_commit IN BOOLEAN
)
RETURN VARCHAR2;

FUNCTION DO_PRD_EXISTS_FOR_CAT_FUNC(
   p_cat_code IN categories.cat_code%TYPE
 )
RETURN NUMBER;

FUNCTION LOCK_PRD_FUNC(
  p_prd_code  IN  products.prd_code%TYPE
)
RETURN BOOLEAN;

FUNCTION GET_SALES_FORMAT_FUNC( --BER7658
	p_prd_code IN products.prd_code%TYPE
)
RETURN VARCHAR2;

FUNCTION VALIDATE_CODE_FUNC(
  p_given_code      IN  VARCHAR2,
  p_product_mode    IN  VARCHAR2,
  p_cash_carry_only IN  BOOLEAN,
  p_raise           IN  BOOLEAN,
  p_cus_code        IN  customers.cus_code%TYPE,
  p_prv_code        IN  provinces.prv_code%TYPE,
  p_whs_code        IN  warehouses.whs_code%TYPE,
  p_prd_code        OUT products.prd_code%TYPE,
  p_many_rows       OUT BOOLEAN
)
RETURN BOOLEAN;

PROCEDURE GET_ATTRIBUTE_ALLOWED_PROC(
  p_cus_rec  IN  customers%ROWTYPE,
  p_prv_rec  IN  provinces%ROWTYPE,
  p_regular  OUT products.prd_attribute%TYPE,
  p_alcohol  OUT products.prd_attribute%TYPE,
  p_tobacco  OUT products.prd_attribute%TYPE
);

PROCEDURE GET_ATTRIBUTE_ALLOWED_PROC(
  p_cus_code IN  customers.cus_code%TYPE,
  p_prv_code IN  provinces.prv_code%TYPE,
  p_regular  OUT products.prd_attribute%TYPE,
  p_alcohol  OUT products.prd_attribute%TYPE,
  p_tobacco  OUT products.prd_attribute%TYPE
);

PROCEDURE GET_ATTRIBUTE_ALLOWED_PROC(
  p_cus_code IN  customers.cus_code%TYPE,
  p_regular  OUT products.prd_attribute%TYPE,
  p_alcohol  OUT products.prd_attribute%TYPE,
  p_tobacco  OUT products.prd_attribute%TYPE
);

FUNCTION GET_ATTRIBUTE_CLAUSE_FUNC(
  p_cus_code IN customers.cus_code%TYPE,
  p_prv_code IN provinces.prv_code%TYPE
)
RETURN VARCHAR2;

FUNCTION GET_ATTRIBUTE_CLAUSE_FUNC(
  p_cus_code IN customers.cus_code%TYPE
)
RETURN VARCHAR2;

END PRD_OPERATION_PACK;
/