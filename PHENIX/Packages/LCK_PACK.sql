CREATE OR REPLACE PACKAGE phenix.LCK_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  locks%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_lck_code                       IN         locks.lck_code%TYPE,
  p_lck_type                       IN         locks.lck_type%TYPE,
  p_lck_menu_name                  IN         locks.lck_menu_name%TYPE,
  p_lck_rec                        OUT NOCOPY locks%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_lck_code                       IN         locks.lck_code%TYPE,
  p_lck_type                       IN         locks.lck_type%TYPE,
  p_lck_menu_name                  IN         locks.lck_menu_name%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_lck_code                       IN         locks.lck_code%TYPE,
  p_lck_type                       IN         locks.lck_type%TYPE,
  p_lck_menu_name                  IN         locks.lck_menu_name%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_lck_code                       IN         locks.lck_code%TYPE,
  p_lck_type                       IN         locks.lck_type%TYPE,
  p_lck_menu_name                  IN         locks.lck_menu_name%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_lck_code                       IN         locks.lck_code%TYPE,
  p_lck_type                       IN         locks.lck_type%TYPE,
  p_lck_menu_name                  IN         locks.lck_menu_name%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_lck_code                       IN         locks.lck_code%TYPE,
  p_lck_type                       IN         locks.lck_type%TYPE,
  p_lck_menu_name                  IN         locks.lck_menu_name%TYPE);

FUNCTION GET_FULL_FUNC(
  p_lck_id                         IN         locks.lck_id%TYPE,
  p_lck_rec                        OUT NOCOPY locks%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_lck_id                         IN         locks.lck_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_lck_id                         IN         locks.lck_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_lck_id                         IN         locks.lck_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_lck_id                         IN         locks.lck_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_lck_id                         IN         locks.lck_id%TYPE);


FUNCTION INSERT_FUNC(
  p_lck_code             IN         locks.lck_code%TYPE,
  p_lck_type             IN         locks.lck_type%TYPE,
  p_lck_use_code         IN         locks.lck_use_code%TYPE,
  p_lck_name             IN         locks.lck_name%TYPE,
  p_lck_method           IN         locks.lck_method%TYPE,
  p_lck_sid              IN         locks.lck_sid%TYPE,
  p_lck_menu_name        IN         locks.lck_menu_name%TYPE             DEFAULT NULL,
  p_lck_handle           IN         locks.lck_handle%TYPE                DEFAULT NULL,
  p_lck_lock_id          IN         locks.lck_lock_id%TYPE               DEFAULT NULL,
  p_lck_creation_date    IN         locks.lck_creation_date%TYPE         DEFAULT SYSDATE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY locks%ROWTYPE)
RETURN NUMBER;

END LCK_PACK;
/