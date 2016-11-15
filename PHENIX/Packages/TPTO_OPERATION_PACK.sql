CREATE OR REPLACE PACKAGE phenix.TPTO_OPERATION_PACK AS

PROCEDURE LOAD_TPTO_PROC(
  p_from_ven_use_code     IN vendors.ven_use_code%TYPE,
  p_to_ven_use_code       IN vendors.ven_use_code%TYPE,
  p_special_order_switch  IN products.prd_special_order_switch%TYPE,
  p_whs_code              IN warehouses.whs_code%TYPE,
  p_language              IN VARCHAR2
);

PROCEDURE LOAD_TPTO_PERSO_PROC(
  p_from_ven_use_code     IN vendors.ven_use_code%TYPE,
  p_to_ven_use_code       IN vendors.ven_use_code%TYPE,
  p_special_order_switch  IN products.prd_special_order_switch%TYPE,
  p_whs_code              IN warehouses.whs_code%TYPE,
  p_language              IN VARCHAR2
);

END TPTO_OPERATION_PACK;
/