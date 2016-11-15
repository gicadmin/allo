CREATE OR REPLACE PACKAGE phenix.PHXPRINT_PACK IS

FUNCTION CHECK_SPJ_NAME_CONTEXT_FUNC
RETURN NUMBER;

FUNCTION GET_CONF_BY_NAME_CONTEXT_FUNC
RETURN SYS_REFCURSOR;

PROCEDURE UPDATE_PRINT_SWITCH_PROC(
  p_rme_id   IN report_merge.rme_id%TYPE,
  p_status   IN NUMBER
);

PROCEDURE GET_HOST_AND_PORT_CONF_PROC(
  p_host   OUT system_parameters.spa_value%TYPE,
  p_port   OUT system_parameters.spa_value%TYPE
);

FUNCTION DECRYPT_FUNC(
  p_password IN VARCHAR2
)
RETURN VARCHAR2;

-------------------------------------------------------------------
END PHXPRINT_PACK;
/