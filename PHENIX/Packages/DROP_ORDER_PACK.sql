CREATE OR REPLACE PACKAGE phenix.DROP_ORDER_PACK IS

FUNCTION EDI_CUSTOMER_MASK_FUNC(
  p_cus_code  IN VARCHAR2,
  p_mask      IN VARCHAR2
)
RETURN NUMBER;

PROCEDURE GENERATE_FLAT_FILE_PROC( --CSC1737
  p_from     IN DATE,
  p_to       IN DATE,
  p_whs_code IN VARCHAR2 DEFAULT NULL---BER1465
);

FUNCTION CALCUL_DISCOUNT_CDS_FUNC ( --csc1388
  p_vds_include_in_stats_switch IN NUMBER,
  p_ven_code                    IN NUMBER,
  p_cus_code                    IN NUMBER,
  p_rcl_id                      IN NUMBER,
  p_cds_sales_amount            IN NUMBER,
  p_vds_id                      IN NUMBER,
  p_cds_reference_number        IN VARCHAR2,
  p_calcul_only                 IN NUMBER DEFAULT 0
)
RETURN NUMBER;

FUNCTION CALCUL_DISCOUNT_CDD_FUNC ( --csc1388
  p_vds_include_in_stats_switch IN NUMBER,
  p_ven_code                    IN NUMBER,
  p_cus_code                    IN NUMBER,
  p_rcl_id                      IN NUMBER,
  p_prd_code                    IN VARCHAR2,
  p_fmt_code                    IN VARCHAR2,
  p_cdd_original_cost           IN NUMBER,
  p_vds_id                      IN NUMBER,    --parametre utilisé seulement si P_CALCUL_ONLY est 0 (zéro)
  p_cds_reference_number        IN VARCHAR2,  --parametre utilisé seulement si P_CALCUL_ONLY est 0 (zéro)
  p_cdd_line_number             IN NUMBER,    --parametre utilisé seulement si P_CALCUL_ONLY est 0 (zéro)
  p_calcul_only                 IN NUMBER DEFAULT 0
)
RETURN NUMBER;

PROCEDURE GENERATE_EDI_STATEMENT_PROC(
 p_jsc_id IN NUMBER
);

END DROP_ORDER_PACK;
/