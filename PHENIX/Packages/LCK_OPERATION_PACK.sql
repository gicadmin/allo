CREATE OR REPLACE PACKAGE phenix.LCK_OPERATION_PACK AS

FUNCTION LOCK_FUNC(
  p_lck_code        IN locks.lck_code%TYPE,
  p_lck_type        IN locks.lck_type%TYPE,
  p_lck_menu_name   IN locks.lck_menu_name%TYPE,
  p_lck_use_code    IN locks.lck_use_code%TYPE,
  p_lck_handle      OUT locks.lck_handle%TYPE,
  p_lck_name        OUT locks.lck_name%TYPE
)
RETURN NUMBER;

FUNCTION RELEASE_FUNC(
  p_lck_handle  IN locks.lck_handle%TYPE
)
RETURN NUMBER;

FUNCTION GET_LOCK_ALLOCATED_ID_FUNC(
  p_lock_name  IN  VARCHAR2
)
RETURN NUMBER;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_lck_name     IN  locks.lck_name%TYPE,
  p_column_name  IN  VARCHAR2
)
RETURN NUMBER;

FUNCTION RESERVE_LCK_FUNC(
  p_lck_code       IN  locks.lck_code%TYPE,
  p_lck_type       IN  locks.lck_type%TYPE,
  p_lck_use_code   IN  locks.lck_use_code%TYPE,
  p_lck_name       IN  locks.lck_name%TYPE       DEFAULT NULL,
  p_lck_menu_name  IN  locks.lck_menu_name%TYPE  DEFAULT NULL,
  p_lck_handle     IN  locks.lck_handle%TYPE     DEFAULT NULL,
  p_lck_lock_id    IN  locks.lck_lock_id%TYPE    DEFAULT NULL,
  p_lck_method     IN  locks.lck_method%TYPE     DEFAULT NULL,
  p_lck_sid        IN  locks.lck_sid%TYPE        DEFAULT NULL
)
RETURN locks.lck_id%TYPE;

FUNCTION RESERVE_FUNC(
  p_lck_code      IN locks.lck_code%TYPE,
  p_lck_type      IN locks.lck_type%TYPE,
  p_lck_menu_name IN locks.lck_menu_name%TYPE DEFAULT NULL
)
RETURN BOOLEAN;

PROCEDURE RESERVE_PROC(
  p_lck_code      IN locks.lck_code%TYPE,
  p_lck_type      IN locks.lck_type%TYPE,
  p_lck_menu_name IN locks.lck_menu_name%TYPE DEFAULT NULL
);

FUNCTION RELEASE_FUNC(
  p_lck_code      IN locks.lck_code%TYPE,
  p_lck_type      IN locks.lck_type%TYPE,
  p_lck_menu_name IN locks.lck_menu_name%TYPE DEFAULT NULL
)
RETURN BOOLEAN;

PROCEDURE RELEASE_PROC(
  p_lck_code      IN locks.lck_code%TYPE,
  p_lck_type      IN locks.lck_type%TYPE,
  p_lck_menu_name IN locks.lck_menu_name%TYPE DEFAULT NULL
);

PROCEDURE RESERVE_PROC(
  p_lck_code      IN locks.lck_code%TYPE,
  p_lck_type      IN locks.lck_type%TYPE,
  p_lck_use_code  IN locks.lck_use_code%TYPE,
  p_lck_menu_name IN locks.lck_menu_name%TYPE DEFAULT NULL
);

FUNCTION IS_SGE_FUNC(
  p_lck_method  IN locks.lck_method%TYPE
)
RETURN BOOLEAN;

FUNCTION IS_SRV_FUNC(
  p_lck_method  IN locks.lck_method%TYPE
)
RETURN BOOLEAN;

FUNCTION IS_PHX_FUNC(
  p_lck_method  IN locks.lck_method%TYPE
)
RETURN BOOLEAN;

FUNCTION GET_FULL_LCK_FOR_PMH_FUNC(
  p_pmh_id  IN  locks.lck_code%TYPE,
  p_rec_lck OUT locks%ROWTYPE
)
RETURN BOOLEAN;

