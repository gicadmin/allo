CREATE OR REPLACE PACKAGE phenix.CTR_PACK AS

---------------------------------------------------------------------------------------------------------
-- IMPORTANT: Ne pas regÃ©nÃ©rer le paquet pour avoir les fonctions / procÃ©dures standards
-- Si la regÃ©nÃ©ration est requise, retirer les traitements en lien avec l'insertion et la suppression
---------------------------------------------------------------------------------------------------------

FUNCTION GET_FULL_FUNC(
  p_ctr_code                       IN         control.ctr_code%TYPE,
  p_ctr_rec                        OUT NOCOPY control%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_ctr_code                       IN         control.ctr_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_ctr_code                       IN         control.ctr_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_ctr_code                       IN         control.ctr_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_ctr_code                       IN         control.ctr_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

-----------------------------------------------------------------------------------------------
-- Ajuster les fonctions / procÃ©dures ci-dessous afin de ne plus les utiliser au fil du temps
-- Les fonctions ci-haut doivent Ãªtre considÃ©rÃ©es ÃƒÂ  la place
-- DÃ©placer les traitements dans un package OPERATION au besoin
-----------------------------------------------------------------------------------------------

FUNCTION FIND_PARAMETER_VARCHAR_FUNC(
  p_parameter_name IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION FIND_PARAMETER_NUMBER_FUNC(
  p_parameter_name IN VARCHAR2
)
RETURN NUMBER;

FUNCTION FIND_PARAMETER_DATE_FUNC(
  p_parameter_name IN VARCHAR2
)
RETURN DATE;

FUNCTION GET_BROKER_FUNC RETURN NUMBER;

FUNCTION GET_WEEK_START_DAY_FUNC RETURN NUMBER;

FUNCTION GET_SUPER_DISTRIBUTOR_FUNC RETURN NUMBER;

FUNCTION GET_FULL_INFO_FUNC RETURN control%ROWTYPE;

FUNCTION FIND_COST_NAME(
  p_cost     IN NUMBER,
  p_language IN VARCHAR2 DEFAULT 'FR'
)
RETURN VARCHAR2;

END CTR_PACK;
/