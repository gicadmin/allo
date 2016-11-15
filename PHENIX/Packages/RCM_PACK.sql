CREATE OR REPLACE PACKAGE phenix.RCM_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  retail_client_managers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_rcm_code                       IN         retail_client_managers.rcm_code%TYPE,
  p_rcm_rec                        OUT NOCOPY retail_client_managers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_rcm_code                       IN         retail_client_managers.rcm_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_rcm_code                       IN         retail_client_managers.rcm_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_rcm_code                       IN         retail_client_managers.rcm_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_rcm_code                       IN         retail_client_managers.rcm_code%TYPE);


PROCEDURE INSERT_PROC(
  p_rcm_code             IN         retail_client_managers.rcm_code%TYPE,
  p_rcm_name             IN         retail_client_managers.rcm_name%TYPE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY retail_client_managers%ROWTYPE);

END RCM_PACK;
/