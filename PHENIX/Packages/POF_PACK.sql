CREATE OR REPLACE PACKAGE phenix.POF_PACK IS

PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  positioning_families%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pof_code                       IN         positioning_families.pof_code%TYPE,
  p_pof_rec                        OUT NOCOPY positioning_families%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pof_code                       IN         positioning_families.pof_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pof_code                       IN         positioning_families.pof_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_pof_code                       IN         positioning_families.pof_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pof_code                       IN         positioning_families.pof_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pof_code                       IN         positioning_families.pof_code%TYPE);


PROCEDURE INSERT_PROC(
  p_pof_code              IN         positioning_families.pof_code%TYPE,
  p_pof_description       IN         positioning_families.pof_description%TYPE,
  p_pof_sequence          IN         positioning_families.pof_sequence%TYPE,
  p_pof_whz_code          IN         positioning_families.pof_whz_code%TYPE,
  p_pof_measure           IN         positioning_families.pof_measure%TYPE,
  p_pof_alt_description   IN         positioning_families.pof_alt_description%TYPE        DEFAULT NULL,
  p_pof_empty_loc_percent IN         positioning_families.pof_empty_loc_percent%TYPE      DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY positioning_families%ROWTYPE);

-----------------------------------------------------------------------------------------------
-- Ajuster les fonctions / procédures ci-dessous afin de ne plus les utiliser au fil du temps
-- Les fonctions ci-haut doivent être considérées à la place
-- Déplacer les traitements dans un package OPERATION au besoin
-----------------------------------------------------------------------------------------------

FUNCTION FIND_MAX_WHZ_WHT_PER_POF_FUNC(
  p_pof_code IN NUMBER
)
RETURN NUMBER;

FUNCTION FIND_POF_MEASURE_FUNC(
  p_pof_code IN NUMBER
)
RETURN VARCHAR2;

END POF_PACK;
/