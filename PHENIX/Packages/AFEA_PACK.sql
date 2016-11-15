CREATE OR REPLACE PACKAGE phenix.AFEA_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  application_features%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_afea_id                        IN         application_features.afea_id%TYPE,
  p_afea_rec                       OUT NOCOPY application_features%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_afea_id                        IN         application_features.afea_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_afea_id                        IN         application_features.afea_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_afea_id                        IN         application_features.afea_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_afea_id                        IN         application_features.afea_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_afea_id                        IN         application_features.afea_id%TYPE);

FUNCTION GET_FULL_FUNC(
  p_afea_code                      IN         application_features.afea_code%TYPE,
  p_afea_rec                       OUT NOCOPY application_features%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_afea_code                      IN         application_features.afea_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_afea_code                      IN         application_features.afea_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_afea_code                      IN         application_features.afea_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_afea_code                      IN         application_features.afea_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_afea_code                      IN         application_features.afea_code%TYPE);


FUNCTION INSERT_FUNC(
  p_afea_code              IN         application_features.afea_code%TYPE,
  p_afea_status            IN         application_features.afea_status%TYPE,
  p_afea_creation_date     IN         application_features.afea_creation_date%TYPE          DEFAULT sysdate  ,
  p_afea_modification_date IN         application_features.afea_modification_date%TYPE      DEFAULT sysdate  )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY application_features%ROWTYPE)
RETURN NUMBER;

END AFEA_PACK;
/