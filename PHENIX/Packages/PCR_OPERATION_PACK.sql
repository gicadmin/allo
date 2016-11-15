CREATE OR REPLACE PACKAGE phenix.PCR_OPERATION_PACK IS

PROCEDURE CREATE_PCR_PROC(
  p_pct_prd_code        IN product_counters.pct_prd_code%TYPE,
  p_pct_fmt_code        IN product_counters.pct_fmt_code%TYPE,
  p_pcr_cod_coh_id      IN customer_order_details.cod_coh_id%TYPE,
  p_pcr_cod_line_number IN customer_order_details.cod_line_number%TYPE,
  p_pcr_cad_id          IN customer_adjustment_details.cad_id%TYPE
);
FUNCTION DO_PCR_EXISTS_FOR_CTT_FUNC(
    p_ctt_code IN counter_types.ctt_code%TYPE
) RETURN NUMBER;
PROCEDURE DELETE_ALL_PCR_FOR_COH_PROC(
  p_cod_coh_id            IN NUMBER
);
PROCEDURE DELETE_PCR_FOR_COD_PROC(
  p_cod_coh_id            IN NUMBER,
  p_cod_line_number       IN NUMBER
);
PROCEDURE PURGE_PROC(
  p_cod_coh_id       IN customer_order_details.cod_coh_id%TYPE,
  p_cod_line_number  IN customer_order_details.cod_line_number%TYPE
);
END PCR_OPERATION_PACK;
/