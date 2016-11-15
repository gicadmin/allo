CREATE OR REPLACE PACKAGE phenix.UPRO_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  user_profiles%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_upro_id                        IN         user_profiles.upro_id%TYPE,
  p_upro_rec                       OUT NOCOPY user_profiles%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_upro_id                        IN         user_profiles.upro_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_upro_id                        IN         user_profiles.upro_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_upro_id                        IN         user_profiles.upro_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_upro_id                        IN         user_profiles.upro_id%TYPE);

FUNCTION GET_FULL_FUNC(
  p_upro_cus_code                  IN         user_profiles.upro_cus_code%TYPE,
  p_upro_ven_code                  IN         user_profiles.upro_ven_code%TYPE,
  p_upro_ause_id                   IN         user_profiles.upro_ause_id%TYPE,
  p_upro_rec                       OUT NOCOPY user_profiles%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_upro_cus_code                  IN         user_profiles.upro_cus_code%TYPE,
  p_upro_ven_code                  IN         user_profiles.upro_ven_code%TYPE,
  p_upro_ause_id                   IN         user_profiles.upro_ause_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_upro_cus_code                  IN         user_profiles.upro_cus_code%TYPE,
  p_upro_ven_code                  IN         user_profiles.upro_ven_code%TYPE,
  p_upro_ause_id                   IN         user_profiles.upro_ause_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_upro_cus_code                  IN         user_profiles.upro_cus_code%TYPE,
  p_upro_ven_code                  IN         user_profiles.upro_ven_code%TYPE,
  p_upro_ause_id                   IN         user_profiles.upro_ause_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_upro_cus_code                  IN         user_profiles.upro_cus_code%TYPE,
  p_upro_ven_code                  IN         user_profiles.upro_ven_code%TYPE,
  p_upro_ause_id                   IN         user_profiles.upro_ause_id%TYPE);


FUNCTION INSERT_FUNC(
  p_upro_ause_id           IN         user_profiles.upro_ause_id%TYPE,
  p_upro_cus_code          IN         user_profiles.upro_cus_code%TYPE               DEFAULT NULL,
  p_upro_ven_code          IN         user_profiles.upro_ven_code%TYPE               DEFAULT NULL,
  p_upro_creation_date     IN         user_profiles.upro_creation_date%TYPE          DEFAULT sysdate  ,
  p_upro_modification_date IN         user_profiles.upro_modification_date%TYPE      DEFAULT sysdate  )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY user_profiles%ROWTYPE)
RETURN NUMBER;

END UPRO_PACK;
/