CREATE OR REPLACE PACKAGE phenix.LSC_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  location_shipping_containers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_lsc_id                         IN         location_shipping_containers.lsc_id%TYPE,
  p_lsc_rec                        OUT NOCOPY location_shipping_containers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_lsc_id                         IN         location_shipping_containers.lsc_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_lsc_id                         IN         location_shipping_containers.lsc_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_lsc_id                         IN         location_shipping_containers.lsc_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_lsc_id                         IN         location_shipping_containers.lsc_id%TYPE);


FUNCTION INSERT_FUNC(
  p_lsc_loc_shipping_dock_code IN         location_shipping_containers.lsc_loc_shipping_dock_code%TYPE,
  p_lsc_pmh_id                 IN         location_shipping_containers.lsc_pmh_id%TYPE,
  p_lsc_container_id           IN         location_shipping_containers.lsc_container_id%TYPE                DEFAULT NULL,
  p_lsc_suffix                 IN         location_shipping_containers.lsc_suffix%TYPE                      DEFAULT NULL,
  p_lsc_loc_code               IN         location_shipping_containers.lsc_loc_code%TYPE                    DEFAULT NULL,
  p_lsc_temp_shh_id            IN         location_shipping_containers.lsc_temp_shh_id%TYPE                 DEFAULT NULL,
  p_lsc_loaded_switch          IN         location_shipping_containers.lsc_loaded_switch%TYPE               DEFAULT 0 ,
  p_lsc_invoiced_switch        IN         location_shipping_containers.lsc_invoiced_switch%TYPE             DEFAULT 0 ,
  p_lsc_selected_switch        IN         location_shipping_containers.lsc_selected_switch%TYPE             DEFAULT 0 )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY location_shipping_containers%ROWTYPE)
RETURN NUMBER;

FUNCTION GET_LSC_ID_FUNC RETURN NUMBER;

FUNCTION GET_FULL_LSC_BY_ID_FUNC(
	p_lsc_id      IN location_shipping_containers.lsc_id%TYPE,
	p_lsc_record	OUT location_shipping_containers%ROWTYPE
)
RETURN BOOLEAN;

FUNCTION GET_FULL_LSC_BY_CONTAINER_FUNC(
	p_lsc_container_id    IN location_shipping_containers.lsc_container_id%TYPE,
	p_lsc_suffix    			IN location_shipping_containers.lsc_suffix%TYPE,
	p_lsc_record					OUT location_shipping_containers%ROWTYPE
)
RETURN BOOLEAN;

FUNCTION LOCK_LSC_BY_ID_FUNC(
	p_lsc_id      IN location_shipping_containers.lsc_id%TYPE
)
RETURN BOOLEAN;

FUNCTION LOCK_LSC_BY_CONTAINER_FUNC(
	p_lsc_container_id    IN location_shipping_containers.lsc_container_id%TYPE,
	p_lsc_suffix    			IN location_shipping_containers.lsc_suffix%TYPE
)
RETURN BOOLEAN;

FUNCTION DOES_LSC_EXISTS_FOR_PMH_FUNC(
	p_pmh_id IN location_shipping_containers.lsc_pmh_id%TYPE
)
RETURN NUMBER;

FUNCTION UPDATE_LSC_FUNC (
	p_pmh_id        	IN  NUMBER ,
  p_lsc_loc_code   	IN  VARCHAR2,
  p_use_code       	IN  NUMBER,
  p_language_flag  	IN  VARCHAR2,
  p_vocal_switch   	IN  NUMBER
)
RETURN PLS_INTEGER;

PROCEDURE DELETE_LSC_BY_PMH_PROC(
	p_pmh_id IN pick_mission_headers.pmh_id%TYPE
);

END LSC_PACK;
/