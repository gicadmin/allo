CREATE OR REPLACE PACKAGE phenix.PLH_PACK IS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  pick_list_headers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_plh_id                         IN         pick_list_headers.plh_id%TYPE,
  p_plh_rec                        OUT NOCOPY pick_list_headers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_plh_id                         IN         pick_list_headers.plh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_plh_id                         IN         pick_list_headers.plh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_plh_id                         IN         pick_list_headers.plh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_plh_id                         IN         pick_list_headers.plh_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_plh_id                         IN         pick_list_headers.plh_id%TYPE);


FUNCTION INSERT_FUNC(
  p_plh_cus_code                IN         pick_list_headers.plh_cus_code%TYPE,
  p_plh_use_code                IN         pick_list_headers.plh_use_code%TYPE,
  p_plh_date_generated          IN         pick_list_headers.plh_date_generated%TYPE,
  p_plh_include_in_route_switch IN         pick_list_headers.plh_include_in_route_switch%TYPE,
  p_plh_whs_delivery_code       IN         pick_list_headers.plh_whs_delivery_code%TYPE,
  p_plh_whs_picking_code        IN         pick_list_headers.plh_whs_picking_code%TYPE,
  p_plh_delivery_rou_code       IN         pick_list_headers.plh_delivery_rou_code%TYPE            DEFAULT NULL,
  p_plh_position                IN         pick_list_headers.plh_position%TYPE                     DEFAULT NULL,
  p_plh_picker_use_code         IN         pick_list_headers.plh_picker_use_code%TYPE              DEFAULT NULL,
  p_plh_rou_type                IN         pick_list_headers.plh_rou_type%TYPE                     DEFAULT NULL,
  p_plh_number_of_packages      IN         pick_list_headers.plh_number_of_packages%TYPE           DEFAULT NULL,
  p_plh_loc_shipping_dock_code  IN         pick_list_headers.plh_loc_shipping_dock_code%TYPE       DEFAULT NULL,
  p_plh_date_printed            IN         pick_list_headers.plh_date_printed%TYPE                 DEFAULT SYSDATE ,
  p_plh_status                  IN         pick_list_headers.plh_status%TYPE                       DEFAULT 'IPR' ,
  p_plh_shorts_checked_switch   IN         pick_list_headers.plh_shorts_checked_switch%TYPE        DEFAULT 1 )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY pick_list_headers%ROWTYPE)
RETURN NUMBER;


FUNCTION GET_PLH_ID_FUNC
RETURN NUMBER;

FUNCTION GET_FULL_PLH_BY_ID_FUNC(
	p_plh_id 			IN pick_list_headers.plh_id%TYPE,
	p_plh_record	OUT pick_list_headers%ROWTYPE
)
RETURN BOOLEAN;

FUNCTION LOCK_PLH_FUNC(
	p_plh_id 			IN pick_list_headers.plh_id%TYPE
)
RETURN BOOLEAN;

PROCEDURE INSERT_PLH_PROC(
	p_plh_id                       	IN pick_list_headers.plh_id%TYPE,
	p_plh_cus_code                 	IN pick_list_headers.plh_cus_code%TYPE,
	p_plh_use_code                 	IN pick_list_headers.plh_use_code%TYPE,
	p_plh_date_generated           	IN pick_list_headers.plh_date_generated%TYPE,       --date de livraison (date de route)
	p_plh_status                   	IN pick_list_headers.plh_status%TYPE,
	p_plh_whs_delivery_code        	IN pick_list_headers.plh_whs_delivery_code%TYPE,
	p_plh_whs_picking_code         	IN pick_list_headers.plh_whs_picking_code%TYPE,
	p_plh_loc_shipping_dock_code   	IN pick_list_headers.plh_loc_shipping_dock_code%TYPE,
	p_plh_include_in_route_switch  	IN pick_list_headers.plh_include_in_route_switch%TYPE,
	p_plh_delivery_rou_code        	IN pick_list_headers.plh_delivery_rou_code%TYPE				DEFAULT NULL,
	p_plh_rou_type                 	IN pick_list_headers.plh_rou_type%TYPE								DEFAULT NULL,
	p_plh_position                 	IN pick_list_headers.plh_position%TYPE								DEFAULT NULL,
	p_plh_date_printed             	IN pick_list_headers.plh_date_printed%TYPE						DEFAULT SYSDATE,	--date de génération
	p_plh_number_of_packages       	IN pick_list_headers.plh_number_of_packages%TYPE			DEFAULT NULL,
	p_plh_picker_use_code          	IN pick_list_headers.plh_picker_use_code%TYPE					DEFAULT NULL,
	p_plh_shorts_checked_switch			IN pick_list_headers.plh_shorts_checked_switch%TYPE		DEFAULT 0	--ber590
);

PROCEDURE UPDATE_PLH_STATUS_PROC(
	p_plh_id 										IN pick_list_headers.plh_id%TYPE,
	p_plh_status 								IN pick_list_headers.plh_status%TYPE,
	p_plh_shorts_checked_switch	IN pick_list_headers.plh_shorts_checked_switch%TYPE DEFAULT NULL		--ber590
);

PROCEDURE UPDATE_PLH_NB_OF_PACKAGES_PROC(
	p_plh_id 									IN pick_list_headers.plh_id%TYPE,
	p_plh_number_of_packages 	IN pick_list_headers.plh_number_of_packages%TYPE
);

--fonction qui valide si un picklist est encore en cueillette/chargement ou pas!
FUNCTION IS_PLH_READY_FUNC(
	p_plh_id 	IN pick_list_headers.plh_id%TYPE
)
RETURN BOOLEAN;

END PLH_PACK;
/