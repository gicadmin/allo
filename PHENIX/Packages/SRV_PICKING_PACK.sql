CREATE OR REPLACE PACKAGE phenix.SRV_PICKING_PACK AS

PROCEDURE INSERT_SCA_PROC(
  p_sca_code            IN scales.sca_code %TYPE,
  p_sca_serial          IN scales.sca_serial%TYPE
);

PROCEDURE GET_PMH_FOR_VOCAL_PROC(
  p_pmh_id_vocal              IN  NUMBER,
  p_pmh_id                    OUT pick_mission_headers.pmh_id%TYPE,
  p_pco_id                    OUT pallet_consolidations.pco_id%TYPE,
  p_pco_split_by_mission_flag OUT pallet_consolidations.pco_split_by_mission_flag%TYPE
);

FUNCTION FORMAT_PCO_ID_FOR_VOCAL_FUNC(
  p_pco_id IN pallet_consolidations.pco_id%TYPE
)
RETURN NUMBER;

PROCEDURE LOCK_PMH_PROC(
  p_pmh_id                IN NUMBER,
  p_use_code              IN NUMBER,
  p_vocal_switch          IN NUMBER
);

PROCEDURE LOCK_PCO_PROC(
  p_pco_id                IN NUMBER,
  p_use_code              IN NUMBER,
  p_vocal_switch          IN NUMBER,
  p_pco_true_id           OUT NUMBER
);

PROCEDURE SPLIT_PMH_PROC(
  p_pmh_id              IN pick_mission_headers.pmh_id%TYPE,
  p_use_code            IN users.use_code%TYPE,
  p_pmd_sequence_number IN pick_mission_details.pmd_sequence_number%TYPE
);

PROCEDURE RELEASE_PICK_MISSIONS_PROC(
  p_use_code        IN NUMBER,
  p_language_flag   IN VARCHAR2,
  p_vocal_switch    IN NUMBER,
  p_pmh_id          IN NUMBER,
  p_error_code      OUT NUMBER,
  p_error_message   OUT VARCHAR2
);

PROCEDURE RELEASE_PALLET_PROC(
  p_pco_id   IN pallet_consolidations.pco_id%TYPE,
  p_use_code IN users.use_code%TYPE
);

FUNCTION CLOSE_PMH_FUNC(
  p_pmh_id         IN   NUMBER,
  p_use_code       IN   NUMBER,
  p_language_flag  IN   VARCHAR2,
  p_vocal_switch   IN   NUMBER,
  p_error_code     OUT  NUMBER,
  p_error_message  OUT  VARCHAR2,
  p_lsc_loc_code   IN   VARCHAR2  DEFAULT NULL
)
RETURN PLS_INTEGER;

FUNCTION CLOSE_PCO_FUNC(
  p_pco_id         IN   NUMBER,
  p_use_code       IN   NUMBER,
  p_language_flag  IN   VARCHAR2,
  p_vocal_switch   IN   NUMBER,
  p_error_code     OUT  NUMBER,
  p_error_message  OUT  VARCHAR2
)
RETURN PLS_INTEGER;

FUNCTION FIND_PMD_IN_PICK_FOR_LOC_FUNC(
  p_pmd_loc_code  IN  pick_mission_details.pmd_loc_code%TYPE,
  p_pmd_pmh_id    OUT pick_mission_details.pmd_pmh_id%TYPE,
  p_lck_use_code  OUT locks.lck_use_code%TYPE
) RETURN NUMBER;

PROCEDURE UPDATE_NB_OF_PACKAGES_PROC(
  p_pmh_id                  IN  pick_mission_headers.pmh_id%TYPE,
  p_use_code                IN  users.use_code%TYPE,
  p_pmh_number_of_packages  IN  pick_mission_headers.pmh_number_of_packages%TYPE
);

FUNCTION UPDATE_PICKED_FUNC(
  p_pmd_id               IN      NUMBER,
  p_use_code             IN      NUMBER,
  p_pmd_picked_quantity  IN      NUMBER,
  p_pmd_picked_weight    IN      NUMBER,
  p_start_date           IN      DATE DEFAULT SYSDATE,
  p_language_flag        IN      VARCHAR2,
  p_vocal_switch         IN      NUMBER,
  p_error_code           OUT     NUMBER,
  p_error_message        OUT     VARCHAR2,
  p_pid_container_id     IN      NUMBER   DEFAULT NULL,
  p_dest_loc             IN      VARCHAR2 DEFAULT NULL
)
RETURN PLS_INTEGER;

