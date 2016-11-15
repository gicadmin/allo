CREATE OR REPLACE PACKAGE phenix.PMH_PACK AS

FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  pick_mission_headers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pmh_id                         IN         pick_mission_headers.pmh_id%TYPE,
  p_pmh_rec                        OUT NOCOPY pick_mission_headers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_pmh_id                         IN         pick_mission_headers.pmh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pmh_id                         IN         pick_mission_headers.pmh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pmh_id                         IN         pick_mission_headers.pmh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pmh_id                         IN         pick_mission_headers.pmh_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pmh_id                         IN         pick_mission_headers.pmh_id%TYPE);

FUNCTION GET_FULL_FUNC(
  p_pmh_container_id               IN         pick_mission_headers.pmh_container_id%TYPE,
  p_pmh_rec                        OUT NOCOPY pick_mission_headers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_pmh_container_id               IN         pick_mission_headers.pmh_container_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pmh_container_id               IN         pick_mission_headers.pmh_container_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pmh_container_id               IN         pick_mission_headers.pmh_container_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pmh_container_id               IN         pick_mission_headers.pmh_container_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pmh_container_id               IN         pick_mission_headers.pmh_container_id%TYPE);


FUNCTION INSERT_FUNC(
  p_pmh_status                     IN         pick_mission_headers.pmh_status%TYPE,
  p_pmh_type                       IN         pick_mission_headers.pmh_type%TYPE,
  p_pmh_whs_picking_code           IN         pick_mission_headers.pmh_whs_picking_code%TYPE,
  p_pmh_whs_delivery_code          IN         pick_mission_headers.pmh_whs_delivery_code%TYPE,
  p_pmh_cus_code                   IN         pick_mission_headers.pmh_cus_code%TYPE                        DEFAULT NULL,
  p_pmh_rou_code                   IN         pick_mission_headers.pmh_rou_code%TYPE                        DEFAULT NULL,
  p_pmh_route_position             IN         pick_mission_headers.pmh_route_position%TYPE                  DEFAULT NULL,
  p_pmh_route_date                 IN         pick_mission_headers.pmh_route_date%TYPE                      DEFAULT NULL,
  p_pmh_whz_code                   IN         pick_mission_headers.pmh_whz_code%TYPE                        DEFAULT NULL,
  p_pmh_use_completion_code        IN         pick_mission_headers.pmh_use_completion_code%TYPE             DEFAULT NULL,
  p_pmh_use_picker_code            IN         pick_mission_headers.pmh_use_picker_code%TYPE                 DEFAULT NULL,
  p_pmh_number_of_packages         IN         pick_mission_headers.pmh_number_of_packages%TYPE              DEFAULT NULL,
  p_pmh_ven_code                   IN         pick_mission_headers.pmh_ven_code%TYPE                        DEFAULT NULL,
  p_pmh_container_reprint_date     IN         pick_mission_headers.pmh_container_reprint_date%TYPE          DEFAULT NULL,
  p_pmh_start_date                 IN         pick_mission_headers.pmh_start_date%TYPE                      DEFAULT NULL,
  p_pmh_container_id               IN         pick_mission_headers.pmh_container_id%TYPE                    DEFAULT NULL,
  p_pmh_container_quantity         IN         pick_mission_headers.pmh_container_quantity%TYPE              DEFAULT NULL,
  p_pmh_pco_id                     IN         pick_mission_headers.pmh_pco_id%TYPE                          DEFAULT NULL,
  p_pmh_prw_whz_code               IN         pick_mission_headers.pmh_prw_whz_code%TYPE                    DEFAULT NULL,
  p_pmh_pco_destination_id         IN         pick_mission_headers.pmh_pco_destination_id%TYPE              DEFAULT NULL,
  p_pmh_pickup_loc_code            IN         pick_mission_headers.pmh_pickup_loc_code%TYPE                 DEFAULT NULL,
  p_pmh_selected_switch            IN         pick_mission_headers.pmh_selected_switch%TYPE                 DEFAULT 0 ,
  p_pmh_counter_switch             IN         pick_mission_headers.pmh_counter_switch%TYPE                  DEFAULT 0 ,
  p_pmh_loaded_on_truck_switch     IN         pick_mission_headers.pmh_loaded_on_truck_switch%TYPE          DEFAULT 0 ,
  p_pmh_overstock_switch           IN         pick_mission_headers.pmh_overstock_switch%TYPE                DEFAULT 0 ,
  p_pmh_pal_mission_complet_swit   IN         pick_mission_headers.pmh_pal_mission_complet_switch%TYPE      DEFAULT 0 ,
  p_pmh_liquidation_switch         IN         pick_mission_headers.pmh_liquidation_switch%TYPE              DEFAULT 0 )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY pick_mission_headers%ROWTYPE)
RETURN NUMBER;

--
-- NE PLUS UTILISER CES PROCEDURES/FONCTIONS ELLE ONT DES EQUIVALENTS DANS LES FONCTIONS STANDARDS
--

FUNCTION GET_PMH_FUNC(
  p_pmh_id      IN NUMBER,
  p_pmh_rec     OUT NOCOPY pick_mission_headers%ROWTYPE
)
RETURN PLS_INTEGER;

-- FONCTIONS ET PROCEDURES A DEPLACER DANS OPERATION PACK..
--
FUNCTION VALIDATE_PMH_EXISTS_FUNC(
  p_pmh_id IN pick_mission_headers.pmh_id%TYPE
)
RETURN NUMBER;

FUNCTION FIND_WHS_PICKING_FROM_LSC_FUNC(
  p_lsc_container_id IN location_shipping_containers.lsc_container_id%TYPE
)
RETURN VARCHAR2;

--ber3036
PROCEDURE UPDATE_PCO_ID_PROC(
  p_pmh_id                  IN pick_mission_headers.pmh_id%TYPE,
  p_pmh_pco_id              IN pick_mission_headers.pmh_pco_id%TYPE
);

--ber3036
PROCEDURE UPDATE_PCO_ID_AND_STATUS_PROC(
  p_pmh_id                  IN pick_mission_headers.pmh_id%TYPE,
  p_pmh_pco_id              IN pick_mission_headers.pmh_pco_id%TYPE
);

FUNCTION FIND_PCO_ID_FUNC(
  p_pmh_id    IN pick_mission_headers.pmh_id%TYPE
)
RETURN NUMBER;

--BER3393 Retourne le nombre de missions existantes pour une palette
FUNCTION COUNT_PMH_FOR_PCO_FUNC(
  p_pmh_pco_id IN pick_mission_headers.pmh_pco_id%TYPE
)
RETURN NUMBER;

--BER3393 Retourne le volume (en mètre cube) d'une mission
FUNCTION GET_PMH_METER_VOLUME_FUNC(
  p_pmh_id IN pick_mission_headers.pmh_id%TYPE
)
RETURN NUMBER;

END PMH_PACK;
/