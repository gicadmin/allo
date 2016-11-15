CREATE TABLE phenix.control (
  ctr_code NUMBER(1) DEFAULT 1 NOT NULL,
  ctr_prv_code VARCHAR2(2 BYTE) NOT NULL,
  ctr_shr_base_code NUMBER(3) NOT NULL,
  ctr_shr_external_code NUMBER(3) NOT NULL,
  ctr_approval_required_switch NUMBER(1) NOT NULL CONSTRAINT ctr_approval_required_switc_ck CHECK (CTR_APPROVAL_REQUIRED_SWITCH IN (0, 1)),
  ctr_avr_applied_on NUMBER(1) NOT NULL CONSTRAINT ctr_avr_applied_on_ck CHECK (CTR_AVR_APPLIED_ON IN (0, 1, 2, 3, 4)),
  ctr_cancelation_days NUMBER(3) NOT NULL,
  ctr_company_address VARCHAR2(45 BYTE) NOT NULL,
  ctr_company_city VARCHAR2(30 BYTE) NOT NULL,
  ctr_company_name VARCHAR2(30 BYTE) NOT NULL,
  ctr_company_postal_code VARCHAR2(10 BYTE) NOT NULL,
  ctr_cost_1_name VARCHAR2(15 BYTE) NOT NULL,
  ctr_cost_2_name VARCHAR2(15 BYTE) NOT NULL,
  ctr_cost_3_name VARCHAR2(15 BYTE) NOT NULL,
  ctr_cost_4_name VARCHAR2(15 BYTE) NOT NULL,
  ctr_credit_retain_percent NUMBER(6,3) NOT NULL,
  ctr_day_of_week NUMBER(1) NOT NULL CONSTRAINT ctr_day_of_week_ck CHECK (CTR_DAY_OF_WEEK IN (3, 9, 2, 6, 4, 7, 5, 8, 1)),
  ctr_drop_past_days NUMBER(3) NOT NULL,
  ctr_federal_tax_number VARCHAR2(15 BYTE) NOT NULL,
  ctr_invoice_cost NUMBER(1) NOT NULL CONSTRAINT ctr_invoice_cost_ck CHECK (CTR_INVOICE_COST IN (0, 1, 2, 3, 4, 5, 6, 7, 8, 9)),
  ctr_order_days_limit NUMBER(3) NOT NULL,
  ctr_provincial_tax_number VARCHAR2(18 BYTE) NOT NULL,
  ctr_recalc_frequency VARCHAR2(1 BYTE) NOT NULL CONSTRAINT ctr_recalc_frequency_ck CHECK (CTR_RECALC_FREQUENCY IN ('D', 'W', 'M', 'O')),
  ctr_shorted_percent NUMBER(6,3) NOT NULL,
  ctr_telephone_number NUMBER(11) NOT NULL,
  ctr_thawing_end_date DATE NOT NULL,
  ctr_thawing_start_date DATE NOT NULL,
  ctr_ticket_price NUMBER(7,2) NOT NULL,
  ctr_tobacco_tax_number VARCHAR2(16 BYTE) NOT NULL,
  ctr_week_start_day NUMBER(1) NOT NULL CONSTRAINT ctr_week_start_day_ck CHECK (CTR_WEEK_START_DAY IN (3, 9, 2, 6, 4, 7, 5, 8, 1)),
  ctr_alt_cost_1_name VARCHAR2(15 BYTE),
  ctr_alt_cost_2_name VARCHAR2(15 BYTE),
  ctr_alt_cost_3_name VARCHAR2(15 BYTE),
  ctr_alt_cost_4_name VARCHAR2(15 BYTE),
  ctr_broker_vendor_id NUMBER(5),
  ctr_duns_number VARCHAR2(15 BYTE),
  ctr_email VARCHAR2(80 BYTE) NOT NULL,
  ctr_fax_number NUMBER(11),
  ctr_override_flag VARCHAR2(1 BYTE) NOT NULL CONSTRAINT ctr_override_flag_ck CHECK (CTR_OVERRIDE_FLAG IN ('Y', 'N', 'P')),
  ctr_ar_vendor_prefix VARCHAR2(2 BYTE),
  ctr_override_password VARCHAR2(6 BYTE),
  ctr_sales_column_1_content NUMBER(2) CONSTRAINT ctr_sales_column_1_content_ck CHECK (CTR_SALES_COLUMN_1_CONTENT
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_column_1_label VARCHAR2(12 BYTE),
  ctr_sales_column_2_content NUMBER(2) CONSTRAINT ctr_sales_column_2_content_ck CHECK (CTR_SALES_COLUMN_2_CONTENT
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_column_2_label VARCHAR2(12 BYTE),
  ctr_sales_column_3_content NUMBER(2) CONSTRAINT ctr_sales_column_3_content_ck CHECK (CTR_SALES_COLUMN_3_CONTENT
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_column_3_label VARCHAR2(12 BYTE),
  ctr_sales_footing_1_content NUMBER(2) CONSTRAINT ctr_sales_footing_1_content_ck CHECK (CTR_SALES_FOOTING_1_CONTENT
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_footing_1_label VARCHAR2(12 BYTE),
  ctr_sales_footing_2_content NUMBER(2) CONSTRAINT ctr_sales_footing_2_content_ck CHECK (CTR_SALES_FOOTING_2_CONTENT
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_footing_2_label VARCHAR2(12 BYTE),
  ctr_sales_footing_3_content NUMBER(2) CONSTRAINT ctr_sales_footing_3_content_ck CHECK (CTR_SALES_FOOTING_3_CONTENT
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_footing_3_label VARCHAR2(12 BYTE),
  ctr_sales_footing_4_content NUMBER(2) CONSTRAINT ctr_sales_footing_4_content_ck CHECK (CTR_SALES_FOOTING_4_CONTENT
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_footing_4_label VARCHAR2(12 BYTE),
  ctr_sales_footing_5_content NUMBER(2) CONSTRAINT ctr_sales_footing_5_content_ck CHECK (CTR_SALES_FOOTING_5_CONTENT
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_footing_5_label VARCHAR2(12 BYTE),
  ctr_sales_footing_6_content NUMBER(2) CONSTRAINT ctr_sales_footing_6_content_ck CHECK (CTR_SALES_FOOTING_6_CONTENT
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_footing_6_label VARCHAR2(12 BYTE),
  ctr_sales_history_1_content NUMBER(2) CONSTRAINT ctr_sales_history_1_content_ck CHECK (CTR_SALES_HISTORY_1_CONTENT
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_history_1_label VARCHAR2(12 BYTE),
  ctr_sales_history_2_content NUMBER(2) CONSTRAINT ctr_sales_history_2_content_ck CHECK (CTR_SALES_HISTORY_2_CONTENT
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 37,38,39,40,41,42,43,44)),
  ctr_sales_history_2_label VARCHAR2(12 BYTE),
  ctr_sales_history_3_content NUMBER(2) CONSTRAINT ctr_sales_history_3_content_ck CHECK (CTR_SALES_HISTORY_3_CONTENT
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_history_3_label VARCHAR2(12 BYTE),
  ctr_sales_history_4_content NUMBER(2) CONSTRAINT ctr_sales_history_4_content_ck CHECK (CTR_SALES_HISTORY_4_CONTENT
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_history_4_label VARCHAR2(12 BYTE),
  ctr_sales_history_5_content NUMBER(2) CONSTRAINT ctr_sales_history_5_content_ck CHECK (CTR_SALES_HISTORY_5_CONTENT
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_history_5_label VARCHAR2(12 BYTE),
  ctr_sales_history_6_content NUMBER(2) CONSTRAINT ctr_sales_history_6_content_ck CHECK (CTR_SALES_HISTORY_6_CONTENT
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_history_6_label VARCHAR2(12 BYTE),
  ctr_pick_generation_switch NUMBER(1) NOT NULL CONSTRAINT ctr_pick_generation_switch_ck CHECK (CTR_PICK_GENERATION_SWITCH IN (0, 1)),
  ctr_member_id NUMBER(10),
  ctr_discard_week NUMBER(2) NOT NULL,
  ctr_purchase_factor NUMBER(6,3) NOT NULL,
  ctr_week_for_average NUMBER(2) NOT NULL,
  ctr_exclude_week_switch NUMBER(1) NOT NULL CONSTRAINT ctr_exclude_week_switch_ck CHECK (CTR_EXCLUDE_WEEK_SWITCH IN (0, 1)),
  ctr_base_invoice_message VARCHAR2(100 BYTE),
  ctr_seasonal_invoice_message VARCHAR2(100 BYTE),
  ctr_seasonal_message_date DATE,
  ctr_price_change_purge_days NUMBER(4) NOT NULL,
  ctr_automatic_pick_list_switch NUMBER(1) NOT NULL CONSTRAINT ctr_automatic_pick_list_swi_ck CHECK (CTR_AUTOMATIC_PICK_LIST_SWITCH IN (0, 1)),
  ctr_route_dates_purge_days NUMBER(4) NOT NULL,
  ctr_purge_vendor_promo_days NUMBER(3) NOT NULL,
  ctr_purge_customer_promo_days NUMBER(3) NOT NULL,
  ctr_vendor_default_term VARCHAR2(6 BYTE) NOT NULL,
  ctr_apply_price_change_switch NUMBER(1) NOT NULL CONSTRAINT ctr_apply_price_change_swit_ck CHECK (CTR_APPLY_PRICE_CHANGE_SWITCH IN (0, 1)),
  ctr_updt_description_switch NUMBER(1) NOT NULL CONSTRAINT ctr_updt_description_switch_ck CHECK (CTR_UPDT_DESCRIPTION_SWITCH IN (0, 1)),
  ctr_updt_alt_desc_switch NUMBER(1) NOT NULL CONSTRAINT ctr_updt_alt_desc_switch_ck CHECK (CTR_UPDT_ALT_DESC_SWITCH IN (0, 1)),
  ctr_updt_short_desc_switch NUMBER(1) NOT NULL CONSTRAINT ctr_updt_short_desc_switch_ck CHECK (CTR_UPDT_SHORT_DESC_SWITCH IN (0, 1)),
  ctr_updt_purchase_upc_switch NUMBER(1) NOT NULL CONSTRAINT ctr_updt_purchase_upc_switc_ck CHECK (CTR_UPDT_PURCHASE_UPC_SWITCH IN (0, 1)),
  ctr_updt_weight_switch NUMBER(1) NOT NULL CONSTRAINT ctr_updt_weight_switch_ck CHECK (CTR_UPDT_WEIGHT_SWITCH IN (0, 1)),
  ctr_updt_height_switch NUMBER(1) NOT NULL CONSTRAINT ctr_updt_height_switch_ck CHECK (CTR_UPDT_HEIGHT_SWITCH IN (0, 1)),
  ctr_updt_width_switch NUMBER(1) NOT NULL CONSTRAINT ctr_updt_width_switch_ck CHECK (CTR_UPDT_WIDTH_SWITCH IN (0, 1)),
  ctr_updt_lenght_switch NUMBER(1) NOT NULL CONSTRAINT ctr_updt_lenght_switch_ck CHECK (CTR_UPDT_LENGHT_SWITCH IN (0, 1)),
  ctr_updt_season_start_switch NUMBER(1) NOT NULL CONSTRAINT ctr_updt_season_start_switc_ck CHECK (CTR_UPDT_SEASON_START_SWITCH IN (0, 1)),
  ctr_updt_season_end_switch NUMBER(1) NOT NULL CONSTRAINT ctr_updt_season_end_switch_ck CHECK (CTR_UPDT_SEASON_END_SWITCH IN (0, 1)),
  ctr_admin_method VARCHAR2(1 BYTE) NOT NULL CONSTRAINT ctr_admin_method_ck CHECK (CTR_ADMIN_METHOD IN ('P', 'S')),
  ctr_toll_free_telephone NUMBER(11),
  ctr_prf_description_length NUMBER(2) NOT NULL,
  ctr_catalog_last_printed_date DATE,
  ctr_price_change_lead_days NUMBER(2) NOT NULL,
  ctr_cty_code VARCHAR2(3 BYTE) NOT NULL,
  ctr_alt_seasonal_message VARCHAR2(100 BYTE),
  ctr_alt_base_message VARCHAR2(100 BYTE),
  ctr_default_ias VARCHAR2(30 BYTE),
  ctr_weight_tolerance_percent NUMBER(6,3) DEFAULT 0 NOT NULL,
  ctr_allocation_1_applied_on NUMBER(1) NOT NULL CONSTRAINT ctr_allocation_1_applied_on_ck CHECK (CTR_ALLOCATION_1_APPLIED_ON IN (0, 1, 2, 3, 4)),
  ctr_allocation_2_applied_on NUMBER(1) NOT NULL CONSTRAINT ctr_allocation_2_applied_on_ck CHECK (CTR_ALLOCATION_2_APPLIED_ON IN (0, 1, 2, 3, 4)),
  ctr_allocation_3_applied_on NUMBER(1) NOT NULL CONSTRAINT ctr_allocation_3_applied_on_ck CHECK (CTR_ALLOCATION_3_APPLIED_ON IN (0, 1, 2, 3, 4)),
  ctr_damaged_goods_zones VARCHAR2(10 BYTE) NOT NULL,
  ctr_profile_weeks_regular NUMBER(3) NOT NULL,
  ctr_profile_weeks_seasonal NUMBER(3) NOT NULL,
  ctr_multi_warehouse_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_multi_warehouse_switch_ck CHECK (CTR_MULTI_WAREHOUSE_SWITCH IN (0, 1)),
  ctr_whs_code VARCHAR2(2 BYTE) NOT NULL,
  ctr_warehouse_conversion NUMBER(4) DEFAULT 1000 NOT NULL,
  ctr_default_environment VARCHAR2(15 BYTE),
  ctr_quotation_purge_days NUMBER(4) DEFAULT 0 NOT NULL,
  ctr_super_distributor_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_super_dist_switch_ck CHECK (CTR_SUPER_DISTRIBUTOR_SWITCH IN (0, 1)),
  ctr_affect_match_cost_1_switch NUMBER(1) NOT NULL CONSTRAINT ctr_affect_match_cost_1_swi_ck CHECK (CTR_AFFECT_MATCH_COST_1_SWITCH IN (0, 1)),
  ctr_affect_match_cost_2_switch NUMBER(1) NOT NULL CONSTRAINT ctr_affect_match_cost_2_swi_ck CHECK (CTR_AFFECT_MATCH_COST_2_SWITCH IN (0, 1)),
  ctr_affect_match_cost_3_switch NUMBER(1) NOT NULL CONSTRAINT ctr_affect_match_cost_3_swi_ck CHECK (CTR_AFFECT_MATCH_COST_3_SWITCH IN (0, 1)),
  ctr_manual_disc_cost_affected NUMBER(1) NOT NULL CONSTRAINT ctr_manual_disc_cost_affect_ck CHECK (CTR_MANUAL_DISC_COST_AFFECTED IN (0, 1, 2, 3, 4)),
  ctr_sales_footing_7_label VARCHAR2(12 BYTE),
  ctr_sales_footing_7_content NUMBER(2) CONSTRAINT ctr_sales_footing_7_content_ck CHECK (CTR_SALES_FOOTING_7_CONTENT
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_footing_8_label VARCHAR2(12 BYTE),
  ctr_sales_footing_8_content NUMBER(2) CONSTRAINT ctr_sales_footing_8_content_ck CHECK (CTR_SALES_FOOTING_8_CONTENT
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_footing_9_label VARCHAR2(12 BYTE),
  ctr_sales_footing_9_content NUMBER(2) CONSTRAINT ctr_sales_footing_9_content_ck CHECK (CTR_SALES_FOOTING_9_CONTENT
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_max_prd_description_length NUMBER(2) NOT NULL,
  ctr_print_rou_per_cust_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_print_rou_per_cust_ck CHECK (CTR_PRINT_ROU_PER_CUST_SWITCH IN (0, 1)),
  ctr_sequence_interval NUMBER(2) DEFAULT 1 NOT NULL,
  ctr_cty_purch_code VARCHAR2(3 BYTE) DEFAULT 'BUY' NOT NULL,
  ctr_inv_pickup_copies NUMBER(2) DEFAULT 1 NOT NULL,
  ctr_vcg_default_cat_code VARCHAR2(2 BYTE) NOT NULL,
  ctr_vcg_cat_description VARCHAR2(30 BYTE) NOT NULL,
  ctr_vcg_alt_cat_description VARCHAR2(30 BYTE),
  ctr_prebook_reservation_days NUMBER(4) DEFAULT 0 NOT NULL,
  ctr_del_prod_in_quotation_days NUMBER(3) DEFAULT 60 NOT NULL,
  ctr_sysgen_prd_reset NUMBER(10) DEFAULT 99999 NOT NULL,
  ctr_sysgen_prd_next NUMBER(10) DEFAULT 10 NOT NULL,
  ctr_cross_dock_order_type VARCHAR2(4 BYTE) DEFAULT 'CXD' NOT NULL,
  ctr_web_identification_key VARCHAR2(50 BYTE),
  ctr_base_po_message VARCHAR2(150 BYTE),
  ctr_last_prx_date DATE,
  ctr_last_vpd_date DATE,
  ctr_last_vpr_date DATE,
  ctr_neg_discount_terms_code VARCHAR2(6 BYTE),
  ctr_wms_flag VARCHAR2(1 BYTE) DEFAULT 'P' NOT NULL CONSTRAINT ctr_wms_flag_ck CHECK (ctr_wms_flag IN ('C', 'R', 'P')),
  ctr_spec_ord_tickets_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT ctr_spec_ord_tickets_switch_ck CHECK (ctr_spec_ord_tickets_switch IN (0, 1)),
  ctr_bin_date_validation_days NUMBER(4) DEFAULT 10 NOT NULL,
  ctr_weight_tolerance_perc NUMBER(6,3) DEFAULT 100 NOT NULL,
  ctr_create_loc_via_rf_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT ctr_create_loc_via_rf_sw_ck CHECK (ctr_create_loc_via_rf_switch IN (0, 1)),
  ctr_vpd_sync_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_vpd_sync_switch_ck CHECK (CTR_VPD_SYNC_SWITCH IN (0,1)),
  ctr_vpr_sync_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_vpr_sync_switch_ck CHECK (CTR_VPR_SYNC_SWITCH IN (0,1)),
  ctr_nac_sync_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_nac_sync_switch_ck CHECK (CTR_NAC_SYNC_SWITCH IN (0,1)),
  ctr_prx_sync_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_prx_sync_switch_ck CHECK (CTR_PRX_SYNC_SWITCH IN (0,1)),
  ctr_qtd_check_promo_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_qtd_check_promo_switch_ck CHECK (CTR_QTD_CHECK_PROMO_SWITCH IN (0, 1)),
  ctr_ap_drop_post_by_vds_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT ctr_ap_drop_post_by_vds_sw_ck CHECK (CTR_AP_DROP_POST_BY_VDS_SWITCH IN (0,1)),
  ctr_iat_physical_count_code NUMBER(3) DEFAULT 1 NOT NULL,
  ctr_iat_no_change_code NUMBER(3) DEFAULT 2 NOT NULL,
  ctr_allow_mix_exp_date_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT ctr_allow_mix_exp_date_swi_ck CHECK (CTR_ALLOW_MIX_EXP_DATE_SWITCH IN (0, 1)),
  ctr_pick_avail_or_ordered_flag VARCHAR2(1 BYTE) DEFAULT 'A' NOT NULL CONSTRAINT ctr_pick_avail_or_ordr_flag_ck CHECK (ctr_pick_avail_or_ordered_flag IN ('A','O')),
  ctr_rf_max_history_screens NUMBER(2) DEFAULT 20 NOT NULL,
  ctr_email_for_rf_errors VARCHAR2(200 BYTE),
  ctr_pick_for_dock_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_pick_for_dock_switch_ck CHECK (CTR_PICK_FOR_DOCK_SWITCH IN (0, 1)),
  ctr_max_growth_percentage NUMBER(6,3),
  ctr_release_start_date DATE,
  ctr_release_end_date DATE,
  ctr_release_message VARCHAR2(100 BYTE),
  ctr_calc_vdi_regular_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT ctr_calc_vdi_regular_swit_ck CHECK (CTR_CALC_VDI_REGULAR_SWITCH IN (0, 1)),
  ctr_gl_posting_method VARCHAR2(1 BYTE) DEFAULT 'D' NOT NULL CONSTRAINT ctr_gl_posting_method_ck CHECK (CTR_GL_POSTING_METHOD IN ('R', 'D')),
  ctr_print_pack_size NUMBER(4) DEFAULT 1 NOT NULL,
  ctr_split_mission_print_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_split_mission_prn_sw_ck CHECK (CTR_SPLIT_MISSION_PRINT_SWITCH IN (0,1)),
  ctr_check_inventory_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT ctr_check_inventory_sw_ck CHECK (CTR_CHECK_INVENTORY_SWITCH IN (0,1)),
  ctr_vr_auto_assign_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT ctr_vr_auto_assign_sw_ck CHECK (CTR_VR_AUTO_ASSIGN_SWITCH IN (0,1)),
  ctr_vr_mission_confirm_length NUMBER(2) DEFAULT 0 NOT NULL,
  ctr_tty_code VARCHAR2(4 BYTE),
  ctr_srp_perc_by_group_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_srp_perc_by_group_swi_ck CHECK (CTR_SRP_PERC_BY_GROUP_SWITCH IN (0, 1)),
  ctr_password_expiry_days NUMBER(4) NOT NULL,
  ctr_password_warning_days NUMBER(4) NOT NULL,
  ctr_crt_promotion_code NUMBER(3) NOT NULL,
  ctr_crt_volume_rebate_code NUMBER(3) NOT NULL,
  ctr_car_invoice_grace_days NUMBER(3) DEFAULT 5 NOT NULL,
  ctr_pgs_sync_type VARCHAR2(1 BYTE) DEFAULT 'M' NOT NULL CONSTRAINT ctr_pgs_sync_type_ck CHECK (CTR_PGS_SYNC_TYPE IN ('C','M')),
  ctr_pgs_last_sync_date DATE DEFAULT SYSDATE NOT NULL,
  ctr_nir_number VARCHAR2(20 BYTE),
  ctr_enterprise_identification VARCHAR2(10 BYTE),
  ctr_tabacco_identification VARCHAR2(16 BYTE),
  ctr_auto_close_po_days NUMBER(3),
  ctr_ap_retail_client_prefix VARCHAR2(2 BYTE) DEFAULT 'C' NOT NULL,
  ctr_web_address VARCHAR2(200 BYTE),
  ctr_edi_input_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_edi_input_switch_ck CHECK (CTR_EDI_INPUT_SWITCH IN (0, 1)),
  ctr_edi_report_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_edi_report_switch_ck CHECK (CTR_EDI_REPORT_SWITCH IN (0, 1)),
  ctr_telxon_input_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_telxon_input_switch_ck CHECK (CTR_TELXON_INPUT_SWITCH IN (0, 1)),
  ctr_telxon_file_name VARCHAR2(30 BYTE),
  ctr_account_statement_weeks NUMBER(2) DEFAULT 4 NOT NULL,
  ctr_check_digit_on_prd_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_check_digit_on_prd_swit_ck CHECK (CTR_CHECK_DIGIT_ON_PRD_SWITCH IN (0, 1)),
  ctr_msi_short_file_name VARCHAR2(30 BYTE),
  ctr_msi_short_input_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_msi_short_input_switch_ck CHECK (CTR_MSI_SHORT_INPUT_SWITCH IN(0,1)),
  ctr_msi_long_file_name VARCHAR2(30 BYTE),
  ctr_msi_long_input_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_msi_long_input_switch_ck CHECK (CTR_MSI_LONG_INPUT_SWITCH IN(0,1)),
  ctr_identifiers_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_identifiers_switch_ck CHECK (CTR_IDENTIFIERS_SWITCH  IN (0, 1)),
  ctr_identifiers_prefix VARCHAR2(1 BYTE),
  ctr_transit_loc_code VARCHAR2(12 BYTE),
  ctr_open_paper_mission_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_open_mission_switch_ck CHECK (CTR_OPEN_PAPER_MISSION_SWITCH IN (0,1)),
  ctr_delay_for_opening_missions NUMBER(4) DEFAULT 0 NOT NULL,
  ctr_credit_entry_password VARCHAR2(6 BYTE),
  ctr_credit_entry_percentage NUMBER(6,3),
  ctr_location_print_format VARCHAR2(50 BYTE) NOT NULL CONSTRAINT ctr_location_print_format_ck CHECK (CTR_LOCATION_PRINT_FORMAT IN ('RAP_ETIQUETTE_LOC_2X4_ZEBRA','RAP_ETIQUETTE_LOC_2X4_DATAMAX','RAP_ETIQUETTE_LOC_1X4_ZEBRA','RAP_ETIQUETTE_LOC_1X4_DATAMAX','RAP_ETIQUETTE_LOC_3X4_ZEBRA', 'RAP_ETIQUETTE_LOC_RESERVE_ZEBRA', 'RAP_ETIQUETTE_LOC_CUEILLETTE_ZEBRA')),
  ctr_profit_range_used VARCHAR2(1 BYTE) DEFAULT 'T' NOT NULL CONSTRAINT ctr_profit_range_used_ck CHECK (CTR_PROFIT_RANGE_USED IN ('T','D')),
  ctr_initial_reposition_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT ctr_initial_reposition_swit_ck CHECK (CTR_INITIAL_REPOSITION_SWITCH IN (0, 1)),
  ctr_read_temperature_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_read_temperature_switch_ck CHECK (CTR_READ_TEMPERATURE_SWITCH IN (0, 1)),
  ctr_rej_dupl_spec_ord_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT ctr_rej_dupl_spec_ord_swit_ck CHECK (CTR_REJ_DUPL_SPEC_ORD_SWITCH IN (0, 1)),
  ctr_warn_recei_lessthan_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_warn_recei_lessthan_swi_ck CHECK (CTR_WARN_RECEI_LESSTHAN_SWITCH IN (0, 1)),
  ctr_loc_height_percent_variant NUMBER(2) DEFAULT 0 NOT NULL,
  ctr_max_loop_for_find_loc NUMBER(1) DEFAULT 0 NOT NULL,
  ctr_sales_footing_10_label VARCHAR2(12 BYTE),
  ctr_sales_footing_10_content NUMBER(2) CONSTRAINT ctr_sales_footing_10_conten_ck CHECK (CTR_SALES_FOOTING_10_CONTENT
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_footing_11_label VARCHAR2(12 BYTE),
  ctr_sales_footing_11_content NUMBER(2) CONSTRAINT ctr_sales_footing_11_conten_ck CHECK (CTR_SALES_FOOTING_11_CONTENT
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_footing_12_label VARCHAR2(12 BYTE),
  ctr_sales_footing_12_content NUMBER(2) CONSTRAINT ctr_sales_footing_12_conten_ck CHECK (CTR_SALES_FOOTING_12_CONTENT
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_header_content NUMBER(2) DEFAULT 1 NOT NULL CONSTRAINT ctr_sales_header_content_ck CHECK (CTR_SALES_HEADER_CONTENT
IN (1, 		--Afficher la grille d'escompte
		2)),
  ctr_counter_mission_rpt_type VARCHAR2(1 BYTE) DEFAULT 'Z' NOT NULL CONSTRAINT ctr_counter_mission_type_ck CHECK (ctr_counter_mission_rpt_type in ('L', 'P', 'Z')  ),
  ctr_maximum_delivery_charge NUMBER(7,2) DEFAULT 99999.99 NOT NULL,
  ctr_max_deliv_charge_password VARCHAR2(6 BYTE) NOT NULL,
  ctr_cost_adj_in_cost_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_cost_adj_in_cost_switch_ck CHECK (CTR_COST_ADJ_IN_COST_SWITCH in (0, 1)  ),
  ctr_trans_alloc_in_cost_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_trans_alloc_in_cost_swi_ck CHECK (CTR_TRANS_ALLOC_IN_COST_SWITCH in (0, 1)  ),
  ctr_ven_agr_in_cost_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_ven_agr_in_cost_switch_ck CHECK (CTR_VEN_AGR_IN_COST_SWITCH in (0, 1)  ),
  ctr_c_and_r_in_cost_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_c_and_r_in_cost_switch_ck CHECK (CTR_C_AND_R_IN_COST_SWITCH in (0, 1)  ),
  ctr_vol_reb_in_cost_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_vol_reb_in_cost_switch_ck CHECK (CTR_VOL_REB_IN_COST_SWITCH in (0, 1)  ),
  ctr_purchase_popup_cost NUMBER DEFAULT 0 NOT NULL CONSTRAINT ctr_purchase_popup_cost_ck CHECK (CTR_PURCHASE_POPUP_COST IN (0, 1, 2, 3, 4, 5)),
  ctr_interco_posting_cost NUMBER(1) NOT NULL,
  ctr_interco_iat_code NUMBER(3) NOT NULL,
  ctr_hold_counter_order_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_hold_counter_order_swit_ck CHECK (CTR_HOLD_COUNTER_ORDER_SWITCH IN (0, 1)),
  ctr_interco_add_to_sale_switch NUMBER(1) NOT NULL CONSTRAINT ctr_interco_add_to_sale_sw_ck CHECK (ctr_interco_add_to_sale_switch IN (0,1)),
  ctr_purge_prod_log_modifs_days NUMBER(3) DEFAULT 365 NOT NULL,
  ctr_incl_pb_in_sugg_qty_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT ctr_incl_pb_in_sugg_qty_swi_ck CHECK (CTR_INCL_PB_IN_SUGG_QTY_SWITCH IN (0,1)),
  ctr_on_cus_order_calc_days NUMBER(2) DEFAULT 0 NOT NULL,
  ctr_reject_exp_receipt_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_reject_exp_rpt_switch_ck CHECK (CTR_REJECT_EXP_RECEIPT_SWITCH IN (0,1)),
  ctr_reject_life_receipt_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_reject_life_rpt_switch_ck CHECK (CTR_REJECT_LIFE_RECEIPT_SWITCH IN (0,1)),
  ctr_reject_exp_rma_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_reject_exp_rma_switch_ck CHECK (CTR_REJECT_EXP_RMA_SWITCH IN (0,1)),
  ctr_reject_life_rma_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_reject_life_rma_switch_ck CHECK (CTR_REJECT_LIFE_RMA_SWITCH IN (0,1)),
  ctr_manual_prebk_price_source NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT ctr_manual_prebk_price_sour_ck CHECK (ctr_manual_prebk_price_source IN (1,2)),
  ctr_validate_msi_fmt_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_validate_msi_fmt_switch_ck CHECK (CTR_VALIDATE_MSI_FMT_SWITCH IN (0, 1)),
  ctr_weeks_for_positioning NUMBER(2) DEFAULT 6 NOT NULL,
  ctr_case_height_interval NUMBER(5,3) DEFAULT 1 NOT NULL,
  ctr_validate_order_num_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_validate_order_num_swi_ck CHECK (ctr_validate_order_num_switch IN (0, 1)),
  ctr_caps_volume_rol_code VARCHAR2(15 BYTE),
  ctr_caps_week_recpt_max_vol NUMBER(7),
  ctr_caps_wkend_recpt_max_vol NUMBER(7),
  ctr_bi_direct_transit_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_bi_direct_transit_swi_ck CHECK (ctr_bi_direct_transit_switch IN (0, 1)),
  ctr_order_credit_days NUMBER(3) DEFAULT 999 NOT NULL,
  ctr_replacement_cost NUMBER(1) DEFAULT (0) NOT NULL CONSTRAINT ctr_replacement_cost_ck CHECK (ctr_replacement_cost IN (0,1,2,3,4)
	),
  ctr_sales_column_1_label_rp VARCHAR2(12 BYTE),
  ctr_sales_column_2_label_rp VARCHAR2(12 BYTE),
  ctr_sales_column_3_label_rp VARCHAR2(12 BYTE),
  ctr_sales_column_1_cont_rp NUMBER(2) CONSTRAINT ctr_sales_column_1_cont_rp_ck CHECK (CTR_SALES_COLUMN_1_CONT_RP
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_column_2_cont_rp NUMBER(2) CONSTRAINT ctr_sales_column_2_cont_rp_ck CHECK (CTR_SALES_COLUMN_2_CONT_RP
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_column_3_cont_rp NUMBER(2) CONSTRAINT ctr_sales_column_3_cont_rp_ck CHECK (CTR_SALES_COLUMN_3_CONT_RP
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_footing_1_label_rp VARCHAR2(12 BYTE),
  ctr_sales_footing_2_label_rp VARCHAR2(12 BYTE),
  ctr_sales_footing_3_label_rp VARCHAR2(12 BYTE),
  ctr_sales_footing_4_label_rp VARCHAR2(12 BYTE),
  ctr_sales_footing_5_label_rp VARCHAR2(12 BYTE),
  ctr_sales_footing_6_label_rp VARCHAR2(12 BYTE),
  ctr_sales_footing_7_label_rp VARCHAR2(12 BYTE),
  ctr_sales_footing_8_label_rp VARCHAR2(12 BYTE),
  ctr_sales_footing_9_label_rp VARCHAR2(12 BYTE),
  ctr_sales_footing_10_label_rp VARCHAR2(12 BYTE),
  ctr_sales_footing_11_label_rp VARCHAR2(12 BYTE),
  ctr_sales_footing_12_label_rp VARCHAR2(12 BYTE),
  ctr_sales_footing_1_cont_rp NUMBER(2) CONSTRAINT ctr_sales_footing_1_cont_rp_ck CHECK (CTR_SALES_FOOTING_1_CONT_RP
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_footing_2_cont_rp NUMBER(2) CONSTRAINT ctr_sales_footing_2_cont_rp_ck CHECK (CTR_SALES_FOOTING_2_CONT_RP
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_footing_3_cont_rp NUMBER(2) CONSTRAINT ctr_sales_footing_3_cont_rp_ck CHECK (CTR_SALES_FOOTING_3_CONT_RP
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_footing_4_cont_rp NUMBER(2) CONSTRAINT ctr_sales_footing_4_cont_rp_ck CHECK (CTR_SALES_FOOTING_4_CONT_RP
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_footing_5_cont_rp NUMBER(2) CONSTRAINT ctr_sales_footing_5_cont_rp_ck CHECK (CTR_SALES_FOOTING_5_CONT_RP
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_footing_6_cont_rp NUMBER(2) CONSTRAINT ctr_sales_footing_6_cont_rp_ck CHECK (CTR_SALES_FOOTING_6_CONT_RP
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_footing_7_cont_rp NUMBER(2) CONSTRAINT ctr_sales_footing_7_cont_rp_ck CHECK (CTR_SALES_FOOTING_7_CONT_RP
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_footing_8_cont_rp NUMBER(2) CONSTRAINT ctr_sales_footing_8_cont_rp_ck CHECK (CTR_SALES_FOOTING_8_CONT_RP
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_footing_9_cont_rp NUMBER(2) CONSTRAINT ctr_sales_footing_9_cont_rp_ck CHECK (CTR_SALES_FOOTING_9_CONT_RP
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_footing_10_cont_rp NUMBER(2) CONSTRAINT ctr_sales_footing_10_con_rp_ck CHECK (CTR_SALES_FOOTING_10_CONT_RP
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_footing_11_cont_rp NUMBER(2) CONSTRAINT ctr_sales_footing_11_con_rp_ck CHECK (CTR_SALES_FOOTING_11_CONT_RP
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_footing_12_cont_rp NUMBER(2) CONSTRAINT ctr_sales_footing_12_con_rp_ck CHECK (CTR_SALES_FOOTING_12_CONT_RP
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_history_1_label_rp VARCHAR2(12 BYTE),
  ctr_sales_history_2_label_rp VARCHAR2(12 BYTE),
  ctr_sales_history_3_label_rp VARCHAR2(12 BYTE),
  ctr_sales_history_4_label_rp VARCHAR2(12 BYTE),
  ctr_sales_history_5_label_rp VARCHAR2(12 BYTE),
  ctr_sales_history_6_label_rp VARCHAR2(12 BYTE),
  ctr_sales_history_1_cont_rp NUMBER(2) CONSTRAINT ctr_sales_history_1_cont_rp_ck CHECK (CTR_SALES_HISTORY_1_CONT_RP
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_history_2_cont_rp NUMBER(2) CONSTRAINT ctr_sales_history_2_cont_rp_ck CHECK (CTR_SALES_HISTORY_2_CONT_RP
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 37,38,39,40,41,42,43,44)),
  ctr_sales_history_3_cont_rp NUMBER(2) CONSTRAINT ctr_sales_history_3_cont_rp_ck CHECK (CTR_SALES_HISTORY_3_CONT_RP
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_history_4_cont_rp NUMBER(2) CONSTRAINT ctr_sales_history_4_cont_rp_ck CHECK (CTR_SALES_HISTORY_4_CONT_RP
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_history_5_cont_rp NUMBER(2) CONSTRAINT ctr_sales_history_5_cont_rp_ck CHECK (CTR_SALES_HISTORY_5_CONT_RP
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_sales_history_6_cont_rp NUMBER(2) CONSTRAINT ctr_sales_history_6_cont_rp_ck CHECK (CTR_SALES_HISTORY_6_CONT_RP
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,38,39,40,41,42,43,44)),
  ctr_avr_sync_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT ctr_avr_sync_switch_ck CHECK (CTR_AVR_SYNC_SWITCH IN (0, 1)),
  ctr_royalty_in_cost_switch NUMBER(7,2) DEFAULT 1 NOT NULL,
  ctr_accpac_version VARCHAR2(5 BYTE),
  ctr_process_shorted_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_process_shorted_switch_ck CHECK (CTR_PROCESS_SHORTED_SWITCH IN (0, 1)),
  ctr_consolidate_mission_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_consolidate_mission_swi_ck CHECK (CTR_CONSOLIDATE_MISSION_SWITCH IN (0, 1)),
  ctr_purge_cus_log_modifs_days NUMBER(3) DEFAULT 1 NOT NULL,
  ctr_purge_ven_log_modifs_days NUMBER(3) DEFAULT 1 NOT NULL,
  ctr_crt_consignment_code NUMBER(3) NOT NULL,
  ctr_use_cycle_for_avail_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_use_cycle_for_avail_swi_ck CHECK (CTR_USE_CYCLE_FOR_AVAIL_SWITCH IN (0, 1)),
  ctr_transfer_days NUMBER(3) DEFAULT 1 NOT NULL,
  ctr_purge_inm_days NUMBER(4) DEFAULT 731 NOT NULL CONSTRAINT ctr_purge_inm_days_ck CHECK (ctr_purge_inm_days >= 731),
  ctr_purge_rtd_days NUMBER(4) DEFAULT 731 NOT NULL CONSTRAINT ctr_purge_rtd_days_ck CHECK (ctr_purge_rtd_days >= 731),
  ctr_purge_ict_days NUMBER(4) DEFAULT 731 NOT NULL CONSTRAINT ctr_purge_ict_days_ck CHECK (ctr_purge_ict_days >= 731),
  ctr_alt_release_message VARCHAR2(100 BYTE),
  ctr_reset_liquidation_date_day NUMBER(3) DEFAULT 0 NOT NULL,
  ctr_email_for_price_change VARCHAR2(200 BYTE),
  ctr_variance_cubiscan NUMBER(6,3),
  ctr_pallet_invoice_prefix VARCHAR2(1 BYTE),
  ctr_iat_system_count_code NUMBER(3) DEFAULT 99 NOT NULL,
  ctr_purge_fax_log_days NUMBER(3) DEFAULT 365 NOT NULL,
  ctr_match_format_on_cud_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT ctr_match_format_on_cud_swi_ck CHECK (CTR_MATCH_FORMAT_ON_CUD_SWITCH IN (0, 1)),
  ctr_purchase_cc_e_mail VARCHAR2(80 BYTE),
  ctr_purge_use_log_modifs_days NUMBER(3) DEFAULT 1 NOT NULL,
  ctr_roadnet_interface_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_roadnet_interface_swi_ck CHECK (CTR_ROADNET_INTERFACE_SWITCH IN (0, 1)),
  ctr_rg_order_cutoff_time VARCHAR2(5 BYTE),
  ctr_prd_code_min NUMBER(10),
  ctr_prd_code_max NUMBER(10),
  ctr_prd_code_numeric_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_prd_code_numeric_switch_ck CHECK (CTR_PRD_CODE_NUMERIC_SWITCH IN (0, 1)),
  ctr_release_sp_in_telev_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_release_sp_in_telev_swi_ck CHECK (CTR_RELEASE_SP_IN_TELEV_SWITCH IN (0, 1)),
  ctr_cty_purch_payable_code VARCHAR2(3 BYTE) NOT NULL,
  ctr_auto_match_price_percent NUMBER(6,3) DEFAULT 0 NOT NULL,
  ctr_auto_match_taxes_percent NUMBER(6,3) DEFAULT 0 NOT NULL,
  ctr_auto_match_qty_percent NUMBER(6,3) DEFAULT 0 NOT NULL,
  ctr_auto_match_qty_maximum NUMBER(7) DEFAULT 0 NOT NULL,
  ctr_auto_match_weight_percent NUMBER(6,3) DEFAULT 0 NOT NULL,
  ctr_auto_match_weight_maximum NUMBER(8,3) DEFAULT 0 NOT NULL,
  ctr_bef_quot_contr_start_days NUMBER(3) DEFAULT 0 NOT NULL,
  ctr_aft_quot_contr_start_days NUMBER(3) DEFAULT 0 NOT NULL,
  ctr_bef_quot_contr_end_days NUMBER(3) DEFAULT 0 NOT NULL,
  ctr_week_past_for_average NUMBER(2) NOT NULL,
  ctr_week_future_for_average NUMBER(2) NOT NULL,
  ctr_drop_manager_switch NUMBER(1) NOT NULL CONSTRAINT ctr_drop_manager_switch_ck CHECK (CTR_DROP_MANAGER_SWITCH IN (0, 1)),
  ctr_admin2_in_cost_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_admin2_in_cost_switch_ck CHECK (CTR_ADMIN2_IN_COST_SWITCH IN (0, 1)),
  ctr_base_po_alt_message VARCHAR2(150 BYTE),
  ctr_quantity_tolerence_percent NUMBER(6,3),
  ctr_urgent_replenishment_days NUMBER(3) DEFAULT 8 NOT NULL,
  ctr_cash_carry_rounding_off NUMBER(3,2),
  ctr_profit_in_extract_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT ctr_profit_in_extract_swi_ck CHECK (CTR_PROFIT_IN_EXTRACT_SWITCH IN (0,1)),
  ctr_rebill_crt_code NUMBER(3),
  ctr_purge_shopping_cart_days NUMBER(3) DEFAULT 999 NOT NULL,
  ctr_proclass_input_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_proclass_input_switch_ck CHECK (CTR_PROCLASS_INPUT_SWITCH IN (0,1)),
  ctr_strategy_override_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_strategy_override_swi_ck CHECK (CTR_STRATEGY_OVERRIDE_SWITCH IN (0,1)),
  ctr_purge_zisa_days NUMBER(3) DEFAULT 999 NOT NULL,
  ctr_disp_cost_in_tele_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_disp_cost_in_tele_switc_ck CHECK (CTR_DISP_COST_IN_TELE_SWITCH IN (0,1)),
  ctr_po_hist_with_cost_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT ctr_po_hist_with_cost_swi_ck CHECK (CTR_PO_HIST_WITH_COST_SWITCH IN (0, 1)),
  ctr_purge_public_whse_days NUMBER(3) DEFAULT 999 NOT NULL,
  ctr_interco_in_caps_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT ctr_interco_in_caps_switch_ck CHECK (CTR_INTERCO_IN_CAPS_SWITCH IN (0,1)),
  ctr_unpost_inh_on_stmt_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_unpost_inh_on_stmt_swi_ck CHECK (CTR_UNPOST_INH_ON_STMT_SWITCH IN (0, 1)),
  ctr_regen_statement_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ctr_regen_statement_switch_ck CHECK (CTR_REGEN_STATEMENT_SWITCH IN (0, 1)),
  ctr_repl_only_max_loc_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT ctr_repl_only_max_loc_swi_ck CHECK (CTR_REPL_ONLY_MAX_LOC_SWITCH IN (0, 1)),
  CONSTRAINT ctr_disp_cost_in_tele_ck CHECK (CTR_DISP_COST_IN_TELE_SWITCH = 1 OR
(CTR_DISP_COST_IN_TELE_SWITCH = 0 AND
 CTR_SALES_COLUMN_1_CONTENT   NOT IN (15,16,40) AND
 CTR_SALES_COLUMN_2_CONTENT   NOT IN (15,16,40) AND
 CTR_SALES_COLUMN_3_CONTENT   NOT IN (15,16,40) AND
 CTR_SALES_FOOTING_1_CONTENT  NOT IN (15,16,40) AND
 CTR_SALES_FOOTING_2_CONTENT  NOT IN (15,16,40) AND
 CTR_SALES_FOOTING_3_CONTENT  NOT IN (15,16,40) AND
 CTR_SALES_FOOTING_4_CONTENT  NOT IN (15,16,40) AND
 CTR_SALES_FOOTING_5_CONTENT  NOT IN (15,16,40) AND
 CTR_SALES_FOOTING_6_CONTENT  NOT IN (15,16,40) AND
 CTR_SALES_FOOTING_7_CONTENT  NOT IN (15,16,40) AND
 CTR_SALES_FOOTING_8_CONTENT  NOT IN (15,16,40) AND
 CTR_SALES_FOOTING_9_CONTENT  NOT IN (15,16,40) AND
 CTR_SALES_FOOTING_10_CONTENT NOT IN (15,16,40) AND
 CTR_SALES_FOOTING_11_CONTENT NOT IN (15,16,40) AND
 CTR_SALES_FOOTING_12_CONTENT NOT IN (15,16,40) AND
 CTR_SALES_COLUMN_1_CONT_RP   NOT IN (15,16,40) AND
 CTR_SALES_COLUMN_2_CONT_RP   NOT IN (15,16,40) AND
 CTR_SALES_COLUMN_3_CONT_RP   NOT IN (15,16,40) AND
 CTR_SALES_FOOTING_1_CONT_RP  NOT IN (15,16,40) AND
 CTR_SALES_FOOTING_2_CONT_RP  NOT IN (15,16,40) AND
 CTR_SALES_FOOTING_3_CONT_RP  NOT IN (15,16,40) AND
 CTR_SALES_FOOTING_4_CONT_RP  NOT IN (15,16,40) AND
 CTR_SALES_FOOTING_5_CONT_RP  NOT IN (15,16,40) AND
 CTR_SALES_FOOTING_6_CONT_RP  NOT IN (15,16,40) AND
 CTR_SALES_FOOTING_7_CONT_RP  NOT IN (15,16,40) AND
 CTR_SALES_FOOTING_8_CONT_RP  NOT IN (15,16,40) AND
 CTR_SALES_FOOTING_9_CONT_RP  NOT IN (15,16,40) AND
 CTR_SALES_FOOTING_10_CONT_RP NOT IN (15,16,40) AND
 CTR_SALES_FOOTING_11_CONT_RP NOT IN (15,16,40) AND
 CTR_SALES_FOOTING_12_CONT_RP NOT IN (15,16,40) )
),
  CONSTRAINT ctr_picklist_roadnet_ck CHECK ( (CTR_AUTOMATIC_PICK_LIST_SWITCH = 0 AND CTR_ROADNET_INTERFACE_SWITCH = 1) OR (CTR_AUTOMATIC_PICK_LIST_SWITCH = 1 AND CTR_ROADNET_INTERFACE_SWITCH = 0) OR (CTR_AUTOMATIC_PICK_LIST_SWITCH = 0 AND CTR_ROADNET_INTERFACE_SWITCH = 0)),
  CONSTRAINT ctr_seasonal_message_ck CHECK ((CTR_SEASONAL_MESSAGE_DATE is not NULL and
 CTR_SEASONAL_INVOICE_MESSAGE is not NULL ) or
(CTR_SEASONAL_MESSAGE_DATE  is NULL and
 CTR_SEASONAL_INVOICE_MESSAGE is NULL )),
  CONSTRAINT ctr_pk PRIMARY KEY (ctr_code),
  CONSTRAINT ctr_caps_volume_rol_fk FOREIGN KEY (ctr_caps_volume_rol_code) REFERENCES phenix."ROLES" (rol_code),
  CONSTRAINT ctr_crt_consignment_fk FOREIGN KEY (ctr_crt_consignment_code) REFERENCES phenix.credit_types (crt_code),
  CONSTRAINT ctr_crt_promo_fk FOREIGN KEY (ctr_crt_promotion_code) REFERENCES phenix.credit_types (crt_code),
  CONSTRAINT ctr_crt_volume_fk FOREIGN KEY (ctr_crt_volume_rebate_code) REFERENCES phenix.credit_types (crt_code),
  CONSTRAINT ctr_cty_fk FOREIGN KEY (ctr_cty_code) REFERENCES phenix.contact_types (cty_code),
  CONSTRAINT ctr_cty_purch_fk FOREIGN KEY (ctr_cty_purch_code) REFERENCES phenix.contact_types (cty_code),
  CONSTRAINT ctr_cty_purch_payable_fk FOREIGN KEY (ctr_cty_purch_payable_code) REFERENCES phenix.contact_types (cty_code),
  CONSTRAINT ctr_iat_no_change_code_fk FOREIGN KEY (ctr_iat_no_change_code) REFERENCES phenix.inventory_adjustment_types (iat_code),
  CONSTRAINT ctr_iat_physical_count_code_fk FOREIGN KEY (ctr_iat_physical_count_code) REFERENCES phenix.inventory_adjustment_types (iat_code),
  CONSTRAINT ctr_iat_system_count_code_fk FOREIGN KEY (ctr_iat_system_count_code) REFERENCES phenix.inventory_adjustment_types (iat_code),
  CONSTRAINT ctr_interco_iat_code_fk FOREIGN KEY (ctr_interco_iat_code) REFERENCES phenix.inventory_adjustment_types (iat_code),
  CONSTRAINT ctr_prv_fk FOREIGN KEY (ctr_prv_code) REFERENCES phenix.provinces (prv_code),
  CONSTRAINT ctr_rebill_crt_code_fk FOREIGN KEY (ctr_rebill_crt_code) REFERENCES phenix.credit_types (crt_code),
  CONSTRAINT ctr_shr_base_fk FOREIGN KEY (ctr_shr_base_code) REFERENCES phenix.shorted_reasons (shr_code),
  CONSTRAINT ctr_shr_external_fk FOREIGN KEY (ctr_shr_external_code) REFERENCES phenix.shorted_reasons (shr_code),
  CONSTRAINT ctr_transit_loc_fk FOREIGN KEY (ctr_transit_loc_code) REFERENCES phenix.locations (loc_code),
  CONSTRAINT ctr_tty_fk FOREIGN KEY (ctr_tty_code) REFERENCES phenix.tender_types (tty_code),
  CONSTRAINT ctr_whs_fk FOREIGN KEY (ctr_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.control IS 'Identifie les paramètres pour le systême';
COMMENT ON COLUMN phenix.control.ctr_code IS 'Indique le numéro d''identifiant unique (ID) du contrôle';
COMMENT ON COLUMN phenix.control.ctr_prv_code IS 'Indique le code de la province de la compagnie';
COMMENT ON COLUMN phenix.control.ctr_shr_base_code IS 'Indique le code du message à court "maison"';
COMMENT ON COLUMN phenix.control.ctr_shr_external_code IS 'Indique le code du message à court pour une quantité manquante (à la réception) supérieure au pourcentage limite';
COMMENT ON COLUMN phenix.control.ctr_approval_required_switch IS 'Indique si les commandes à la vente doivent être vérifiées';
COMMENT ON COLUMN phenix.control.ctr_avr_applied_on IS 'Indique le coûtant sur lequel les volumes annuels sont appliqués  (Note : Les AVR n''affectent jamais le coûtant facturé)';
COMMENT ON COLUMN phenix.control.ctr_cancelation_days IS 'Indique le nombre de jours (après la date de livraison) permis avant l''annulation de la commande';
COMMENT ON COLUMN phenix.control.ctr_company_address IS 'Indique l''adresse de la compagnie';
COMMENT ON COLUMN phenix.control.ctr_company_city IS 'Indique la ville de la compagnie';
COMMENT ON COLUMN phenix.control.ctr_company_name IS 'Indique le nom de la compagnie';
COMMENT ON COLUMN phenix.control.ctr_company_postal_code IS 'Indique le code postal de la compagnie';
COMMENT ON COLUMN phenix.control.ctr_cost_1_name IS 'Indique le nom du coûtant 1';
COMMENT ON COLUMN phenix.control.ctr_cost_2_name IS 'Indique le nom du coûtant 2';
COMMENT ON COLUMN phenix.control.ctr_cost_3_name IS 'Indique le nom du coûtant 3';
COMMENT ON COLUMN phenix.control.ctr_cost_4_name IS 'Indique le nom du coûtant 4';
COMMENT ON COLUMN phenix.control.ctr_credit_retain_percent IS 'Indique le pourcentage retenu pour les frais de manutention';
COMMENT ON COLUMN phenix.control.ctr_day_of_week IS 'Indique le jour actuel de la semaine (plus utilisé dans Phenix)';
COMMENT ON COLUMN phenix.control.ctr_drop_past_days IS 'Indique le nombre de jours permis entre la date de facture et la date de déposition d''une commande indirecte : si la date de la facture excède ce nombre de jour, elle sera rejetée';
COMMENT ON COLUMN phenix.control.ctr_federal_tax_number IS 'Indique le numéro de taxe fédérale';
COMMENT ON COLUMN phenix.control.ctr_invoice_cost IS 'Indique le coûtant servant à la facturation';
COMMENT ON COLUMN phenix.control.ctr_order_days_limit IS 'Indique le nombre de jours maximum permis entre l''entrée d''une commande et la date de livraison : si le nombre de jours excède, la commande sera rejetée';
COMMENT ON COLUMN phenix.control.ctr_provincial_tax_number IS 'Indique le numéro de taxe provinciale';
COMMENT ON COLUMN phenix.control.ctr_recalc_frequency IS 'Indique la fréquence de calcul des coûts moyens (Immédiat, Journalier, Hebdomadaire, Périodique)';
COMMENT ON COLUMN phenix.control.ctr_shorted_percent IS 'Indique le pourcentage vérifié à la réception pour déterminer si le "message à cours manufacturier" sera appliqué';
COMMENT ON COLUMN phenix.control.ctr_telephone_number IS 'Indique le numéro de téléphone de la compagnie';
COMMENT ON COLUMN phenix.control.ctr_thawing_end_date IS 'Indique la date de fin de la période de dégel';
COMMENT ON COLUMN phenix.control.ctr_thawing_start_date IS 'Indique la date de début de la période de dégel';
COMMENT ON COLUMN phenix.control.ctr_ticket_price IS 'Indique le prix des étiquettes';
COMMENT ON COLUMN phenix.control.ctr_tobacco_tax_number IS 'Indique le numéro de la taxe tabac';
COMMENT ON COLUMN phenix.control.ctr_week_start_day IS 'Indique le jour de début de semaine de la compagnie';
COMMENT ON COLUMN phenix.control.ctr_alt_cost_1_name IS 'Indique le nom alternatif du coûtant 1';
COMMENT ON COLUMN phenix.control.ctr_alt_cost_2_name IS 'Indique le nom alternatif du coûtant 2';
COMMENT ON COLUMN phenix.control.ctr_alt_cost_3_name IS 'Indique le nom alternatif du coûtant 3';
COMMENT ON COLUMN phenix.control.ctr_alt_cost_4_name IS 'Indique le nom alternatif du coûtant 4';
COMMENT ON COLUMN phenix.control.ctr_broker_vendor_id IS 'Indique le code du fournisseur courtier';
COMMENT ON COLUMN phenix.control.ctr_duns_number IS 'Indique le numéro DUNS de la compagnie (servant à EDI)';
COMMENT ON COLUMN phenix.control.ctr_email IS 'Indique l''adresse courriel de la compagnie';
COMMENT ON COLUMN phenix.control.ctr_fax_number IS 'Indique le numéro de télécopieur de la compagnie';
COMMENT ON COLUMN phenix.control.ctr_override_flag IS 'Indique si l''utilisateur (télévendeur) a le droit de modifier les prix à la saisie d''une commande';
COMMENT ON COLUMN phenix.control.ctr_ar_vendor_prefix IS 'Indique le préfixe pour les comptes fournisseur à recevoir';
COMMENT ON COLUMN phenix.control.ctr_override_password IS 'Indique le mot de passe permettant de modifier les prix à la saisie d''une commande';
COMMENT ON COLUMN phenix.control.ctr_sales_column_1_content IS 'Indique le code du contenu de la première colonne optionnelle (télévente)';
COMMENT ON COLUMN phenix.control.ctr_sales_column_1_label IS 'Indique le libellé de la première colonne optionnelle (télévente)';
COMMENT ON COLUMN phenix.control.ctr_sales_column_2_content IS 'Indique le code du contenu de la deuxième colonne optionnelle (télévente)';
COMMENT ON COLUMN phenix.control.ctr_sales_column_2_label IS 'Indique le libellé de la deuxième colonne optionnelle (télévente)';
COMMENT ON COLUMN phenix.control.ctr_sales_column_3_content IS 'Indique le code du contenu de la troisième colonne optionnelle (télévente)';
COMMENT ON COLUMN phenix.control.ctr_sales_column_3_label IS 'Indique le libellé de la troisième colonne optionnelle (télévente)';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_1_content IS 'Indique le code du contenu du premier pied de page optionnel (télévente)';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_1_label IS 'Indique le libellé du premier pied de page optionnel (télévente)';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_2_content IS 'Indique le code du contenu du deuxième pied de page optionnel (télévente)';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_2_label IS 'Indique le libellé du deuxième pied de page optionnel (télévente)';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_3_content IS 'Indique le code du contenu du troisième pied de page optionnel (télévente)';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_3_label IS 'Indique le libellé du troisième pied de page optionnel (télévente)';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_4_content IS 'Indique le code du contenu du quatrième pied de page optionnel (télévente)';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_4_label IS 'Indique le libellé du quatrième pied de page optionnel (télévente)';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_5_content IS 'Indique le code du contenu du cinquième pied de page optionnel (télévente)';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_5_label IS 'Indique le libellé du cinquième pied de page optionnel (télévente)';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_6_content IS 'Indique le code du contenu du sixième pied de page optionnel (télévente)';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_6_label IS 'Indique le libellé du sixième pied de page optionnel (télévente)';
COMMENT ON COLUMN phenix.control.ctr_sales_history_1_content IS 'Indique le code du contenu du premier pied de page historique optionnel (profil client)';
COMMENT ON COLUMN phenix.control.ctr_sales_history_1_label IS 'Indique le libellé du premier pied de page historique optionnel (profil client)';
COMMENT ON COLUMN phenix.control.ctr_sales_history_2_content IS 'Indique le code du contenu du deuxième pied de page historique optionnel (profil client)';
COMMENT ON COLUMN phenix.control.ctr_sales_history_2_label IS 'Indique le libellé du deuxième pied de page historique optionnel (profil client)';
COMMENT ON COLUMN phenix.control.ctr_sales_history_3_content IS 'Indique le code du contenu du troisième pied de page historique optionnel (profil client)';
COMMENT ON COLUMN phenix.control.ctr_sales_history_3_label IS 'Indique le libellé du troisième pied de page historique optionnel (profil client)';
COMMENT ON COLUMN phenix.control.ctr_sales_history_4_content IS 'Indique le code du contenu du quatrième pied de page historique optionnel (profil client)';
COMMENT ON COLUMN phenix.control.ctr_sales_history_4_label IS 'Indique le libellé du quatrième pied de page historique optionnel (profil client)';
COMMENT ON COLUMN phenix.control.ctr_sales_history_5_content IS 'Indique le code du contenu du cinquième pied de page historique optionnel (profil client)';
COMMENT ON COLUMN phenix.control.ctr_sales_history_5_label IS 'Indique le libellé du cinquième pied de page historique optionnel (profil client)';
COMMENT ON COLUMN phenix.control.ctr_sales_history_6_content IS 'Indique le code du contenu du sixième pied de page historique optionnel (profil client)';
COMMENT ON COLUMN phenix.control.ctr_sales_history_6_label IS 'Indique le libellé du sixième pied de page historique optionnel (profil client)';
COMMENT ON COLUMN phenix.control.ctr_pick_generation_switch IS 'Indique s''il y a une génération des missions de cueillette en cours';
COMMENT ON COLUMN phenix.control.ctr_member_id IS 'Indique le code de la compagnie chez le courtier';
COMMENT ON COLUMN phenix.control.ctr_discard_week IS 'Indique le nombre de semaine(s) à exclure pour le calcul des ventes moyennes (CAPS)';
COMMENT ON COLUMN phenix.control.ctr_purchase_factor IS 'Indique quel pourcentage minimum du multiple d''achat on doit avoir pour arrondir au plus élevé (quantité suggérée dans CAPS)';
COMMENT ON COLUMN phenix.control.ctr_week_for_average IS 'Indique le nombre de semaines utilisées dans le calcul des ventes moyennes (CAPS)';
COMMENT ON COLUMN phenix.control.ctr_exclude_week_switch IS 'Indique si la semaine courante est exclus dans le calcul des statistiques (CAPS)';
COMMENT ON COLUMN phenix.control.ctr_base_invoice_message IS 'Indique le message de base pour la facturation';
COMMENT ON COLUMN phenix.control.ctr_seasonal_invoice_message IS 'Indique le message saisonnier pour la facture';
COMMENT ON COLUMN phenix.control.ctr_seasonal_message_date IS 'Indique la date d''expiration du message saisonnier';
COMMENT ON COLUMN phenix.control.ctr_price_change_purge_days IS 'Indique le nombre de jours avant la suppression des changements de prix déjà activés';
COMMENT ON COLUMN phenix.control.ctr_automatic_pick_list_switch IS 'Indique si les demandes de cueillette sont créées automatiquement';
COMMENT ON COLUMN phenix.control.ctr_route_dates_purge_days IS 'Indique le nombre de jours avant la suppression d''une route terminée';
COMMENT ON COLUMN phenix.control.ctr_purge_vendor_promo_days IS 'Indique le nombre de jours avant la suppression d''une promotion fournisseur terminée';
COMMENT ON COLUMN phenix.control.ctr_purge_customer_promo_days IS 'Indique le nombre de jours avant la suppression d''une promotion client terminée';
COMMENT ON COLUMN phenix.control.ctr_vendor_default_term IS 'Indique le code du terme utilisé par défaut pour le fournisseur qui devient client';
COMMENT ON COLUMN phenix.control.ctr_apply_price_change_switch IS 'Indique si un changement de prix sera appliquer à tous les fournisseurs vendant ce produit';
COMMENT ON COLUMN phenix.control.ctr_updt_description_switch IS 'Indique si on modifie automatiquement la description des produits lors de synchronisations';
COMMENT ON COLUMN phenix.control.ctr_updt_alt_desc_switch IS 'Indique si on modifie automatiquement la description alternative des produits lors de synchronisations';
COMMENT ON COLUMN phenix.control.ctr_updt_short_desc_switch IS 'Indique si on modifie automatiquement la description courte des produits lors de synchronisations';
COMMENT ON COLUMN phenix.control.ctr_updt_purchase_upc_switch IS 'Indique si on modifie automatiquement l''identifiant du code à barres du format d''achat des produits lors de synchronisations';
COMMENT ON COLUMN phenix.control.ctr_updt_weight_switch IS 'Indique si on modifie automatiquement le poids du format d''achat des produits lors de synchronisations';
COMMENT ON COLUMN phenix.control.ctr_updt_height_switch IS 'Indique si on modifie automatiquement la hauteur du format d''achat des produits lors de synchronisations';
COMMENT ON COLUMN phenix.control.ctr_updt_width_switch IS 'Indique si on modifie automatiquement la largeur du format d''achat des produits lors de synchronisations';
COMMENT ON COLUMN phenix.control.ctr_updt_lenght_switch IS 'Indique si on modifie automatiquement la longueur du format d''achat des produits lors de synchronisations';
COMMENT ON COLUMN phenix.control.ctr_updt_season_start_switch IS 'Indique si on modifie automatiquement la date de début de saison des produits (saisonnier) lors de synchronisations';
COMMENT ON COLUMN phenix.control.ctr_updt_season_end_switch IS 'Indique si on modifie automatiquement la date de fin de saison des produits (saisonnier) lors de synchronisations';
COMMENT ON COLUMN phenix.control.ctr_admin_method IS 'Indique la méthode de calcul des profits';
COMMENT ON COLUMN phenix.control.ctr_toll_free_telephone IS 'Indique le numéro de téléphone sans frais de la compagnie';
COMMENT ON COLUMN phenix.control.ctr_prf_description_length IS 'Indique la longueur maximale de l''empaquetage d''un produit format';
COMMENT ON COLUMN phenix.control.ctr_catalog_last_printed_date IS 'Indique la date de la dernière impression des bottins';
COMMENT ON COLUMN phenix.control.ctr_price_change_lead_days IS 'Indique le nombre de jours de devancement des changements de prix lors des synchronisations automatiques';
COMMENT ON COLUMN phenix.control.ctr_cty_code IS 'Indique le code du type de contact utilisé à la vente';
COMMENT ON COLUMN phenix.control.ctr_alt_seasonal_message IS 'Indique le message saisonnier alternatif pour la facture';
COMMENT ON COLUMN phenix.control.ctr_alt_base_message IS 'Indique le message de base alternatif pour la facturation';
COMMENT ON COLUMN phenix.control.ctr_default_ias IS 'Indique l''adresse IP du serveur d''application par défaut';
COMMENT ON COLUMN phenix.control.ctr_weight_tolerance_percent IS 'Indique le pourcentage de différence toléré entre la quantité à cueillir et la quantité réellement cueillie';
COMMENT ON COLUMN phenix.control.ctr_allocation_1_applied_on IS 'Indique le coûtant sur lequel les promos allocation1 sont appliquées';
COMMENT ON COLUMN phenix.control.ctr_allocation_2_applied_on IS 'Indique le coûtant sur lequel les promos allocation2 sont appliquées';
COMMENT ON COLUMN phenix.control.ctr_allocation_3_applied_on IS 'Indique le coûtant sur lequel les promos allocation3 sont appliquées';
COMMENT ON COLUMN phenix.control.ctr_damaged_goods_zones IS 'Indique les zones d''entrepôt servant aux biens endommagés';
COMMENT ON COLUMN phenix.control.ctr_profile_weeks_regular IS 'Indique le nombre de semaines où les produits réguliers seront maintenus dans le profil client';
COMMENT ON COLUMN phenix.control.ctr_profile_weeks_seasonal IS 'Indique le nombre de semaines où les produits saisonniers seront maintenus dans le profil client';
COMMENT ON COLUMN phenix.control.ctr_multi_warehouse_switch IS 'Indique si plusieurs entrepôts différents sont utilisés par le système';
COMMENT ON COLUMN phenix.control.ctr_whs_code IS 'Indique le code de l''entrepôt principal';
COMMENT ON COLUMN phenix.control.ctr_warehouse_conversion IS 'Indique la conversion décimale utilisée pour l''entrepôt';
COMMENT ON COLUMN phenix.control.ctr_default_environment IS 'Indique l''environnement français de base';
COMMENT ON COLUMN phenix.control.ctr_quotation_purge_days IS 'Indique le nombre de jours avant la suppression des soumissions terminées';
COMMENT ON COLUMN phenix.control.ctr_super_distributor_switch IS 'Indique si la compagnie est un super distributeur';
COMMENT ON COLUMN phenix.control.ctr_affect_match_cost_1_switch IS 'Indique si l''allocation 1 affecte le coûtant facturé';
COMMENT ON COLUMN phenix.control.ctr_affect_match_cost_2_switch IS 'Indique si l''allocation 2 affecte le coûtant facturé';
COMMENT ON COLUMN phenix.control.ctr_affect_match_cost_3_switch IS 'Indique si l''allocation 3 affecte le coûtant facturé';
COMMENT ON COLUMN phenix.control.ctr_manual_disc_cost_affected IS 'Indique le coûtant sur lequel les allocations manuelles sont appliquées (Note : Les allocations manuelles affectent toujours le coûtant facturé)';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_7_label IS 'Indique le libellé du septième pied de page optionnel (télévente)';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_7_content IS 'Indique le code du contenu du septième pied de page optionnel (télévente)';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_8_label IS 'Indique le libellé du huitième pied de page optionnel (télévente)';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_8_content IS 'Indique le code du contenu du huitième pied de page optionnel (télévente)';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_9_label IS 'Indique le libellé du neuvième pied de page optionnel (télévente)';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_9_content IS 'Indique le code du contenu du neuvième pied de page optionnel (télévente)';
COMMENT ON COLUMN phenix.control.ctr_max_prd_description_length IS 'Indique la longueur maximum de la description de produit';
COMMENT ON COLUMN phenix.control.ctr_print_rou_per_cust_switch IS 'Indique si, lors des routes, on imprime un sommaire par client en même temps que ses factures et un sommaire de route à la toute fin';
COMMENT ON COLUMN phenix.control.ctr_sequence_interval IS 'Indique l''intervalle des séquences d''affichage proposée par défaut lors de la création de produits';
COMMENT ON COLUMN phenix.control.ctr_cty_purch_code IS 'Indique le code du type de contact utilisé pour les achats';
COMMENT ON COLUMN phenix.control.ctr_inv_pickup_copies IS 'Indique le nombre de copies supplémentaires à imprimer lors d''une commande de type comptoir';
COMMENT ON COLUMN phenix.control.ctr_vcg_default_cat_code IS 'Indique le code de la catégorie de produit fournisseur par défaut';
COMMENT ON COLUMN phenix.control.ctr_vcg_cat_description IS 'Indique la description de la catégorie de produit fournisseur par défaut';
COMMENT ON COLUMN phenix.control.ctr_vcg_alt_cat_description IS 'Indique la description alternative de la catégorie de produit fournisseur par défaut';
COMMENT ON COLUMN phenix.control.ctr_prebook_reservation_days IS 'Indique le nombre de jour de devancement permis à la génération des cueillettes';
COMMENT ON COLUMN phenix.control.ctr_del_prod_in_quotation_days IS 'Indique le nombre de jours que le produit sera conservé dans les soumissions après avoir été détruit';
COMMENT ON COLUMN phenix.control.ctr_sysgen_prd_reset IS 'Indique le point de retour pour la génération automatique du code de produit';
COMMENT ON COLUMN phenix.control.ctr_sysgen_prd_next IS 'Indique le prochain code de produit généré automatiquement';
COMMENT ON COLUMN phenix.control.ctr_cross_dock_order_type IS 'Indique le type de commande passé au système d''entrepôt pour une transaction "quai à quai"';
COMMENT ON COLUMN phenix.control.ctr_web_identification_key IS 'Indique la clé d''identification utilisée pour les services WEB';
COMMENT ON COLUMN phenix.control.ctr_base_po_message IS 'Indique le message standard pour les commandes d''achats';
COMMENT ON COLUMN phenix.control.ctr_last_prx_date IS 'Indique la date de la dernière synchronisation de prix';
COMMENT ON COLUMN phenix.control.ctr_last_vpd_date IS 'Indique la date de la dernière synchronisation de produits fournisseur';
COMMENT ON COLUMN phenix.control.ctr_last_vpr_date IS 'Indique la date de la dernière synchronisation de promotions fournisseur';
COMMENT ON COLUMN phenix.control.ctr_neg_discount_terms_code IS 'Indique le code du terme utilisé pour les escomptes négatives';
COMMENT ON COLUMN phenix.control.ctr_wms_flag IS 'Indique le système de gestion d''entrepôt utilisé';
COMMENT ON COLUMN phenix.control.ctr_spec_ord_tickets_switch IS 'Indique si les étiquettes sont imprimées pour les commandes spéciales';
COMMENT ON COLUMN phenix.control.ctr_bin_date_validation_days IS 'Indique le nombre de jours permis entre l''ancienne et la nouvelle date d''expiration';
COMMENT ON COLUMN phenix.control.ctr_weight_tolerance_perc IS 'Indique le pourcentage de différence toléré entre le poids moyen du produit et le poids de réception';
COMMENT ON COLUMN phenix.control.ctr_create_loc_via_rf_switch IS 'Indique si la localisation peut être créée par la station RF';
COMMENT ON COLUMN phenix.control.ctr_vpd_sync_switch IS 'Indique si les produits fournisseur sont synchronisés automatiquement';
COMMENT ON COLUMN phenix.control.ctr_vpr_sync_switch IS 'Indique si les promotions fournisseur sont synchronisées automatiquement';
COMMENT ON COLUMN phenix.control.ctr_nac_sync_switch IS 'Indique si les comptes nationaux sont synchronisés automatiquement';
COMMENT ON COLUMN phenix.control.ctr_prx_sync_switch IS 'Indique si les changements de prix sont synchronisés automatiquement';
COMMENT ON COLUMN phenix.control.ctr_qtd_check_promo_switch IS 'Indique si on vérifie pour prendre le meilleur prix entre une soumission et une promotion (respectant les pourcentages de temps de la soumission)';
COMMENT ON COLUMN phenix.control.ctr_ap_drop_post_by_vds_switch IS 'Indique si la réconciliation des commandes indirectes des comptes payables est basée sur le fournisseur';
COMMENT ON COLUMN phenix.control.ctr_iat_physical_count_code IS 'Indique le code du type d''ajustement utilisé lorsqu''il y a une prise d''inventaire';
COMMENT ON COLUMN phenix.control.ctr_iat_no_change_code IS 'Indique le code du type d''ajustement utilisé lorsqu''il n''y a aucune différence lors d''un décompte';
COMMENT ON COLUMN phenix.control.ctr_allow_mix_exp_date_switch IS 'Indique si on permet de mixer des dates d''expiration dans une même localisation (lorsque l''écart de date permis est dépassé)';
COMMENT ON COLUMN phenix.control.ctr_pick_avail_or_ordered_flag IS 'Indique si on envoit cueillir la quantité commandée ou la quantité disponible';
COMMENT ON COLUMN phenix.control.ctr_rf_max_history_screens IS 'Indique le nombre maximum d''écrans RF maintenus dans l''historique par utilisateur';
COMMENT ON COLUMN phenix.control.ctr_email_for_rf_errors IS 'Indique l''adresse de courriel à contacter en cas d''erreurs';
COMMENT ON COLUMN phenix.control.ctr_pick_for_dock_switch IS 'Indique si la cueillette est autorisée sur le quai de réception';
COMMENT ON COLUMN phenix.control.ctr_max_growth_percentage IS 'Indique le pourcentage maximum de croissance utilisé pour le calcul des ventes futures (CAPS)';
COMMENT ON COLUMN phenix.control.ctr_release_start_date IS 'Indique la date et l''heure de début de la mise en production';
COMMENT ON COLUMN phenix.control.ctr_release_end_date IS 'Indique la date et l''heure de fin de la mise en production';
COMMENT ON COLUMN phenix.control.ctr_release_message IS 'Indique le message qui sera affiché lors de l''entrée dans Phenix';
COMMENT ON COLUMN phenix.control.ctr_calc_vdi_regular_switch IS 'Indique si les escomptes sont calculés selon le prix de liste ou le prix de liste moins la promotion';
COMMENT ON COLUMN phenix.control.ctr_gl_posting_method IS 'Indique la méthode utilisée pour l''envoie des comptes à ACCPAC';
COMMENT ON COLUMN phenix.control.ctr_print_pack_size IS 'Indique le facteur de division pour l''impression des missions de cueillette';
COMMENT ON COLUMN phenix.control.ctr_split_mission_print_switch IS 'Indique si l''en-tête et les détails seront imprimés séparéments';
COMMENT ON COLUMN phenix.control.ctr_check_inventory_switch IS 'Indique si l''inventaire de la localisation est vérifié au moment de la cueillette';
COMMENT ON COLUMN phenix.control.ctr_vr_auto_assign_switch IS 'Indique si les missions de cueillette sont assignées automatiquement au cueilleur ou si le cueilleur doit choisir ses missions';
COMMENT ON COLUMN phenix.control.ctr_vr_mission_confirm_length IS 'Indique combien de numéros doivent être vérifiés lorsque l''on confirme une mission sur le système de reconnaissance vocale';
COMMENT ON COLUMN phenix.control.ctr_tty_code IS 'Indique le type de paiement utilisé par défaut pour les commandes "Payer et emporter"';
COMMENT ON COLUMN phenix.control.ctr_srp_perc_by_group_switch IS 'Indique si les PDS sont gérés par groupe de produit';
COMMENT ON COLUMN phenix.control.ctr_password_expiry_days IS 'Indique après combien de jours un mot de passe expire';
COMMENT ON COLUMN phenix.control.ctr_password_warning_days IS 'Indique combien de jours avant l''expiration du mot de passe on propose à l''utilisateur de modifier celui-ci';
COMMENT ON COLUMN phenix.control.ctr_crt_promotion_code IS 'Indique le type de crédit utilisé pour accorder des promotions';
COMMENT ON COLUMN phenix.control.ctr_crt_volume_rebate_code IS 'Indique le type de crédit utilisé pour accorder des rabais volume';
COMMENT ON COLUMN phenix.control.ctr_car_invoice_grace_days IS 'Indique le nombre de jour de grâce pour finaliser les commandes clients avant la refacturation finale des promotions ayant des compteurs ("count and recount")';
COMMENT ON COLUMN phenix.control.ctr_pgs_sync_type IS 'Indique si la mise à jour est complète ou seulement ce qui a été modifié depuis la dernière date';
COMMENT ON COLUMN phenix.control.ctr_pgs_last_sync_date IS 'Indique la date de la dernière synchronisation';
COMMENT ON COLUMN phenix.control.ctr_nir_number IS 'Indique le numéro d''identification au registre des transporteurs';
COMMENT ON COLUMN phenix.control.ctr_enterprise_identification IS 'Indique le numéro d''entreprise du Québec (NEQ)';
COMMENT ON COLUMN phenix.control.ctr_tabacco_identification IS 'Indique le numéro d''identification';
COMMENT ON COLUMN phenix.control.ctr_auto_close_po_days IS 'Indique le nombre de jours avant qu''une commande d''achat reçue à zéro et jamais facturée ne soit fermée automatiquement';
COMMENT ON COLUMN phenix.control.ctr_ap_retail_client_prefix IS 'Indique le préfixe utilisé pour les factures des détaillants envoyées à ACCPAC';
COMMENT ON COLUMN phenix.control.ctr_web_address IS 'Indique l''adresse du site Internet de la compagnie';
COMMENT ON COLUMN phenix.control.ctr_edi_input_switch IS 'Indique si les commandes clients sont extraites avec le logiciel EDI ';
COMMENT ON COLUMN phenix.control.ctr_edi_report_switch IS 'Indique si les rapports de rejet sont envoyés automatiquement pour les commandes extraites avec le logiciel EDI ';
COMMENT ON COLUMN phenix.control.ctr_telxon_input_switch IS 'Indique si les commandes clients sont extraites avec le logiciel TELXON ';
COMMENT ON COLUMN phenix.control.ctr_telxon_file_name IS 'Indique le nom du fichier pour les commandes clients extraites avec le logiciel TELXON ';
COMMENT ON COLUMN phenix.control.ctr_account_statement_weeks IS 'Indique le nombre d''états de compte gardé dans l''historique';
COMMENT ON COLUMN phenix.control.ctr_check_digit_on_prd_switch IS 'Indique si on calcule un caractère de validation qu''on ajoute au code de produit';
COMMENT ON COLUMN phenix.control.ctr_msi_short_file_name IS 'Indique le nom du fichier court pour les commandes clients extraites avec le logiciel MSI (incluant l''extension : .TXT, .MCS, etc)';
COMMENT ON COLUMN phenix.control.ctr_msi_short_input_switch IS 'Indique si les commandes clients sont extraites avec le logiciel MSI créant un fichier court';
COMMENT ON COLUMN phenix.control.ctr_msi_long_file_name IS 'Indique le nom du fichier long pour les commandes clients extraites avec le logiciel MSI (incluant l''extension : .TXT, .MCS, etc)';
COMMENT ON COLUMN phenix.control.ctr_msi_long_input_switch IS 'Indique le nom du fichier pour les commandes clients extraites avec le logiciel MSI créant un fichier long';
COMMENT ON COLUMN phenix.control.ctr_identifiers_switch IS 'Indique si l''utilisateur utilise les concepts d''identifiant';
COMMENT ON COLUMN phenix.control.ctr_identifiers_prefix IS 'Indique le prefixe d''identifiant';
COMMENT ON COLUMN phenix.control.ctr_transit_loc_code IS 'Indique la localisation de transit utilisée par le système';
COMMENT ON COLUMN phenix.control.ctr_open_paper_mission_switch IS 'Indique si une mission doit être ouverte avant de pourvoir la fermer';
COMMENT ON COLUMN phenix.control.ctr_delay_for_opening_missions IS 'Indique le nombre de secondes entre la réimpression d''une étiquette de cueillette et l''ouverture d''une deuxième mission';
COMMENT ON COLUMN phenix.control.ctr_credit_entry_password IS 'Indique le mot de passe requis lors de l''entré d''un crédit si le prix a été modifié et ne respecte pas les règles';
COMMENT ON COLUMN phenix.control.ctr_credit_entry_percentage IS 'Indique le pourcentage comparé au profit lors de la modification de prix des biens endommagés';
COMMENT ON COLUMN phenix.control.ctr_location_print_format IS 'Indique le format de rapport d''étiquettes à imprimer';
COMMENT ON COLUMN phenix.control.ctr_profit_range_used IS 'Indique la méthode utilisée pour les limites de prix dans télévente lors du calcul du profit';
COMMENT ON COLUMN phenix.control.ctr_initial_reposition_switch IS 'Indique si la valeur initiale dans la génération des cueillettes sera de repositionner les clients sur la route';
COMMENT ON COLUMN phenix.control.ctr_read_temperature_switch IS 'Indique si la température des camions de livraison doit être prise lors de la réception';
COMMENT ON COLUMN phenix.control.ctr_rej_dupl_spec_ord_switch IS 'Indique si le système rejettera une commande spéciale par interface si le produit est déjà sur une commande ouverte pour le client';
COMMENT ON COLUMN phenix.control.ctr_warn_recei_lessthan_switch IS 'Indique si le système acceptera une quantité reçue plus petite que la quantité commandée';
COMMENT ON COLUMN phenix.control.ctr_loc_height_percent_variant IS 'Indique la variation du pourcentage de la capacité minimum requise pour un type de localisation  ';
COMMENT ON COLUMN phenix.control.ctr_max_loop_for_find_loc IS 'Indique le nombre maximum d''essai pour trouver une localisation convenable à la hauteur d''un produit .';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_10_label IS 'Information de la colonne 10 à la vente';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_10_content IS 'Information de la colonne 10 à la vente';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_11_label IS 'Information de la colonne 11 à la vente';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_11_content IS 'Information de la colonne 11 à la vente';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_12_label IS 'Information de la colonne 12 à la vente';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_12_content IS 'Information de la colonne 12 à la vente';
COMMENT ON COLUMN phenix.control.ctr_sales_header_content IS 'Indique le contenu de la barre de titre dans télévente';
COMMENT ON COLUMN phenix.control.ctr_counter_mission_rpt_type IS 'Indique la maniére utilisé pour cueillir les missions de la commande comptoir';
COMMENT ON COLUMN phenix.control.ctr_maximum_delivery_charge IS 'Indique le montant maximum de frais de livraison permis sans validation de mot de passe';
COMMENT ON COLUMN phenix.control.ctr_max_deliv_charge_password IS 'Indique le mot de passe nécessaire à la saisie d''un frais de transport trop grand';
COMMENT ON COLUMN phenix.control.ctr_cost_adj_in_cost_switch IS 'Indique si l''ajustement du coût est ajouté aux coûtants retournés par la routine de prix';
COMMENT ON COLUMN phenix.control.ctr_trans_alloc_in_cost_switch IS 'Indique si le coefficient de transport est ajouté aux coûtants retournés par la routine de prix';
COMMENT ON COLUMN phenix.control.ctr_ven_agr_in_cost_switch IS 'Indique si les ententes fournisseurs sont déduites des coûtants retournés par la routine de prix';
COMMENT ON COLUMN phenix.control.ctr_c_and_r_in_cost_switch IS 'Indique si les compteurs ("count and recount") sont déduits des coûtants retournés par la routine de prix';
COMMENT ON COLUMN phenix.control.ctr_vol_reb_in_cost_switch IS 'Indique si les rabais volume sont ajoutés aux coûtants retournés par la routine de prix';
COMMENT ON COLUMN phenix.control.ctr_purchase_popup_cost IS 'Indique le coûtant affiché dans l''historique d''achat pour les télévendeurs';
COMMENT ON COLUMN phenix.control.ctr_interco_posting_cost IS 'Indique le coutant utilisé pour le transfert GL inter-compagnie';
COMMENT ON COLUMN phenix.control.ctr_interco_iat_code IS 'Indique le type d''ajustement utilisé pour le transfert inter-compagnie';
COMMENT ON COLUMN phenix.control.ctr_hold_counter_order_switch IS 'Indique si les commandes comptoirs seront générées en cueillettes automatiquement';
COMMENT ON COLUMN phenix.control.ctr_interco_add_to_sale_switch IS 'Indique si les quantités d''interco sont inclues dans l''affichage des ventes de l''écran CAPS';
COMMENT ON COLUMN phenix.control.ctr_purge_prod_log_modifs_days IS 'Indique le nombre de jours avant la suppression des modifications dans maintenance produits';
COMMENT ON COLUMN phenix.control.ctr_incl_pb_in_sugg_qty_switch IS 'Indique si les ventes reliées à des promotions bulletins sont incluses dans le calcul des quantités suggérées(CAPS)';
COMMENT ON COLUMN phenix.control.ctr_on_cus_order_calc_days IS 'Indique le nombre de jours futurs utilisé pour le controle des calculs des quantités en commande client - télévente';
COMMENT ON COLUMN phenix.control.ctr_reject_exp_receipt_switch IS 'Indique s''il y a un blocage sur les réceptions des avis de réceptions avec date périmée (date d''expiration plus petite que la date d''aujourd''hui).';
COMMENT ON COLUMN phenix.control.ctr_reject_life_receipt_switch IS 'Indique s''il y a un blocage sur les réceptions des avis de réceptions avec durée de vie de produit non respecté (date d''expiration plus petite que la date d''aujourd''hui additionné au nombre de jours pour la réception définit dans la fiche produit).';
COMMENT ON COLUMN phenix.control.ctr_reject_exp_rma_switch IS 'Indique s''il y a un blocage sur les réceptions de RMA avec date périmée (date d''expiration plus petite que la date d''aujourd''hui).';
COMMENT ON COLUMN phenix.control.ctr_reject_life_rma_switch IS 'Indique s''il y a un blocage sur les réceptions de RMA avec durée de vie de produit non respecté (date d''expiration plus petite que la date d''aujourd''hui additionné au nombre de jours pour la réception définit dans la fiche produit).';
COMMENT ON COLUMN phenix.control.ctr_manual_prebk_price_source IS 'Indique la source de prix pour les bulletins sans promotions.';
COMMENT ON COLUMN phenix.control.ctr_validate_msi_fmt_switch IS 'Indique les formats de produits reçu par MSI sont rejetées, s''ils ne sont pas valides';
COMMENT ON COLUMN phenix.control.ctr_weeks_for_positioning IS 'Indique le nombre de semaines par défaut pour le calcul du positionnement de produit';
COMMENT ON COLUMN phenix.control.ctr_case_height_interval IS 'Indique l''intervalle des hauteurs pour regrouper les produits ';
COMMENT ON COLUMN phenix.control.ctr_validate_order_num_switch IS 'Indique si le numéro de commande requis est cochée ceci oblige la facturation par commande client (dans la maintenance client)';
COMMENT ON COLUMN phenix.control.ctr_caps_volume_rol_code IS 'Indique le rôle pour prioriser les acheteurs dans la liste qui sera utilisé pour calculer le total des caisses à réceptionner dans CAPS.';
COMMENT ON COLUMN phenix.control.ctr_caps_week_recpt_max_vol IS 'Indique le maximum de caisse par jour qui devrait être permises pendant la semaine. Ce champs est à titre d''information seulement.';
COMMENT ON COLUMN phenix.control.ctr_caps_wkend_recpt_max_vol IS 'Indique le maximum de caisse par jour qui devrait être permises pendant le weekend. Ce champs est à titre d''information seulement.';
COMMENT ON COLUMN phenix.control.ctr_bi_direct_transit_switch IS 'Indique si les transits multi-directionnels sont permis ';
COMMENT ON COLUMN phenix.control.ctr_order_credit_days IS 'Indique le nombre de jours limite d''une commande client pour la validation de crédit.';
COMMENT ON COLUMN phenix.control.ctr_replacement_cost IS 'Indique lesquels des coûtants de remplacement est utilisé pour les calculs des commissions des vendeurs.';
COMMENT ON COLUMN phenix.control.ctr_sales_column_1_label_rp IS 'Indique le libellé de la première colonne optionnelle (représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_column_2_label_rp IS 'Indique le libellé de la deuxième colonne optionnelle (représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_column_3_label_rp IS 'Indique le libellé de la troisième colonne optionnelle (représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_column_1_cont_rp IS 'Indique le code du contenu de la première colonne optionnelle (représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_column_2_cont_rp IS 'Indique le code du contenu de la deuxième colonne optionnelle (représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_column_3_cont_rp IS 'Indique le code du contenu de la troisième colonne optionnelle (représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_1_label_rp IS 'Indique le libellé du premier pied de page optionnel (représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_2_label_rp IS 'Indique le libellé du deuxième pied de page optionnel (représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_3_label_rp IS 'Indique le libellé du troisième pied de page optionnel (représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_4_label_rp IS 'Indique le libellé du quatrième pied de page optionnel (représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_5_label_rp IS 'Indique le libellé du cinquième pied de page optionnel (représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_6_label_rp IS 'Indique le libellé du sixième pied de page optionnel (représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_7_label_rp IS 'Indique le libellé du septième pied de page optionnel (représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_8_label_rp IS 'Indique le libellé du huitième pied de page optionnel (représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_9_label_rp IS 'Indique le libellé du neuvième pied de page optionnel (représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_10_label_rp IS 'Indique le libellé du dixième pied de page optionnel (représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_11_label_rp IS 'Indique le libellé du onzième pied de page optionnel (représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_12_label_rp IS 'Indique le libellé du douzième pied de page optionnel (représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_1_cont_rp IS 'Indique le code du contenu du premier pied de page optionnel (représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_2_cont_rp IS 'Indique le code du contenu du deuxième pied de page optionnel (représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_3_cont_rp IS 'Indique le code du contenu du troisième pied de page optionnel (représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_4_cont_rp IS 'Indique le code du contenu du quatrième pied de page optionnel (représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_5_cont_rp IS 'Indique le code du contenu du cinquième pied de page optionnel (représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_6_cont_rp IS 'Indique le code du contenu du sixième pied de page optionnel (représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_7_cont_rp IS 'Indique le code du contenu du septième pied de page optionnel (représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_8_cont_rp IS 'Indique le code du contenu du huitième pied de page optionnel (représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_9_cont_rp IS 'Indique le code du contenu du neuvième pied de page optionnel (représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_10_cont_rp IS 'Indique le code du contenu du dixième pied de page optionnel (représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_11_cont_rp IS 'Indique le code du contenu du onzième pied de page optionnel (représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_footing_12_cont_rp IS 'Indique le code du contenu du douzième pied de page optionnel (représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_history_1_label_rp IS 'Indique le libellé du premier pied de page historique optionnel (profil client - représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_history_2_label_rp IS 'Indique le libellé du deuxième pied de page historique optionnel (profil client - représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_history_3_label_rp IS 'Indique le libellé du troisième pied de page historique optionnel (profil client - représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_history_4_label_rp IS 'Indique le libellé du quatrième pied de page historique optionnel (profil client - représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_history_5_label_rp IS 'Indique le libellé du cinquième pied de page historique optionnel (profil client - représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_history_6_label_rp IS 'Indique le libellé du sixième pied de page historique optionnel (profil client - représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_history_1_cont_rp IS 'Indique le code du contenu du premier pied de page historique optionnel (profil client - représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_history_2_cont_rp IS 'Indique le code du contenu du deuxième pied de page historique optionnel (profil client - représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_history_3_cont_rp IS 'Indique le code du contenu du troisième pied de page historique optionnel (profil client - représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_history_4_cont_rp IS 'Indique le code du contenu du quatrième pied de page historique optionnel (profil client - représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_history_5_cont_rp IS 'Indique le code du contenu du cinquième pied de page historique optionnel (profil client - représentant).';
COMMENT ON COLUMN phenix.control.ctr_sales_history_6_cont_rp IS 'Indique le code du contenu du sixième pied de page historique optionnel (profil client - représentant).';
COMMENT ON COLUMN phenix.control.ctr_avr_sync_switch IS 'Indique si les pourcentages des programmes et remises trimestrielles des fournisseurs (AVR) sont synchronisés automatiquement';
COMMENT ON COLUMN phenix.control.ctr_royalty_in_cost_switch IS 'Indique si les royautés sont ajoutés aux coûtants retournés par la routine de prix';
COMMENT ON COLUMN phenix.control.ctr_accpac_version IS 'Indique la version d''ACCPAC sous SQL';
COMMENT ON COLUMN phenix.control.ctr_process_shorted_switch IS 'Indique si on vérifie s''il y a un nouvel inventaire disponible pour les éléments en rupture de marchandise avant de facturer';
COMMENT ON COLUMN phenix.control.ctr_consolidate_mission_switch IS 'Indique si le système utilise la consolidation de mission en palette lors de la cueillette';
COMMENT ON COLUMN phenix.control.ctr_purge_cus_log_modifs_days IS 'Indique le nombre de jours avant la suppression des logs de client';
COMMENT ON COLUMN phenix.control.ctr_purge_ven_log_modifs_days IS 'Indique le nombre de jours avant la suppression des logs de fournisseur';
COMMENT ON COLUMN phenix.control.ctr_crt_consignment_code IS 'Indique le type de crédit qui sera utilisé pour les crédits liés pour les consignes de Maxi vente';
COMMENT ON COLUMN phenix.control.ctr_use_cycle_for_avail_switch IS 'Indique si les quantités commandées sont limitées a la quantité disponible';
COMMENT ON COLUMN phenix.control.ctr_purge_inm_days IS 'Indique le nombre de jours avant la suppression des mouvements d''inventaire ne servant plus aux dates d''expiration/rotation';
COMMENT ON COLUMN phenix.control.ctr_purge_rtd_days IS 'Indique le nombre de jours avant la suppression des transactions de réception ne servant plus aux dates d''expiration/rotation';
COMMENT ON COLUMN phenix.control.ctr_purge_ict_days IS 'Indique le nombre de jours avant la suppression des décomptes d''inventaire déjà effectués ne servant plus aux dates d''expiration/rotation';
COMMENT ON COLUMN phenix.control.ctr_alt_release_message IS 'Indique le message alternatif qui sera affiché lors de l''entrée dans Phenix';
COMMENT ON COLUMN phenix.control.ctr_reset_liquidation_date_day IS 'Indique après combien de jours la date de mise en liquidation est remise à nul';
COMMENT ON COLUMN phenix.control.ctr_email_for_price_change IS 'Indique l''adressse courriel  qui va recevoir le rapport à la fin de la syncro';
COMMENT ON COLUMN phenix.control.ctr_variance_cubiscan IS 'Indique la variation pour le cubiscan';
COMMENT ON COLUMN phenix.control.ctr_pallet_invoice_prefix IS 'Indique le préfixe utilisépour les factures des palettes envoyées à ACCPACC';
COMMENT ON COLUMN phenix.control.ctr_iat_system_count_code IS 'Indique le type d''ajustement d''inventaire utilisé lorsque le système créé automatiquement un décompte d''inventaire.';
COMMENT ON COLUMN phenix.control.ctr_purge_fax_log_days IS 'Indique le nombre de jours avant lla suppression des envois de fax ';
COMMENT ON COLUMN phenix.control.ctr_match_format_on_cud_switch IS 'Indique si le format utilisé doit avoir une correspondance parfaite avec le format de l''escompte';
COMMENT ON COLUMN phenix.control.ctr_purchase_cc_e_mail IS 'Indique une adresse courriel à laquelle sera envoyé en copie conforme chaque envoi d''une commande d''achat.';
COMMENT ON COLUMN phenix.control.ctr_purge_use_log_modifs_days IS 'Indique le nombre de jours avant la suppression des logs de user';
COMMENT ON COLUMN phenix.control.ctr_roadnet_interface_switch IS 'Indique si Phenix s''interface avec Roadnet';
COMMENT ON COLUMN phenix.control.ctr_rg_order_cutoff_time IS 'Indique l''heure de tombée pour les commandes livrées le lendemain';
COMMENT ON COLUMN phenix.control.ctr_prd_code_min IS 'Indique la valeur minimum acceptée pour un code produit numérique';
COMMENT ON COLUMN phenix.control.ctr_prd_code_max IS 'Indique la valeur maximum acceptée pour un code produit numérique';
COMMENT ON COLUMN phenix.control.ctr_prd_code_numeric_switch IS 'Indique si le code produit accepte des numériques seulement et valide les bornes définies (code minimum et maximum)';
COMMENT ON COLUMN phenix.control.ctr_release_sp_in_telev_switch IS 'Indique si le système relâche automatiquement les commandes spéciales';
COMMENT ON COLUMN phenix.control.ctr_cty_purch_payable_code IS 'Indique le code du type de contact utilisé pour le paiement des achats';
COMMENT ON COLUMN phenix.control.ctr_auto_match_price_percent IS 'Indique le pourcentage de différence de prix, facturé en trop, qui est toléré pour qu''une commande d''achat soit réconciliée automatiquement quand même';
COMMENT ON COLUMN phenix.control.ctr_auto_match_taxes_percent IS 'Indique le pourcentage de différence de taxes qui est toléré pour qu''une commande d''achat soit réconciliée automatiquement quand même';
COMMENT ON COLUMN phenix.control.ctr_auto_match_qty_percent IS 'Indique le pourcentage de différence de quantité, facturée en trop, qui est toléré pour qu''une commande d''achat soit réconciliée automatiquement quand même';
COMMENT ON COLUMN phenix.control.ctr_auto_match_qty_maximum IS 'Indique le nombre d''items maximum, facturés en trop sur le total de la facture, qui est toléré pour qu''une commande d''achat soit réconciliée automatiquement quand même';
COMMENT ON COLUMN phenix.control.ctr_auto_match_weight_percent IS 'Indique le pourcentage de différence de poids, facturée en trop, qui est toléré pour qu''une commande d''achat soit réconciliée automatiquement quand même';
COMMENT ON COLUMN phenix.control.ctr_auto_match_weight_maximum IS 'Indique le poids maximum, facturés en trop sur le total de la facture, qui est toléré pour qu''une commande d''achat soit réconciliée automatiquement quand même';
COMMENT ON COLUMN phenix.control.ctr_bef_quot_contr_start_days IS 'Indique le nombre de jours avant le début du contrat que les soumissions ciblées devront apparaitre dans CAPS';
COMMENT ON COLUMN phenix.control.ctr_aft_quot_contr_start_days IS 'Indique le nombre de jours après le début du contrat que les soumissions ciblées devront apparaitre dans CAPS';
COMMENT ON COLUMN phenix.control.ctr_bef_quot_contr_end_days IS 'Indique le nombre de jours avant la fin du contrat que les soumissions ciblées devront apparaitre dans CAPS';
COMMENT ON COLUMN phenix.control.ctr_week_past_for_average IS 'Indique le nombre de semaine dans le passé qui vont être prises en compte pour calculer les ventes moyennes';
COMMENT ON COLUMN phenix.control.ctr_week_future_for_average IS 'Indique le nombre de semaine dans le futur qui vont être prises en compte pour calculer les ventes moyennes';
COMMENT ON COLUMN phenix.control.ctr_drop_manager_switch IS 'Indique si le système est configuré pour redistribuer des transactions indirectes (drop)';
COMMENT ON COLUMN phenix.control.ctr_admin2_in_cost_switch IS 'Indique si on applique le admin2 est ajouté aux coûtants ramenés par la routine de prix ';
COMMENT ON COLUMN phenix.control.ctr_base_po_alt_message IS 'Indique le message alternatif affiché sur la commande d’achat';
COMMENT ON COLUMN phenix.control.ctr_quantity_tolerence_percent IS 'Indique le pourcentage de tolérance de nombre de caisses lors de la réception';
COMMENT ON COLUMN phenix.control.ctr_urgent_replenishment_days IS 'Indique le nombre de jours que le système calcule pour faire un réapprovisionnement d''urgence';
COMMENT ON COLUMN phenix.control.ctr_cash_carry_rounding_off IS 'Indique le montant d’arrondissement dans le cash and carry';
COMMENT ON COLUMN phenix.control.ctr_profit_in_extract_switch IS 'Indique si la profitabilité est considérée lors de l''extraction d''une commande client par un logiciel externe';
COMMENT ON COLUMN phenix.control.ctr_rebill_crt_code IS 'Indique le type de crédit qui sera utilisé pour les refacturations';
COMMENT ON COLUMN phenix.control.ctr_purge_shopping_cart_days IS 'Indique le nombre de jours avant la suppression des paniers d''achats en suspens';
COMMENT ON COLUMN phenix.control.ctr_proclass_input_switch IS 'Indique si les commandes clients sont extraites avec le logiciel ProCLASS';
COMMENT ON COLUMN phenix.control.ctr_strategy_override_switch IS 'Indique si on priorise la promo à l escompte';
COMMENT ON COLUMN phenix.control.ctr_purge_zisa_days IS 'Indique le nombre de jours avant la suppression des audits des quantités vendues supérieur à l''inventaire';
COMMENT ON COLUMN phenix.control.ctr_disp_cost_in_tele_switch IS 'Indique si les commandes clients sont extraites avec le logiciel ProCLASS';
COMMENT ON COLUMN phenix.control.ctr_po_hist_with_cost_switch IS 'Indique si les coûtants sont affichés dans le pop-up des historiques d''achats quand c''est appelé ailleurs que les saisi des commandes d''achats';
COMMENT ON COLUMN phenix.control.ctr_purge_public_whse_days IS 'Indique le nombre de jours avant la suppression des transactions d''entreposages public (complétés)';
COMMENT ON COLUMN phenix.control.ctr_unpost_inh_on_stmt_switch IS 'Inclure les factures non postées à Accpac dans l''état de compte';
COMMENT ON COLUMN phenix.control.ctr_regen_statement_switch IS 'Indique si on regénère un état de compte existant pour ajouter de nouvelles factures / paiements';
COMMENT ON COLUMN phenix.control.ctr_repl_only_max_loc_switch IS 'Indique si les réappros. selon les ventes sont générés seulement pour les localisations qui ont des quantités / poids maximum définie';