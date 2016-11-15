CREATE OR REPLACE PACKAGE phenix.CPW_PACK IS

PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  customer_profile_weeks%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_cpw_cpf_cus_code               IN         customer_profile_weeks.cpw_cpf_cus_code%TYPE,
  p_cpw_cpf_prf_prd_code           IN         customer_profile_weeks.cpw_cpf_prf_prd_code%TYPE,
  p_cpw_cpf_prf_fmt_code           IN         customer_profile_weeks.cpw_cpf_prf_fmt_code%TYPE,
  p_cpw_fcw_fca_year               IN         customer_profile_weeks.cpw_fcw_fca_year%TYPE,
  p_cpw_fcw_fca_period             IN         customer_profile_weeks.cpw_fcw_fca_period%TYPE,
  p_cpw_fcw_week                   IN         customer_profile_weeks.cpw_fcw_week%TYPE,
  p_cpw_rec                        OUT NOCOPY customer_profile_weeks%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_cpw_cpf_cus_code               IN         customer_profile_weeks.cpw_cpf_cus_code%TYPE,
  p_cpw_cpf_prf_prd_code           IN         customer_profile_weeks.cpw_cpf_prf_prd_code%TYPE,
  p_cpw_cpf_prf_fmt_code           IN         customer_profile_weeks.cpw_cpf_prf_fmt_code%TYPE,
  p_cpw_fcw_fca_year               IN         customer_profile_weeks.cpw_fcw_fca_year%TYPE,
  p_cpw_fcw_fca_period             IN         customer_profile_weeks.cpw_fcw_fca_period%TYPE,
  p_cpw_fcw_week                   IN         customer_profile_weeks.cpw_fcw_week%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_cpw_cpf_cus_code               IN         customer_profile_weeks.cpw_cpf_cus_code%TYPE,
  p_cpw_cpf_prf_prd_code           IN         customer_profile_weeks.cpw_cpf_prf_prd_code%TYPE,
  p_cpw_cpf_prf_fmt_code           IN         customer_profile_weeks.cpw_cpf_prf_fmt_code%TYPE,
  p_cpw_fcw_fca_year               IN         customer_profile_weeks.cpw_fcw_fca_year%TYPE,
  p_cpw_fcw_fca_period             IN         customer_profile_weeks.cpw_fcw_fca_period%TYPE,
  p_cpw_fcw_week                   IN         customer_profile_weeks.cpw_fcw_week%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_cpw_cpf_cus_code               IN         customer_profile_weeks.cpw_cpf_cus_code%TYPE,
  p_cpw_cpf_prf_prd_code           IN         customer_profile_weeks.cpw_cpf_prf_prd_code%TYPE,
  p_cpw_cpf_prf_fmt_code           IN         customer_profile_weeks.cpw_cpf_prf_fmt_code%TYPE,
  p_cpw_fcw_fca_year               IN         customer_profile_weeks.cpw_fcw_fca_year%TYPE,
  p_cpw_fcw_fca_period             IN         customer_profile_weeks.cpw_fcw_fca_period%TYPE,
  p_cpw_fcw_week                   IN         customer_profile_weeks.cpw_fcw_week%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_cpw_cpf_cus_code               IN         customer_profile_weeks.cpw_cpf_cus_code%TYPE,
  p_cpw_cpf_prf_prd_code           IN         customer_profile_weeks.cpw_cpf_prf_prd_code%TYPE,
  p_cpw_cpf_prf_fmt_code           IN         customer_profile_weeks.cpw_cpf_prf_fmt_code%TYPE,
  p_cpw_fcw_fca_year               IN         customer_profile_weeks.cpw_fcw_fca_year%TYPE,
  p_cpw_fcw_fca_period             IN         customer_profile_weeks.cpw_fcw_fca_period%TYPE,
  p_cpw_fcw_week                   IN         customer_profile_weeks.cpw_fcw_week%TYPE);


