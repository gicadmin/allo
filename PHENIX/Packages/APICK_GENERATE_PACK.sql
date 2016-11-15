CREATE OR REPLACE PACKAGE phenix.APICK_GENERATE_PACK IS

FUNCTION GENERATE_COH_COD_FUNC(
  p_whs_picking_code  IN VARCHAR2,  --ber1436
  p_whs_delivery_code IN VARCHAR2,  --ber1436
  p_use_language      IN VARCHAR2,
  p_error_code        OUT NUMBER,
  p_error_message     OUT VARCHAR2
)
RETURN BOOLEAN;

FUNCTION GENERATE_PICK_FUNC(
  p_date_livraison    IN DATE,
  p_no_sequence       IN NUMBER,
  p_use_code          IN NUMBER,
  p_route_type        IN VARCHAR2,
  p_whs_picking_code  IN VARCHAR2,  --ber1436
  p_whs_delivery_code IN VARCHAR2,  --ber1436
  p_use_language      IN VARCHAR2,
  p_log_id            IN NUMBER,  --gic3414
  p_message_code      OUT NUMBER,
  p_error_code        OUT NUMBER,
  p_error_message     OUT VARCHAR2
)
RETURN BOOLEAN;

END APICK_GENERATE_PACK;
/