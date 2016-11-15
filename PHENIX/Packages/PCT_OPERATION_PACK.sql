CREATE OR REPLACE PACKAGE phenix.PCT_OPERATION_PACK IS

FUNCTION FIND_PCT_INFO_FUNC(
  p_pct_ctt_code  IN product_counters.pct_ctt_code%TYPE,
  p_pct_prd_code  IN product_counters.pct_prd_code%TYPE,
  p_pct_fmt_code  IN product_counters.pct_fmt_code%TYPE,
  p_cpc_cus_code  IN customer_product_counters.cpc_cus_code%TYPE,
  p_pct_date      IN DATE
) RETURN product_counters%ROWTYPE;

FUNCTION FIND_PCT_TELEMARK_AMOUNT_FUNC(
  p_pct_prd_code             IN product_counters.pct_prd_code%TYPE,
  p_pct_fmt_code             IN product_counters.pct_fmt_code%TYPE,
  p_cpc_cus_code             IN customer_product_counters.cpc_cus_code%TYPE
) RETURN NUMBER;

FUNCTION FIND_OTHER_PCT_FOR_PRD_FUNC(
  p_pct_prd_code        IN product_counters.pct_prd_code%TYPE,
  p_pct_pgr_code        IN product_counters.pct_pgr_code%TYPE,
  p_pct_fmt_code        IN product_counters.pct_fmt_code%TYPE,
  p_pct_ctt_code        IN product_counters.pct_ctt_code%TYPE,
  p_ctt_telemark_switch IN counter_types.ctt_telemarketing_switch%TYPE
) RETURN NUMBER;

PROCEDURE FIND_TOTAL_CUS_REBATE_PROC(
  p_pct_prd_code  IN product_counters.pct_prd_code%TYPE,
  p_pct_fmt_code  IN product_counters.pct_fmt_code%TYPE,
  p_cpc_cus_code  IN customer_product_counters.cpc_cus_code%TYPE,
  p_pct_date      IN DATE,
  p_total_dollars OUT NUMBER,
  p_total_points  OUT NUMBER
);

PROCEDURE SYNC_COUNTERS_PROC(
  p_nac_code           IN counter_types.ctt_broker_nac_code%TYPE,
  p_type_code          IN counter_types.ctt_broker_type_code%TYPE,
  p_broker_prd_code    IN products.prd_code%TYPE,
  p_fmt_code           IN formats.fmt_code%TYPE,
  p_pct_start_date     IN product_counters.pct_start_date%TYPE,
  p_pct_end_date       IN product_counters.pct_end_date%TYPE,
  p_pct_rebate_percent IN NUMBER,
  p_pct_rebate_amount  IN product_counters.pct_rebate_amount%TYPE,
  p_loh_id             IN log_headers.loh_id%TYPE DEFAULT NULL
);

FUNCTION DOES_PCT_EXISTS_FUNC(
  p_pct_ctt_code IN product_counters.pct_ctt_code%TYPE,
  p_pct_prd_code IN product_counters.pct_prd_code%TYPE,
  p_pct_fmt_code IN product_counters.pct_fmt_code%TYPE,
  p_pct_pgr_code IN product_counters.pct_pgr_code%TYPE DEFAULT NULL
) RETURN BOOLEAN;

PROCEDURE DELETE_ALL_PCT_FOR_BROKER_PROC(
  p_ctt_broker_nac_code  IN counter_types.ctt_broker_nac_code%TYPE,
  p_ctt_broker_type_code IN counter_types.ctt_broker_type_code%TYPE,
  p_ctt_code             OUT counter_types.ctt_code%TYPE,
  p_nbr_pct_deleted      OUT NUMBER
);

FUNCTION DO_PCT_EXISTS_FOR_CTT_FUNC(
  p_ctt_code IN counter_types.ctt_code%TYPE
) RETURN NUMBER;

FUNCTION DOES_PCT_EXISTS_FUNC(
  p_pct_ctt_code    IN product_counters.pct_ctt_code%TYPE,
  p_pct_fmt_code    IN product_counters.pct_fmt_code%TYPE,
  p_pct_prd_code    IN product_counters.pct_prd_code%TYPE,
  p_pct_pgr_code    IN product_counters.pct_pgr_code%TYPE,
  p_pct_id          IN product_counters.pct_id%TYPE,
  p_pct_start_date  IN product_counters.pct_start_date%TYPE,
  p_pct_end_date    IN product_counters.pct_end_date%TYPE,
  p_status          IN VARCHAR2 DEFAULT 'INSERT'
)RETURN BOOLEAN;

