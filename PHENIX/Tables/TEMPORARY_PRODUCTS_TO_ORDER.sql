CREATE GLOBAL TEMPORARY TABLE phenix.temporary_products_to_order (
  tpto_prd_code VARCHAR2(10 BYTE),
  tpto_prd_description VARCHAR2(45 BYTE),
  tpto_prd_definition VARCHAR2(1 BYTE),
  tpto_prd_special_order_switch NUMBER(1),
  tpto_prd_season_start DATE,
  tpto_prd_season_end DATE,
  tpto_prd_availability_date DATE,
  tpto_brn_description VARCHAR2(30 BYTE),
  tpto_prd_ven_code NUMBER(5),
  tpto_prd_ven_name VARCHAR2(30 BYTE),
  tpto_prf_description VARCHAR2(30 BYTE),
  tpto_prf_conversion_to_base NUMBER,
  tpto_ven_use_code NUMBER(5),
  tpto_ven_use_name VARCHAR2(65 BYTE),
  tpto_pod_prf_fmt_code VARCHAR2(7 BYTE),
  tpto_pod_fmt_short_code VARCHAR2(2 BYTE),
  tpto_pwi_whs_code VARCHAR2(2 BYTE),
  tpto_vwh_ship_days NUMBER,
  tpto_qty_min NUMBER,
  tpto_qty_available NUMBER,
  tpto_qty_order NUMBER,
  tpto_qty_order_by_customer NUMBER,
  tpto_qty_in_inventory NUMBER,
  tpto_average NUMBER,
  tpto_cycle_order_date DATE,
  tpto_today_delivery_date DATE,
  tpto_cycle_delivery_date DATE,
  tpto_customer_delivery_date DATE,
  tpto_sales_days NUMBER,
  tpto_sales_days_per_week NUMBER,
  tpto_cycle_purchase_days NUMBER
)
ON COMMIT PRESERVE ROWS;