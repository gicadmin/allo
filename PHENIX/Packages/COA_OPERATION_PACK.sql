CREATE OR REPLACE PACKAGE phenix.COA_OPERATION_PACK IS

FUNCTION IS_ACTION_EXISTS_FOR_COH_FUNC(
  p_coa_cod_coh_id      IN customer_order_actions.coa_cod_coh_id%TYPE,
  p_coa_action          IN customer_order_actions.coa_action%TYPE,
  p_coa_status          IN customer_order_actions.coa_status%TYPE
)RETURN BOOLEAN;


END COA_OPERATION_PACK;
/