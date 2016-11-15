CREATE OR REPLACE PACKAGE phenix.PRO_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  programs%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pro_id                         IN         programs.pro_id%TYPE,
  p_pro_rec                        OUT NOCOPY programs%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pro_id                         IN         programs.pro_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pro_id                         IN         programs.pro_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_pro_id                         IN         programs.pro_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pro_id                         IN         programs.pro_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pro_id                         IN         programs.pro_id%TYPE);

FUNCTION GET_FULL_FUNC(
  p_pro_name                       IN         programs.pro_name%TYPE,
  p_pro_rec                        OUT NOCOPY programs%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pro_name                       IN         programs.pro_name%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pro_name                       IN         programs.pro_name%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_pro_name                       IN         programs.pro_name%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pro_name                       IN         programs.pro_name%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pro_name                       IN         programs.pro_name%TYPE);


FUNCTION INSERT_FUNC(
  p_pro_type                  IN         programs.pro_type%TYPE,
  p_pro_alternate_description IN         programs.pro_alternate_description%TYPE,
  p_pro_command               IN         programs.pro_command%TYPE,
  p_pro_description           IN         programs.pro_description%TYPE,
  p_pro_name                  IN         programs.pro_name%TYPE,
  p_pro_prn_id                IN         programs.pro_prn_id%TYPE                     DEFAULT NULL,
  p_pro_extract_query         IN         programs.pro_extract_query%TYPE              DEFAULT NULL,
  p_pro_extract_header        IN         programs.pro_extract_header%TYPE             DEFAULT NULL,
  p_pro_environment           IN         programs.pro_environment%TYPE                DEFAULT NULL,
  p_pro_alert_switch          IN         programs.pro_alert_switch%TYPE               DEFAULT 0 )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY programs%ROWTYPE)
RETURN NUMBER;

-----------------------------------------------------------------------------------------------
-- Ajuster les fonctions / procédures ci-dessous afin de ne plus les utiliser au fil du temps
-- Les fonctions ci-haut doivent être considérées à la place
-- Déplacer les traitements dans un package OPERATION au besoin
-----------------------------------------------------------------------------------------------

FUNCTION FIND_PRINCIPAL_PRN_ID_FUNC(
  p_pro_name IN VARCHAR2
)
RETURN NUMBER;

END PRO_PACK;
/