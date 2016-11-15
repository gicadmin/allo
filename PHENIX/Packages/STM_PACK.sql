CREATE OR REPLACE PACKAGE phenix.STM_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  standard_messages%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_stm_code                       IN         standard_messages.stm_code%TYPE,
  p_stm_rec                        OUT NOCOPY standard_messages%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_stm_code                       IN         standard_messages.stm_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_stm_code                       IN         standard_messages.stm_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_stm_code                       IN         standard_messages.stm_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_stm_code                       IN         standard_messages.stm_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_stm_code                       IN         standard_messages.stm_code%TYPE);

FUNCTION GET_FULL_FUNC(
  p_stm_short_code                 IN         standard_messages.stm_short_code%TYPE,
  p_stm_rec                        OUT NOCOPY standard_messages%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_stm_short_code                 IN         standard_messages.stm_short_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_stm_short_code                 IN         standard_messages.stm_short_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_stm_short_code                 IN         standard_messages.stm_short_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_stm_short_code                 IN         standard_messages.stm_short_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_stm_short_code                 IN         standard_messages.stm_short_code%TYPE);


PROCEDURE INSERT_PROC(
  p_stm_code             IN         standard_messages.stm_code%TYPE,
  p_stm_description      IN         standard_messages.stm_description%TYPE,
  p_stm_short_code       IN         standard_messages.stm_short_code%TYPE,
  p_stm_alt_description  IN         standard_messages.stm_alt_description%TYPE       DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY standard_messages%ROWTYPE);

END STM_PACK;
/