CREATE OR REPLACE PACKAGE phenix.PUL_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  phenix_user_locks%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pul_id                         IN         phenix_user_locks.pul_id%TYPE,
  p_pul_rec                        OUT NOCOPY phenix_user_locks%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_pul_id                         IN         phenix_user_locks.pul_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pul_id                         IN         phenix_user_locks.pul_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pul_id                         IN         phenix_user_locks.pul_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pul_id                         IN         phenix_user_locks.pul_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pul_id                         IN         phenix_user_locks.pul_id%TYPE);


FUNCTION INSERT_FUNC(
  p_pul_use_code          IN         phenix_user_locks.pul_use_code%TYPE,
  p_pul_sid_id            IN         phenix_user_locks.pul_sid_id%TYPE,
  p_pul_menu_name         IN         phenix_user_locks.pul_menu_name%TYPE,
  p_pul_whs_delivery_code IN         phenix_user_locks.pul_whs_delivery_code%TYPE      DEFAULT NULL,
  p_pul_whs_picking_code  IN         phenix_user_locks.pul_whs_picking_code%TYPE       DEFAULT NULL,
  p_pul_rou_code          IN         phenix_user_locks.pul_rou_code%TYPE               DEFAULT NULL,
  p_pul_creation_date     IN         phenix_user_locks.pul_creation_date%TYPE          DEFAULT SYSDATE )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY phenix_user_locks%ROWTYPE)
RETURN NUMBER;

END PUL_PACK;
/