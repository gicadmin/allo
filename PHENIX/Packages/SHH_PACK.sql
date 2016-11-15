CREATE OR REPLACE PACKAGE phenix.SHH_PACK IS

FUNCTION GET_SHH_ID_FUNC RETURN NUMBER;

FUNCTION GET_FULL_SHH_BY_ID_FUNC(
	p_shh_id 			IN shipment_headers.shh_id%TYPE,
	p_shh_record	OUT shipment_headers%ROWTYPE
)
RETURN BOOLEAN;

PROCEDURE INSERT_SHH_PROC(
	p_shh_id           				IN shipment_headers.shh_id%TYPE,
	p_shh_date              	IN shipment_headers.shh_date%TYPE,
	p_shh_load_window         IN shipment_headers.shh_load_window%TYPE,
	p_shh_car_code            IN shipment_headers.shh_car_code%TYPE,
	p_shh_trailer_number      IN shipment_headers.shh_trailer_number%TYPE,
	p_shh_loc_code            IN shipment_headers.shh_loc_code%TYPE,
	p_shh_cus_code            IN shipment_headers.shh_cus_code%TYPE,
	p_shh_ven_code            IN shipment_headers.shh_ven_code%TYPE,
	p_shh_temperature         IN shipment_headers.shh_temperature%TYPE,
	p_shh_reference_number    IN shipment_headers.shh_reference_number%TYPE,
	p_shh_in_process_switch   IN shipment_headers.shh_in_process_switch%TYPE
);

PROCEDURE DELETE_SHH_PROC(
	p_shh_id   IN shipment_headers.shh_id%TYPE
);

FUNCTION LOCK_SHH_FUNC(
	p_shh_id   IN shipment_headers.shh_id%TYPE
)
RETURN BOOLEAN;

END SHH_PACK;
 
/