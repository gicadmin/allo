CREATE OR REPLACE PACKAGE phenix.FMT_OPERATION_PACK IS

FUNCTION FIND_KG_CONVERSION_FUNC(
	p_fmt_code IN formats.fmt_code%TYPE
)
RETURN NUMBER;
FUNCTION FIND_FMT_FOR_BALANCE_FUNC
RETURN VARCHAR2;

FUNCTION FIND_FMT_SHORT_CODE_FUNC(
  p_fmt_code IN formats.fmt_code%TYPE
)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC (
  p_fmt_code  IN formats.fmt_code%TYPE,
  p_language  IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

END FMT_OPERATION_PACK;
/