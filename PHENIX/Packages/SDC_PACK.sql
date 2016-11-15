CREATE OR REPLACE PACKAGE phenix.SDC_PACK IS

FUNCTION GET_FULL_SDC_FUNC(
  p_sdc_id      IN shipment_delivery_accessories.sdc_id%TYPE,
  p_sdc_record	OUT shipment_delivery_accessories%ROWTYPE
)
RETURN BOOLEAN;

FUNCTION LOCK_SDC_FUNC(
	p_sdc_id IN shipment_delivery_accessories.sdc_id%TYPE
)
RETURN BOOLEAN;

FUNCTION FIND_COLUMN_VALUE_NUMBER_FUNC(
	p_column_name  IN VARCHAR2,
	p_sdc_id 			 IN shipment_delivery_accessories.sdc_id%TYPE
)
RETURN NUMBER;

FUNCTION DO_SDC_EXISTS_FOR_DAC_FUNC(
  p_sdc_dac_code IN shipment_delivery_accessories.sdc_dac_code%TYPE
)
RETURN BOOLEAN;

FUNCTION DO_SDC_EXISTS_FOR_RSH_DAC_FUNC(
  p_sdc_rsh_id   IN  shipment_delivery_accessories.sdc_rsh_id%TYPE,
  p_sdc_dac_code IN  shipment_delivery_accessories.sdc_dac_code%TYPE,
  p_sdc_id       OUT shipment_delivery_accessories.sdc_id%TYPE,
  p_sdc_quantity OUT shipment_delivery_accessories.sdc_quantity%TYPE
)
RETURN BOOLEAN;

PROCEDURE DELETE_SDC_PROC(
	p_sdc_id IN shipment_delivery_accessories.sdc_id%TYPE
);

PROCEDURE UPDATE_SDC_QUANTITY_PROC(
	p_sdc_id           IN shipment_delivery_accessories.sdc_id%TYPE,
  p_new_sdc_quantity IN shipment_delivery_accessories.sdc_id%TYPE
);

PROCEDURE INSERT_SDC_PROC(
	p_sdc_id       IN shipment_delivery_accessories.sdc_id%TYPE,
  p_sdc_rsh_id   IN shipment_delivery_accessories.sdc_rsh_id%TYPE,
  p_sdc_dac_code IN shipment_delivery_accessories.sdc_dac_code%TYPE,
  p_sdc_quantity IN shipment_delivery_accessories.sdc_id%TYPE
);

FUNCTION GET_SDC_ID_FUNC RETURN NUMBER;

FUNCTION DO_SDC_EXISTS_FOR_RSH_FUNC(
  p_sdc_rsh_id IN shipment_delivery_accessories.sdc_rsh_id%TYPE
)
RETURN BOOLEAN;

END SDC_PACK;
/