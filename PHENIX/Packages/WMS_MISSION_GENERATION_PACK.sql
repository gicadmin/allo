CREATE OR REPLACE PACKAGE phenix.WMS_MISSION_GENERATION_PACK IS

FUNCTION GENERATE_REGULAR_FUNC(	--ni comptoir... ni endommagé
	p_log_id 						IN NUMBER,
	p_date_livraison 		IN DATE,
	p_whs_picking_code 	IN VARCHAR2,
	p_whs_delivery_code IN VARCHAR2,
	p_use_language			IN VARCHAR2,
	p_error_code 				OUT NUMBER,
	p_error_message 		OUT VARCHAR2
)
RETURN BOOLEAN;

FUNCTION GENERATE_COUNTER_FUNC(
	p_log_id 						IN NUMBER,
	p_plh_id						IN NUMBER,
	p_date_livraison 		IN DATE,
	p_whs_picking_code 	IN VARCHAR2,
	p_whs_delivery_code IN VARCHAR2,
	p_use_language			IN VARCHAR2,
	p_error_code 				OUT NUMBER,
	p_error_message 		OUT VARCHAR2
)
RETURN BOOLEAN;

FUNCTION GENERATE_SECOND_WAVE_FUNC(
	p_date_livraison 		IN DATE,
	p_whs_picking_code 	IN VARCHAR2,
	p_whs_delivery_code IN VARCHAR2,
	p_use_language			IN VARCHAR2,
	p_error_code 				OUT NUMBER,
	p_error_message 		OUT VARCHAR2
)
RETURN BOOLEAN;

FUNCTION GENERATE_THE_REST_FUNC (
  p_log_id             IN NUMBER,
  p_date_livraison     IN DATE,
  p_whs_picking_code   IN VARCHAR2,
  p_whs_delivery_code  IN VARCHAR2,
  p_use_language       IN VARCHAR2,
  p_error_code         OUT NUMBER,
  p_error_message      OUT VARCHAR2
)
RETURN PLS_INTEGER;

END WMS_MISSION_GENERATION_PACK;
/