PROCEDURE SET_PCT_INFO_PROC(
  p_pct_ctt_code       IN product_counters.pct_ctt_code%TYPE,
  p_pct_prd_code       IN product_counters.pct_prd_code%TYPE,
  p_pct_start_date     IN product_counters.pct_start_date%TYPE,
  p_pct_end_date       IN product_counters.pct_end_date%TYPE,
  p_pct_dollar_switch  IN product_counters.pct_dollar_switch%TYPE,
  p_pct_rebate_amount  IN product_counters.pct_rebate_amount%TYPE
);
PROCEDURE COPY_PROC(
  p_from_type               IN product_counters.pct_ctt_code%TYPE,
  p_to_type                 IN product_counters.pct_ctt_code%TYPE,
  p_to_telemarketing_value  IN VARCHAR2
);

PROCEDURE SET_DATE_BY_TYPE_PROC(
  p_pct_ctt_code        IN product_counters.pct_ctt_code%TYPE,
  p_pct_new_start_date  IN product_counters.pct_start_date%TYPE,
  p_pct_new_end_date    IN product_counters.pct_end_date%TYPE,
  p_pct_old_start_date  IN product_counters.pct_start_date%TYPE,
  p_pct_old_end_date    IN product_counters.pct_end_date%TYPE
);

PROCEDURE CREATE_IF_REQUIRED_PROC(
  p_pct_prf_prd_code        IN product_counters.pct_prd_code%TYPE,
  p_pct_ctt_code            IN product_counters.pct_ctt_code%TYPE,
  p_prf_fmt_code            IN product_formats.prf_fmt_code%TYPE,
  p_pct_dollar_switch       IN product_counters.pct_dollar_switch%TYPE,
  p_pct_start_date          IN product_counters.pct_start_date%TYPE,
  p_pct_end_date            IN product_counters.pct_end_date%TYPE,
  p_pct_rebate_amount       IN product_counters.pct_rebate_amount%TYPE,
  p_prf_operation_flag      IN product_formats.prf_operation_flag%TYPE,
  p_prf_conversion_to_base  IN product_formats.prf_conversion_to_base%TYPE
);

PROCEDURE PURGE_PROC(
  p_pct_prd_code IN product_counters.pct_prd_code%TYPE
);

PROCEDURE FIND_PCT_TELEMARK_AMOUNT_PROC(
  p_pct_prd_code          IN product_counters.pct_prd_code%TYPE,
  p_pct_fmt_code          IN product_counters.pct_fmt_code%TYPE,
  p_cpc_cus_code          IN customer_product_counters.cpc_cus_code%TYPE,
  p_vendor_amount         OUT NUMBER,
  p_admin_amount          OUT NUMBER,
  p_telemarketer_amount   OUT NUMBER,
  p_salesman_amount       OUT NUMBER,
  p_pct_id                OUT NUMBER,
  p_ctt_billing_method    OUT VARCHAR2
);

PROCEDURE FIND_FOR_DISPLAY_AMOUNT_PROC(
  p_pct_id              IN product_counters.pct_id%TYPE,
  p_pct_rebate_amount   IN product_counters.pct_rebate_amount%TYPE,
  p_vendor_amount       OUT NUMBER,
  p_admin_amount        OUT NUMBER,
  p_telemarketer_amount OUT NUMBER,
  p_salesman_amount     OUT NUMBER
);

FUNCTION FIND_PCT_INFO_FUNC(
  p_pct_ctt_code  IN product_counters.pct_ctt_code%TYPE,
  p_pct_prd_code  IN product_counters.pct_prd_code%TYPE,
  p_pct_fmt_code  IN product_counters.pct_fmt_code%TYPE,
  p_pct_date      IN DATE
) RETURN product_counters%ROWTYPE;

FUNCTION FIND_PCT_TELEMARK_AMOUNT_FUNC(
  p_pct_prd_code             IN product_counters.pct_prd_code%TYPE,
  p_pct_fmt_code             IN product_counters.pct_fmt_code%TYPE
) RETURN NUMBER;

FUNCTION DOES_PCT_EXISTS_FUNC(
  p_prd_code  IN products.prd_code%TYPE
) RETURN BOOLEAN;

END PCT_OPERATION_PACK;
/