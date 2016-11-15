CREATE OR REPLACE PACKAGE phenix.ACCOUNT_STATEMENT_PACK IS

FUNCTION GET_CUSTOMER_AGEING_FUNC (
  p_cus_code                  IN  NUMBER,
  p_term                      IN  VARCHAR2,
  p_include_unposted_switch   IN  NUMBER,--on inclut ou pas les montants non postés avec le montant dû courant
  p_ash_accpac_id             IN  NUMBER,
  p_amount_current            OUT NUMBER,
  p_amount_1_to_7             OUT NUMBER,
  p_amount_8_to_14            OUT NUMBER,
  p_amount_15_to_21           OUT NUMBER,
  p_amount_22_to_28           OUT NUMBER,
  p_amount_29_plus            OUT NUMBER,
  p_postdated_checks_amount   OUT NUMBER,
  p_credit_amount             OUT NUMBER,
  p_term_description          OUT VARCHAR2
)
RETURN NUMBER;

PROCEDURE GEN_ACCOUNT_STATEMENT_PROC(
  p_jsc_id IN NUMBER
);

PROCEDURE PRINT_ACCOUNT_STATEMENT_PROC(
  p_ash_id              IN account_statement_headers.ash_id%TYPE,
  p_ash_accpac_id       IN account_statement_headers.ash_accpac_id%TYPE,
  p_ash_generation_date IN account_statement_headers.ash_generation_date%TYPE,
  p_cus_code            IN customers.cus_code%TYPE,
  p_cus_language        IN customers.cus_language_flag%TYPE
);

PROCEDURE GEN_ACCOUNT_STATEMENT_PROC(
  p_cus_code IN customers.cus_code%TYPE,
  p_whs_code IN warehouses.whs_code%TYPE
);

FUNCTION GET_INVOICE_DUE_DATE_FUNC(
  p_invoice_date IN DATE,
  p_due_day      IN NUMBER,
  p_due_days     IN NUMBER
)
RETURN DATE;

FUNCTION ADD_GEN_ACCOUNT_STATEMENT_FUNC(
  p_cus_code IN customers.cus_code%TYPE,
  p_use_code IN users.use_code%TYPE
)
RETURN NUMBER;

END ACCOUNT_STATEMENT_PACK;
/