CREATE OR REPLACE PACKAGE phenix.SPJ_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  system_projects%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_spj_name                       IN         system_projects.spj_name%TYPE,
  p_spj_context                    IN         system_projects.spj_context%TYPE,
  p_spj_rec                        OUT NOCOPY system_projects%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_spj_name                       IN         system_projects.spj_name%TYPE,
  p_spj_context                    IN         system_projects.spj_context%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_spj_name                       IN         system_projects.spj_name%TYPE,
  p_spj_context                    IN         system_projects.spj_context%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_spj_name                       IN         system_projects.spj_name%TYPE,
  p_spj_context                    IN         system_projects.spj_context%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_spj_name                       IN         system_projects.spj_name%TYPE,
  p_spj_context                    IN         system_projects.spj_context%TYPE)
RETURN NUMBER;

FUNCTION GET_FULL_FUNC(
  p_spj_id                         IN         system_projects.spj_id%TYPE,
  p_spj_rec                        OUT NOCOPY system_projects%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_spj_id                         IN         system_projects.spj_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_spj_id                         IN         system_projects.spj_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_spj_id                         IN         system_projects.spj_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_spj_id                         IN         system_projects.spj_id%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_spj_name             IN         system_projects.spj_name%TYPE,
  p_spj_context          IN         system_projects.spj_context%TYPE,
  p_spj_creation_date    IN         system_projects.spj_creation_date%TYPE         DEFAULT NULL,
  p_spj_mod_date         IN         system_projects.spj_mod_date%TYPE              DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY system_projects%ROWTYPE)
RETURN NUMBER;

END SPJ_PACK;
/