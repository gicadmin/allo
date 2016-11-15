CREATE GLOBAL TEMPORARY TABLE phenix.temporary_customer_sales (
  tcs_cus_code NUMBER(10),
  tcs_ven_code NUMBER(5),
  tcs_sale_price_in_for_period NUMBER,
  tcs_sale_price_dr_for_period NUMBER,
  tcs_sale_price_in_for_year NUMBER,
  tcs_sale_price_dr_for_year NUMBER,
  tcs_sale_switch NUMBER,
  tcs_enf_code NUMBER(10),
  tcs_sale_price_in_ly_period NUMBER,
  tcs_sale_price_dr_ly_period NUMBER,
  tcs_sale_price_in_ly_year NUMBER,
  tcs_sale_price_dr_ly_year NUMBER
)
ON COMMIT PRESERVE ROWS;
COMMENT ON TABLE phenix.temporary_customer_sales IS 'Table utilisée pour le rapport du sommaire des ventes par client( incluant ou excluant) les livraisons directes aux détaillants ';
COMMENT ON COLUMN phenix.temporary_customer_sales.tcs_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.temporary_customer_sales.tcs_ven_code IS 'Indique le code du manufacturier';
COMMENT ON COLUMN phenix.temporary_customer_sales.tcs_sale_price_in_for_period IS 'Indique le total des ventes d''entrepôt pour la période';
COMMENT ON COLUMN phenix.temporary_customer_sales.tcs_sale_price_dr_for_period IS 'Indique le total des commandes indirectes pour la période';
COMMENT ON COLUMN phenix.temporary_customer_sales.tcs_sale_price_in_for_year IS 'Indique le total des ventes d''entrepôt pour l''année';
COMMENT ON COLUMN phenix.temporary_customer_sales.tcs_sale_price_dr_for_year IS 'Indique le total des commandes indirectes pour l''année';
COMMENT ON COLUMN phenix.temporary_customer_sales.tcs_sale_switch IS 'Indique si la quantité vendue est égale à 0 (la swich prend la valeur 0) ou différent de 0 (la swich prend la valeur 1)';
COMMENT ON COLUMN phenix.temporary_customer_sales.tcs_enf_code IS 'Indique le code du client qui a pour maisom mère TCS_CUS_CODE';
COMMENT ON COLUMN phenix.temporary_customer_sales.tcs_sale_price_in_ly_period IS 'Indique le total des ventes d''entrepôt pour la période de l''année passée';
COMMENT ON COLUMN phenix.temporary_customer_sales.tcs_sale_price_dr_ly_period IS 'Indique le total des commandes indirectes pour la période de l''année passée';
COMMENT ON COLUMN phenix.temporary_customer_sales.tcs_sale_price_in_ly_year IS 'Indique le total des ventes cumulatives d''entrepôt pour l''année passée';
COMMENT ON COLUMN phenix.temporary_customer_sales.tcs_sale_price_dr_ly_year IS 'Indique le total des commandes indirectes cumulatives pour l''année passée';