CREATE OR REPLACE PACKAGE phenix.TPR_OPERATION_PACK IS

-------------------------------------------------
FUNCTION DOES_TPR_EXISTS_FOR_CGR_FUNC(
  p_cgr_code  IN  customer_groups.cgr_code%TYPE
)
RETURN NUMBER;
---------------------------------
FUNCTION REFILL_TPR_BASED_ON_TPA_FUNC(
	p_sid_id								IN NUMBER,
	p_language							IN VARCHAR2,
	p_error_message 				OUT VARCHAR2
)
RETURN BOOLEAN;
------------------------------------------------------
END TPR_OPERATION_PACK;
/