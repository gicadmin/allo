CREATE OR REPLACE PACKAGE phenix.SRT_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  suggested_retail_price_types%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_srt_code                       IN         suggested_retail_price_types.srt_code%TYPE,
  p_srt_rec                        OUT NOCOPY suggested_retail_price_types%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_srt_code                       IN         suggested_retail_price_types.srt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_srt_code                       IN         suggested_retail_price_types.srt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_srt_code                       IN         suggested_retail_price_types.srt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_srt_code                       IN         suggested_retail_price_types.srt_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_srt_code                       IN         suggested_retail_price_types.srt_code%TYPE);


PROCEDURE INSERT_PROC(
  p_srt_code                 IN         suggested_retail_price_types.srt_code%TYPE,
  p_srt_description          IN         suggested_retail_price_types.srt_description%TYPE,
  p_srt_alt_description      IN         suggested_retail_price_types.srt_alt_description%TYPE           DEFAULT NULL,
  p_srt_lower_rounding_value IN         suggested_retail_price_types.srt_lower_rounding_value%TYPE      DEFAULT NULL,
  p_srt_upper_rounding_value IN         suggested_retail_price_types.srt_upper_rounding_value%TYPE      DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY suggested_retail_price_types%ROWTYPE);

END SRT_PACK;
/