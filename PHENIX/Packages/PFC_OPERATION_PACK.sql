CREATE OR REPLACE PACKAGE phenix.PFC_OPERATION_PACK AS

FUNCTION EXIST_PFC_FUNC(
  p_prd_code IN products.prd_code%TYPE
)
RETURN BOOLEAN;

FUNCTION COUNT_FUNC(
  p_pfc_prd_code IN product_food_certifications.pfc_prd_code%TYPE
)
RETURN NUMBER;

END PFC_OPERATION_PACK;
/