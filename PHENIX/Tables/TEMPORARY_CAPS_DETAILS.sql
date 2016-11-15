CREATE TABLE phenix.temporary_caps_details (
  tcd_tch_id NUMBER(15) NOT NULL,
  tcd_ven_purchase_code NUMBER(5),
  tcd_ven_purchase_name VARCHAR2(30 BYTE),
  tcd_id NUMBER(15) NOT NULL,
  tcd_prd_code VARCHAR2(10 BYTE) NOT NULL,
  tcd_prd_definition VARCHAR2(1 BYTE) NOT NULL,
  tcd_prd_seasonal_or_regular VARCHAR2(1 BYTE) NOT NULL CONSTRAINT tcd_prd_seasonal_or_regular_ck CHECK (tcd_prd_seasonal_or_regular IN ('R', 'S')),
  tcd_prd_ctg_code NUMBER(5),
  tcd_prd_catalog_sequence_code NUMBER(5),
  tcd_prd_pgr_code NUMBER(5),
  tcd_prd_special_order_switch NUMBER(1) NOT NULL CONSTRAINT tcd_prd_special_order_swi_ck CHECK (tcd_prd_special_order_switch IN (0, 1)),
  tcd_prd_ven_code NUMBER(5),
  tcd_prd_ven_name VARCHAR2(30 BYTE),
  tcd_prd_description VARCHAR2(45 BYTE),
  tcd_prd_availability_date DATE,
  tcd_prd_fmt_weighted_inv_code VARCHAR2(7 BYTE),
  tcd_prd_fmt_solid_inv_code VARCHAR2(7 BYTE),
  tcd_prd_brn_or_manuf VARCHAR2(15 BYTE),
  tcd_vpd_code VARCHAR2(15 BYTE),
  tcd_vpd_list_cost NUMBER(7,2),
  tcd_vpd_prf_fmt_code VARCHAR2(7 BYTE),
  tcd_vpd_purchase_multiple NUMBER(6),
  tcd_vpd_items_per_palette NUMBER(5),
  tcd_vpd_items_per_row NUMBER(3),
  tcd_vpd_vcg_id NUMBER(15),
  tcd_vcg_collected_avr_percent NUMBER(6,3),
  tcd_vcg_quart_warehouse_avr NUMBER(6,3),
  tcd_fmt_short_code VARCHAR2(2 BYTE),
  tcd_displayed_prf_description VARCHAR2(33 BYTE),
  tcd_prf_description VARCHAR2(30 BYTE),
  tcd_prf_conversion_to_base NUMBER(8),
  tcd_prf_volume NUMBER(10,3),
  tcd_prf_inner_weight NUMBER(8,3),
  tcd_prf_converted_purch_weight NUMBER(8,3),
  tcd_prw_replenish_quantity NUMBER(8,3),
  tcd_prw_replenish_coefficient NUMBER(6,3),
  tcd_prw_replenish_point NUMBER(8,3),
  tcd_prw_items_per_pallet NUMBER(5),
  tcd_prw_items_per_row NUMBER(3),
  tcd_pod_avr NUMBER(7,2),
  tcd_pod_consignment_amount NUMBER(7,2),
  tcd_pod_cost_1 NUMBER(7,2),
  tcd_pod_cost_2 NUMBER(7,2),
  tcd_pod_cost_3 NUMBER(7,2),
  tcd_pod_cost_4 NUMBER(7,2),
  tcd_pod_manual_discount NUMBER(5,2),
  tcd_pod_pty_code NUMBER(3),
  tcd_pod_vpr_end_date DATE,
  tcd_pod_vpr_start_date DATE,
  tcd_vpr_freegood_quantity NUMBER,
  tcd_vpr_freegood_volume NUMBER,
  tcd_vpr_reclaim_ven_code NUMBER(5),
  tcd_vpr_reclaim_reference VARCHAR2(15 BYTE),
  tcd_vpr_reclaim_message VARCHAR2(100 BYTE),
  tcd_vpr_alloc_3_applied_on NUMBER(1),
  tcd_vpr_allocation_3 NUMBER(7,2),
  tcd_vpr_match_cost_3_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT tcd_vpr_match_cost_3_swi_ck CHECK (tcd_vpr_match_cost_3_switch IN (0, 1)),
  tcd_pod_pod_poh_id NUMBER(15),
  tcd_pod_pod_line_number NUMBER(4),
  tcd_pod_allocation_1 NUMBER(7,2),
  tcd_pod_allocation_2 NUMBER(7,2),
  tcd_pod_allocation_3 NUMBER(7,2),
  tcd_pod_alloc_1_applied_on NUMBER(1),
  tcd_pod_alloc_2_applied_on NUMBER(1),
  tcd_pod_alloc_3_applied_on NUMBER(1),
  tcd_pod_max_quantity_allowed NUMBER(7),
  tcd_pod_max_weight_allowed NUMBER(9,3),
  tcd_pod_ven_code NUMBER(5),
  tcd_pod_reclaim_message VARCHAR2(100 BYTE),
  tcd_pod_reclaim_reference VARCHAR2(15 BYTE),
  tcd_pod_match_cost_1_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT tcd_pod_match_cost_1_swi_ck CHECK (tcd_pod_match_cost_1_switch IN (0, 1)),
  tcd_pod_match_cost_2_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT tcd_pod_match_cost_2_swi_ck CHECK (tcd_pod_match_cost_2_switch IN (0, 1)),
  tcd_pod_match_cost_3_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT tcd_pod_match_cost_3_swi_ck CHECK (tcd_pod_match_cost_3_switch IN (0, 1)),
  tcd_pod_match_cost NUMBER(7,2),
  tcd_pod_disc_cost_affected NUMBER(1),
  tcd_pod_quantity_freegood NUMBER(7),
  tcd_pod_quantity_ordered NUMBER(7),
  tcd_pod_quantity_suggested NUMBER(7),
  tcd_pod_weight_freegood NUMBER(9,3),
  tcd_pod_weight_ordered NUMBER(9,3),
  tcd_pod_weight_suggested NUMBER(9,3),
  tcd_best_vpr_end_date DATE,
  tcd_best_vpr_start_date DATE,
  tcd_best_vpr_amount NUMBER,
  tcd_total_products NUMBER(10),
  tcd_total_order_weight NUMBER(11,3),
  tcd_total_order_volume NUMBER(11,3),
  tcd_total_order NUMBER(10,2),
  tcd_total_number_of_palettes NUMBER(7,2),
  tcd_cod_total_quantity_prebook NUMBER(7),
  tcd_cod_total_weight_prebook NUMBER(9,3),
  tcd_cod_prebook_bef_next_cycle NUMBER,
  tcd_pod_total_open_prebook_fd NUMBER,
  tcd_pod_total_open_prebook_dc NUMBER,
  tcd_pod_bef_next_deliv_pbk_dc NUMBER,
  tcd_cod_special_left_quantity NUMBER(7),
  tcd_cod_special_left_weight NUMBER(9,3),
  tcd_next_cycle_date DATE,
  tcd_next_order_limit_date DATE,
  tcd_days_between_order NUMBER,
  tcd_verified_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT tcd_verified_swi_ck CHECK (tcd_verified_switch IN (0, 1)),
  tcd_promo_end_next_cyc_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT tcd_promo_end_next_cyc_swi_ck CHECK (tcd_promo_end_next_cyc_switch IN (0, 1)),
  tcd_cod_prebook_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT tcd_cod_prebook_swi_ck CHECK (tcd_cod_prebook_switch IN (0, 1)),
  tcd_promo_for_next_cyc_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT tcd_promo_for_next_cyc_swi_ck CHECK (tcd_promo_for_next_cyc_switch IN (0, 1)),
  tcd_price_ch_next_cyc_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT tcd_price_ch_next_cyc_swi_ck CHECK (tcd_price_ch_next_cyc_switch IN (0, 1)),
  tcd_override_growth_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT tcd_override_growth_swi_ck CHECK (tcd_override_growth_switch IN (0, 1)),
  tcd_old_quantity_suggested NUMBER(7),
  tcd_old_weight_suggested NUMBER(9,3),
  tcd_old_freegood_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT tcd_old_freegood_swi_ck CHECK (tcd_old_freegood_switch IN (0, 1)),
  tcd_old_ordered_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT tcd_old_ordered_swi_ck CHECK (tcd_old_ordered_switch IN (0, 1)),
  tcd_old_manual_disc_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT tcd_old_manual_disc_swi_ck CHECK (tcd_old_manual_disc_switch IN (0, 1)),
  tcd_old_reclaim_info_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT tcd_old_reclaim_info_swi_ck CHECK (tcd_old_reclaim_info_switch IN (0, 1)),
  tcd_old_verified_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT tcd_old_verified_swit_ck CHECK (tcd_old_verified_switch IN (0, 1)),
  tcd_best_cpr_from_date DATE,
  tcd_best_cpr_to_date DATE,
  tcd_best_cpr_alloc_amount NUMBER,
  tcd_prx_effective_date DATE,
  tcd_prx_cost NUMBER,
  tcd_convert_prd_to_vpd NUMBER,
  tcd_convert_vpd_to_prd NUMBER,
  tcd_start_date_for_stats DATE,
  tcd_current_fiscal_year NUMBER,
  tcd_current_fiscal_period NUMBER,
  tcd_current_fiscal_week NUMBER,
  tcd_prd_qty_accounting NUMBER,
  tcd_prd_qty_on_hand NUMBER,
  tcd_prd_qty_available NUMBER,
  tcd_prd_qty_damaged NUMBER,
  tcd_prd_qty_cash_n_carry NUMBER,
  tcd_prd_qty_on_cust_order NUMBER,
  tcd_prd_qty_on_open_pod NUMBER,
  tcd_prd_qty_indirect_deliv NUMBER,
  tcd_prd_qty_rma NUMBER,
  tcd_prd_qty_interco_in NUMBER,
  tcd_prd_qty_interco_out NUMBER,
  tcd_prd_conv_replenish_qty NUMBER,
  tcd_prd_conv_replenish_point NUMBER,
  tcd_prd_conv_replenish_coeff NUMBER,
  tcd_week_average_sales NUMBER,
  tcd_average_inventory_per_week NUMBER,
  tcd_caps_stats_done_switch NUMBER(1) DEFAULT 0 NOT NULL,
  tcd_lost_sales_current_week NUMBER,
  tcd_lost_sales_last_week NUMBER,
  tcd_sum_pod_qty_wght_ordered NUMBER,
  tcd_pod_pige_prebook_left NUMBER,
  tcd_more_than_one_whs_switch NUMBER(1) DEFAULT 0 NOT NULL,
  tcd_other_whs_only_switch NUMBER(1) DEFAULT 0 NOT NULL,
  tcd_prd_product_life NUMBER(4),
  tcd_vpd_special_order_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT tcd_vpd_special_order_swi_ck CHECK (tcd_vpd_special_order_switch IN (0, 1)),
  tcd_prd_minimum_reception_days NUMBER(4),
  tcd_prd_lot_control_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT tcd_prd_lot_control_switch_ck CHECK (tcd_prd_lot_control_switch IN (0, 1)),
  tcd_inv_expiry_date DATE,
  tcd_cod_preb_bef_next_cycle_fd NUMBER,
  tcd_cod_preb_bef_next_cycle_dc NUMBER,
  tcd_pod_added_transp_amount NUMBER(11,6) DEFAULT 0 NOT NULL,
  tcd_pod_match_cost_freight NUMBER(7,2),
  tcd_contract_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT tcd_contract_switch_ck CHECK (TCD_CONTRACT_SWITCH IN (0,1)),
  tcd_round_per_pallet_percent NUMBER(6,3),
  tcd_round_per_row_percent NUMBER(6,3),
  tcd_replenish_nb_of_week NUMBER(3,1),
  tcd_ly_start_date_for_stats DATE,
  tcd_ly_end_date_for_stats DATE,
  tcd_vcg_collected_avr_amount NUMBER(7,2),
  tcd_vcg_collect_distrib_qualif VARCHAR2(2 BYTE),
  tcd_vcg_qurt_whouse_avr_amount NUMBER(7,2),
  tcd_vcg_qualifier VARCHAR2(2 BYTE),
  tcd_prf_liter NUMBER(8,3),
  tcd_prf_purchase_weight_kg NUMBER(8,3),
  tcd_prf_purchase_weight_lb NUMBER(8,3),
  tcd_fmt_code_from_vcg_vendor VARCHAR2(7 BYTE),
  tcd_fmt_conv_from_vcg_vendor NUMBER,
  tcd_pct_rebate_amount NUMBER(7,2),
  CONSTRAINT tcd_pk PRIMARY KEY (tcd_id),
  CONSTRAINT tcd_prd_fk FOREIGN KEY (tcd_prd_code) REFERENCES phenix.products (prd_code) ON DELETE CASCADE,
  CONSTRAINT tcd_tch_fk FOREIGN KEY (tcd_tch_id) REFERENCES phenix.temporary_caps_headers (tch_id) ON DELETE CASCADE
);
COMMENT ON COLUMN phenix.temporary_caps_details.tcd_prd_product_life IS 'Indique la durée de vie du produit exprimée en nombre de jour';
COMMENT ON COLUMN phenix.temporary_caps_details.tcd_vpd_special_order_switch IS 'Indique si le fournisseur doit faire une commande spéciale pour obtenir ce produit';
COMMENT ON COLUMN phenix.temporary_caps_details.tcd_prd_minimum_reception_days IS 'Indique la durée minimale permise entre le jour d''expiration et le jour de réception du produit';
COMMENT ON COLUMN phenix.temporary_caps_details.tcd_prd_lot_control_switch IS 'Indique s''il y a un contrôle des lots à la réception';
COMMENT ON COLUMN phenix.temporary_caps_details.tcd_inv_expiry_date IS 'Indique la plus ancienne date d''expiration du produit';
COMMENT ON COLUMN phenix.temporary_caps_details.tcd_contract_switch IS 'Indique s''il y a des contrats qui respectent les règles pour ce produit';
COMMENT ON COLUMN phenix.temporary_caps_details.tcd_round_per_pallet_percent IS 'Indique le pourcentage maximum pouvant être ajouté à la quantité suggérée s''il permet l''arrondissement à la palette suivante lors des commandes d''achat';
COMMENT ON COLUMN phenix.temporary_caps_details.tcd_round_per_row_percent IS 'Indique le pourcentage maximum pouvant être ajouté à la quantité suggérée s''il permet l''arrondissement à la rangée suivante lors des commandes d''achat';
COMMENT ON COLUMN phenix.temporary_caps_details.tcd_replenish_nb_of_week IS 'Indique le nombre de semaines d''inventaire nécessaire en entrepôt pour ne pas commander';
COMMENT ON COLUMN phenix.temporary_caps_details.tcd_ly_start_date_for_stats IS 'Indique la date de début des statistiques qui seront affichés à l''écran pour l''année précédente';
COMMENT ON COLUMN phenix.temporary_caps_details.tcd_ly_end_date_for_stats IS 'Indique la date de fin des statistiques qui seront affichés à l''écran pour l''année précédente';
COMMENT ON COLUMN phenix.temporary_caps_details.tcd_vcg_collected_avr_amount IS 'Indique le montant brut de la catégorie du produit';
COMMENT ON COLUMN phenix.temporary_caps_details.tcd_vcg_collect_distrib_qualif IS 'Indique de quelle façon la remise du programme est calculée';
COMMENT ON COLUMN phenix.temporary_caps_details.tcd_vcg_qurt_whouse_avr_amount IS 'Indique le montant de rabais volume trimestriel entrepôt de la catégorie du produit';
COMMENT ON COLUMN phenix.temporary_caps_details.tcd_vcg_qualifier IS 'Indique de quelle façon la remise trimestrielle est calculée';
COMMENT ON COLUMN phenix.temporary_caps_details.tcd_prf_liter IS 'Indique la mesure du produit format en litre (selon le format utilisé pour calculer le prix)';
COMMENT ON COLUMN phenix.temporary_caps_details.tcd_prf_purchase_weight_kg IS 'Indique le poids brut du produit format en kilogrammes (selon le format utilisé pour calculer le prix)';
COMMENT ON COLUMN phenix.temporary_caps_details.tcd_prf_purchase_weight_lb IS 'Indique le poids brut du produit format en livres (selon le format utilisé pour calculer le prix)';
COMMENT ON COLUMN phenix.temporary_caps_details.tcd_fmt_code_from_vcg_vendor IS 'Indique le format d''achat du produit fournisseur de la catégorie de produit (comm. courtier = manuf, sinon, c''est le fournisseur à l''achat)';
COMMENT ON COLUMN phenix.temporary_caps_details.tcd_fmt_conv_from_vcg_vendor IS 'Indique le facteur de conversion entre les formats de prix du fournisseur à l''achat et du fournisseur de la catégorie de produit (comm. courtier = manuf, sinon, c''est le fournisseur à l''achat)';
COMMENT ON COLUMN phenix.temporary_caps_details.tcd_pct_rebate_amount IS 'Indique le montant du rabais';