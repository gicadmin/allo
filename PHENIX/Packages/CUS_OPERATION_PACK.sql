CREATE OR REPLACE PACKAGE phenix.CUS_OPERATION_PACK AS

FUNCTION LOCK_CUS_ON_MODULE_FUNC(
  p_module_name IN VARCHAR2,
  p_cus_code    IN customers.cus_code%TYPE,
  p_use_code    IN users.use_code%TYPE,
  p_unique_id   OUT VARCHAR2,
  p_lock_name   OUT VARCHAR2
)
RETURN NUMBER;

FUNCTION RELEASE_CUS_ON_MODULE_FUNC(
  p_unique_id  IN VARCHAR2
)
RETURN NUMBER;

PROCEDURE SYNC_TOTALS_PROC(
  p_cus_code            IN customers.cus_code%TYPE,
  p_total_dollars       IN NUMBER,
  p_reconciliation_date IN DATE,
  p_loh_id              IN log_headers.loh_id%TYPE DEFAULT NULL
);

FUNCTION GET_BILLABLE_CUSTOMER_FUNC(
  p_cus_code          IN customers.cus_code%TYPE,
  p_transaction_type  IN VARCHAR2
) RETURN customers.cus_code%TYPE;
---------------------------------------------------
--  Fonction qui permet de dÃ©terminer si la grille de surcharge de carburant reliÃ©e Ã  customer
FUNCTION IS_LINKEDTO_FSG_FUNC(
p_fsg_code  IN  FUEL_SURCHARGE_GRIDS.FSG_CODE%TYPE
)
RETURN NUMBER;
---------------------------------------------------

FUNCTION EXIST_HEAD_OFFICE_FUNC(
p_cus_code            IN customers.cus_code%TYPE
)
RETURN NUMBER;
----------------------------------------------------
FUNCTION EXIST_BRANCH_FUNC(
p_cus_code            IN customers.cus_code%TYPE
)
RETURN NUMBER;
----------------------------------------------------
FUNCTION EXIST_LOOP_CUSCODE_FUNC(
p_cus_cus_code            IN customers.cus_cus_code%TYPE,
p_cus_code                IN customers.cus_code%TYPE
)
RETURN NUMBER;
----------------------------------------------------
FUNCTION VALIDATE_LOOP_BRANCH_FUNC(
p_cus_code                      IN customers.cus_code%TYPE,
p_cus_cus_code                  IN customers.cus_cus_code%TYPE,
p_CUS_INV_HEAD_OFFICE_SWITCH    IN number
)
RETURN NUMBER;
----------------------------------------------------
FUNCTION EXIST_OPENED_PICK_FUNC(
p_cus_code            IN customers.cus_code%TYPE,
p_cus_invoice_method  IN customers.cus_invoice_method%TYPE
)
RETURN NUMBER;
----------------------------------------------------
-- retourne dans une chaine concatinÃ©e et sÃ©parÃ©e par Â¤ : le TFE, BANK_ACCOUNT_NUMBER, INSTITUTION_NUMBER
FUNCTION GET_ACCPAC_BANCINFO_FUNC(
P_CUS_CODE                IN customers.cus_code%TYPE,
p_BANK_ACCOUNT_NUMBER     OUT VARCHAR2,
p_INSTITUTION_NUMBER      OUT VARCHAR2,
p_TFE                     OUT VARCHAR2
)
RETURN VARCHAR2;
----------------------------------------------------
FUNCTION GET_EXPID_INFO_FUNC(
  p_cus_code            IN NUMBER,
  p_pty_code            OUT NUMBER,
  p_trt_code            OUT NUMBER,
  p_whs_code            OUT VARCHAR2,
  p_address             OUT VARCHAR2,
  p_city                OUT VARCHAR2,
  p_prv_resides_in_code OUT VARCHAR2,
  p_postal_code         OUT VARCHAR2,
  p_prv_name            OUT VARCHAR2,
  p_prv_cun_code        OUT VARCHAR2,
  p_lang                IN VARCHAR2
)
RETURN VARCHAR2;

PROCEDURE GET_CUS_FUEL_INFO_PROC(
  p_cus_code                 IN customers.cus_code%TYPE,
  p_trt_current_fuel_price   OUT territories.trt_current_fuel_price%TYPE,
  p_trt_base_fuel_price      OUT territories.trt_base_fuel_price%TYPE,
  p_trt_fuel_weight_percent  OUT territories.trt_fuel_weight_percent%TYPE );

FUNCTION UPDATE_CDK_FOR_CUS_IN_RGC_FUNC(
  p_rgc_code IN  route_grouping_codes.rgc_code%TYPE,
  p_cdk_code IN  customers.cus_cdk_code%TYPE,
  p_use_code IN  users.use_code%TYPE,
  p_cus_code OUT customers.cus_code%TYPE
) RETURN NUMBER;

FUNCTION LOCK_CUS_FUNC(
  p_cus_code    IN customers.cus_code%TYPE
)RETURN BOOLEAN;

