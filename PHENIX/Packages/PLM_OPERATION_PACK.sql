CREATE OR REPLACE PACKAGE phenix.PLM_OPERATION_PACK AS

FUNCTION GET_COST_FOR_DATE_FUNC(
  p_prd_code    IN products.prd_code%TYPE,
  p_name_champ  IN VARCHAR2,
  p_date        IN DATE
)
RETURN NUMBER;

END PLM_OPERATION_PACK;
/