CREATE OR REPLACE PACKAGE phenix.MODULE_RESTRICTION_PACK IS

PROCEDURE SET_MODULE_EXECUTING_PROC(
  p_mes_mon_code IN module_execution_status.mes_mon_code%TYPE,
  p_mes_whs_code IN module_execution_status.mes_whs_code%TYPE,
  p_mes_sid_id   IN module_execution_status.mes_sid_id%TYPE
);

PROCEDURE SET_MODULE_EXECUTING_PROC(
  p_mes_mon_code IN module_execution_status.mes_mon_code%TYPE,
  p_mes_whs_code IN module_execution_status.mes_whs_code%TYPE
);

PROCEDURE SET_MODULE_EXECUTING_PROC(
  p_mes_mon_code IN module_execution_status.mes_mon_code%TYPE
);

PROCEDURE SET_MODULE_IDLE_PROC(
  p_mes_mon_code IN module_execution_status.mes_mon_code%TYPE,
  p_mes_whs_code IN module_execution_status.mes_whs_code%TYPE
);

PROCEDURE SET_MODULE_IDLE_PROC(
  p_mes_mon_code IN module_execution_status.mes_mon_code%TYPE
);

FUNCTION CHECK_MODULE_FUNC(
  p_mes_mon_code IN module_execution_status.mes_mon_code%TYPE,
  p_mes_whs_code IN module_execution_status.mes_whs_code%TYPE
)
RETURN BOOLEAN;

FUNCTION CHECK_MODULE_FUNC(
  p_mes_mon_code IN module_execution_status.mes_mon_code%TYPE
)
RETURN BOOLEAN;

FUNCTION ACCPAC_CHECK_MODULE_FUNC (
  P_MODULE_NAME  IN VARCHAR2
  ) RETURN NUMBER;

END MODULE_RESTRICTION_PACK;
/