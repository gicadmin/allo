CREATE OR REPLACE PACKAGE phenix.EST_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  establishments%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_est_code                       IN         establishments.est_code%TYPE,
  p_est_rec                        OUT NOCOPY establishments%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_est_code                       IN         establishments.est_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_est_code                       IN         establishments.est_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_est_code                       IN         establishments.est_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_est_code                       IN         establishments.est_code%TYPE);


PROCEDURE INSERT_PROC(
  p_est_code             IN         establishments.est_code%TYPE,
  p_est_name             IN         establishments.est_name%TYPE,
  p_est_alt_name         IN         establishments.est_alt_name%TYPE              DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY establishments%ROWTYPE);

END EST_PACK;
/