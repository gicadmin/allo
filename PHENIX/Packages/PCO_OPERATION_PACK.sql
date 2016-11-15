CREATE OR REPLACE PACKAGE phenix.PCO_OPERATION_PACK IS

--fonction pour trouver le volume cueilli sur une palette
FUNCTION FIND_PCO_VOLUME_PICKED_FUNC(
  p_pco_id IN pallet_consolidations.pco_id%TYPE
)
RETURN NUMBER;

--ber3036 valider si le client est déjà chargé pour la route du jour
FUNCTION IS_CUS_ALREADY_CHARGED_FUNC(
  p_rou_type    IN VARCHAR2,
  p_route_date  IN DATE,
  p_cus_code    IN NUMBER
)
RETURN BOOLEAN;

--ber3036 valider si un client est déjà sur des palettes, mélanger avec d'autres clients, pour une route/date donnée
FUNCTION IS_CUS_ALONE_ON_PALLET_FUNC(
  p_rou_type    IN VARCHAR2,
  p_route_date  IN DATE,
  p_cus_code    IN NUMBER
)
RETURN BOOLEAN;

--Trouver le nombre maximum de colis permis pour un client sur une palette
PROCEDURE FIND_MAX_PACKAGES_PER_CUS_PROC(
  p_pco_id            IN pallet_consolidations.pco_id%TYPE,
  p_cus_code          IN customers.cus_code%TYPE,
  p_pmh_id_to_update  OUT NUMBER,
  p_max_packages      OUT NUMBER
);

--Mettre "complété" les missions d'un client sur une palette spécifique
PROCEDURE SET_COMPLET_CUS_ON_PALLET_PROC(
  p_pco_id    IN pallet_consolidations.pco_id%TYPE,
  p_cus_code  IN pick_mission_headers.pmh_cus_code%TYPE,
  p_pmh_id    IN pick_mission_headers.pmh_id%TYPE,
  p_use_code  IN users.use_code%TYPE
);

--fonction pour trouver le quai d'expédition et son code de validation de la porte
PROCEDURE FIND_DOCK_FROM_PCO_PROC(
  p_pco_id                IN pallet_consolidations.pco_id%TYPE,
  p_dock_code             OUT VARCHAR2,
  p_loc_validation_code   OUT VARCHAR2,
  p_door_validation_code  OUT VARCHAR2
);

--Fonction utilisée pour fermer une palette de cueillette
FUNCTION CLOSE_PCO_FUNC(
  p_pco_id         IN   NUMBER,
  p_use_code       IN   NUMBER,
  p_language_flag  IN   VARCHAR2,
  p_vocal_switch   IN   NUMBER,
  p_error_code     OUT  NUMBER,
  p_error_message  OUT  VARCHAR2
)
RETURN PLS_INTEGER;

-- Vérifier si une palette peut être chargée
FUNCTION IS_PCO_READY_TO_LOAD_FUNC(
  p_pco_id         IN pallet_consolidations.pco_id%TYPE,
  p_rsh_id         IN route_shipments.rsh_id%TYPE,
  p_use_whs_code   IN users.use_whs_code%TYPE,
  p_language_flag  IN VARCHAR2,
  p_vocal_switch   IN NUMBER,
  p_pal_code       OUT pallet_types.pal_code%TYPE,
  p_error_code     OUT NUMBER,
  p_error_message  OUT VARCHAR2
)
RETURN PLS_INTEGER;

-- Mettre à jour le type d'une palette
PROCEDURE SET_PCO_PAL_CODE_PROC(
  p_pco_id   IN pallet_consolidations.pco_id%TYPE,
  p_pal_code IN pallet_types.pal_code%TYPE,
  p_use_code IN users.use_code%TYPE
);

-- Charger une palette dans le camion
FUNCTION LOAD_PCO_ON_RSH_FUNC(
  p_rsh_id            IN route_shipments.rsh_id%TYPE,
  p_pco_id            IN pallet_consolidations.pco_id%TYPE,
  p_use_code          IN users.use_code%TYPE,
  p_use_whs_code      IN users.use_whs_code%TYPE,
  p_position_in_truck IN NUMBER,
  p_language_flag     IN VARCHAR2,
  p_vocal_switch      IN NUMBER,
  p_error_code        OUT NUMBER,
  p_error_message     OUT VARCHAR2
)
RETURN PLS_INTEGER;

