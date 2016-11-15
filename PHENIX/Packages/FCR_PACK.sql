CREATE OR REPLACE PACKAGE phenix.FCR_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  food_certifications%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_fcr_code                       IN         food_certifications.fcr_code%TYPE,
  p_fcr_fcg_code                   IN         food_certifications.fcr_fcg_code%TYPE,
  p_fcr_rec                        OUT NOCOPY food_certifications%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_fcr_code                       IN         food_certifications.fcr_code%TYPE,
  p_fcr_fcg_code                   IN         food_certifications.fcr_fcg_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_fcr_code                       IN         food_certifications.fcr_code%TYPE,
  p_fcr_fcg_code                   IN         food_certifications.fcr_fcg_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_fcr_code                       IN         food_certifications.fcr_code%TYPE,
  p_fcr_fcg_code                   IN         food_certifications.fcr_fcg_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_fcr_code                       IN         food_certifications.fcr_code%TYPE,
  p_fcr_fcg_code                   IN         food_certifications.fcr_fcg_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_fcr_code                       IN         food_certifications.fcr_code%TYPE,
  p_fcr_fcg_code                   IN         food_certifications.fcr_fcg_code%TYPE);


PROCEDURE INSERT_PROC(
  p_fcr_code             IN         food_certifications.fcr_code%TYPE,
  p_fcr_description      IN         food_certifications.fcr_description%TYPE,
  p_fcr_fcg_code         IN         food_certifications.fcr_fcg_code%TYPE,
  p_fcr_alt_description  IN         food_certifications.fcr_alt_description%TYPE       DEFAULT NULL,
  p_fcr_short_code       IN         food_certifications.fcr_short_code%TYPE            DEFAULT NULL,
  p_fcr_logo             IN         food_certifications.fcr_logo%TYPE                  DEFAULT NULL,
  p_fcr_bottin_switch    IN         food_certifications.fcr_bottin_switch%TYPE         DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY food_certifications%ROWTYPE);

END FCR_PACK;
/