PROCEDURE SET_PCO_PAL_CODE_PROC(
  p_pco_id   IN pallet_consolidations.pco_id%TYPE,
  p_pal_code IN pallet_types.pal_code%TYPE,
  p_use_code IN users.use_code%TYPE
);

PROCEDURE SET_COMPLET_CUS_ON_PALLET_PROC(
  p_pco_id    IN pallet_consolidations.pco_id%TYPE,
  p_cus_code  IN pick_mission_headers.pmh_cus_code%TYPE,
  p_pmh_id    IN pick_mission_headers.pmh_id%TYPE,
  p_use_code  IN users.use_code%TYPE
);

PROCEDURE INSERT_PICKED_WEIGHT_PROC(
  p_pmd_id         IN  pick_mission_weights.pmw_pmd_id%TYPE,
  p_weight_picked  IN  pick_mission_weights.pmw_weight%TYPE
);

PROCEDURE DELETE_PICKED_WEIGHTS_PROC(
  p_pmd_id IN pick_mission_weights.pmw_pmd_id%TYPE
);

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

FUNCTION FIND_PALLET_FUNC(
  p_whz_code           IN warehouse_zones.whz_code%TYPE,
  p_use_code           IN users.use_code%TYPE,
  p_whs_code           IN warehouses.whs_code%TYPE,
  p_overstock_switch   IN NUMBER,
  p_vocal_switch       IN NUMBER
)
RETURN pallet_consolidations.pco_id%TYPE;

FUNCTION FIND_MISSION_FOR_PALLET_FUNC(
  p_pco_id        IN  pallet_consolidations.pco_id%TYPE,
  p_use_code      IN  users.use_code%TYPE,
  p_vocal_switch  IN  NUMBER
)
RETURN pick_mission_headers.pmh_id%TYPE;

PROCEDURE FIND_DOCK_FROM_PCO_PROC(
  p_pco_id                IN pallet_consolidations.pco_id%TYPE,
  p_dock_code             OUT VARCHAR2,
  p_loc_validation_code   OUT VARCHAR2,
  p_door_validation_code  OUT VARCHAR2
);

PROCEDURE FIND_MAX_PACKAGES_PER_CUS_PROC(
  p_pco_id            IN pallet_consolidations.pco_id%TYPE,
  p_cus_code          IN customers.cus_code%TYPE,
  p_pmh_id_to_update  OUT NUMBER,
  p_max_packages      OUT NUMBER
);

FUNCTION IS_PCO_ALL_PMH_CLOSED_FUNC(
  p_pco_id IN pallet_consolidations.pco_id%TYPE
)
RETURN BOOLEAN;

PROCEDURE PRINT_CONTAINERS_PROC(
  p_pmh_id      IN  NUMBER,
  p_use_code    IN  NUMBER,
  p_prn_code    IN  VARCHAR2
);


PROCEDURE PRINT_PALLET_TICKET_PAPER_PROC(
  p_pco_id               IN NUMBER,
  p_use_code             IN NUMBER,
  p_prn_code             IN VARCHAR2,
  p_print_prd_not_picked IN VARCHAR  DEFAULT 'NO',
  p_language             IN VARCHAR2 DEFAULT 'FR',
  p_pmh_id               IN NUMBER   DEFAULT NULL,
  p_last_pmh_switch      IN NUMBER   DEFAULT 0
);

PROCEDURE PRINT_WRAPPING_STICKERS_PROC (
  p_pmh_id            IN NUMBER,
  p_use_code          IN NUMBER,
  p_printer_code      IN VARCHAR2,
  p_stickers_quantity IN NUMBER
);

PROCEDURE CREATE_TOTE_OUTPUT_PROC(
  p_pmh_id    IN  NUMBER,
  p_tot_code  IN  VARCHAR2,
  p_quantity  IN  NUMBER
);

PROCEDURE CHECK_TOTE_OUTPUT_PROC(
  p_pmh_id IN NUMBER
);

PROCEDURE UPDATE_INSERT_PME_PROC(
  p_pme_pmd_id           IN  pick_mission_exp_dates.pme_pmd_id%TYPE,
  p_pme_expiration_date  IN  pick_mission_exp_dates.pme_expiration_date%TYPE,
  p_pme_quantity         IN  pick_mission_exp_dates.pme_quantity%TYPE
);

