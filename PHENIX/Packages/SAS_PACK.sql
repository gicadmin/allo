CREATE OR REPLACE PACKAGE phenix.SAS_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  system_active_sessions%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_sas_session_id                 IN         system_active_sessions.sas_session_id%TYPE,
  p_sas_rec                        OUT NOCOPY system_active_sessions%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_sas_session_id                 IN         system_active_sessions.sas_session_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_sas_session_id                 IN         system_active_sessions.sas_session_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_sas_session_id                 IN         system_active_sessions.sas_session_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_sas_session_id                 IN         system_active_sessions.sas_session_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_sas_session_id                 IN         system_active_sessions.sas_session_id%TYPE);


PROCEDURE INSERT_PROC(
  p_sas_session_id       IN         system_active_sessions.sas_session_id%TYPE,
  p_sas_sen_code         IN         system_active_sessions.sas_sen_code%TYPE,
  p_sas_use_code         IN         system_active_sessions.sas_use_code%TYPE,
  p_sas_date             IN         system_active_sessions.sas_date%TYPE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY system_active_sessions%ROWTYPE);

END SAS_PACK;
/