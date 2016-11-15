CREATE OR REPLACE PACKAGE phenix.WHC_PACK IS

PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  warehouse_conditions%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_whc_code                       IN         warehouse_conditions.whc_code%TYPE,
  p_whc_rec                        OUT NOCOPY warehouse_conditions%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_whc_code                       IN         warehouse_conditions.whc_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_whc_code                       IN         warehouse_conditions.whc_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_whc_code                       IN         warehouse_conditions.whc_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_whc_code                       IN         warehouse_conditions.whc_code%TYPE);


PROCEDURE INSERT_PROC(
  p_whc_code             IN         warehouse_conditions.whc_code%TYPE,
  p_whc_description      IN         warehouse_conditions.whc_description%TYPE,
  p_whc_alt_description  IN         warehouse_conditions.whc_alt_description%TYPE       DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY warehouse_conditions%ROWTYPE);

-----------------------------------------------------------------------------------------------
-- Ajuster les fonctions / procédures ci-dessous afin de ne plus les utiliser au fil du temps
-- Les fonctions ci-haut doivent être considérées à la place
-- Déplacer les traitements dans un package OPERATION au besoin
-----------------------------------------------------------------------------------------------

FUNCTION FIND_WHC_DESCRIPTION_FUNC(
  p_whc_code IN VARCHAR2,
  p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

END WHC_PACK;
/