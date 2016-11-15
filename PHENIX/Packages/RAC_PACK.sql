CREATE OR REPLACE PACKAGE phenix.RAC_PACK IS

PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  racking_types%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_rac_code                       IN         racking_types.rac_code%TYPE,
  p_rac_rec                        OUT NOCOPY racking_types%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_rac_code                       IN         racking_types.rac_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_rac_code                       IN         racking_types.rac_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_rac_code                       IN         racking_types.rac_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_rac_code                       IN         racking_types.rac_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_rac_code                       IN         racking_types.rac_code%TYPE);


PROCEDURE INSERT_PROC(
  p_rac_code                    IN         racking_types.rac_code%TYPE,
  p_rac_description             IN         racking_types.rac_description%TYPE,
  p_rac_min_days_sales          IN         racking_types.rac_min_days_sales%TYPE,
  p_rac_alt_description         IN         racking_types.rac_alt_description%TYPE              DEFAULT NULL,
  p_rac_contraint_switch        IN         racking_types.rac_contraint_switch%TYPE             DEFAULT 0 ,
  p_rac_case_flow_switch        IN         racking_types.rac_case_flow_switch%TYPE             DEFAULT 0 ,
  p_rac_allow_double_loc_switch IN         racking_types.rac_allow_double_loc_switch%TYPE      DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY racking_types%ROWTYPE);

-----------------------------------------------------------------------------------------------
-- Ajuster les fonctions / procédures ci-dessous afin de ne plus les utiliser au fil du temps
-- Les fonctions ci-haut doivent être considérées à la place
-- Déplacer les traitements dans un package OPERATION au besoin
-----------------------------------------------------------------------------------------------

FUNCTION GET_RAC_RECORD_FUNC(
  p_rac_code    IN  racking_types.rac_code%TYPE,
  p_racking_rec OUT NOCOPY racking_types%ROWTYPE
)
RETURN PLS_INTEGER;


FUNCTION FIND_RAC_CODE_MIN_SALES_FUNC(
  p_double_loc IN NUMBER
)
RETURN NUMBER;

END RAC_PACK;
/