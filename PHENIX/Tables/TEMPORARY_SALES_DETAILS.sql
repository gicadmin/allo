CREATE GLOBAL TEMPORARY TABLE phenix.temporary_sales_details (
  tsd_fca_period NUMBER(2),
  tsd_fca_year NUMBER(4),
  tsd_cus_code NUMBER(10),
  tsd_cus_name VARCHAR2(30 BYTE),
  tsd_cus_address VARCHAR2(45 BYTE),
  tsd_combined_city_prv_postal VARCHAR2(45 BYTE),
  tsd_cus_use_code NUMBER(5),
  tsd_cus_use_name VARCHAR2(62 BYTE),
  tsd_cgr_code NUMBER(3),
  tsd_cgr_description VARCHAR2(30 BYTE),
  tsd_pgr_code NUMBER(5),
  tsd_pgr_description VARCHAR2(30 BYTE),
  tsd_prd_code VARCHAR2(10 BYTE),
  tsd_prd_description VARCHAR2(45 BYTE),
  tsd_prf_cost_price NUMBER,
  tsd_prf_profit_amount NUMBER,
  tsd_prf_selling_retail NUMBER,
  tsd_prf_fmt_code VARCHAR2(7 BYTE),
  tsd_fmt_short_code VARCHAR2(2 BYTE),
  tsd_prf_description VARCHAR2(30 BYTE),
  tsd_period_qty_weight NUMBER,
  tsd_period_cost NUMBER,
  tsd_period_profit_amount NUMBER,
  tsd_period_sales NUMBER,
  tsd_start_to_cur_qty_wght NUMBER,
  tsd_start_to_cur_cost NUMBER,
  tsd_start_to_cur_profit_amount NUMBER,
  tsd_start_to_cur_sales NUMBER,
  tsd_last_year_cost NUMBER,
  tsd_last_year_profit_amount NUMBER,
  tsd_last_year_sales NUMBER,
  tsd_last_year_start_to_cur_sal NUMBER,
  tsd_fca_week NUMBER(2),
  tsd_cus_cgr_code NUMBER(3),
  tsd_cus_cgr_description VARCHAR2(30 BYTE),
  tsd_cus_ranking VARCHAR2(1 BYTE),
  tsd_cus_deleted_switch NUMBER(1) DEFAULT 0 NOT NULL
)
ON COMMIT PRESERVE ROWS;
COMMENT ON TABLE phenix.temporary_sales_details IS 'Table utilisée pour les rapports RAP_VENTES_DETAILS/PROFIT/PRODUIT';
COMMENT ON COLUMN phenix.temporary_sales_details.tsd_fca_period IS 'Indique la période';
COMMENT ON COLUMN phenix.temporary_sales_details.tsd_fca_year IS 'Indique l''année';
COMMENT ON COLUMN phenix.temporary_sales_details.tsd_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.temporary_sales_details.tsd_cus_name IS 'Indique le nom du client';
COMMENT ON COLUMN phenix.temporary_sales_details.tsd_cus_address IS 'Indique l''adresse du client';
COMMENT ON COLUMN phenix.temporary_sales_details.tsd_combined_city_prv_postal IS 'Indique la ville, province et code postal du client';
COMMENT ON COLUMN phenix.temporary_sales_details.tsd_cus_use_code IS 'Indique le vendeur du client';
COMMENT ON COLUMN phenix.temporary_sales_details.tsd_cus_use_name IS 'Indique le nom du vendeur du client';
COMMENT ON COLUMN phenix.temporary_sales_details.tsd_cgr_code IS 'Indique le groupe du client';
COMMENT ON COLUMN phenix.temporary_sales_details.tsd_cgr_description IS 'Indique la description du groupe de client';
COMMENT ON COLUMN phenix.temporary_sales_details.tsd_pgr_code IS 'Indique le groupe de produit';
COMMENT ON COLUMN phenix.temporary_sales_details.tsd_pgr_description IS 'Indique la description du groupe de produit';
COMMENT ON COLUMN phenix.temporary_sales_details.tsd_prd_code IS 'Indique le code du produit';
COMMENT ON COLUMN phenix.temporary_sales_details.tsd_prd_description IS 'Indique la description du produit';
COMMENT ON COLUMN phenix.temporary_sales_details.tsd_prf_cost_price IS 'Indique le coûtant du produit format';
COMMENT ON COLUMN phenix.temporary_sales_details.tsd_prf_profit_amount IS 'Indique le profit du produit format';
COMMENT ON COLUMN phenix.temporary_sales_details.tsd_prf_selling_retail IS 'Indique le vendant du produit format';
COMMENT ON COLUMN phenix.temporary_sales_details.tsd_prf_fmt_code IS 'Indique le format du produit';
COMMENT ON COLUMN phenix.temporary_sales_details.tsd_prf_description IS 'Indique l''empaquetage du produit format';
COMMENT ON COLUMN phenix.temporary_sales_details.tsd_period_qty_weight IS 'Indique le total de quantité ou poids de la période';
COMMENT ON COLUMN phenix.temporary_sales_details.tsd_period_cost IS 'Indique le total des coûtants de la période';
COMMENT ON COLUMN phenix.temporary_sales_details.tsd_period_profit_amount IS 'Indique le total de profit de la période';
COMMENT ON COLUMN phenix.temporary_sales_details.tsd_period_sales IS 'Indique le total de ventes de la période';
COMMENT ON COLUMN phenix.temporary_sales_details.tsd_start_to_cur_qty_wght IS 'Indique le total de quantité ou poids du début de l''année à la période';
COMMENT ON COLUMN phenix.temporary_sales_details.tsd_start_to_cur_cost IS 'Indique le total des coûtants du début de l''année à la période';
COMMENT ON COLUMN phenix.temporary_sales_details.tsd_start_to_cur_profit_amount IS 'Indique le total de profit du début de l''année à la période';
COMMENT ON COLUMN phenix.temporary_sales_details.tsd_start_to_cur_sales IS 'Indique le total des ventes du début de l''année à la période';
COMMENT ON COLUMN phenix.temporary_sales_details.tsd_last_year_cost IS 'Indique le coûtant de la période de l''année dernière';
COMMENT ON COLUMN phenix.temporary_sales_details.tsd_last_year_profit_amount IS 'Indique le profit de la période de l''année dernière';
COMMENT ON COLUMN phenix.temporary_sales_details.tsd_last_year_sales IS 'Indique les ventes de la période de l''année dernière';
COMMENT ON COLUMN phenix.temporary_sales_details.tsd_last_year_start_to_cur_sal IS 'Indique les ventes du début à la période de l''année dernière';
COMMENT ON COLUMN phenix.temporary_sales_details.tsd_fca_week IS 'Indique le numéro de la semaine';
COMMENT ON COLUMN phenix.temporary_sales_details.tsd_cus_cgr_code IS 'Indique le code de groupe de client';
COMMENT ON COLUMN phenix.temporary_sales_details.tsd_cus_cgr_description IS 'Indique la description du groupe du client';
COMMENT ON COLUMN phenix.temporary_sales_details.tsd_cus_ranking IS 'Indique la Priorité du client';
COMMENT ON COLUMN phenix.temporary_sales_details.tsd_cus_deleted_switch IS 'Indique si le client est actif';