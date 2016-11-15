CREATE GLOBAL TEMPORARY TABLE phenix.temporary_sales_vendor (
  tsv_cus_code NUMBER(10),
  tsv_cus_name VARCHAR2(30 BYTE),
  tsv_ven_code NUMBER(5),
  tsv_ven_name VARCHAR2(30 BYTE),
  tsv_sale_price_in_for_period NUMBER,
  tvs_sale_price_dr_for_period NUMBER,
  tvs_sale_price_in_for_year NUMBER,
  tvs_sale_price_dr_for_year NUMBER,
  tvs_sale_price_last_year NUMBER
)
ON COMMIT PRESERVE ROWS;
COMMENT ON TABLE phenix.temporary_sales_vendor IS 'Table utilisée pour le rapport de ventes par manufacturier';
COMMENT ON COLUMN phenix.temporary_sales_vendor.tsv_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.temporary_sales_vendor.tsv_cus_name IS 'Indique le nom du client';
COMMENT ON COLUMN phenix.temporary_sales_vendor.tsv_ven_code IS 'Indique le code du manufacturier';
COMMENT ON COLUMN phenix.temporary_sales_vendor.tsv_ven_name IS 'Indique le nom du manufacturier';
COMMENT ON COLUMN phenix.temporary_sales_vendor.tsv_sale_price_in_for_period IS 'Indique le total des ventes d''entrepôt pour la période';
COMMENT ON COLUMN phenix.temporary_sales_vendor.tvs_sale_price_dr_for_period IS 'Indique le total des commandes indirectes pour la période';
COMMENT ON COLUMN phenix.temporary_sales_vendor.tvs_sale_price_in_for_year IS 'Indique le total des ventes d''entrepôt pour l''année';
COMMENT ON COLUMN phenix.temporary_sales_vendor.tvs_sale_price_dr_for_year IS 'Indique le total des commandes indirectes pour l''année';
COMMENT ON COLUMN phenix.temporary_sales_vendor.tvs_sale_price_last_year IS 'Indique le total des ventes d''entrepôt pour l''année dernière';