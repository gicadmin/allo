CREATE TABLE phenix.temporary_multi_products (
  tmp_tch_id NUMBER(15) NOT NULL,
  tmp_prd_code VARCHAR2(10 BYTE) NOT NULL,
  tmp_prd_definition VARCHAR2(1 BYTE) NOT NULL,
  tmp_prd_seasonal_or_regular VARCHAR2(1 BYTE) NOT NULL CONSTRAINT tmp_prd_seasonal_or_regular_ck CHECK (tmp_prd_seasonal_or_regular IN ('R', 'S')),
  tmp_prd_ctg_code NUMBER(5),
  tmp_prd_catalog_sequence_code NUMBER(5),
  tmp_prd_pgr_code NUMBER(5),
  tmp_prd_special_order_switch NUMBER(1) NOT NULL CONSTRAINT tmp_prd_special_order_swi_ck CHECK (tmp_prd_special_order_switch IN (0, 1)),
  tmp_prd_ven_code NUMBER(5),
  tmp_prd_ven_name VARCHAR2(30 BYTE),
  tmp_prd_description VARCHAR2(45 BYTE),
  tmp_prd_availability_date DATE,
  tmp_prd_fmt_weighted_inv_code VARCHAR2(7 BYTE),
  tmp_prd_fmt_solid_inv_code VARCHAR2(7 BYTE),
  tmp_prd_brn_or_manuf VARCHAR2(15 BYTE),
  tmp_ven_purchase_code NUMBER(5),
  tmp_ven_purchase_name VARCHAR2(30 BYTE),
  tmp_vpd_code VARCHAR2(15 BYTE),
  tmp_vpd_list_cost NUMBER(7,2),
  tmp_vpd_prf_fmt_code VARCHAR2(7 BYTE),
  tmp_vpd_purchase_multiple NUMBER(6),
  tmp_vpd_items_per_palette NUMBER(5),
  tmp_vpd_items_per_row NUMBER(3),
  tmp_vpd_vcg_id NUMBER(15),
  tmp_vcg_collected_avr_percent NUMBER(6,3),
  tmp_vcg_quart_warehouse_avr NUMBER(6,3),
  tmp_fmt_short_code VARCHAR2(2 BYTE),
  tmp_displayed_prf_description VARCHAR2(33 BYTE),
  tmp_prf_description VARCHAR2(30 BYTE),
  tmp_prf_conversion_to_base NUMBER(8),
  tmp_prf_volume NUMBER(10,3),
  tmp_prf_inner_weight NUMBER(8,3),
  tmp_prf_converted_purch_weight NUMBER(8,3),
  tmp_best_vpr_end_date DATE,
  tmp_best_vpr_start_date DATE,
  tmp_best_vpr_amount NUMBER,
  tmp_next_cycle_date DATE,
  tmp_promo_for_next_cyc_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT tmp_promo_for_next_cyc_swi_ck CHECK (tmp_promo_for_next_cyc_switch IN (0, 1)),
  tmp_price_ch_next_cyc_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT tmp_price_ch_next_cyc_swi_ck CHECK (tmp_price_ch_next_cyc_switch IN (0, 1)),
  tmp_best_cpr_from_date DATE,
  tmp_best_cpr_to_date DATE,
  tmp_best_cpr_alloc_amount NUMBER,
  tmp_prx_effective_date DATE,
  tmp_prx_cost NUMBER,
  tmp_convert_prd_to_vpd NUMBER,
  tmp_convert_vpd_to_prd NUMBER,
  tmp_start_date_for_stats DATE,
  tmp_current_fiscal_year NUMBER,
  tmp_current_fiscal_period NUMBER,
  tmp_current_fiscal_week NUMBER,
  tmp_days_between_order NUMBER,
  tmp_many_cpr_switch NUMBER DEFAULT 0 NOT NULL CONSTRAINT tmp_many_cpr_swi_ck CHECK (tmp_many_cpr_switch IN (0, 1)),
  tmp_many_vpr_switch NUMBER DEFAULT 0 NOT NULL CONSTRAINT tmp_many_vpr_swi_ck CHECK (tmp_many_vpr_switch IN (0, 1)),
  tmp_prd_message_1 VARCHAR2(100 BYTE),
  tmp_prd_message_2 VARCHAR2(100 BYTE),
  tmp_prd_product_life NUMBER(4),
  tmp_vpd_special_order_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT tmp_vpd_special_order_swi_ck CHECK (tmp_vpd_special_order_switch IN (0, 1)),
  tmp_prd_minimum_reception_days NUMBER(4),
  tmp_prd_lot_control_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT tmp_prd_lot_control_switch_ck CHECK (tmp_prd_lot_control_switch IN (0, 1)),
  tmp_ly_start_date_for_stats DATE,
  tmp_ly_end_date_for_stats DATE,
  tmp_vcg_collected_avr_amount NUMBER(7,2),
  tmp_vcg_collect_distrib_qualif VARCHAR2(2 BYTE),
  tmp_vcg_qurt_whouse_avr_amount NUMBER(7,2),
  tmp_vcg_qualifier VARCHAR2(2 BYTE),
  tmp_prf_liter NUMBER(8,3),
  tmp_prf_purchase_weight_kg NUMBER(8,3),
  tmp_prf_purchase_weight_lb NUMBER(8,3),
  tmp_fmt_code_from_vcg_vendor VARCHAR2(7 BYTE),
  tmp_fmt_conv_from_vcg_vendor NUMBER,
  tmp_pct_rebate_amount NUMBER(7,2),
  CONSTRAINT tmp_pk PRIMARY KEY (tmp_tch_id,tmp_prd_code),
  CONSTRAINT tmp_prd_fk FOREIGN KEY (tmp_prd_code) REFERENCES phenix.products (prd_code) ON DELETE CASCADE,
  CONSTRAINT tmp_tch_fk FOREIGN KEY (tmp_tch_id) REFERENCES phenix.temporary_caps_headers (tch_id) ON DELETE CASCADE
);
COMMENT ON COLUMN phenix.temporary_multi_products.tmp_prd_product_life IS 'Indique la durée de vie du produit exprimée en nombre de jour';
COMMENT ON COLUMN phenix.temporary_multi_products.tmp_vpd_special_order_switch IS 'Indique si le fournisseur doit faire une commande spéciale pour obtenir ce produit';
COMMENT ON COLUMN phenix.temporary_multi_products.tmp_prd_minimum_reception_days IS 'Indique la durée minimale permise entre le jour d''expiration et le jour de réception du produit';
COMMENT ON COLUMN phenix.temporary_multi_products.tmp_prd_lot_control_switch IS 'Indique s''il y a un contrôle des lots à la réception';
COMMENT ON COLUMN phenix.temporary_multi_products.tmp_ly_start_date_for_stats IS 'Indique la date de début des statistiques qui seront affichés à l''écran pour l''année précédente';
COMMENT ON COLUMN phenix.temporary_multi_products.tmp_ly_end_date_for_stats IS 'Indique la date de fin des statistiques qui seront affichés à l''écran pour l''année précédente';
COMMENT ON COLUMN phenix.temporary_multi_products.tmp_vcg_collected_avr_amount IS 'Indique le montant brut de la catégorie du produit';
COMMENT ON COLUMN phenix.temporary_multi_products.tmp_vcg_collect_distrib_qualif IS 'Indique de quelle façon la remise du programme est calculée';
COMMENT ON COLUMN phenix.temporary_multi_products.tmp_vcg_qurt_whouse_avr_amount IS 'Indique le montant de rabais volume trimestriel entrepôt de la catégorie du produit';
COMMENT ON COLUMN phenix.temporary_multi_products.tmp_vcg_qualifier IS 'Indique de quelle façon la remise trimestrielle est calculée';
COMMENT ON COLUMN phenix.temporary_multi_products.tmp_prf_liter IS 'Indique la mesure du produit format en litre (selon le format utilisé pour calculer le prix)';
COMMENT ON COLUMN phenix.temporary_multi_products.tmp_prf_purchase_weight_kg IS 'Indique le poids brut du produit format en kilogrammes (selon le format utilisé pour calculer le prix)';
COMMENT ON COLUMN phenix.temporary_multi_products.tmp_prf_purchase_weight_lb IS 'Indique le poids brut du produit format en livres (selon le format utilisé pour calculer le prix)';
COMMENT ON COLUMN phenix.temporary_multi_products.tmp_fmt_code_from_vcg_vendor IS 'Indique le format d''achat du produit fournisseur de la catégorie de produit (comm. courtier = manuf, sinon, c''est le fournisseur à l''achat)';
COMMENT ON COLUMN phenix.temporary_multi_products.tmp_fmt_conv_from_vcg_vendor IS 'Indique le facteur de conversion entre les formats de prix du fournisseur à l''achat et du fournisseur de la catégorie de produit (comm. courtier = manuf, sinon, c''est le fournisseur à l''achat)';
COMMENT ON COLUMN phenix.temporary_multi_products.tmp_pct_rebate_amount IS 'Indique le montant du rabais';