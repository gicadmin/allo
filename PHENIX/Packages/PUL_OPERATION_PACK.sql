CREATE OR REPLACE PACKAGE phenix.PUL_OPERATION_PACK AS

FUNCTION CHECK_MODULE_FUNC(
  p_pul_menu_name        IN phenix_user_locks.pul_menu_name%TYPE,
  p_pul_whs_picking_code IN phenix_user_locks.pul_whs_picking_code%TYPE
)
RETURN BOOLEAN;

FUNCTION CHECK_MODULE_FUNC(
  p_pul_menu_name IN phenix_user_locks.pul_menu_name%TYPE,
  p_pul_rou_code  IN phenix_user_locks.pul_rou_code%TYPE
)
RETURN BOOLEAN;

END PUL_OPERATION_PACK;
/