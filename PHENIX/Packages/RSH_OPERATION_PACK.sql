CREATE OR REPLACE PACKAGE phenix.RSH_OPERATION_PACK IS

--Valider si une route est OK pour le chargement final (par route)
FUNCTION IS_ROUTE_RSH_OK_TO_LOAD_FUNC(
  p_rou_code                  IN routes.rou_code%TYPE,
  p_whs_code                  IN warehouses.whs_code%TYPE,
  p_delivery_date             IN OUT DATE,
  p_language_flag             IN VARCHAR2,
  p_vocal_switch              IN NUMBER,
  p_rdh_route_lock_dock_code  OUT route_date_headers.rdh_route_loc_dock_code%TYPE,
  p_loc_door_validation_code  OUT locations.loc_door_validation_code%TYPE,
  p_trk_code                  OUT trucks.trk_code%TYPE,
  p_error_code                OUT NUMBER,
  p_error_message             OUT VARCHAR2
)
RETURN PLS_INTEGER;

--Début du chargement final (par route)
FUNCTION START_OR_JOIN_ROUTE_RSH_FUNC(
  p_rou_code       IN route_date_headers.rdh_rou_code%TYPE,
  p_route_date     IN route_date_headers.rdh_route_date%TYPE,
  p_whs_code       IN warehouses.whs_code%TYPE,
  p_use_code       IN users.use_code%TYPE,
  p_language_flag  IN VARCHAR2,
  p_vocal_switch   IN NUMBER,
  p_rsh_id         OUT route_shipments.rsh_id%TYPE,
  p_error_code     OUT NUMBER,
  p_error_message  OUT VARCHAR2
)
RETURN PLS_INTEGER;

--Début du chargement final par camion (1er chargement)
FUNCTION START_OR_JOIN_TRUCK_RSH_FUNC(
  p_rgc_code                 IN route_grouping_codes.rgc_code%TYPE,
  p_whs_code                 IN warehouses.whs_code%TYPE,
  p_delivery_date            IN DATE,
  p_trk_code                 IN trucks.trk_code%TYPE,
  p_use_code                 IN users.use_code%TYPE,
  p_force_create_trk_switch  IN NUMBER,
  p_language_flag            IN VARCHAR2,
  p_vocal_switch             IN NUMBER,
  p_rsh_id                   OUT route_shipments.rsh_id%TYPE,
  p_error_code               OUT NUMBER,
  p_error_message            OUT VARCHAR2
)
RETURN PLS_INTEGER;

-- Vérifier si un chargement est terminé
FUNCTION IS_RSH_READY_TO_CLOSE_FUNC(
  p_rsh_id         IN route_shipments.rsh_id%TYPE,
  p_use_whs_code   IN users.use_whs_code%TYPE,
  p_language_flag  IN VARCHAR2,
  p_vocal_switch   IN NUMBER,
  p_error_code     OUT NUMBER,
  p_error_message  OUT VARCHAR2
)
RETURN PLS_INTEGER;

-- Fermeture d'un chargement
FUNCTION CLOSE_RSH_FUNC(
  p_rsh_id         IN route_shipments.rsh_id%TYPE,
  p_use_code       IN users.use_code%TYPE,
  p_language_flag  IN VARCHAR2,
  p_vocal_switch   IN NUMBER,
  p_error_code     OUT NUMBER,
  p_error_message  OUT VARCHAR2
)
RETURN PLS_INTEGER;

--Retourne le chargement par camion pour la route et la date de livraison
FUNCTION FIND_RSH_FOR_TRUCK_FUNC(
  p_rsh_rdh_rou_code    IN route_shipments.rsh_rdh_rou_code%TYPE,
  p_rsh_rdh_route_date  IN route_shipments.rsh_rdh_route_date%TYPE
)
RETURN NUMBER;

FUNCTION IS_TKC_EXISTS_FOR_RSH_FUNC(
  p_rsh_tkc_code IN route_shipments.rsh_tkc_code%TYPE
)
RETURN BOOLEAN;

PROCEDURE UPDATE_RSH_TKC_CODE_PROC(
  p_rsh_id       IN route_shipments.rsh_id%TYPE,
  p_rsh_tkc_code IN route_shipments.rsh_tkc_code%TYPE
);

PROCEDURE PURGE_PROC(
  p_nb_days_to_keep IN NUMBER,
  p_max_items       IN NUMBER
);

END RSH_OPERATION_PACK;
/