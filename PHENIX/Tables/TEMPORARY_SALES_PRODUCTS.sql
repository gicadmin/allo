CREATE GLOBAL TEMPORARY TABLE phenix.temporary_sales_products (
  tsp_cus_code NUMBER(10) NOT NULL,
  tsp_pgr_code NUMBER(5) NOT NULL,
  tsp_pgr_description VARCHAR2(30 BYTE) NOT NULL,
  tsp_prd_code VARCHAR2(10 BYTE) NOT NULL,
  tsp_prd_description VARCHAR2(30 BYTE) NOT NULL,
  tsp_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  tsp_prf_description VARCHAR2(30 BYTE) NOT NULL,
  tsp_fca_period NUMBER(2) NOT NULL,
  tsp_fca_year NUMBER(4) NOT NULL,
  tsp_selling_retail NUMBER(7,2),
  tsp_cost_price NUMBER(7,2),
  tsp_profit NUMBER(7,2),
  tsp_qty_weight NUMBER(10,2),
  tsp_qty_weight_a_date NUMBER(10,2),
  tsp_amount NUMBER(10,2),
  tsp_amount_a_date NUMBER(10,2),
  tsp_amount_last_year NUMBER(10,2),
  tsp_amount_a_date_last_year NUMBER(10,2),
  tsp_cost_amount NUMBER(10,2),
  tsp_cost_amount_a_date NUMBER(10,2)
)
ON COMMIT PRESERVE ROWS;