FUNCTION LOCK_CUS_FOR_CRO_FUNC(
  p_cro_rou_code  IN  customer_routes.cro_rou_code%TYPE
)RETURN BOOLEAN;

FUNCTION ASSIGN_SURCHARGE_FUNC(
  p_cro_rou_code                IN  customer_routes.cro_rou_code%TYPE,
  p_cus_surcharge_per_delivery  IN  customers.cus_surcharge_per_delivery%TYPE
)RETURN NUMBER;

FUNCTION COUNT_INH_BY_ROU_CUS_FUNC(
  p_cus_code            IN customers.cus_code%TYPE,
  p_rou_type            IN routes.rou_type%TYPE,
  p_rod_rdh_route_date  IN DATE

) RETURN NUMBER ;

PROCEDURE GET_CREDIT_INFO_PROC(
  p_cus_code                   IN  customers.cus_code%TYPE,
  p_cus_credit_limit           OUT customers.cus_credit_limit%TYPE,
  p_prv_federal_tax            OUT provinces.prv_federal_tax%TYPE ,
  p_prv_provincial_tax         OUT provinces.prv_provincial_tax%TYPE,
  p_prv_compounded_tax_switch  OUT provinces.prv_compounded_tax_switch%TYPE
);

PROCEDURE GET_PRV_INFO_BY_CUS_CODE_PROC(
  p_cus_code                    IN  customers.cus_code%TYPE,
  p_prv_compounded_tax_switch   OUT provinces.prv_compounded_tax_switch%TYPE,
  p_prv_federal_tax             OUT provinces.prv_federal_tax%TYPE,
  p_prv_provincial_tax          OUT provinces.prv_provincial_tax%TYPE
);

PROCEDURE GET_TAX_PRV_FOR_CUS_PROC(
  p_cus_code                    IN  customers.cus_code%TYPE,
  p_prv_compounded_tax_switch   OUT provinces.prv_compounded_tax_switch%TYPE,
  p_prv_federal_tax             OUT provinces.prv_federal_tax%TYPE,
  p_prv_provincial_tax          OUT provinces.prv_provincial_tax%TYPE
);

FUNCTION DO_CUS_EXISTS_FOR_CAT_FUNC(
   p_cat_code IN categories.cat_code%TYPE
 ) RETURN NUMBER;

PROCEDURE GET_PROVINCE_INFO_PROC(
  p_cus_code IN customers.cus_code%TYPE,
  p_cus_rec  OUT NOCOPY customers%ROWTYPE,
  p_prv_rec  OUT NOCOPY provinces%ROWTYPE
);

FUNCTION LOCK_CUS_ON_MODULE_FUNC(
  p_cus_code     IN  customers.cus_code%TYPE,
  p_use_code     IN  users.use_code%TYPE,
  p_module_name  IN  VARCHAR2,
  p_unique_id    OUT VARCHAR2,
  p_lck_use_code OUT locks.lck_use_code%TYPE,
  p_lck_use_name OUT VARCHAR2
)
RETURN BOOLEAN;

FUNCTION VALIDATE_CREDIT_FUNC(
  p_cus_code IN customers.cus_code%TYPE,
  p_remaining_credit_amount OUT NUMBER
)
RETURN NUMBER;

FUNCTION GET_CREDIT_MESSAGE_FUNC(
  p_cus_code IN customers.cus_code%TYPE,
  p_language IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION DO_EXISTS_STORE_FUNC(
  p_cus_store_num  IN  customers.cus_store_num%TYPE,
  p_cus_code       OUT customers.cus_code%TYPE,
  p_cus_whs_code   OUT customers.cus_whs_code%TYPE
)
RETURN BOOLEAN;

PROCEDURE GET_INFO_CONTACT_PROC(
  p_cus_code      IN customers.cus_code%TYPE,
  p_con_cty_code  IN contacts.con_cty_code%TYPE,
  p_con_name      OUT VARCHAR2,
  p_cus_use_code  OUT customers.cus_use_code%TYPE,
  p_use_name      OUT VARCHAR2
);

FUNCTION GET_INVOICED_FUNC(
  p_cus_code IN customers.cus_code%TYPE
)
RETURN NUMBER;

PROCEDURE PURGE_PROC(
  p_cus_code IN customers.cus_code%TYPE
);

PROCEDURE PURGE_PROC(
  p_nb_days_to_keep IN NUMBER,
  p_max_items       IN NUMBER
);

FUNCTION IS_HEAD_OFFICE_FUNC(
  p_cus_code IN customers.cus_code%TYPE
)
RETURN BOOLEAN;

FUNCTION GET_ANOTHER_ACTIVE_FUNC(
  p_cus_sit_code IN customers.cus_sit_code%TYPE,
  p_cus_code     IN customers.cus_code%TYPE
)
RETURN NUMBER;

END CUS_OPERATION_PACK;
/