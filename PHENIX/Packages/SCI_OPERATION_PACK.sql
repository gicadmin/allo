CREATE OR REPLACE PACKAGE phenix.SCI_OPERATION_PACK IS

--ber4898 fonction qui fait la somme des coutants/ventes pour une semaine spécifique pour un client
PROCEDURE COST_AND_SALES_FOR_A_WEEK_PROC(
  p_cus_code        IN stat_customer_invoices.sci_cus_code%TYPE,
  p_fcw_fca_year    IN stat_customer_invoices.sci_fcw_fca_year%TYPE,
  p_fcw_fca_period  IN stat_customer_invoices.sci_fcw_fca_period%TYPE,
  p_fcw_week        IN stat_customer_invoices.sci_fcw_week%TYPE,
  p_sum_costs       OUT NUMBER,
  p_sum_sales       OUT NUMBER
);

FUNCTION CALCULATE_PROJECT_SALES_FUNC(
  p_cus_code        IN stat_customer_invoices.sci_cus_code%TYPE,
  p_fcw_fca_year    IN stat_customer_invoices.sci_fcw_fca_year%TYPE,
  p_fcw_fca_period  IN stat_customer_invoices.sci_fcw_fca_period%TYPE,
  p_fcw_week        IN stat_customer_invoices.sci_fcw_week%TYPE
)
RETURN NUMBER;

PROCEDURE PURGE_PROC(
  p_nb_days_to_keep IN NUMBER,
  p_max_items       IN NUMBER
);

PROCEDURE TREAT_COD_PROC(
  p_inh_id    IN invoice_headers.inh_id%TYPE,
  p_prd_code  IN stat_customer_invoices.sci_prd_code%TYPE DEFAULT NULL
);

PROCEDURE TREAT_CAD_PROC(
  p_inh_id    IN invoice_headers.inh_id%TYPE,
  p_prd_code  IN stat_customer_invoices.sci_prd_code%TYPE DEFAULT NULL
);

PROCEDURE RECALC_WEEK_PROC(
  p_fcw_fca_year               IN stat_customer_invoices.sci_fcw_fca_year%TYPE,
  p_fcw_fca_period             IN stat_customer_invoices.sci_fcw_fca_period%TYPE,
  p_fcw_week                   IN stat_customer_invoices.sci_fcw_week%TYPE,
  p_cus_code                   IN stat_customer_invoices.sci_cus_code%TYPE,
  p_prd_code                   IN stat_customer_invoices.sci_prd_code%TYPE,
  p_inh_cash_and_carry_switch  IN stat_customer_invoices.sci_inh_cash_and_carry_switch%TYPE
);

PROCEDURE RELOAD_ALL_SCI_INH_PROC(
  p_treated_inh_only_switch IN NUMBER DEFAULT 1,  --indique si on veut seulement les factures qui ont déjà passé dans la QUEUE (dont la inh_stats_calculated_Date IS NOT NULL)
  p_log_id                  IN NUMBER DEFAULT NULL
);

END SCI_OPERATION_PACK;
/