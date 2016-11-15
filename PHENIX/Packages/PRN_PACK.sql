CREATE OR REPLACE PACKAGE phenix.PRN_PACK IS

FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  printers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_prn_id                         IN         printers.prn_id%TYPE,
  p_prn_rec                        OUT NOCOPY printers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_prn_id                         IN         printers.prn_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_prn_id                         IN         printers.prn_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_prn_id                         IN         printers.prn_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_prn_id                         IN         printers.prn_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_prn_id                         IN         printers.prn_id%TYPE);

FUNCTION GET_FULL_FUNC(
  p_prn_code                       IN         printers.prn_code%TYPE,
  p_prn_rec                        OUT NOCOPY printers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_prn_code                       IN         printers.prn_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_prn_code                       IN         printers.prn_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_prn_code                       IN         printers.prn_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_prn_code                       IN         printers.prn_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_prn_code                       IN         printers.prn_code%TYPE);


FUNCTION INSERT_FUNC(
  p_prn_description      IN         printers.prn_description%TYPE,
  p_prn_library_path     IN         printers.prn_library_path%TYPE,
  p_prn_code             IN         printers.prn_code%TYPE,
  p_prn_alt_description  IN         printers.prn_alt_description%TYPE       DEFAULT NULL,
  p_prn_vr_check_digit   IN         printers.prn_vr_check_digit%TYPE        DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY printers%ROWTYPE)
RETURN NUMBER;

-----------------------------------------------------------------------------------------------
-- Ajuster les fonctions / procédures ci-dessous afin de ne plus les utiliser au fil du temps
-- Les fonctions ci-haut doivent être considérées à la place
-- Déplacer les traitements dans un package OPERATION au besoin
-----------------------------------------------------------------------------------------------

FUNCTION FIND_PRN_ID_BY_PRN_CODE_FUNC(
  p_prn_code IN printers.prn_code%TYPE
)
RETURN NUMBER;

FUNCTION FIND_PRN_ID_BY_PRO_NAME_FUNC(
  p_pro_name IN programs.pro_name%TYPE
)
RETURN NUMBER;

FUNCTION FIND_PRN_INCL_WHS_FUNC(
  p_pro_name  IN VARCHAR2,
  p_whs_code  IN VARCHAR2
)
RETURN NUMBER;

FUNCTION FIND_PRN_WHS_ONLY_FUNC(
  p_pro_name  IN VARCHAR2,
  p_whs_code  IN VARCHAR2
)
RETURN NUMBER;

END PRN_PACK;
/