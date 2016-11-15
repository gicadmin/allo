CREATE OR REPLACE PACKAGE phenix.PMH_OPERATION_PACK IS

PROCEDURE UPDATE_NB_OF_PACKAGES_PROC(
  p_pmh_id                  IN  pick_mission_headers.pmh_id%TYPE,
  p_use_code                IN  users.use_code%TYPE,
  p_pmh_number_of_packages  IN  pick_mission_headers.pmh_number_of_packages%TYPE
);

--Fonction utilisée pour fermer une mission de cueillette                                                                                                                            --
FUNCTION CLOSE_PMH_FUNC(   --GIC1797
  p_pmh_id         IN      NUMBER,
  p_use_code       IN      NUMBER,
  p_language_flag  IN      VARCHAR2,
  p_vocal_switch   IN      NUMBER,
  p_error_code     OUT     NUMBER,
  p_error_message  OUT     VARCHAR2,
  p_lsc_loc_code   IN      VARCHAR2  DEFAULT NULL
)
RETURN PLS_INTEGER;

FUNCTION UPDATE_INVENTORY_PMH_FUNC (
	p_pmh_id        IN  NUMBER,
  p_lsc_loc_code  IN  VARCHAR2,
  p_use_code      IN  NUMBER,
  p_language_flag IN  VARCHAR2,
  p_vocal_switch  IN  NUMBER,
  p_error_code    OUT NUMBER,
  p_error_message OUT VARCHAR2
)
RETURN PLS_INTEGER;

FUNCTION UPDATE_PMH_LSC_EMPTY_FUNC(
	p_pmh_id        IN  NUMBER,
  p_vocal_switch  IN  NUMBER,
	p_error_code    OUT NUMBER
)
RETURN PLS_INTEGER;

PROCEDURE PURGE_PROC(
    p_nb_days_to_keep               IN  NUMBER,
    p_max_items                     IN NUMBER
);

FUNCTION LOCK_PMH_FUNC(
  p_pmh_id IN pick_mission_headers.pmh_id%TYPE
)
RETURN BOOLEAN;

PROCEDURE LOCK_PMH_PROC(
  p_pmh_id IN pick_mission_headers.pmh_id%TYPE
);

PROCEDURE LOCK_PMH_PROC(
  p_pmh_id   IN pick_mission_headers.pmh_id%TYPE,
  p_use_code IN users.use_code%TYPE
);

FUNCTION LOCK_ALL_PMH_FOR_PCO_FUNC(
  p_pmh_pco_id IN pick_mission_headers.pmh_pco_id%TYPE
)
RETURN BOOLEAN;

FUNCTION RELEASE_PMH_FUNC(
  p_pmh_id IN pick_mission_headers.pmh_id%TYPE
)
RETURN BOOLEAN;

PROCEDURE RELEASE_PMH_PROC(
  p_pmh_id IN pick_mission_headers.pmh_id%TYPE
);

PROCEDURE RELEASE_ALL_PMH_FOR_PCO_PROC(
  p_pmh_pco_id IN pick_mission_headers.pmh_pco_id%TYPE
);

FUNCTION GET_FULL_VOCAL_FUNC(
  p_pmh_id  IN NUMBER,
  p_pmh_rec OUT NOCOPY pick_mission_headers%ROWTYPE
)
RETURN BOOLEAN;

--BER3393 Retourner les informations reliés à une mission/palette pour une mission venant de la vocal
PROCEDURE GET_PMH_FOR_VOCAL_PROC(
  p_pmh_id_vocal              IN NUMBER,
  p_pmh_id                    OUT pick_mission_headers.pmh_id%TYPE,
  p_pco_id                    OUT pallet_consolidations.pco_id%TYPE,
  p_pco_split_by_mission_flag OUT pallet_consolidations.pco_split_by_mission_flag%TYPE
);

FUNCTION COUNT_PMH_ON_PCO_FUNC(
  p_pmh_pco_id IN pick_mission_headers.pmh_pco_id%TYPE
)
RETURN NUMBER;

FUNCTION FIND_IF_MISSION_ON_GROUND_FUNC(
  p_pmh_id              IN  NUMBER,
  p_pmh_counter_switch  IN  NUMBER
)
RETURN NUMBER;