PROCEDURE INSERT_PROC(
  p_cpw_cpf_cus_code     IN         customer_profile_weeks.cpw_cpf_cus_code%TYPE,
  p_cpw_cpf_prf_prd_code IN         customer_profile_weeks.cpw_cpf_prf_prd_code%TYPE,
  p_cpw_cpf_prf_fmt_code IN         customer_profile_weeks.cpw_cpf_prf_fmt_code%TYPE,
  p_cpw_fcw_fca_year     IN         customer_profile_weeks.cpw_fcw_fca_year%TYPE,
  p_cpw_fcw_fca_period   IN         customer_profile_weeks.cpw_fcw_fca_period%TYPE,
  p_cpw_fcw_week         IN         customer_profile_weeks.cpw_fcw_week%TYPE,
  p_cpw_quantity         IN         customer_profile_weeks.cpw_quantity%TYPE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY customer_profile_weeks%ROWTYPE);

-----------------------------------------------------------------------------------------------
-- Ajuster les fonctions / procédures ci-dessous afin de ne plus les utiliser au fil du temps
-- Les fonctions ci-haut doivent être considérées à la place
-- Déplacer les traitements dans un package OPERATION au besoin
-----------------------------------------------------------------------------------------------

PROCEDURE UPDATE_OR_INSERT_CPW_PROC(
	p_cpw_cpf_cus_code                  	IN customer_profile_weeks.cpw_cpf_cus_code%TYPE,
	p_cpw_cpf_prf_prd_code                IN customer_profile_weeks.cpw_cpf_prf_prd_code%TYPE,
	p_cpw_cpf_prf_fmt_code                IN customer_profile_weeks.cpw_cpf_prf_fmt_code%TYPE,
	p_cpw_fcw_fca_year										IN customer_profile_weeks.cpw_fcw_fca_year%TYPE,
	p_cpw_fcw_fca_period                  IN customer_profile_weeks.cpw_fcw_fca_period%TYPE,
	p_cpw_fcw_week                        IN customer_profile_weeks.cpw_fcw_week%TYPE,
	p_cpw_quantity                        IN customer_profile_weeks.cpw_quantity%TYPE
);

PROCEDURE INSERT_CPW_PROC(
	p_cpw_cpf_cus_code                  	IN customer_profile_weeks.cpw_cpf_cus_code%TYPE,
	p_cpw_cpf_prf_prd_code                IN customer_profile_weeks.cpw_cpf_prf_prd_code%TYPE,
	p_cpw_cpf_prf_fmt_code                IN customer_profile_weeks.cpw_cpf_prf_fmt_code%TYPE,
	p_cpw_fcw_fca_year										IN customer_profile_weeks.cpw_fcw_fca_year%TYPE,
	p_cpw_fcw_fca_period                  IN customer_profile_weeks.cpw_fcw_fca_period%TYPE,
	p_cpw_fcw_week                        IN customer_profile_weeks.cpw_fcw_week%TYPE,
	p_cpw_quantity                        IN customer_profile_weeks.cpw_quantity%TYPE
);

FUNCTION DOES_CPW_ALREADY_EXISTS_FUNC(
	p_cpw_cpf_cus_code                  	IN customer_profile_weeks.cpw_cpf_cus_code%TYPE,
	p_cpw_cpf_prf_prd_code                IN customer_profile_weeks.cpw_cpf_prf_prd_code%TYPE,
	p_cpw_cpf_prf_fmt_code                IN customer_profile_weeks.cpw_cpf_prf_fmt_code%TYPE,
	p_cpw_fcw_fca_year										IN customer_profile_weeks.cpw_fcw_fca_year%TYPE,
	p_cpw_fcw_fca_period                  IN customer_profile_weeks.cpw_fcw_fca_period%TYPE,
	p_cpw_fcw_week                        IN customer_profile_weeks.cpw_fcw_week%TYPE
)
RETURN BOOLEAN;

END CPW_PACK;
/