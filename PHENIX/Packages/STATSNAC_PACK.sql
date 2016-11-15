CREATE OR REPLACE PACKAGE phenix.STATSNAC_PACK AS

PROCEDURE SYNC_TOTALS_PROC(
  p_nac_code            IN counter_types.ctt_broker_nac_code%TYPE,
  p_type_code           IN counter_types.ctt_broker_type_code%TYPE,
  p_cus_code            IN customer_product_counters.cpc_cus_code%TYPE,
  p_total_dollars       IN NUMBER,
  p_reconciliation_date IN DATE,
  p_loh_id              IN log_headers.loh_id%TYPE DEFAULT NULL
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

FUNCTION START_AUTONOMOUS_LOG_FUNC(
  p_module_name   IN VARCHAR2,
  p_module_type   IN VARCHAR2,
  p_file_name_in  IN VARCHAR2,
  p_file_name_out IN VARCHAR2,
  p_message       IN VARCHAR2
) RETURN NUMBER;

PROCEDURE DETAIL_AUTONOMOUS_LOG_PROC(
  p_loh_id      IN NUMBER,
  p_line_number IN NUMBER,
  p_message     IN VARCHAR2,
  p_error       IN VARCHAR2
);

PROCEDURE END_AUTONOMOUS_LOG_PROC(
  p_loh_id  IN NUMBER,
  p_message IN VARCHAR2
);

PROCEDURE DELETE_ALL_PCT_FOR_BROKER_PROC(
  p_ctt_broker_nac_code  IN counter_types.ctt_broker_nac_code%TYPE,
  p_ctt_broker_type_code IN counter_types.ctt_broker_type_code%TYPE,
  p_ctt_code             OUT counter_types.ctt_code%TYPE,
  p_nbr_pct_deleted      OUT NUMBER
);

END STATSNAC_PACK;
/