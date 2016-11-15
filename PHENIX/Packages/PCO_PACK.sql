CREATE OR REPLACE PACKAGE phenix.PCO_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  pallet_consolidations%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_pco_id                         IN         pallet_consolidations.pco_id%TYPE,
  p_pco_rec                        OUT NOCOPY pallet_consolidations%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_pco_id                         IN         pallet_consolidations.pco_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_pco_id                         IN         pallet_consolidations.pco_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_pco_id                         IN         pallet_consolidations.pco_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_pco_id                         IN         pallet_consolidations.pco_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_pco_id                         IN         pallet_consolidations.pco_id%TYPE);


FUNCTION INSERT_FUNC(
  p_pco_type                    IN         pallet_consolidations.pco_type%TYPE,
  p_pco_pick_status             IN         pallet_consolidations.pco_pick_status%TYPE,
  p_pco_load_status             IN         pallet_consolidations.pco_load_status%TYPE,
  p_pco_selected_switch         IN         pallet_consolidations.pco_selected_switch%TYPE,
  p_pco_overstock_switch        IN         pallet_consolidations.pco_overstock_switch%TYPE,
  p_pco_whs_picking_code        IN         pallet_consolidations.pco_whs_picking_code%TYPE,
  p_pco_whs_delivery_code       IN         pallet_consolidations.pco_whs_delivery_code%TYPE,
  p_pco_meter_expected_volume   IN         pallet_consolidations.pco_meter_expected_volume%TYPE,
  p_pco_rdh_route_date          IN         pallet_consolidations.pco_rdh_route_date%TYPE,
  p_pco_rdh_rou_code            IN         pallet_consolidations.pco_rdh_rou_code%TYPE,
  p_pco_pallet_method           IN         pallet_consolidations.pco_pallet_method%TYPE,
  p_pco_whz_code                IN         pallet_consolidations.pco_whz_code%TYPE,
  p_pco_sequence_per_zone       IN         pallet_consolidations.pco_sequence_per_zone%TYPE,
  p_pco_meter_picked_volume     IN         pallet_consolidations.pco_meter_picked_volume%TYPE          DEFAULT NULL,
  p_pco_pal_code                IN         pallet_consolidations.pco_pal_code%TYPE                     DEFAULT NULL,
  p_pco_truck_rsh_id            IN         pallet_consolidations.pco_truck_rsh_id%TYPE                 DEFAULT NULL,
  p_pco_truck_position_in_truck IN         pallet_consolidations.pco_truck_position_in_truck%TYPE      DEFAULT NULL,
  p_pco_truck_level_in_truck    IN         pallet_consolidations.pco_truck_level_in_truck%TYPE         DEFAULT NULL,
  p_pco_route_rsh_id            IN         pallet_consolidations.pco_route_rsh_id%TYPE                 DEFAULT NULL,
  p_pco_route_position_in_truck IN         pallet_consolidations.pco_route_position_in_truck%TYPE      DEFAULT NULL,
  p_pco_route_level_in_truck    IN         pallet_consolidations.pco_route_level_in_truck%TYPE         DEFAULT NULL,
  p_pco_use_picker_code         IN         pallet_consolidations.pco_use_picker_code%TYPE              DEFAULT NULL,
  p_pco_start_date              IN         pallet_consolidations.pco_start_date%TYPE                   DEFAULT NULL,
  p_pco_truck_use_code          IN         pallet_consolidations.pco_truck_use_code%TYPE               DEFAULT NULL,
  p_pco_route_use_code          IN         pallet_consolidations.pco_route_use_code%TYPE               DEFAULT NULL,
  p_pco_transport_min_position  IN         pallet_consolidations.pco_transport_min_position%TYPE       DEFAULT NULL,
  p_pco_transport_max_position  IN         pallet_consolidations.pco_transport_max_position%TYPE       DEFAULT NULL,
  p_pco_use_completion_code     IN         pallet_consolidations.pco_use_completion_code%TYPE          DEFAULT NULL,
  p_pco_transfer_pco_id         IN         pallet_consolidations.pco_transfer_pco_id%TYPE              DEFAULT NULL,
  p_pco_prw_whz_code            IN         pallet_consolidations.pco_prw_whz_code%TYPE                 DEFAULT NULL,
  p_pco_creation_date           IN         pallet_consolidations.pco_creation_date%TYPE                DEFAULT SYSDATE ,
  p_pco_split_by_mission_flag   IN         pallet_consolidations.pco_split_by_mission_flag%TYPE        DEFAULT 'Q' ,
  p_pco_second_wave_switch      IN         pallet_consolidations.pco_second_wave_switch%TYPE           DEFAULT 0                     ,
  p_pco_manual_switch           IN         pallet_consolidations.pco_manual_switch%TYPE                DEFAULT 0 )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY pallet_consolidations%ROWTYPE)
RETURN NUMBER;

-----------------------------------------------------------------------------------------------
-- Ajuster les fonctions / procédures ci-dessous afin de ne plus les utiliser au fil du temps
-- Les fonctions ci-haut doivent être considérées à la place
-- Déplacer les traitements dans un package OPERATION au besoin
-----------------------------------------------------------------------------------------------

FUNCTION IS_PCO_ALREADY_PICKED_FUNC(
	p_pco_rdh_rou_code 		      IN pallet_consolidations.pco_rdh_rou_code%TYPE,
  p_pco_rdh_route_date	      IN OUT pallet_consolidations.pco_rdh_route_date%TYPE,
  p_language_flag             IN VARCHAR2,
  p_vocal_switch              IN NUMBER,
  p_count_pco_rdh_route_date  OUT NUMBER,
  p_error_code                OUT NUMBER,
  p_error_message             OUT VARCHAR2
)
RETURN BOOLEAN;

FUNCTION IS_PCO_RGC_ALREADY_PICKED_FUNC(
	p_rou_rgc_code 		          IN routes.rou_rgc_code%TYPE,
  p_rou_whs_delivery_code     IN routes.rou_whs_delivery_code%TYPE,
  p_pco_rdh_route_date	      IN OUT pallet_consolidations.pco_rdh_route_date%TYPE,
  p_count_pco_rdh_route_date  OUT NUMBER
)
RETURN BOOLEAN;

FUNCTION GET_MAX_PCO_ROUTE_LEVEL_FUNC(
	p_pco_route_rsh_id             IN  pallet_consolidations.pco_route_rsh_id%TYPE,
  p_pco_route_position_in_truck  IN  pallet_consolidations.pco_route_position_in_truck%TYPE
)
RETURN NUMBER;

FUNCTION GET_MAX_PCO_TRUCK_LEVEL_FUNC(
	p_pco_truck_rsh_id             IN  pallet_consolidations.pco_truck_rsh_id%TYPE,
  p_pco_truck_position_in_truck  IN  pallet_consolidations.pco_truck_position_in_truck%TYPE
)
RETURN NUMBER;



END PCO_PACK;
/