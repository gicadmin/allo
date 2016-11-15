CREATE OR REPLACE PACKAGE phenix.CPC_OPERATION_PACK AS

PROCEDURE SYNC_TOTALS_PROC(
  p_nac_code            IN counter_types.ctt_broker_nac_code%TYPE,
  p_type_code           IN counter_types.ctt_broker_type_code%TYPE,
  p_cus_code            IN customer_product_counters.cpc_cus_code%TYPE,
  p_total_dollars       IN NUMBER,
  p_reconciliation_date IN DATE,
  p_loh_id              IN log_headers.loh_id%TYPE DEFAULT NULL
);

FUNCTION GET_FULL_BY_CTT_FUNC(
  p_cpc_ctt_code IN customer_product_counters.cpc_ctt_code%TYPE,
  p_cpc_rec      OUT NOCOPY customer_product_counters%ROWTYPE
) RETURN BOOLEAN;

FUNCTION DOES_BROKER_CPC_EXISTS_FUNC(
  p_cpc_cus_code IN customer_product_counters.cpc_cus_code%TYPE
) RETURN BOOLEAN;

FUNCTION DO_CPC_EXISTS_FOR_CTT_FUNC(
  p_ctt_code IN counter_types.ctt_code%TYPE
) RETURN NUMBER;

--ber4898 création de la procédure pour trouver les sommes
PROCEDURE GET_TOTAL_AMOUNT_PROC(
  p_cpc_cus_code IN customer_product_counters.cpc_cus_code%TYPE,
  p_dollar_amount OUT NUMBER,
  p_point_amount  OUT NUMBER
);

PROCEDURE PURGE_PROC(
  p_cpc_cus_code IN customer_product_counters.cpc_cus_code%TYPE
);

END CPC_OPERATION_PACK;
/