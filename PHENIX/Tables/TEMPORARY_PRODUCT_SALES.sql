CREATE GLOBAL TEMPORARY TABLE phenix.temporary_product_sales (
  tps_cus_code NUMBER(10),
  tps_cus_name VARCHAR2(30 BYTE),
  tps_ven_code NUMBER(5),
  tps_ven_name VARCHAR2(30 BYTE),
  tps_cls_code NUMBER(3),
  tps_cls_description VARCHAR2(30 BYTE),
  tps_prd_code VARCHAR2(10 BYTE),
  tps_prd_description VARCHAR2(45 BYTE),
  tps_fmt_code VARCHAR2(7 BYTE),
  tps_prf_description VARCHAR2(30 BYTE),
  tps_brn_description VARCHAR2(15 BYTE),
  tps_sum_quantity_weight NUMBER(15,3),
  tps_count_distinct_product NUMBER(9),
  tps_amount NUMBER(15,3),
  tps_detail_line_switch NUMBER(1),
  tps_fmt_short_code VARCHAR2(2 BYTE),
  tps_prd_special_order_switch NUMBER(1),
  tps_prd_status VARCHAR2(1 BYTE),
  tps_quantity_weight_available NUMBER(10,3),
  tps_week_avg_sales NUMBER(10,3),
  tps_average_inventory_per_week NUMBER(10,3),
  tps_prf_whz_code VARCHAR2(2 BYTE),
  tps_whz_description VARCHAR2(30 BYTE)
)
ON COMMIT PRESERVE ROWS;
COMMENT ON TABLE phenix.temporary_product_sales IS 'Table utilisée pour les quatres rapports de ventes par classes (RAP_VENTE_PAR_CLASSE_PROD...)';
COMMENT ON COLUMN phenix.temporary_product_sales.tps_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.temporary_product_sales.tps_cus_name IS 'Indique le nom du client';
COMMENT ON COLUMN phenix.temporary_product_sales.tps_ven_code IS 'Indique le code du fournisseur/manufacturier';
COMMENT ON COLUMN phenix.temporary_product_sales.tps_ven_name IS 'Indique le nom du fournisseur/manufacturier';
COMMENT ON COLUMN phenix.temporary_product_sales.tps_cls_code IS 'Indique le code de la classe du client';
COMMENT ON COLUMN phenix.temporary_product_sales.tps_cls_description IS 'Indique la description de la classe du client';
COMMENT ON COLUMN phenix.temporary_product_sales.tps_prd_code IS 'Indique le code du produit';
COMMENT ON COLUMN phenix.temporary_product_sales.tps_prd_description IS 'Indique la description du produit';
COMMENT ON COLUMN phenix.temporary_product_sales.tps_fmt_code IS 'Indique le code du format';
COMMENT ON COLUMN phenix.temporary_product_sales.tps_prf_description IS 'Indique l''empaquetage du produit format';
COMMENT ON COLUMN phenix.temporary_product_sales.tps_brn_description IS 'Indique la description de la marque déposée';
COMMENT ON COLUMN phenix.temporary_product_sales.tps_sum_quantity_weight IS 'Indique la somme de quantité/poids';
COMMENT ON COLUMN phenix.temporary_product_sales.tps_count_distinct_product IS 'Indique le nombre de produit distincts concernés';
COMMENT ON COLUMN phenix.temporary_product_sales.tps_amount IS 'Indique le montant de la ligne';
COMMENT ON COLUMN phenix.temporary_product_sales.tps_detail_line_switch IS 'Indique si la ligne est une ligne de détail (dans un sous-select)';
COMMENT ON COLUMN phenix.temporary_product_sales.tps_fmt_short_code IS 'Indique le code du format court';
COMMENT ON COLUMN phenix.temporary_product_sales.tps_prd_special_order_switch IS 'Indique si le produit est une commande spéciale';
COMMENT ON COLUMN phenix.temporary_product_sales.tps_prd_status IS 'Indique le statut du produit';
COMMENT ON COLUMN phenix.temporary_product_sales.tps_quantity_weight_available IS 'Indique la quantité disponible du produit';
COMMENT ON COLUMN phenix.temporary_product_sales.tps_week_avg_sales IS 'Indique la moyenne des ventes par semaine';
COMMENT ON COLUMN phenix.temporary_product_sales.tps_average_inventory_per_week IS 'Indique l''inventaire moyen par semaine';
COMMENT ON COLUMN phenix.temporary_product_sales.tps_prf_whz_code IS 'Indique le code d''entreposage';
COMMENT ON COLUMN phenix.temporary_product_sales.tps_whz_description IS 'Indique la description du code d''entreposage';