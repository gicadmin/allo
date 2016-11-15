CREATE OR REPLACE PACKAGE phenix.SGE_MANAGEMENT_PACK IS

FUNCTION GET_FULL_MESSAGE_FUNC(
  p_sqlerrm                   VARCHAR2,
  p_code_lang                 VARCHAR2)
  RETURN VARCHAR2;

FUNCTION GET_MESSAGE_FUNC(
  p_sqlerrm                   VARCHAR2,
  p_code_lang                 VARCHAR2)
  RETURN VARCHAR2;

FUNCTION GET_ERROR_NUMBER_FUNC(
  p_sqlerrm                   VARCHAR2)
  RETURN NUMBER;

FUNCTION GET_ERROR_CODE_FUNC(
  p_sqlerrm                   VARCHAR2)
  RETURN VARCHAR2;

PROCEDURE SET_IDENTIFIER_PROC(
  p_use_login IN users.use_login%TYPE
);

FUNCTION GET_USER_PROGRESS_FUNC(
  p_use_code IN users.use_code%TYPE
)
RETURN VARCHAR2;

END SGE_MANAGEMENT_PACK;
/