CREATE OR REPLACE PACKAGE phenix.TSO_OPERATION_PACK IS

PROCEDURE UPDATE_QUANTITY_WEIGHT_PROC(
  p_reset_first_switch IN NUMBER DEFAULT 0 --on ne reset pas si les champs n'ont encore jamais été rempli...
);

PROCEDURE POPULATE_TEMP_SPEC_REL_PROC(
  p_cus_code                IN NUMBER,
  p_cus_open_qth_switch     IN NUMBER,
  p_coh_delivery_type_flag  IN VARCHAR2,
  p_use_language            IN VARCHAR2,
  p_whs_delivery_code       IN VARCHAR2,
  p_cus_qty_code            IN NUMBER,
  p_cus_nac_code            IN NUMBER,
  p_cus_nac_zone            IN NUMBER,
  p_prd_attribute_clause    IN VARCHAR2
);

FUNCTION SPECIAL_ORDER_FOR_CUS_FUNC
RETURN BOOLEAN;

END TSO_OPERATION_PACK;
/