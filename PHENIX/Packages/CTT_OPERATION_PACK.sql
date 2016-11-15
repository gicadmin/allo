CREATE OR REPLACE PACKAGE phenix.CTT_OPERATION_PACK AS

FUNCTION GET_BROKER_CTT_CODE_FUNC(
  p_ctt_broker_nac_code   IN  counter_types.ctt_broker_nac_code%TYPE,
  p_ctt_broker_type_code  IN  counter_types.ctt_broker_type_code%TYPE
) RETURN NUMBER;

PROCEDURE FIND_CTT_SWITCH_PROC(
  p_ctt_code                     IN NUMBER,
  p_ctt_telemarketing_switch     OUT NUMBER,
  p_ctt_customer_rebate_switch   OUT NUMBER,
  p_ctt_broker_initiated_switch  OUT NUMBER
);

END CTT_OPERATION_PACK;
/