-- Créer une palette de transport (sans lien avec un chargement)
FUNCTION CREATE_TRANSPORT_FUNC(
  p_rou_code          IN pallet_consolidations.pco_rdh_rou_code%TYPE,
  p_route_date        IN pallet_consolidations.pco_rdh_route_date%TYPE,
  p_min_position      IN pallet_consolidations.pco_transport_min_position%TYPE,
  p_max_position      IN pallet_consolidations.pco_transport_max_position%TYPE,
  p_whs_code          IN pallet_consolidations.pco_whs_picking_code%TYPE,
  p_use_code          IN pallet_consolidations.pco_use_picker_code%TYPE,
  p_pal_code          IN pallet_consolidations.pco_pal_code%TYPE,
  p_whz_code          IN pallet_consolidations.pco_whz_code%TYPE,
  p_language_flag     IN VARCHAR2,
  p_vocal_switch      IN NUMBER,
  p_pco_id            OUT pallet_consolidations.pco_id%TYPE,
  p_error_code        OUT NUMBER,
  p_error_message     OUT VARCHAR2
)
RETURN PLS_INTEGER;

-- Décharger une palette
FUNCTION UNLOAD_PCO_FROM_RSH_FUNC(
  p_rsh_id            IN route_shipments.rsh_id%TYPE,
  p_pco_id            IN pallet_consolidations.pco_id%TYPE,
  p_use_code          IN users.use_code%TYPE,
  p_use_whs_code      IN users.use_whs_code%TYPE,
  p_language_flag     IN VARCHAR2,
  p_vocal_switch      IN NUMBER,
  p_error_code        OUT NUMBER,
  p_error_message     OUT VARCHAR2
)
RETURN PLS_INTEGER;

-- Retourner les éléments concernant les palettes/missions/etc non chargés
FUNCTION GET_ITEMS_NOT_CHARGED_FUNC(
  p_pco_rdh_route_date IN pallet_consolidations.pco_rdh_route_date%TYPE,
  p_pco_rdh_rou_code   IN pallet_consolidations.pco_rdh_rou_code%TYPE,
  p_rsh_shipment_type  IN route_shipments.rsh_shipment_type%TYPE,
  p_use_whs_code       IN users.use_whs_code%TYPE,
  p_count_pco          OUT NUMBER,
  p_count_pmh          OUT NUMBER,
  p_count_osm          OUT NUMBER,
  p_count_plh          OUT NUMBER
)
RETURN NUMBER;

--BER3393 Vérifier si toutes les missions de la palette sont fermées
FUNCTION IS_PCO_ALL_PMH_CLOSED_FUNC(
  p_pco_id IN pallet_consolidations.pco_id%TYPE
)
RETURN BOOLEAN;

-- Vérifier si des palettes non fermées existent pour le regroupement spécifié
FUNCTION IS_PCO_NOT_CLOSED_FOR_RGC_FUNC(
  p_rou_code IN  routes.rou_code%TYPE,
  p_rgc_code IN  route_grouping_codes.rgc_code%TYPE,
  p_pco_id   OUT pallet_consolidations.pco_id%TYPE
)
RETURN BOOLEAN;

FUNCTION CHECK_PICK_STATUS_IF_CLS_FUNC(
  p_pco_whs_picking_code       IN pallet_consolidations.pco_whs_picking_code%TYPE,
  p_pco_whs_delivery_code      IN pallet_consolidations.pco_whs_delivery_code%TYPE,
  p_whs_auto_close_transit_swi IN warehouses.whs_auto_close_transit_switch%TYPE DEFAULT NULL
)
RETURN VARCHAR2;

PROCEDURE TRANSFER_PALLET_PROC(
  p_pco_from IN pallet_consolidations.pco_id%TYPE,
  p_pco_to   IN pallet_consolidations.pco_id%TYPE
);

FUNCTION IS_PALLET_SHORTED_FUNC(
  p_pco_id IN pallet_consolidations.pco_id%TYPE
)
RETURN BOOLEAN;

