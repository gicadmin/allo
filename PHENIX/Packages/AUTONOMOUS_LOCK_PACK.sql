CREATE OR REPLACE PACKAGE phenix.AUTONOMOUS_LOCK_PACK IS

FUNCTION TRY_TO_LOCK_PROGRAM_FUNC (
	p_use_code 					IN NUMBER,
	p_sid_id						IN NUMBER,
	p_menu_name					IN VARCHAR2,
	p_validate_whs_code	IN NUMBER   DEFAULT 0,			--0 = on ne valide pas d'entrepot   1 = on valide les 2 entrepots   2 = on valide l'entrepot de cueillette seulement  3 = on valide l'entrepot de livraison seulement
	p_whs_delivery_code	IN VARCHAR2 DEFAULT NULL,	--à remplir selon nécessaire
	p_whs_picking_code	IN VARCHAR2 DEFAULT NULL,	--ber1436
	p_rou_code          IN NUMBER   DEFAULT NULL  --ber3036 le code de route est utilisé seulement lorsqu'on valide l'entrepot de cueillette seulement (pour l'instant du moins)
)
RETURN BOOLEAN;

--fonction utilisé pour essayer de locké un program donné
FUNCTION TRY_TO_DELETE_LOCK_FUNC (
	p_use_code 					IN NUMBER,
	p_sid_id						IN NUMBER,
	p_menu_name					IN VARCHAR2,
	p_validate_whs_code	IN NUMBER   DEFAULT 0,			--0 = on ne valide pas d'entrepot   1 = on valide les 2 entrepots   2 = on valide l'entrepot de cueillette seulement  3 = on valide l'entrepot de livraison seulement
	p_whs_delivery_code	IN VARCHAR2 DEFAULT NULL,	--à remplir selon nécessaire
	p_whs_picking_code	IN VARCHAR2 DEFAULT NULL,	--ber1436 à remplir selon nécessaire
	p_rou_code          IN NUMBER   DEFAULT NULL  --ber3036 le code de route est utilisé seulement lorsqu'on valide l'entrepot de cueillette seulement (pour l'instant du moins)
)
RETURN BOOLEAN;

FUNCTION INSERT_LCK_FUNC(
  p_lck_code       IN  locks.lck_code%TYPE,
  p_lck_type       IN  locks.lck_type%TYPE,
  p_lck_menu_name  IN  locks.lck_menu_name%TYPE,
  p_lck_use_code   IN  locks.lck_use_code%TYPE,
  p_lck_name       IN  locks.lck_name%TYPE,
  p_lck_handle     IN  locks.lck_handle%TYPE,
  p_lck_lock_id    IN  locks.lck_lock_id%TYPE,
  p_lck_method     IN  locks.lck_method%TYPE,
  p_lck_sid        IN  locks.lck_sid%TYPE
)
RETURN NUMBER;

PROCEDURE DELETE_LCK_PROC(
  p_lck_handle  IN  locks.lck_handle%TYPE
);

FUNCTION RESERVE_LCK_FUNC(
  p_lck_code       IN  locks.lck_code%TYPE,
  p_lck_type       IN  locks.lck_type%TYPE,
  p_lck_menu_name  IN  locks.lck_menu_name%TYPE,
  p_lck_use_code   IN  locks.lck_use_code%TYPE,
  p_lck_name       IN  locks.lck_name%TYPE,
  p_lck_handle     IN  locks.lck_handle%TYPE,
  p_lck_lock_id    IN  locks.lck_lock_id%TYPE,
  p_lck_method     IN  locks.lck_method%TYPE,
  p_lck_sid        IN  locks.lck_sid%TYPE
)
RETURN NUMBER;

FUNCTION RELEASE_LCK_FUNC(
  p_lck_code      IN locks.lck_code%TYPE,
  p_lck_type      IN locks.lck_type%TYPE,
  p_lck_menu_name IN locks.lck_menu_name%TYPE DEFAULT NULL
) RETURN BOOLEAN;


FUNCTION FIND_MENU_DELIV_WHS_FUNC(
  p_menu_name           IN VARCHAR2,
  p_whs_delivery_code   IN VARCHAR2
)
RETURN BOOLEAN;

END AUTONOMOUS_LOCK_PACK;
/