PROCEDURE LOCK_MISSION_PROC(
  p_pmh_id               IN  NUMBER,
  p_use_code             IN  NUMBER,
  p_whs_code             IN  VARCHAR2,
  p_vocal_switch         IN  NUMBER,
  p_pmh_to_close_switch  OUT NUMBER
);

PROCEDURE LOCK_MISSION_PROC(
  p_pmh_id               IN  NUMBER,
  p_use_code             IN  NUMBER,
  p_whs_code             IN  VARCHAR2,
  p_vocal_switch         IN  NUMBER,
  p_pmh_to_close_switch  OUT NUMBER,
  p_pmh_true_id          OUT NUMBER
);

PROCEDURE SPLIT_PMH_PROC(
  p_pmh_id              IN pick_mission_headers.pmh_id%TYPE,
  p_use_code            IN users.use_code%TYPE,
  p_pmd_sequence_number IN pick_mission_details.pmd_sequence_number%TYPE
);

PROCEDURE RELEASE_PICK_MISSIONS_PROC (
  p_use_code        IN NUMBER,
  p_language_flag   IN VARCHAR2,
  p_vocal_switch    IN NUMBER,
  p_pmh_id          IN NUMBER,  --si NULL, on relàche tout... même les palettes (BER3036)
  p_error_code      OUT NUMBER,
  p_error_message   OUT VARCHAR2
);

FUNCTION GET_PCO_ID_FUNC(
  p_pmh_id IN pick_mission_headers.pmh_id%TYPE
)
RETURN pick_mission_headers.pmh_pco_id%TYPE;

FUNCTION GET_NB_OF_PACKAGES_FUNC(
  p_pmh_id IN pick_mission_headers.pmh_id%TYPE
)
RETURN NUMBER;

FUNCTION GET_NEXT_PICKER_ON_PCO_FUNC(
  p_pco_id IN pallet_consolidations.pco_id%TYPE,
  p_pmh_id IN pick_mission_headers.pmh_id%TYPE
)
RETURN NUMBER;

FUNCTION FORMAT_PMH_ID_FOR_VOCAL_FUNC(
  p_pmh_id IN pick_mission_headers.pmh_id%TYPE
)
RETURN NUMBER;

PROCEDURE UPDATE_PMH_CONTAINER_PROC(
  p_pmh_id                  IN pick_mission_headers.pmh_id%TYPE,
  p_pmh_container_id        IN pick_mission_headers.pmh_container_id%TYPE,
  p_pmh_container_quantity  IN pick_mission_headers.pmh_container_quantity%TYPE
);

FUNCTION DOES_CONTAINER_ID_EXISTS_FUNC(
  p_container_id  IN NUMBER
) RETURN BOOLEAN;

FUNCTION EXIST_WHZ_PRINT_TYPE_FUNC(
  p_pmh_id     IN pick_mission_headers.pmh_id%TYPE,
  p_print_type IN warehouse_zones.whz_print_report_type%TYPE
)
RETURN BOOLEAN;

PROCEDURE SET_PICKUP_LOCATION_PROC(
  p_pmh_id              IN pick_mission_headers.pmh_id%TYPE,
  p_pmh_pickup_loc_code IN pick_mission_headers.pmh_pickup_loc_code%TYPE
);

PROCEDURE SET_PICKUP_LOCATION_PROC(
  p_pmh_pco_id          IN pick_mission_headers.pmh_pco_id%TYPE,
  p_pmh_pickup_loc_code IN pick_mission_headers.pmh_pickup_loc_code%TYPE
);

PROCEDURE FLAG_AS_TO_COLLECT_PROC(
  p_pmh_id IN pick_mission_headers.pmh_id%TYPE
);

PROCEDURE UNFLAG_AS_TO_COLLECT_PROC(
  p_pmh_id IN pick_mission_headers.pmh_id%TYPE
);

PROCEDURE OPEN_COLLECT_PROC(
  p_pmh_id IN pick_mission_headers.pmh_id%TYPE
);

PROCEDURE CLOSE_COLLECT_PROC(
  p_pmh_id IN pick_mission_headers.pmh_id%TYPE
);

PROCEDURE RELEASE_COLLECT_PROC(
  p_reserved_code IN action_required.acr_reserved_code%TYPE
);

END PMH_OPERATION_PACK;
/