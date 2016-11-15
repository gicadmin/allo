CREATE OR REPLACE PACKAGE phenix.ROU_PACK IS

PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  routes%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_rou_code                       IN         routes.rou_code%TYPE,
  p_rou_rec                        OUT NOCOPY routes%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_rou_code                       IN         routes.rou_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_rou_code                       IN         routes.rou_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_rou_code                       IN         routes.rou_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_rou_code                       IN         routes.rou_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_rou_code                       IN         routes.rou_code%TYPE);


PROCEDURE INSERT_PROC(
  p_rou_code                  IN         routes.rou_code%TYPE,
  p_rou_day                   IN         routes.rou_day%TYPE,
  p_rou_description           IN         routes.rou_description%TYPE,
  p_rou_active_switch         IN         routes.rou_active_switch%TYPE,
  p_rou_whs_delivery_code     IN         routes.rou_whs_delivery_code%TYPE,
  p_rou_trk_code              IN         routes.rou_trk_code%TYPE                   DEFAULT NULL,
  p_rou_alt_description       IN         routes.rou_alt_description%TYPE            DEFAULT NULL,
  p_rou_priority_code         IN         routes.rou_priority_code%TYPE              DEFAULT NULL,
  p_rou_pmo_code              IN         routes.rou_pmo_code%TYPE                   DEFAULT NULL,
  p_rou_default_loc_dock_code IN         routes.rou_default_loc_dock_code%TYPE      DEFAULT NULL,
  p_rou_rgc_code              IN         routes.rou_rgc_code%TYPE                   DEFAULT NULL,
  p_rou_order_cutoff_time     IN         routes.rou_order_cutoff_time%TYPE          DEFAULT NULL,
  p_rou_type                  IN         routes.rou_type%TYPE                       DEFAULT 'RG' );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY routes%ROWTYPE);

-----------------------------------------------------------------------------------------------
-- Ajuster les fonctions / procédures ci-dessous afin de ne plus les utiliser au fil du temps
-- Les fonctions ci-haut doivent être considérées à la place
-- Déplacer les traitements dans un package OPERATION au besoin
-----------------------------------------------------------------------------------------------

FUNCTION FIND_ROU_DESCRIPTION_FUNC(
	p_rou_code IN NUMBER,
	p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

FUNCTION FIND_COLUMN_VALUE_VARCHAR_FUNC(
  p_column_name IN VARCHAR2,
  p_rou_code    IN routes.rou_code%TYPE
)
RETURN VARCHAR2;

FUNCTION DO_ROU_EXISTS_FUNC(
  p_rou_code IN routes.rou_code%TYPE
)
RETURN BOOLEAN;

END ROU_PACK;
/