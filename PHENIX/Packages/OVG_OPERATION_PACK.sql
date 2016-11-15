CREATE OR REPLACE PACKAGE phenix.OVG_OPERATION_PACK IS

PROCEDURE GET_OFFINV_VOL_REB_BY_CUS_PROC(
  p_cus_code               IN NUMBER,
  p_total_sales_amount     IN NUMBER DEFAULT 0,
  p_offinv_vol_reb_amount  OUT NUMBER,
  p_offinv_vol_reb_percent OUT NUMBER
);

PROCEDURE GET_OFFINV_VOL_REB_PROC(
  p_ovg_code               IN NUMBER,
  p_total_sales_amount     IN NUMBER DEFAULT 0,
  p_offinv_vol_reb_amount  OUT NUMBER,
  p_offinv_vol_reb_percent OUT NUMBER
);

END OVG_OPERATION_PACK;
 
/