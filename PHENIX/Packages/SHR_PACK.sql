CREATE OR REPLACE PACKAGE phenix.SHR_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  shorted_reasons%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_shr_code                       IN         shorted_reasons.shr_code%TYPE,
  p_shr_rec                        OUT NOCOPY shorted_reasons%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_shr_code                       IN         shorted_reasons.shr_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_shr_code                       IN         shorted_reasons.shr_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_shr_code                       IN         shorted_reasons.shr_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_shr_code                       IN         shorted_reasons.shr_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_shr_code                       IN         shorted_reasons.shr_code%TYPE);


PROCEDURE INSERT_PROC(
  p_shr_code             IN         shorted_reasons.shr_code%TYPE,
  p_shr_description      IN         shorted_reasons.shr_description%TYPE,
  p_shr_fill_rate_switch IN         shorted_reasons.shr_fill_rate_switch%TYPE,
  p_shr_alt_description  IN         shorted_reasons.shr_alt_description%TYPE       DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY shorted_reasons%ROWTYPE);

END SHR_PACK;
/