FUNCTION DELETE_PME_FOR_PMD_FUNC(
  p_pme_pmd_id IN pick_mission_exp_dates.pme_pmd_id%TYPE
)
RETURN NUMBER;

FUNCTION CREATE_UPT_FUNC(
  p_use_code    IN NUMBER,
  p_whz_code    IN VARCHAR2,
  p_method      IN VARCHAR2,
  p_start_date  IN DATE,
  p_end_date    IN DATE,
  p_upt_type    IN VARCHAR2 DEFAULT 'P'
)
RETURN PLS_INTEGER;

FUNCTION LOCK_THE_REST_OF_SPLIT_FUNC(
  p_pmh_id IN pick_mission_headers.pmh_id%TYPE
)
RETURN NUMBER;

FUNCTION IS_SPLIT_PMH_FUNC(
  p_pmh_id   IN pick_mission_headers.pmh_id%TYPE,
  p_use_code IN users.use_code%TYPE
)
RETURN BOOLEAN;

FUNCTION IS_ALL_LINES_ARE_PICKED_FUNC(
  p_pmd_pmh_id IN pick_mission_details.pmd_pmh_id%TYPE
)
RETURN BOOLEAN;

FUNCTION IS_PCO_ALREADY_STARTED_FUNC(
  p_pmd_pmh_pco_id IN pick_mission_details.pmd_pmh_pco_id%TYPE
)
RETURN BOOLEAN;

FUNCTION FIND_MISSION_STARTED_FUNC(
  p_user_loc    IN  VARCHAR2,
  p_use_code    IN  NUMBER,
  p_voc_switch  IN  NUMBER
)
RETURN NUMBER;

FUNCTION GET_PCO_FOR_VOCAL_FUNC(
  p_pco_id_vocal IN NUMBER
)
RETURN NUMBER;

PROCEDURE RELEASE_PMH_PROC(
  p_pmh_id IN pick_mission_headers.pmh_id%TYPE
);

PROCEDURE LOCK_PMH_PROC(
  p_pmh_id IN pick_mission_headers.pmh_id%TYPE
);

PROCEDURE TAG_TO_TRANSFER_CUS_MISS_PROC (
  p_cus_code IN customers.cus_code%TYPE,
  p_pco_from IN pallet_consolidations.pco_id%TYPE,
  p_pco_to   IN pallet_consolidations.pco_id%TYPE
) ;

FUNCTION LOCK_USER_FUNC(
  p_use_code IN users.use_code%TYPE
)
RETURN BOOLEAN;

FUNCTION RELEASE_USER_FUNC(
  p_use_code IN users.use_code%TYPE
)
RETURN BOOLEAN;

PROCEDURE IS_USER_LOCKED_PROC(
  p_use_code IN users.use_code%TYPE
);

FUNCTION GET_PICKED_PACKAGES_FUNC(
  p_pco_id IN pallet_consolidations.pco_id%TYPE,
  p_pmh_id IN pick_mission_headers.pmh_id%TYPE
)
RETURN NUMBER;

FUNCTION GET_PICKED_PACKAGES_FUNC(
  p_pco_id       IN pallet_consolidations.pco_id%TYPE,
  p_pmh_id       IN pick_mission_headers.pmh_id%TYPE,
  p_pmh_cus_code IN pick_mission_headers.pmh_cus_code%TYPE
)
RETURN NUMBER;

PROCEDURE SET_PICKUP_LOCATION_PROC(
  p_pmh_id              IN pick_mission_headers.pmh_id%TYPE,
  p_pmh_pickup_loc_code IN pick_mission_headers.pmh_pickup_loc_code%TYPE
);

PROCEDURE SET_PICKUP_LOCATION_PROC(
  p_pmh_pco_id          IN pick_mission_headers.pmh_pco_id%TYPE,
  p_pmh_pickup_loc_code IN pick_mission_headers.pmh_pickup_loc_code%TYPE
);

PROCEDURE RESERVE_COLLECT_PROC(
  p_acr_id             IN action_required.acr_id%TYPE,
  p_acr_reserved_code  IN OUT action_required.acr_reserved_code%TYPE
);

PROCEDURE RELEASE_COLLECT_PROC(
  p_reserved_code IN action_required.acr_reserved_code%TYPE
);

END SRV_PICKING_PACK;
/