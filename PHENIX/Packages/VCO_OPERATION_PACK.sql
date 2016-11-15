CREATE OR REPLACE PACKAGE phenix.VCO_OPERATION_PACK IS

FUNCTION GET_NBR_LINE_VCO_FUNC
RETURN NUMBER ;

FUNCTION GET_NBR_LINE_FOR_CUS_FUNC(
  p_cus_code  IN validate_customer_orders.vco_coh_cus_code%TYPE
)
RETURN NUMBER;

PROCEDURE GET_SHORTED_LINE_PROC(
  p_vco_id              IN  validate_customer_orders.vco_id%TYPE,
  p_vco_cod_coh_id      OUT validate_customer_orders.vco_cod_coh_id%TYPE,
  p_vco_cod_line_number OUT validate_customer_orders.vco_cod_line_number%TYPE
);

END VCO_OPERATION_PACK;
/