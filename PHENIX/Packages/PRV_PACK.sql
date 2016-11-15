CREATE OR REPLACE PACKAGE phenix.PRV_PACK IS

PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  provinces%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_prv_code                       IN         provinces.prv_code%TYPE,
  p_prv_rec                        OUT NOCOPY provinces%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_prv_code                       IN         provinces.prv_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_prv_code                       IN         provinces.prv_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_prv_code                       IN         provinces.prv_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_prv_code                       IN         provinces.prv_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_prv_code                       IN         provinces.prv_code%TYPE);


PROCEDURE INSERT_PROC(
  p_prv_code                   IN         provinces.prv_code%TYPE,
  p_prv_alcohol_permit_switch  IN         provinces.prv_alcohol_permit_switch%TYPE,
  p_prv_compounded_tax_switch  IN         provinces.prv_compounded_tax_switch%TYPE,
  p_prv_federal_tax            IN         provinces.prv_federal_tax%TYPE,
  p_prv_harmonized_tax_switch  IN         provinces.prv_harmonized_tax_switch%TYPE,
  p_prv_name                   IN         provinces.prv_name%TYPE,
  p_prv_provincial_tax         IN         provinces.prv_provincial_tax%TYPE,
  p_prv_tobacco_permit_switch  IN         provinces.prv_tobacco_permit_switch%TYPE,
  p_prv_cun_code               IN         provinces.prv_cun_code%TYPE,
  p_prv_alt_name               IN         provinces.prv_alt_name%TYPE                    DEFAULT NULL,
  p_prv_ven_tobacco_tax_code   IN         provinces.prv_ven_tobacco_tax_code%TYPE        DEFAULT NULL,
  p_prv_ven_cigar_tax_code     IN         provinces.prv_ven_cigar_tax_code%TYPE          DEFAULT NULL,
  p_prv_tobacco_markup_rate    IN         provinces.prv_tobacco_markup_rate%TYPE         DEFAULT 0 ,
  p_prv_tobacco_tax_rate       IN         provinces.prv_tobacco_tax_rate%TYPE            DEFAULT 0 ,
  p_prv_max_tobacco_no_licence IN         provinces.prv_max_tobacco_no_licence%TYPE      DEFAULT NULL,
  p_prv_tobacco_tax_pay_method IN         provinces.prv_tobacco_tax_pay_method%TYPE      DEFAULT 'P' );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY provinces%ROWTYPE);

----------------------------------------------------------------------------------------------------
--FONCTIONS ET PROCÉDURES À NE PLUS UTILISER
----------------------------------------------------------------------------------------------------

FUNCTION GET_PRV_RECORD_FUNC(
	p_prv_code       	IN VARCHAR2,
  p_provinces_rec 	OUT NOCOPY provinces%ROWTYPE
)
RETURN PLS_INTEGER;

FUNCTION FIND_PRV_NAME_FUNC(
	p_prv_code IN VARCHAR2,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

PROCEDURE FIND_PRV_NAME_AND_CUN_PROC(
	p_prv_code 			IN VARCHAR2,
	p_prv_name			OUT VARCHAR2,
	p_prv_cun_code	OUT VARCHAR2,
	p_language 			IN VARCHAR2 DEFAULT 'F'
);

PROCEDURE FIND_PRV_MAIN_INFO_PROC(
	p_prv_code 						IN provinces.prv_code%TYPE,
	p_prv_name 						OUT provinces.prv_name%TYPE,
	p_prv_provincial_tax 	OUT provinces.prv_provincial_tax%TYPE,
	p_prv_federal_tax 		OUT provinces.prv_federal_tax%TYPE,
	p_cun_description 		OUT countries.cun_description%TYPE
);

PROCEDURE FIND_PRV_TAX_RATE_PROC(
	p_prv_code 									IN VARCHAR2,
	p_prv_federal_tax						OUT NUMBER,
	p_prv_provincial_tax				OUT NUMBER,
	p_prv_compounded_tax_switch	OUT NUMBER
);

FUNCTION GET_POSTAL_CODE_MASK_FUNC(
	p_prv_code IN provinces.prv_code%TYPE
)
RETURN VARCHAR2;

FUNCTION VALIDATE_POSTAL_CODE_FUNC(
	p_postal_code 	IN VARCHAR2,
	p_prv_code 			IN provinces.prv_code%TYPE
)
RETURN NUMBER;

FUNCTION FORMAT_POSTAL_CODE_FUNC(
	p_postal_code 	IN VARCHAR2,
	p_prv_code 			IN provinces.prv_code%TYPE
)
RETURN VARCHAR2;


END PRV_PACK;
/