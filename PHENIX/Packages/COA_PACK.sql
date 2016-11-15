CREATE OR REPLACE PACKAGE phenix.COA_PACK IS

PROCEDURE INSERT_COA_PROC(
  p_coa_cod_coh_id                      customer_order_actions.coa_cod_coh_id%type,
  p_coa_cod_line_number                 customer_order_actions.coa_cod_line_number%type,
  p_coa_action                          customer_order_actions.coa_action%type,
  p_coa_status                          customer_order_actions.coa_status%type,
  p_coa_last_changed                    customer_order_actions.coa_last_changed%type
);

PROCEDURE CHECK_REQUIRED_ACTION_PROC(
	p_cod_coh_id                    IN customer_order_details.cod_coh_id%TYPE,
	p_cod_line_number               IN customer_order_details.cod_line_number%TYPE,
	p_cod_prf_prd_code              IN customer_order_details.cod_prf_prd_code%TYPE,
	p_cod_prf_fmt_code              IN customer_order_details.cod_prf_fmt_code%TYPE,
	p_cod_order_type                IN customer_order_details.cod_order_type%TYPE);

PROCEDURE DELETE_ACTIONS_PROC(
    p_cod_coh_id                    IN customer_order_details.cod_coh_id%TYPE,
    p_cod_line_number               IN customer_order_details.cod_line_number%TYPE);

PROCEDURE RESERVE_ACTIONS_PROC(
    p_coa_id                        IN customer_order_actions.coa_id%type,
    p_coa_reserved_code             IN OUT customer_order_actions.coa_reserved_code%TYPE);

PROCEDURE CLOSE_ACTIONS_PROC(
    p_coa_action                    IN customer_order_actions.coa_action%type,
    p_coa_reserved_code             IN customer_order_actions.coa_reserved_code%TYPE);

END COA_PACK;
/