CREATE OR REPLACE PACKAGE phenix.MES_OPERATION_PACK AS

FUNCTION IS_EXECUTING_FUNC(
  p_mes_mon_code IN module_execution_status.mes_mon_code%TYPE
)
RETURN BOOLEAN;

END MES_OPERATION_PACK;
/