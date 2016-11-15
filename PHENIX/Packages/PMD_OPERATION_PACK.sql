CREATE OR REPLACE PACKAGE phenix.PMD_OPERATION_PACK IS

--fonction qui met à jour la ligne de pmd existante avec les nouvelle valeurs déduites de qty et insére une nouvelle ligne avec la qty à transférere
FUNCTION UPDATE_PMD_MDP_FUNC(
  p_prf_prd_code       				IN	VARCHAR2,	--indique le code de produit à transférer
  p_prf_fmt_code       				IN	VARCHAR2,	--indique le code de format à transférer
  p_original_pmd_id             	IN  NUMBER,		--indique la ligne de mission originale (de laquelle on soustrait)
  p_original_pmd_qty_picked_left 	IN	NUMBER,		--indique la quantité cueillie à laisser sur la ligne de mission originale (de laquelle on soustrait)
  p_original_pmd_wght_pickd_left	IN	NUMBER,		--indique le poids cueilli à laisser sur la ligne de mission originale (de laquelle on soustrait)
  p_destination_pmh_id				IN 	NUMBER,		--indique le no de mission de destination (sur laquelle on ajoute)
  p_destination_pmd_sequence		IN	NUMBER,		--indique la séquence d'affichage à utiliser pour la nouvelle ligne
  p_destination_pmd_qty_picked		IN	NUMBER,		--indique la quantité cueillie à mettre sur la nouvelle ligne
  p_destination_pmd_qty				IN	NUMBER,		--indique la quantité demandée à mettre sur la nouvelle ligne
  p_destination_pmd_wght_picked		IN	NUMBER,		--indique le poids cueilli à mettre sur la nouvelle ligne
  p_destination_pmd_wght			IN	NUMBER,		--indique le poids demandé à mettre sur la nouvelle ligne
  p_destination_pmd_loc_code		IN	VARCHAR2,	--indique la loc de cueillette originale à mettre sur la nouvelle ligne
  p_destination_pmd_id				OUT	NUMBER		--renvoit le ID de la ligne de mission créée
)
RETURN PLS_INTEGER;

--Fonction utilisée pour mettre la quantité/poids cueilli dans une ligne de mission de cueillette                                          --
FUNCTION UPDATE_PICKED_FUNC(   --GIC1797
  p_pmd_id               IN      NUMBER,
  p_use_code             IN      NUMBER,
  p_pmd_picked_quantity  IN      NUMBER,
  p_pmd_picked_weight    IN      NUMBER,
  p_start_date           IN      DATE DEFAULT SYSDATE,   --GIC2056
  p_language_flag        IN      VARCHAR2,
  p_vocal_switch         IN      NUMBER,
  p_error_code           OUT     NUMBER,
  p_error_message        OUT     VARCHAR2,
  p_pid_container_id     IN      NUMBER   DEFAULT NULL,   --- CSC2799
  p_dest_loc             IN      VARCHAR2 DEFAULT NULL    --- CSC2997
)
RETURN PLS_INTEGER;

PROCEDURE PURGE_PROC(
    p_pmh_id                    IN PICK_MISSION_HEADERS.PMH_ID%type
);

FUNCTION GET_PMD_INFO_FOR_VOLUME_FUNC(
  p_pmh_id            IN  NUMBER,
  p_pmd_volume        IN  NUMBER,
  p_pmd_prf_prd_code  OUT VARCHAR2,
  p_pmd_prf_fmt_code  OUT VARCHAR2
) RETURN BOOLEAN;

FUNCTION COUNT_USE_LOCK_ON_PCO_FUNC(
  p_pco_id IN pick_mission_details.pmd_pmh_pco_id%TYPE
) RETURN NUMBER;

--BER3820 déplacer la procédure ici (utilisé lors des mise en retenue)
--CSC6701 Gérer les missions qui doivent être cueillies lors de la mise en retenue
PROCEDURE FIX_PMD_TO_PICK_RETAIN_PROC (
  p_loc_code      IN pick_mission_details.pmd_loc_code%TYPE,
  p_prf_prd_code  IN pick_mission_details.pmd_prf_prd_code%TYPE,
  p_prf_fmt_code  IN pick_mission_details.pmd_prf_fmt_code%TYPE,
  p_log_id        IN NUMBER
);

FUNCTION LOCK_PMD_FUNC(
  p_pmd_id IN pick_mission_details.pmd_id%TYPE
)
RETURN BOOLEAN;

PROCEDURE LOCK_PMD_PROC(
  p_pmd_id IN pick_mission_details.pmd_id%TYPE
);

FUNCTION LOCK_ALL_PMD_FOR_PMH_FUNC(
  p_pmd_pmh_id IN pick_mission_details.pmd_pmh_id%TYPE
)
RETURN BOOLEAN;

