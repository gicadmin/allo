CREATE OR REPLACE PACKAGE phenix.SALES_INTERFACE_PACK IS

PROCEDURE EXTRACT_ORDERS_PROC(
  p_jsc_id IN NUMBER
);

PROCEDURE INSERT_COURIER_PROC(
  p_coh_id                    IN NUMBER,
  p_cus_code                  IN NUMBER,
  p_cod_project_delivery_date IN DATE,
  p_whs_code                  IN VARCHAR2,  --BER1607
  p_cod_order_source          IN VARCHAR2   --USG720
);

PROCEDURE VALIDATE_QUANTITY_PROC(
  p_log_id                     IN NUMBER,
  p_use_cycle_for_avail_switch IN control.ctr_use_cycle_for_avail_switch%TYPE,
  p_cus_language_flag          IN customers.cus_language_flag%TYPE,
  p_vco_rec                    IN OUT NOCOPY validate_customer_orders%ROWTYPE
);

END SALES_INTERFACE_PACK;
/