FUNCTION GET_PCO_LOAD_STATUS_FUNC(
  p_pco_id          IN pallet_consolidations.pco_id%TYPE,
  p_pco_pick_status IN pallet_consolidations.pco_pick_status%TYPE
)
RETURN VARCHAR2;

FUNCTION IS_PCO_EXIST_ON_ROUTE_RSH_FUNC(
  p_pco_route_rsh_id IN pallet_consolidations.pco_route_rsh_id%TYPE
)
RETURN BOOLEAN;

FUNCTION IS_PCO_EXIST_ON_TRUCK_RSH_FUNC(
  p_pco_truck_rsh_id IN pallet_consolidations.pco_truck_rsh_id%TYPE
)
RETURN BOOLEAN;

FUNCTION LOCK_PCO_FUNC(
  p_pco_id IN pallet_consolidations.pco_id%TYPE
)
RETURN BOOLEAN;

FUNCTION LOCK_PCO_TRANSPORT_FUNC(
  p_pco_id IN pallet_consolidations.pco_id%TYPE
)
RETURN BOOLEAN;

PROCEDURE RELEASE_PCO_PROC(
  p_pco_id IN pallet_consolidations.pco_id%TYPE
);

PROCEDURE RELEASE_PCO_TRANSPORT_PROC(
  p_pco_id IN pallet_consolidations.pco_id%TYPE
);

FUNCTION GET_FULL_VOCAL_FUNC(
  p_pco_id  IN NUMBER,
  p_pco_rec OUT NOCOPY pallet_consolidations%ROWTYPE
)
RETURN BOOLEAN;

PROCEDURE LOCK_PALLET_PROC(
  p_pco_id        IN NUMBER,
  p_use_code      IN NUMBER,
  p_whs_code      IN VARCHAR2,
  p_vocal_switch  IN NUMBER,
  p_pco_true_id   OUT NUMBER
);

PROCEDURE RELEASE_PALLET_PROC(
  p_pco_id   IN pallet_consolidations.pco_id%TYPE,
  p_use_code IN users.use_code%TYPE
);

FUNCTION FORMAT_PCO_ID_FOR_VOCAL_FUNC(
  p_pco_id IN pallet_consolidations.pco_id%TYPE
)
RETURN NUMBER;

FUNCTION FIND_NB_OF_PAL_PER_WHZ_FUNC(
  p_pco_rdh_route_date IN pallet_consolidations.pco_rdh_route_date%TYPE,
  p_pco_rdh_rou_code    IN pallet_consolidations.pco_rdh_rou_code%TYPE,
  p_pco_whz_code        IN pallet_consolidations.pco_whz_code%TYPE
)
RETURN NUMBER;

PROCEDURE TAG_TO_TRANSFER_CUS_MISS_PROC (
  p_cus_code    IN customers.cus_code%TYPE,
  p_pco_from    IN pallet_consolidations.pco_id%TYPE,
  p_pco_to      IN pallet_consolidations.pco_id%TYPE
);

PROCEDURE CHANGE_ROUTE_PROC(
  p_pco_rdh_route_date   IN pallet_consolidations.pco_rdh_route_date%TYPE,
  p_pco_rdh_rou_code     IN pallet_consolidations.pco_rdh_rou_code%TYPE,
  p_pmh_cus_code         IN pick_mission_headers.pmh_cus_code%TYPE,
  p_new_pco_rdh_rou_code IN pallet_consolidations.pco_rdh_rou_code%TYPE
);

PROCEDURE PURGE_PROC(
  p_pco_id IN pallet_consolidations.pco_id%TYPE
);

PROCEDURE PURGE_PROC(
  p_nb_days_to_keep IN NUMBER,
  p_max_items       IN NUMBER
);

PROCEDURE CHANGE_ROUTE_PROC(
  p_pco_rdh_route_date   IN pallet_consolidations.pco_rdh_route_date%TYPE,
  p_pmh_cus_code         IN pick_mission_headers.pmh_cus_code%TYPE,
  p_rou_type             IN routes.rou_type%TYPE,
  p_new_pco_rdh_rou_code IN pallet_consolidations.pco_rdh_rou_code%TYPE
);

END PCO_OPERATION_PACK;
/