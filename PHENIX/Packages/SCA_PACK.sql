CREATE OR REPLACE PACKAGE phenix.SCA_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  scales%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_sca_code                       IN         scales.sca_code%TYPE,
  p_sca_rec                        OUT NOCOPY scales%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_sca_code                       IN         scales.sca_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_sca_code                       IN         scales.sca_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_sca_code                       IN         scales.sca_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_sca_code                       IN         scales.sca_code%TYPE);

FUNCTION GET_FULL_FUNC(
  p_sca_code                       IN         scales.sca_code%TYPE,
  p_sca_serial                     IN         scales.sca_serial%TYPE,
  p_sca_rec                        OUT NOCOPY scales%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_sca_code                       IN         scales.sca_code%TYPE,
  p_sca_serial                     IN         scales.sca_serial%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_sca_code                       IN         scales.sca_code%TYPE,
  p_sca_serial                     IN         scales.sca_serial%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_sca_code                       IN         scales.sca_code%TYPE,
  p_sca_serial                     IN         scales.sca_serial%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_sca_code                       IN         scales.sca_code%TYPE,
  p_sca_serial                     IN         scales.sca_serial%TYPE);


PROCEDURE INSERT_PROC(
  p_sca_code             IN         scales.sca_code%TYPE,
  p_sca_serial           IN         scales.sca_serial%TYPE,
  p_sca_date             IN         scales.sca_date%TYPE                  DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY scales%ROWTYPE);

END SCA_PACK;
/