CREATE OR REPLACE PACKAGE phenix.WMS_FIND_PACK IS

FUNCTION FIND_IDENT_CONTAIN_FUNC(
  p_ident          IN      NUMBER,
  p_language_flag  IN      VARCHAR2,
  p_flag           OUT     VARCHAR2,
  p_prd_code       OUT     VARCHAR2,
  p_fmt_code       OUT     VARCHAR2,
  p_twin_c         OUT     NUMBER,
  p_nbr_cases      OUT     NUMBER,
  p_expiry_date    OUT     DATE,
  p_fifo_date      OUT     DATE, -- GIC3396
  p_loc_act        OUT     VARCHAR2,
  p_loc_dest       OUT     VARCHAR2,
  p_pick_miss      OUT     NUMBER,
  p_cus            OUT     NUMBER,
  p_ven            OUT     NUMBER,
  p_error_code     OUT     NUMBER
)
RETURN PLS_INTEGER;

FUNCTION FIND_MISSION_FUNC(
  p_loc             IN    VARCHAR2,
  p_use_code        IN    VARCHAR2,
  p_language_flag   IN    VARCHAR2,
  p_voc_switch      IN    VARCHAR2,
  p_pick_miss       OUT   NUMBER,
  p_error_code      OUT   NUMBER,
  p_whz_code        IN    VARCHAR2 DEFAULT NULL,
  p_hour            IN    NUMBER DEFAULT NULL,
  p_minute          IN    NUMBER DEFAULT NULL,
  p_cus_code        IN    NUMBER DEFAULT NULL,
  p_ven_code        IN    NUMBER DEFAULT NULL
)
RETURN PLS_INTEGER;

FUNCTION FIND_MISSION_STARTED_FUNC(
  p_user_loc    IN  VARCHAR2,
  p_use_code    IN  NUMBER,
  p_voc_switch  IN  NUMBER
)
RETURN NUMBER;

FUNCTION FIND_SAME_LOC_WAREHOUSE_FUNC(--GIC2866
  p_prf_prd_code      IN VARCHAR2,
  p_prf_fmt_code      IN VARCHAR2,
  p_whs_code          IN VARCHAR2  DEFAULT NULL,
  p_loc_code          IN VARCHAR2  DEFAULT NULL
)
RETURN NUMBER;

FUNCTION FIND_PALLET_FUNC(
  p_whz_code           IN warehouse_zones.whz_code%TYPE,
  p_use_code           IN users.use_code%TYPE,
  p_whs_code           IN warehouses.whs_code%TYPE,
  p_overstock_switch   IN NUMBER,
  p_vocal_switch       IN NUMBER
)
RETURN pallet_consolidations.pco_id%TYPE;

--BER3393 Retourne une mission à traiter lorsque la palette est cueillie séparément par missions
FUNCTION FIND_MISSION_FOR_PALLET_FUNC(
  p_pco_id        IN  pallet_consolidations.pco_id%TYPE,
  p_use_code      IN  users.use_code%TYPE,
  p_whs_code      IN  warehouses.whs_code%TYPE,
  p_vocal_switch  IN  NUMBER
)
RETURN pick_mission_headers.pmh_id%TYPE;

PROCEDURE SKIP_MISSION_PROC(
  p_usm_pmh_id   IN user_skipped_missions.usm_pmh_id%TYPE,
  p_usm_use_code IN user_skipped_missions.usm_use_code%TYPE
);

PROCEDURE DELETE_SKIPPED_MISSIONS_PROC(
  p_usm_use_code IN user_skipped_missions.usm_use_code%TYPE
);

END WMS_FIND_PACK;
/