FUNCTION GET_FULL_LCK_FOR_PMD_FUNC(
  p_pmd_id  IN  locks.lck_code%TYPE,
  p_rec_lck OUT locks%ROWTYPE
)
RETURN BOOLEAN;

FUNCTION IS_MISSION_LCK_FOR_USER_FUNC(
  p_lck_use_code IN locks.lck_use_code%TYPE
)
RETURN BOOLEAN;

FUNCTION IS_OTHER_LCK_FOR_USER_FUNC(
  p_lck_use_code IN locks.lck_use_code%TYPE,
  p_lck_type     IN locks.lck_type%TYPE
)
RETURN BOOLEAN;

FUNCTION IS_OTHER_LCK_FOR_USER_FUNC(
  p_lck_use_code IN locks.lck_use_code%TYPE,
  p_lck_code     IN locks.lck_code%TYPE,
  p_lck_type     IN locks.lck_type%TYPE
)
RETURN BOOLEAN;

FUNCTION IS_LCK_FOR_ANOTHER_USER_FUNC(
  p_lck_code     IN locks.lck_code%TYPE,
  p_lck_type     IN locks.lck_type%TYPE,
  p_lck_use_code IN locks.lck_use_code%TYPE
)
RETURN BOOLEAN;

FUNCTION IS_ANOTHER_LCK_ON_PCO_FUNC(
  p_pco_id       IN pallet_consolidations.pco_id%TYPE,
  p_lck_use_code IN locks.lck_use_code%TYPE
)
RETURN BOOLEAN;

FUNCTION IS_ANOTHER_LCK_ON_PMD_FUNC(
  p_pmd_pmh_id   IN pick_mission_details.pmd_pmh_id%TYPE,
  p_lck_use_code IN locks.lck_use_code%TYPE
)
RETURN BOOLEAN;

FUNCTION GET_ANOTHER_USE_ON_PMD_FUNC(
  p_pmd_pmh_id   IN pick_mission_details.pmd_pmh_id%TYPE,
  p_lck_use_code IN locks.lck_use_code%TYPE
)
RETURN locks.lck_use_code%TYPE;

FUNCTION IS_LCK_FOR_PCO_FUNC(
  p_pco_id IN pallet_consolidations.pco_id%TYPE
)
RETURN BOOLEAN;

FUNCTION GET_LCK_USE_FOR_PCO_FUNC(
  p_pco_id IN pallet_consolidations.pco_id%TYPE
)
RETURN locks.lck_use_code%TYPE;

PROCEDURE GET_LCK_USE_FOR_PCO_PROC(
  p_pco_id       IN  pallet_consolidations.pco_id%TYPE,
  p_lck_use_code OUT locks.lck_use_code%TYPE,
  p_lck_method   OUT locks.lck_method%TYPE
);

PROCEDURE GET_LCK_USE_FOR_PMH_PROC(
  p_pmh_id       IN  pick_mission_headers.pmh_id%TYPE,
  p_lck_use_code OUT locks.lck_use_code%TYPE,
  p_lck_method   OUT locks.lck_method%TYPE
);

FUNCTION IS_OTHER_PCO_FOR_USER_FUNC(
  p_pco_id       IN pallet_consolidations.pco_id%TYPE,
  p_lck_use_code IN locks.lck_use_code%TYPE
)
RETURN BOOLEAN;

FUNCTION GET_PMH_FOR_USER_FUNC(
  p_use_code IN users.use_code%TYPE,
  p_pco_id   IN pallet_consolidations.pco_id%TYPE
)
RETURN pick_mission_headers.pmh_id%TYPE;

PROCEDURE GET_INFO_LCK_PROC(
  p_lck_code      IN  locks.lck_code%TYPE,
  p_lck_type      IN  locks.lck_type%TYPE,
  p_lck_menu_name IN  locks.lck_menu_name%TYPE,
  p_lck_use_code  OUT locks.lck_use_code%TYPE,
  p_lck_method    OUT locks.lck_method%TYPE
);

FUNCTION IS_LOCKED_FUNC(
  p_lck_code IN locks.lck_code%TYPE,
  p_lck_type IN locks.lck_type%TYPE
)
RETURN BOOLEAN;

END LCK_OPERATION_PACK;
/