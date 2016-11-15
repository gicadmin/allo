CREATE OR REPLACE PACKAGE phenix.FMT_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  formats%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_fmt_code                       IN         formats.fmt_code%TYPE,
  p_fmt_rec                        OUT NOCOPY formats%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_fmt_code                       IN         formats.fmt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_fmt_code                       IN         formats.fmt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_fmt_code                       IN         formats.fmt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_fmt_code                       IN         formats.fmt_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_fmt_code                       IN         formats.fmt_code%TYPE);

FUNCTION GET_FULL_FUNC(
  p_fmt_short_code                 IN         formats.fmt_short_code%TYPE,
  p_fmt_rec                        OUT NOCOPY formats%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_fmt_short_code                 IN         formats.fmt_short_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_fmt_short_code                 IN         formats.fmt_short_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_fmt_short_code                 IN         formats.fmt_short_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_fmt_short_code                 IN         formats.fmt_short_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_fmt_short_code                 IN         formats.fmt_short_code%TYPE);


PROCEDURE INSERT_PROC(
  p_fmt_code                    IN         formats.fmt_code%TYPE,
  p_fmt_description             IN         formats.fmt_description%TYPE,
  p_fmt_weighted_format_switch  IN         formats.fmt_weighted_format_switch%TYPE,
  p_fmt_short_code              IN         formats.fmt_short_code%TYPE,
  p_fmt_edi_short_code          IN         formats.fmt_edi_short_code%TYPE,
  p_fmt_surcharge               IN         formats.fmt_surcharge%TYPE                    DEFAULT NULL,
  p_fmt_alt_description         IN         formats.fmt_alt_description%TYPE              DEFAULT NULL,
  p_fmt_conversion_to_kilograms IN         formats.fmt_conversion_to_kilograms%TYPE      DEFAULT NULL,
  p_fmt_surcharge_percent       IN         formats.fmt_surcharge_percent%TYPE            DEFAULT NULL,
  p_fmt_average_volume          IN         formats.fmt_average_volume%TYPE               DEFAULT 0 ,
  p_fmt_shipping_case_switch    IN         formats.fmt_shipping_case_switch%TYPE         DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY formats%ROWTYPE);

----------------------------------------------------------------------------------------------------------------------
FUNCTION GET_FMT_FUNC(
	p_fmt_code    IN VARCHAR2,
  p_formats_rec OUT NOCOPY formats%ROWTYPE
)
RETURN PLS_INTEGER;

FUNCTION FIND_FMT_DESCRIPTION_FUNC(
	p_fmt_code IN VARCHAR2,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

FUNCTION FIND_FMT_DESC_FROM_EDI_FUNC(
	p_fmt_edi_short_code 	IN VARCHAR2,
	p_language 						IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

FUNCTION FIND_FMT_SHORT_CODE_FUNC(
	p_fmt_code IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION FIND_FMT_REAL_CODE_FUNC(
	p_fmt_short_code IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION FIND_KG_CONVERSION_FUNC(
	p_fmt_code IN formats.fmt_code%TYPE
)
RETURN NUMBER;

--gic1700 fonction pour convertir un poids dun format X, vers un format Y (ex: Gramme vers Livres... etc)
FUNCTION CONVERT_BETWEEN_WEIGHTS_FUNC(
	p_fmt_initial IN VARCHAR2,
	p_fmt_final 	IN VARCHAR2
)
RETURN NUMBER;

END FMT_PACK;
/