FUNCTION RELEASE_PMD_FUNC(
  p_pmd_id IN pick_mission_details.pmd_id%TYPE
)
RETURN BOOLEAN;

FUNCTION RELEASE_ALL_PMD_FOR_PMH_FUNC(
  p_pmd_pmh_id IN pick_mission_details.pmd_pmh_id%TYPE
)
RETURN BOOLEAN;

PROCEDURE RELEASE_ALL_PMD_FOR_USER_PROC(
  p_pmd_pmh_id IN pick_mission_details.pmd_pmh_id%TYPE,
  p_use_code   IN users.use_code%TYPE
);

FUNCTION IS_ALL_LINES_ARE_PICKED_FUNC(
  p_pmd_pmh_id IN pick_mission_details.pmd_pmh_id%TYPE
)
RETURN BOOLEAN;

FUNCTION IS_ALL_LINES_ARE_PICKED_FUNC(
  p_pmd_pmh_pco_id IN pick_mission_details.pmd_pmh_pco_id%TYPE
)
RETURN BOOLEAN;

FUNCTION IS_PCO_ALREADY_STARTED_FUNC(
  p_pmd_pmh_pco_id IN pick_mission_details.pmd_pmh_pco_id%TYPE
)
RETURN BOOLEAN;

PROCEDURE SET_PMD_SHORTED_SWITCH_PROC(
  p_pmd_id              IN NUMBER,
  p_pmd_shorted_switch  IN NUMBER
);

FUNCTION GET_MAX_SEQUENCE_FUNC(
  p_pmh_id IN pick_mission_headers.pmh_id%TYPE
)
RETURN NUMBER;

FUNCTION LOCK_THE_REST_OF_SPLIT_FUNC(
  p_pmh_id IN pick_mission_headers.pmh_id%TYPE
)
RETURN NUMBER;

PROCEDURE GET_SUM_PICKED_PROC(
  p_pmd_pmh_id        IN pick_mission_details.pmd_pmh_id%TYPE,
  p_sum_qty_picked    OUT NUMBER,
  p_sum_weight_picked OUT NUMBER,
  p_sum_packages      OUT NUMBER
);

FUNCTION COUNT_LINES_FOR_PMH_FUNC(
  p_pmh_id IN NUMBER
)
RETURN NUMBER;

FUNCTION FIND_PMD_IN_PICK_FOR_LOC_FUNC(
  p_pmd_loc_code  IN  pick_mission_details.pmd_loc_code%TYPE,
  p_pmd_pmh_id    OUT pick_mission_details.pmd_pmh_id%TYPE,
  p_lck_use_code  OUT locks.lck_use_code%TYPE
) RETURN NUMBER;

FUNCTION IS_SPLIT_PMH_FUNC(
  p_pmh_id   IN pick_mission_headers.pmh_id%TYPE,
  p_use_code IN users.use_code%TYPE
)
RETURN BOOLEAN;

PROCEDURE UPDATE_PICKED_PROC(
  p_pmd_id              IN pick_mission_details.pmd_id%TYPE,
  p_pmd_quantity_picked IN pick_mission_details.pmd_quantity_picked%TYPE,
  p_pmd_weight_picked   IN pick_mission_details.pmd_weight_picked%TYPE
);

FUNCTION DOES_LOC_USED_FUNC(
  p_loc_code IN locations.loc_code%TYPE
) RETURN BOOLEAN ;

PROCEDURE RELEASE_MISSION_DETAILS_PROC(
  p_pmh_id IN pick_mission_details.pmd_pmh_id%TYPE
);

PROCEDURE RELEASE_PALLET_DETAILS_PROC(
  p_pco_id IN pick_mission_details.pmd_pmh_pco_id%TYPE
);
FUNCTION IS_ROU_ALREADY_STARTED_FUNC(
  p_rou_code    IN pick_mission_headers.pmh_rou_code%TYPE,
  p_route_date  IN pick_mission_headers.pmh_route_date%TYPE
) RETURN BOOLEAN ;

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

FUNCTION EXIST_QUANTITY_QUANTITY_FUNC(
  p_pmh_id  IN pick_mission_details.pmd_pmh_id%TYPE
) RETURN BOOLEAN;

FUNCTION GET_PACKAGES_MISSION_FUNC (
  p_pmh_id IN pick_mission_headers.pmh_id%TYPE
)
RETURN NUMBER;

FUNCTION GET_PACKAGES_PALLET_FUNC (
  p_tpa_temp_pallet_id IN pick_mission_headers.pmh_id%TYPE,
  p_tpa_rou_code       IN pick_mission_headers.PMH_ROU_CODE%TYPE
)
RETURN NUMBER;
END PMD_OPERATION_PACK;
/