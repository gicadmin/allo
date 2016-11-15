CREATE OR REPLACE PACKAGE phenix.VCG_OPERATION_PACK IS

FUNCTION COUNT_FUNC(
  p_vcg_ven_code IN vendor_product_categories.vcg_ven_code%TYPE
)
RETURN NUMBER;

FUNCTION GET_FIRST_FUNC(
  p_ven_code IN vendor_product_categories.vcg_ven_code%TYPE
)
RETURN NUMBER;

PROCEDURE PURGE_PROC(
  p_vcg_ven_code IN vendor_product_categories.vcg_ven_code%TYPE
);

--csc8489
FUNCTION CALC_DISTRIB_AVR_AMOUNT_FUNC(
  p_collected_amount  IN NUMBER,
  p_admin_percent     IN NUMBER
)
RETURN NUMBER;

--csc8489
FUNCTION CALC_DISTRIB_AVR_PERCENT_FUNC(
  p_collected_percent   IN NUMBER,
  p_admin_percent       IN NUMBER
)
RETURN NUMBER;

--csc8489 création d'une fonction pour locker un produit entrepot
FUNCTION LOCK_VCG_FUNC(
  p_vcg_id IN vendor_product_categories.vcg_id%TYPE
)
RETURN BOOLEAN;

--csc8489
FUNCTION INIT_COLLECT_DISTRIB_FUNC(
  p_ven_code IN NUMBER
)
RETURN BOOLEAN;

--CSC8489 calculer le montant DISTRIBUTED unitaire (tel qu'il serait si on l'inscrivait directement dans la table COD)
FUNCTION FIND_DISTRIBUTED_AMOUNT_FUNC(
  p_vcg_collect_distrib_qualif  IN VARCHAR2,
  p_vcg_distributed_avr_percent IN NUMBER,
  p_vcg_distributed_avr_amount  IN NUMBER,
  p_prd_code                    IN VARCHAR2,
  p_fmt_code                    IN VARCHAR2,  --format solide sil y en a un...
  p_manuf_fmt_code              IN VARCHAR2,
  p_prd_definition              IN VARCHAR2,
  p_cod_selling_retail          IN NUMBER
)
RETURN NUMBER;

--CSC8489 calculer le montant TRIMESTRIELLE pour entrepot unitaire (tel qu'il serait si on l'inscrivait directement dans la table COD)
FUNCTION FIND_QUARTERLY_WHOUSE_FUNC(
  p_vcg_qualifier               IN VARCHAR2,
  p_vcg_quart_warehouse_avr     IN NUMBER,
  p_vcg_quart_whouse_avr_amount IN NUMBER,
  p_vcg_id                      IN NUMBER,
  p_cus_code                    IN NUMBER,
  p_prd_code                    IN VARCHAR2,
  p_fmt_code                    IN VARCHAR2,  --format solide sil y en a un...
  p_manuf_fmt_code              IN VARCHAR2,
  p_prd_definition              IN VARCHAR2,
  p_cod_selling_retail          IN NUMBER
)
RETURN NUMBER;

END VCG_OPERATION_PACK;
/