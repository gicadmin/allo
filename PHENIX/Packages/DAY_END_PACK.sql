CREATE OR REPLACE PACKAGE phenix.DAY_END_PACK IS

PROCEDURE CUSTOMER_PROMO_PURGE_PROC(
 p_jsc_id IN NUMBER
);

PROCEDURE CUSTOMER_PROFILE_PURGE_PROC(
 p_jsc_id IN NUMBER
);

PROCEDURE PRICE_CHANGE_ACTIVATION_PROC(
 p_jsc_id IN NUMBER
);

FUNCTION UPDATE_SOLID_BACON_DINDE_FUNC(   --ber183
 p_log_id             IN NUMBER,
 p_prd_code            IN VARCHAR2,
 p_prd_fmt_solid_inventory_code  IN VARCHAR2,
 p_weighted_inv_new_price     IN NUMBER
)
RETURN BOOLEAN;

PROCEDURE PRODUCT_ACTIVATION_PROC(
 p_jsc_id IN NUMBER
);

PROCEDURE PRICE_CHANGE_PURGE_PROC(
 p_jsc_id IN NUMBER
);

PROCEDURE PRODUCT_SET_DELETE_PROC(
 p_jsc_id IN NUMBER
);

PROCEDURE PURGE_LOG_PROC(
 p_jsc_id IN NUMBER
);

PROCEDURE QUOTATION_EXTENSION_PROC(
 p_jsc_id IN NUMBER
);

FUNCTION QUOTATION_PURGE_FUNC(  --créer avec BER244
 p_log_id     IN NUMBER,
 p_nb_deleted   IN OUT NUMBER,
 p_error_message OUT VARCHAR2
)
RETURN BOOLEAN;

PROCEDURE RESET_CSD_PROCESSED_PROC(
 p_jsc_id IN NUMBER
);

PROCEDURE ROUTE_DATE_PURGE_PROC(
 p_jsc_id IN NUMBER
);

PROCEDURE VENDOR_PROMO_PURGE_PROC(
 p_jsc_id IN NUMBER
);

PROCEDURE ACTIVATE_PRODUCT_PROC(
 p_jsc_id IN NUMBER
);

PROCEDURE UPDATE_WEEKLY_INVENTORY_PROC(
 p_jsc_id IN NUMBER
);

--CSC1935 nouvelle procédure pour pouvoir fermer automatiquement les lignes reçues à zéro jamais facturée
PROCEDURE CLOSE_PURCH_LINE_PROC(
 p_jsc_id IN NUMBER
);
PROCEDURE PRODUCT_LOG_MODIFS_PURGE_PROC( --CSC5067
 p_jsc_id IN NUMBER
);
PROCEDURE CUSTOMER_LOG_MODIFS_PURGE_PROC( --USG859
 p_jsc_id IN NUMBER
);
PROCEDURE VENDOR_LOG_MODIFS_PURGE_PROC( --USG859
 p_jsc_id IN NUMBER
);

PROCEDURE RESET_LIQUIDATION_DATE_PROC(
  p_jsc_id IN job_schedules.jsc_id%TYPE
);

PROCEDURE CLOSE_PALLET_BALANCES_PROC(
 p_jsc_id IN  job_schedules.jsc_id%TYPE
);

PROCEDURE CPF_DAILY_UPDATE_PROC(
  p_jsc_id IN job_schedules.jsc_id%TYPE
);

PROCEDURE PURGE_PGP_PROC(
 p_jsc_id IN NUMBER
);

PROCEDURE PURCHASE_GROUP_EXTRACT_PROC(
 p_jsc_id   IN NUMBER
);

PROCEDURE PURCHASE_GROUP_IMPORT_PROC(
 p_jsc_id   IN NUMBER
);
PROCEDURE INVOICE_RECEIPT_CHARGES_PROC(
 p_jsc_id   IN NUMBER
);

PROCEDURE USER_LOG_MODIFS_PURGE_PROC( --csc8092
 p_jsc_id   IN NUMBER
);

PROCEDURE INVOICE_INCENTIVES_PROC(
 p_jsc_id IN NUMBER
);

END DAY_END_PACK;
/