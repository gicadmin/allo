CREATE OR REPLACE PACKAGE phenix.MES_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  module_execution_status%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_mes_id                         IN         module_execution_status.mes_id%TYPE,
  p_mes_rec                        OUT NOCOPY module_execution_status%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_mes_id                         IN         module_execution_status.mes_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_mes_id                         IN         module_execution_status.mes_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_mes_id                         IN         module_execution_status.mes_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_mes_id                         IN         module_execution_status.mes_id%TYPE);

FUNCTION GET_FULL_FUNC(
  p_mes_mon_code                   IN         module_execution_status.mes_mon_code%TYPE,
  p_mes_whs_code                   IN         module_execution_status.mes_whs_code%TYPE,
  p_mes_rec                        OUT NOCOPY module_execution_status%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_mes_mon_code                   IN         module_execution_status.mes_mon_code%TYPE,
  p_mes_whs_code                   IN         module_execution_status.mes_whs_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_mes_mon_code                   IN         module_execution_status.mes_mon_code%TYPE,
  p_mes_whs_code                   IN         module_execution_status.mes_whs_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_mes_mon_code                   IN         module_execution_status.mes_mon_code%TYPE,
  p_mes_whs_code                   IN         module_execution_status.mes_whs_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_mes_mon_code                   IN         module_execution_status.mes_mon_code%TYPE,
  p_mes_whs_code                   IN         module_execution_status.mes_whs_code%TYPE);


FUNCTION INSERT_FUNC(
  p_mes_mon_code         IN         module_execution_status.mes_mon_code%TYPE,
  p_mes_whs_code         IN         module_execution_status.mes_whs_code%TYPE              DEFAULT NULL,
  p_mes_sid_id           IN         module_execution_status.mes_sid_id%TYPE                DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY module_execution_status%ROWTYPE)
RETURN NUMBER;

END MES_PACK;
/