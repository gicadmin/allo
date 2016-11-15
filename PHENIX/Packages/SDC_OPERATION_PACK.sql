CREATE OR REPLACE PACKAGE phenix.SDC_OPERATION_PACK IS

-- Fonction pour créer des transactions d'accessoires
FUNCTION UPDATE_SHIPMENT_ACC_FUNC(
  p_sdc_rsh_id     IN shipment_delivery_accessories.sdc_rsh_id%TYPE,
  p_sdc_dac_code   IN shipment_delivery_accessories.sdc_dac_code%TYPE,
  p_sdc_quantity   IN shipment_delivery_accessories.sdc_quantity%TYPE,
  p_language_flag  IN VARCHAR2,
  p_vocal_switch   IN NUMBER,
  p_error_code     OUT NUMBER,
  p_error_message  OUT VARCHAR2
)
RETURN PLS_INTEGER;
---------------------------------------------------------

FUNCTION DO_SDC_EXISTS_FOR_RSH_FUNC(
  p_sdc_rsh_id IN shipment_delivery_accessories.sdc_rsh_id%TYPE
)
RETURN BOOLEAN;
-------------------------------------

END SDC_OPERATION_PACK;
/