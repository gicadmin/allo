CREATE OR REPLACE PACKAGE phenix.SPJ_OPERATION_PACK IS

FUNCTION GET_CONF_BY_NAME_CONTEXT_FUNC (
    p_spj_name       IN SYSTEM_PROJECTS.SPJ_NAME%TYPE,
    p_spj_context    IN SYSTEM_PROJECTS.SPJ_CONTEXT%TYPE
) RETURN SYS_REFCURSOR;

FUNCTION GET_DOMAIN_FUNC (
  p_table_name     IN VARCHAR2,
  p_column_name    IN VARCHAR2,
  p_spj_name       IN VARCHAR2
) RETURN VARCHAR2;
----------------------------------------------------------------------------------------------------
END SPJ_OPERATION_PACK;
/