CREATE OR REPLACE PACKAGE phenix.URA_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  user_remote_applications%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_ura_id                         IN         user_remote_applications.ura_id%TYPE,
  p_ura_rec                        OUT NOCOPY user_remote_applications%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_ura_id                         IN         user_remote_applications.ura_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_ura_id                         IN         user_remote_applications.ura_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_ura_id                         IN         user_remote_applications.ura_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_ura_id                         IN         user_remote_applications.ura_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_ura_id                         IN         user_remote_applications.ura_id%TYPE);

FUNCTION GET_FULL_FUNC(
  p_ura_key                        IN         user_remote_applications.ura_key%TYPE,
  p_ura_rec                        OUT NOCOPY user_remote_applications%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_ura_key                        IN         user_remote_applications.ura_key%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_ura_key                        IN         user_remote_applications.ura_key%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_ura_key                        IN         user_remote_applications.ura_key%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_ura_key                        IN         user_remote_applications.ura_key%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_ura_key                        IN         user_remote_applications.ura_key%TYPE);


FUNCTION INSERT_FUNC(
  p_ura_use_code          IN         user_remote_applications.ura_use_code%TYPE,
  p_ura_key               IN         user_remote_applications.ura_key%TYPE,
  p_ura_creation_date     IN         user_remote_applications.ura_creation_date%TYPE          DEFAULT SYSDATE               ,
  p_ura_modification_date IN         user_remote_applications.ura_modification_date%TYPE      DEFAULT SYSDATE               )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY user_remote_applications%ROWTYPE)
RETURN NUMBER;

END URA_PACK;
/