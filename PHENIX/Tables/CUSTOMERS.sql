CREATE TABLE phenix.customers (
  cus_code NUMBER(10) NOT NULL,
  cus_prv_resides_in_code VARCHAR2(2 BYTE) NOT NULL,
  cus_use_code NUMBER(5) NOT NULL,
  cus_active_schedules_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT cus_active_schedules_switch_ck CHECK (CUS_ACTIVE_SCHEDULES_SWITCH IN (0, 1)),
  cus_address VARCHAR2(45 BYTE) NOT NULL,
  cus_admin_method VARCHAR2(1 BYTE) DEFAULT 'P' NOT NULL CONSTRAINT cus_admin_method_ck CHECK (CUS_ADMIN_METHOD IN ('P', 'S')),
  cus_ar_payment_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cus_ar_payment_switch_ck CHECK (CUS_AR_PAYMENT_SWITCH IN (0, 1)),
  cus_city VARCHAR2(30 BYTE) NOT NULL,
  cus_creation_date DATE DEFAULT SYSDATE NOT NULL,
  cus_credit_control_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cus_credit_control_switch_ck CHECK (CUS_CREDIT_CONTROL_SWITCH IN (0, 1)),
  cus_credit_status VARCHAR2(1 BYTE) DEFAULT 'N' NOT NULL CONSTRAINT cus_credit_status_ck CHECK (CUS_CREDIT_STATUS IN ('N', 'D', 'R', 'Y')),
  cus_deleted_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cus_deleted_switch_ck CHECK (CUS_DELETED_SWITCH IN (0, 1)),
  cus_interest NUMBER(6,3) DEFAULT 0 NOT NULL,
  cus_inv_head_office_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cus_inv_head_office_switch_ck CHECK (CUS_INV_HEAD_OFFICE_SWITCH IN (0, 1)),
  cus_invoice_copies NUMBER(2) DEFAULT 1 NOT NULL,
  cus_language_flag VARCHAR2(1 BYTE) DEFAULT 'F' NOT NULL CONSTRAINT cus_language_flag_ck CHECK (CUS_LANGUAGE_FLAG IN ('E', 'F')),
  cus_multi_vend_drop_switch NUMBER(1) NOT NULL CONSTRAINT cus_multi_vend_drop_switch_ck CHECK (CUS_MULTI_VEND_DROP_SWITCH IN (0, 1)),
  cus_name VARCHAR2(30 BYTE) NOT NULL,
  cus_order_required_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cus_order_required_switch_ck CHECK (CUS_ORDER_REQUIRED_SWITCH IN (0, 1)),
  cus_open_quotation_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT cus_open_quotation_switch_ck CHECK (CUS_OPEN_QUOTATION_SWITCH IN (0, 1)),
  cus_postal_code VARCHAR2(10 BYTE) NOT NULL,
  cus_print_ticket_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cus_print_ticket_switch_ck CHECK (CUS_PRINT_TICKET_SWITCH IN (0, 1)),
  cus_projected_sales_amount NUMBER(12,2) DEFAULT 0 NOT NULL,
  cus_ranking VARCHAR2(1 BYTE) DEFAULT '5' NOT NULL CONSTRAINT cus_ranking_ck CHECK (CUS_RANKING IN (5, 4, 3, 2, 1)),
  cus_substitution_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cus_substitution_switch_ck CHECK (CUS_SUBSTITUTION_SWITCH IN (0, 1)),
  cus_surcharge_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT cus_surcharge_switch_ck CHECK (CUS_SURCHARGE_SWITCH IN (0, 1)),
  cus_telephone NUMBER(11) NOT NULL,
  cus_volume_rebate_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cus_volume_rebate_switch_ck CHECK (CUS_VOLUME_REBATE_SWITCH IN (0, 1)),
  cus_cus_code NUMBER(10),
  cus_cgr_code NUMBER(3),
  cus_dgt_code NUMBER(5),
  cus_prv_delivers_in_code VARCHAR2(2 BYTE),
  cus_qty_code NUMBER(5),
  cus_srt_code NUMBER(3),
  cus_trt_code NUMBER(2),
  cus_use_telemark_code NUMBER(5),
  cus_alt_name VARCHAR2(30 BYTE),
  cus_alcohol_permit VARCHAR2(15 BYTE),
  cus_customer_alpha_index VARCHAR2(15 BYTE),
  cus_credit_limit NUMBER(9,2),
  cus_cigarette_counter NUMBER(9),
  cus_date_last_paid DATE,
  cus_deliver_to_address VARCHAR2(45 BYTE),
  cus_deliver_to_city VARCHAR2(30 BYTE),
  cus_deliver_to_name VARCHAR2(30 BYTE),
  cus_deliver_to_postal_code VARCHAR2(10 BYTE),
  cus_duns_number VARCHAR2(13 BYTE),
  cus_fax_number NUMBER(11),
  cus_latitude NUMBER(7,4),
  cus_longitude NUMBER(7,4),
  cus_terms VARCHAR2(6 BYTE),
  cus_tobacco_permit VARCHAR2(15 BYTE),
  cus_active_schedule_end_date DATE NOT NULL,
  cus_active_schedule_start_date DATE NOT NULL,
  cus_surcharge_per_delivery NUMBER(7,2),
  cus_federal_tax_number VARCHAR2(15 BYTE),
  cus_provincial_tax_number VARCHAR2(18 BYTE),
  cus_vrg_code NUMBER(3),
  cus_print_profile_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cus_print_profile_switch_ck CHECK (CUS_PRINT_PROFILE_SWITCH IN (0, 1)),
  cus_pty_code NUMBER(3),
  cus_store_num VARCHAR2(10 BYTE),
  cus_federal_tax_exempt_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cus_federal_tax_exempt_swi_ck CHECK (CUS_FEDERAL_TAX_EXEMPT_SWITCH IN (0, 1)),
  cus_province_tax_exempt_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cus_province_tax_exempt_swi_ck CHECK (CUS_PROVINCE_TAX_EXEMPT_SWITCH IN (0, 1)),
  cus_whs_code VARCHAR2(2 BYTE) NOT NULL,
  cus_edi_partner_identity VARCHAR2(20 BYTE),
  cus_vendor_identification VARCHAR2(30 BYTE),
  cus_single_spec_order_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cus_single_spec_order_switc_ck CHECK (CUS_SINGLE_SPEC_ORDER_SWITCH IN (0, 1)),
  cus_car_code NUMBER(5),
  cus_naz_nac_code NUMBER(4),
  cus_naz_zone_code NUMBER(3),
  cus_elimination_date DATE,
  cus_modification_date DATE DEFAULT SYSDATE NOT NULL,
  cus_reb_on_drop_terms_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cus_reb_on_drop_terms_swi_ck CHECK (CUS_REB_ON_DROP_TERMS_SWITCH IN (0, 1)),
  cus_reb_on_drop_avr_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cus_reb_on_drop_avr_switch_ck CHECK (CUS_REB_ON_DROP_AVR_SWITCH IN (0, 1)),
  cus_reb_on_whouse_avr_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cus_reb_on_whouse_avr_swi_ck CHECK (CUS_REB_ON_WHOUSE_AVR_SWITCH IN (0, 1)),
  cus_broker_id NUMBER(6),
  cus_transport_allocation NUMBER(6,3),
  cus_generate_synch_file_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cus_gene_synch_file_switch_ck CHECK (CUS_GENERATE_SYNCH_FILE_SWITCH in (0, 1)),
  cus_edi_product_valid_flag VARCHAR2(1 BYTE) DEFAULT 'P' NOT NULL CONSTRAINT cus_edi_product_valid_flag_ck CHECK (CUS_EDI_PRODUCT_VALID_FLAG IN ('P', 'U')),
  cus_prebook_for_branch_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cus_prebook_for_branch_swi_ck CHECK (CUS_PREBOOK_FOR_BRANCH_SWITCH IN (0, 1)),
  cus_gen_vol_rebate_cr_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cus_gen_vol_rebate_cr_swi_ck CHECK (CUS_GEN_VOL_REBATE_CR_SWITCH in (0, 1)),
  cus_pgs_publish_price_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cus_pgs_publish_price_swit_ck CHECK (CUS_PGS_PUBLISH_PRICE_SWITCH IN (0,1)),
  cus_pos_files_type VARCHAR2(3 BYTE) CONSTRAINT cus_pos_files_type_ck CHECK (CUS_POS_FILES_TYPE IN ('SMS')),
  cus_corporate_name VARCHAR2(30 BYTE) NOT NULL,
  cus_invoice_method VARCHAR2(3 BYTE) DEFAULT 'COH' NOT NULL CONSTRAINT cus_invoice_method_ck CHECK (CUS_INVOICE_METHOD in ('COH', 'WHC')
		),
  cus_handling_amount NUMBER(7,2) DEFAULT 0 NOT NULL,
  cus_fsg_code NUMBER(5),
  cus_dcg_code NUMBER(5),
  cus_minimum_profit_amount NUMBER(7,2) DEFAULT 0,
  cus_bursary_amount NUMBER(7,2),
  cus_bursary_end_date DATE,
  cus_loan_interest_amount NUMBER(7,2),
  cus_loan_end_date DATE,
  cus_transport_contribution NUMBER(7,2) DEFAULT 0 NOT NULL,
  cus_minimum_profit_percent NUMBER(6,3),
  cus_dsc_code NUMBER(3),
  cus_minimum_delivery_charge NUMBER(7,2) DEFAULT 0 NOT NULL,
  cus_deliver_telephone NUMBER(11),
  cus_dairy_permit VARCHAR2(15 BYTE),
  cus_block_quotation_pr_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cus_block_quotation_pr_swi_ck CHECK (cus_block_quotation_pr_switch IN (0, 1)),
  cus_profit_in_deliv_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT cus_profit_in_deliv_switch_ck CHECK (cus_profit_in_deliv_switch IN (0, 1)),
  cus_print_inv_by_line_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cus_print_inv_by_line_switc_ck CHECK (CUS_PRINT_INV_BY_LINE_SWITCH IN (0, 1)),
  cus_ovg_code NUMBER(5),
  cus_recalc_price_at_inv_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cus_recalc_price_at_inv_swi_ck CHECK (CUS_RECALC_PRICE_AT_INV_SWITCH IN (0, 1)),
  cus_last_balance_dollars NUMBER(7,2) DEFAULT 0 NOT NULL,
  cus_last_balance_points NUMBER(5) DEFAULT 0 NOT NULL,
  cus_last_balance_date DATE,
  cus_vtt_stamp_required_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cus_vtt_stamp_required_swi_ck CHECK (CUS_VTT_STAMP_REQUIRED_SWITCH IN (0, 1)),
  cus_invoice_pallets_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT cus_invoice_pallets_switch_ck CHECK (CUS_INVOICE_PALLETS_SWITCH IN (0, 1)),
  cus_inv_pal_hd_office_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cus_inv_pal_hd_office_swi_ck CHECK (CUS_INV_PAL_HD_OFFICE_SWITCH IN (0, 1)),
  cus_pug_code NUMBER(5),
  cus_cdk_code VARCHAR2(4 BYTE),
  cus_combined_tr_invoice_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cus_combined_tr_invoice_swi_ck CHECK (CUS_COMBINED_TR_INVOICE_SWITCH IN (0, 1)),
  cus_detail_tr_invoice_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cus_detail_tr_invoice_swi_ck CHECK (CUS_DETAIL_TR_INVOICE_SWITCH IN (0, 1)),
  cus_growth_alloc_percent NUMBER(6,3) DEFAULT 0 NOT NULL,
  cus_additional_alloc_percent NUMBER(6,3) DEFAULT 0 NOT NULL,
  cus_whouse_vol_alloc_percent NUMBER(6,3) DEFAULT 0 NOT NULL,
  cus_drop_volume_alloc_percent NUMBER(6,3) DEFAULT 0 NOT NULL,
  cus_internal_admin_percent NUMBER(6,3) DEFAULT 0 NOT NULL,
  cus_past_due_grace_days NUMBER(3) DEFAULT 0 NOT NULL,
  cus_incl_price_on_route_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT cus_incl_price_on_route_swi_ck CHECK (CUS_INCL_PRICE_ON_ROUTE_SWITCH IN (0, 1)),
  cus_pick_by_prw_zone_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cus_pick_by_prw_zone_switch_ck CHECK (CUS_PICK_BY_PRW_ZONE_SWITCH IN (0, 1)),
  cus_str_code VARCHAR2(10 BYTE),
  cus_cat_code NUMBER(2),
  cus_xrg_code VARCHAR2(10 BYTE),
  cus_sit_code NUMBER(10),
  cus_gen_acct_stmnt_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT cus_gen_acct_stmnt_switch_ck CHECK (CUS_GEN_ACCT_STMNT_SWITCH IN (0, 1)),
  CONSTRAINT cus_bursary_ck CHECK (
		((CUS_BURSARY_AMOUNT IS NULL AND CUS_BURSARY_END_DATE IS NULL)
			OR (CUS_BURSARY_AMOUNT IS NOT NULL AND CUS_BURSARY_END_DATE IS NOT NULL))
		),
  CONSTRAINT cus_deleted_ck CHECK ( (CUS_DELETED_SWITCH = 0 AND CUS_ELIMINATION_DATE IS NULL) OR (CUS_DELETED_SWITCH = 1 AND CUS_ELIMINATION_DATE IS NOT NULL) ),
  CONSTRAINT cus_delivery_ck CHECK ((CUS_DELIVER_TO_ADDRESS is not NULL and
 CUS_DELIVER_TO_CITY is not NULL and
 CUS_DELIVER_TO_NAME is not NULL and
 CUS_DELIVER_TO_POSTAL_CODE is not NULL and
 CUS_PRV_DELIVERS_IN_CODE is not NULL) or
(CUS_DELIVER_TO_ADDRESS is NULL and
 CUS_DELIVER_TO_CITY is NULL and
 CUS_DELIVER_TO_NAME is NULL and
 CUS_DELIVER_TO_POSTAL_CODE is NULL and
 CUS_PRV_DELIVERS_IN_CODE is NULL)),
  CONSTRAINT cus_head_office_ck CHECK ((CUS_CUS_CODE is NULL and
CUS_INV_HEAD_OFFICE_SWITCH = 0) or
(CUS_CUS_CODE is not NULL and
CUS_INV_HEAD_OFFICE_SWITCH = 1) or
(CUS_CUS_CODE is not NULL and
CUS_INV_HEAD_OFFICE_SWITCH = 0)),
  CONSTRAINT cus_loan_ck CHECK (
		((CUS_LOAN_INTEREST_AMOUNT IS NULL AND CUS_LOAN_END_DATE IS NULL)
			OR (CUS_LOAN_INTEREST_AMOUNT IS NOT NULL AND CUS_LOAN_END_DATE IS NOT NULL))
		),
  CONSTRAINT cus_minimum_profit_ck CHECK (
	((CUS_MINIMUM_PROFIT_AMOUNT IS NOT NULL AND CUS_MINIMUM_PROFIT_PERCENT IS NULL)
	OR (CUS_MINIMUM_PROFIT_AMOUNT IS NULL AND CUS_MINIMUM_PROFIT_PERCENT IS NOT NULL))
	),
  CONSTRAINT cus_national_account_ck CHECK ((CUS_NAZ_NAC_CODE IS NULL AND CUS_NAZ_ZONE_CODE IS NULL) OR
(CUS_NAZ_NAC_CODE IS NOT NULL AND CUS_NAZ_ZONE_CODE IS NOT NULL)),
  CONSTRAINT cus_broker_id_uk UNIQUE (cus_broker_id),
  CONSTRAINT cus_pk PRIMARY KEY (cus_code),
  CONSTRAINT cus_car_code_fk FOREIGN KEY (cus_car_code) REFERENCES phenix.carriers (car_code),
  CONSTRAINT cus_cat_fk FOREIGN KEY (cus_cat_code) REFERENCES phenix.categories (cat_code),
  CONSTRAINT cus_cdk_code_fk FOREIGN KEY (cus_cdk_code) REFERENCES phenix.cross_docks (cdk_code),
  CONSTRAINT cus_cgr_fk FOREIGN KEY (cus_cgr_code) REFERENCES phenix.customer_groups (cgr_code),
  CONSTRAINT cus_cus_fk FOREIGN KEY (cus_cus_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT cus_dcg_fk FOREIGN KEY (cus_dcg_code) REFERENCES phenix.delivery_charge_grids (dcg_code),
  CONSTRAINT cus_dgt_fk FOREIGN KEY (cus_dgt_code) REFERENCES phenix.discount_grid_types (dgt_code),
  CONSTRAINT cus_dsc_fk FOREIGN KEY (cus_dsc_code) REFERENCES phenix.dock_sharing_codes (dsc_code),
  CONSTRAINT cus_fsg_fk FOREIGN KEY (cus_fsg_code) REFERENCES phenix.fuel_surcharge_grids (fsg_code),
  CONSTRAINT cus_naz_fk FOREIGN KEY (cus_naz_nac_code,cus_naz_zone_code) REFERENCES phenix.national_account_zones (naz_nac_code,naz_zone_code),
  CONSTRAINT cus_ovg_fk FOREIGN KEY (cus_ovg_code) REFERENCES phenix.off_invoice_vol_rebate_grids (ovg_code),
  CONSTRAINT cus_prv_delivers_in_fk FOREIGN KEY (cus_prv_delivers_in_code) REFERENCES phenix.provinces (prv_code),
  CONSTRAINT cus_prv_resides_in_fk FOREIGN KEY (cus_prv_resides_in_code) REFERENCES phenix.provinces (prv_code),
  CONSTRAINT cus_pty_fk FOREIGN KEY (cus_pty_code) REFERENCES phenix.promotion_types (pty_code),
  CONSTRAINT cus_pug_fk FOREIGN KEY (cus_pug_code) REFERENCES phenix.purchasing_groups (pug_code),
  CONSTRAINT cus_qty_fk FOREIGN KEY (cus_qty_code) REFERENCES phenix.quotation_types (qty_code),
  CONSTRAINT cus_sit_fk FOREIGN KEY (cus_sit_code) REFERENCES phenix.sites (sit_code),
  CONSTRAINT cus_srt_fk FOREIGN KEY (cus_srt_code) REFERENCES phenix.suggested_retail_price_types (srt_code),
  CONSTRAINT cus_str_fk FOREIGN KEY (cus_str_code) REFERENCES phenix.stores (str_code),
  CONSTRAINT cus_trt_fk FOREIGN KEY (cus_trt_code) REFERENCES phenix.territories (trt_code),
  CONSTRAINT cus_use_fk FOREIGN KEY (cus_use_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT cus_use_telemark_fk FOREIGN KEY (cus_use_telemark_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT cus_vrg_fk FOREIGN KEY (cus_vrg_code) REFERENCES phenix.volume_rebate_grids (vrg_code),
  CONSTRAINT cus_whs_fk FOREIGN KEY (cus_whs_code) REFERENCES phenix.warehouses (whs_code),
  CONSTRAINT cus_xrg_code_fk FOREIGN KEY (cus_xrg_code) REFERENCES phenix.xref_grids (xrg_code)
);
COMMENT ON TABLE phenix.customers IS 'Listes des clients de l''entreprise';
COMMENT ON COLUMN phenix.customers.cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.customers.cus_prv_resides_in_code IS 'Indique le code de la province du client';
COMMENT ON COLUMN phenix.customers.cus_use_code IS 'Indique le code du vendeur associé à ce client';
COMMENT ON COLUMN phenix.customers.cus_active_schedules_switch IS 'Indique si le client est actif dans les cédules';
COMMENT ON COLUMN phenix.customers.cus_address IS 'Adresse';
COMMENT ON COLUMN phenix.customers.cus_admin_method IS 'Méthode de calcul du "cost plus"';
COMMENT ON COLUMN phenix.customers.cus_ar_payment_switch IS 'Indique si on imprime les transactions payées pour ce client';
COMMENT ON COLUMN phenix.customers.cus_city IS 'Indique la ville du client';
COMMENT ON COLUMN phenix.customers.cus_creation_date IS 'Indique la date d''activation du client';
COMMENT ON COLUMN phenix.customers.cus_credit_control_switch IS 'Indique si le contrôle de la limite de crédit est activée lors de l''entrée de commande client';
COMMENT ON COLUMN phenix.customers.cus_credit_status IS 'Indique s''il y a restriction sur les commandes acceptées (indirectes, régulières, ou les deux)';
COMMENT ON COLUMN phenix.customers.cus_deleted_switch IS 'Indique si le client est éliminé (ou actif)';
COMMENT ON COLUMN phenix.customers.cus_interest IS 'Indique le pourcentage d''intérêt';
COMMENT ON COLUMN phenix.customers.cus_inv_head_office_switch IS 'Indique si la facture est envoyée à la maison mère';
COMMENT ON COLUMN phenix.customers.cus_invoice_copies IS 'Indique le nombre de facture à imprimer';
COMMENT ON COLUMN phenix.customers.cus_language_flag IS 'Indique la langue de correspondance avec le client';
COMMENT ON COLUMN phenix.customers.cus_multi_vend_drop_switch IS 'Indique si les commandes indirectes sont imprimées sur la même facture';
COMMENT ON COLUMN phenix.customers.cus_name IS 'Indique le nom du client';
COMMENT ON COLUMN phenix.customers.cus_order_required_switch IS 'Indique si un numéro de commande (référence) est requis pour passer une commande';
COMMENT ON COLUMN phenix.customers.cus_open_quotation_switch IS 'Indique si les soumissions du clients sont ouvertes ou si le client a seulement droit aux produits soumissionnés';
COMMENT ON COLUMN phenix.customers.cus_postal_code IS 'Indique le code postal';
COMMENT ON COLUMN phenix.customers.cus_print_ticket_switch IS 'Indique si on charge le prix des étiquettes au client';
COMMENT ON COLUMN phenix.customers.cus_projected_sales_amount IS 'Indique les objectifs de ventes pour le client';
COMMENT ON COLUMN phenix.customers.cus_ranking IS 'Indique le code de classification du client (de A à E)';
COMMENT ON COLUMN phenix.customers.cus_substitution_switch IS 'Indique si le client accepte les substitutions sur les produits en rupture d''inventaire';
COMMENT ON COLUMN phenix.customers.cus_surcharge_switch IS 'Indique si le client a des surcharges reliés aux formats';
COMMENT ON COLUMN phenix.customers.cus_telephone IS 'Indique le numéro de téléphone du client';
COMMENT ON COLUMN phenix.customers.cus_volume_rebate_switch IS 'Indique si le client a droit au rabais volume';
COMMENT ON COLUMN phenix.customers.cus_cus_code IS 'Indique le code de la maison mère';
COMMENT ON COLUMN phenix.customers.cus_cgr_code IS 'Numéro de groupe de client';
COMMENT ON COLUMN phenix.customers.cus_dgt_code IS 'Indique le code du type de la grille d''escompte';
COMMENT ON COLUMN phenix.customers.cus_prv_delivers_in_code IS 'Indique le code de la province du destinataire';
COMMENT ON COLUMN phenix.customers.cus_qty_code IS 'Indique le code du type de soumission';
COMMENT ON COLUMN phenix.customers.cus_srt_code IS 'Indique le code du type de prix de détail suggéré';
COMMENT ON COLUMN phenix.customers.cus_trt_code IS 'Indique le code de la région du client';
COMMENT ON COLUMN phenix.customers.cus_use_telemark_code IS 'Indique le code du télévendeur associé à ce client';
COMMENT ON COLUMN phenix.customers.cus_alt_name IS 'Nom alternatif';
COMMENT ON COLUMN phenix.customers.cus_alcohol_permit IS 'Numéro du permis d''alcool';
COMMENT ON COLUMN phenix.customers.cus_customer_alpha_index IS 'Indique le nom court du client';
COMMENT ON COLUMN phenix.customers.cus_credit_limit IS 'Indique la limite de crédit';
COMMENT ON COLUMN phenix.customers.cus_cigarette_counter IS 'Indique le compteur de cigarettes';
COMMENT ON COLUMN phenix.customers.cus_date_last_paid IS 'Indique la date du dernier paiement (plus utilisé dans Phenix)';
COMMENT ON COLUMN phenix.customers.cus_deliver_to_address IS 'Indique l''adresse du destinataire';
COMMENT ON COLUMN phenix.customers.cus_deliver_to_city IS 'Indique la ville du destinataire';
COMMENT ON COLUMN phenix.customers.cus_deliver_to_name IS 'Indique le nom du destinataire';
COMMENT ON COLUMN phenix.customers.cus_deliver_to_postal_code IS 'Indique le code postal du destinataire';
COMMENT ON COLUMN phenix.customers.cus_duns_number IS 'Indique le numéro DUNS du client (servant à l''EDI)';
COMMENT ON COLUMN phenix.customers.cus_fax_number IS 'Indique le numéro de télécopieur du client';
COMMENT ON COLUMN phenix.customers.cus_latitude IS 'Indique la latitude du client';
COMMENT ON COLUMN phenix.customers.cus_longitude IS 'Indique la longitude du client';
COMMENT ON COLUMN phenix.customers.cus_terms IS 'Indique le code des termes de paiement';
COMMENT ON COLUMN phenix.customers.cus_tobacco_permit IS 'Indique le numéro du permis de tabac';
COMMENT ON COLUMN phenix.customers.cus_active_schedule_end_date IS 'Date de fin d''activation des horraires';
COMMENT ON COLUMN phenix.customers.cus_active_schedule_start_date IS 'Date de début d''activation des horraires';
COMMENT ON COLUMN phenix.customers.cus_surcharge_per_delivery IS 'Indique si la surcharge à la livraison';
COMMENT ON COLUMN phenix.customers.cus_federal_tax_number IS 'Indique le numéro de taxe fédérale';
COMMENT ON COLUMN phenix.customers.cus_provincial_tax_number IS 'Indique le numéro de taxe provinciale';
COMMENT ON COLUMN phenix.customers.cus_vrg_code IS 'Indique le code de la grille de rabais volume';
COMMENT ON COLUMN phenix.customers.cus_print_profile_switch IS 'Indique si on imprime le bottin personnalisé';
COMMENT ON COLUMN phenix.customers.cus_pty_code IS 'Indique le code de type de promotion servant à déterminer les bannières pour ce client';
COMMENT ON COLUMN phenix.customers.cus_store_num IS 'Indique le numéro du magasin à l''intérieur d''une chaîne';
COMMENT ON COLUMN phenix.customers.cus_federal_tax_exempt_switch IS 'Indique si le client est exempté de la taxe fédérale';
COMMENT ON COLUMN phenix.customers.cus_province_tax_exempt_switch IS 'Indique si le client est exempté de la taxe provinciale';
COMMENT ON COLUMN phenix.customers.cus_whs_code IS 'Indique à quel entrepôt ce client est rattaché';
COMMENT ON COLUMN phenix.customers.cus_edi_partner_identity IS 'Indique l''identité EDI du client';
COMMENT ON COLUMN phenix.customers.cus_vendor_identification IS 'Indique l''identifiant du distributeur selon le client';
COMMENT ON COLUMN phenix.customers.cus_single_spec_order_switch IS 'Indique si on autorise la cueillette de commandes spéciales sans commande régulière dans la génération de cueillette';
COMMENT ON COLUMN phenix.customers.cus_car_code IS 'Numéro du transporteur';
COMMENT ON COLUMN phenix.customers.cus_naz_nac_code IS 'Indique le compte national du client';
COMMENT ON COLUMN phenix.customers.cus_naz_zone_code IS 'Indique la zone du compte national du client';
COMMENT ON COLUMN phenix.customers.cus_elimination_date IS 'Indique la date à laquelle le client a été éliminé';
COMMENT ON COLUMN phenix.customers.cus_modification_date IS 'Indique la dernière date à laquelle le client a été modifié';
COMMENT ON COLUMN phenix.customers.cus_reb_on_drop_terms_switch IS 'Indique si le client a droit aux rabais volume trimestriels sur les termes des drops';
COMMENT ON COLUMN phenix.customers.cus_reb_on_drop_avr_switch IS 'Indique si le client a droit aux rabais volume trimestriels sur les drops';
COMMENT ON COLUMN phenix.customers.cus_reb_on_whouse_avr_switch IS 'Indique si le client a droit aux rabais volume trimestriels sur les ventes de l''entrepôt';
COMMENT ON COLUMN phenix.customers.cus_broker_id IS 'Numéro unique du client chez le Broker';
COMMENT ON COLUMN phenix.customers.cus_transport_allocation IS 'Indique le pourcentage de l''allocation de transport donné au client';
COMMENT ON COLUMN phenix.customers.cus_generate_synch_file_switch IS 'Indique si la génération des fichiers interfaces (synchronisation) est nécessaire pour ce  client';
COMMENT ON COLUMN phenix.customers.cus_edi_product_valid_flag IS 'Indique la méthode de validation des commandes EDI (par le code du produit ou par l''identifiant du code à barres)';
COMMENT ON COLUMN phenix.customers.cus_prebook_for_branch_switch IS 'Indique si la maison mère fait des réservations bulletins pour ses clients';
COMMENT ON COLUMN phenix.customers.cus_gen_vol_rebate_cr_switch IS 'Indique si les rabais volume du client sont générés au même moment que la facture';
COMMENT ON COLUMN phenix.customers.cus_pgs_publish_price_switch IS 'Indique si le client veut publier ses prix sur internet';
COMMENT ON COLUMN phenix.customers.cus_pos_files_type IS 'Indique le type de caisse enregistreuse';
COMMENT ON COLUMN phenix.customers.cus_corporate_name IS 'Indique la raison sociale du client';
COMMENT ON COLUMN phenix.customers.cus_invoice_method IS 'Indique la méthode de facturation du client';
COMMENT ON COLUMN phenix.customers.cus_handling_amount IS 'Indique le montant utilisé pour les frais de manutention';
COMMENT ON COLUMN phenix.customers.cus_fsg_code IS 'Indique le code de la grille de surcharge pour le carburant';
COMMENT ON COLUMN phenix.customers.cus_dcg_code IS 'Indique le code de la grille de frais de livraison';
COMMENT ON COLUMN phenix.customers.cus_minimum_profit_amount IS 'Indique le montant de profit minimum par commande';
COMMENT ON COLUMN phenix.customers.cus_bursary_amount IS 'Indique le montant de subvention hebdomadaire à déduire des profits';
COMMENT ON COLUMN phenix.customers.cus_bursary_end_date IS 'Indique la date de fin de la subvention';
COMMENT ON COLUMN phenix.customers.cus_loan_interest_amount IS 'Indique le montant d''intérêt hebdomadaire du prêt';
COMMENT ON COLUMN phenix.customers.cus_loan_end_date IS 'Indique la date de fin du prêt';
COMMENT ON COLUMN phenix.customers.cus_transport_contribution IS 'Indique combien nous coute la livraison pour ce client (utilisé dans le rapport RAP_ANALYSE_PROFIT seulement)';
COMMENT ON COLUMN phenix.customers.cus_minimum_profit_percent IS 'Indique le pourcentage de profit minimum par commande';
COMMENT ON COLUMN phenix.customers.cus_dsc_code IS 'Indique le code de partage d''un quai d''expédition';
COMMENT ON COLUMN phenix.customers.cus_minimum_delivery_charge IS 'Indique le frais minimum à charger à ce client pour la livraison';
COMMENT ON COLUMN phenix.customers.cus_deliver_telephone IS 'Indique le numéro de téléphone du destinataire ';
COMMENT ON COLUMN phenix.customers.cus_dairy_permit IS 'Indique le numéro de permis du client à la commission Canadienne du lait';
COMMENT ON COLUMN phenix.customers.cus_block_quotation_pr_switch IS 'Indique que les prix des produits dans une soumission ne peuvent être modifié dans télévente pour ce client';
COMMENT ON COLUMN phenix.customers.cus_profit_in_deliv_switch IS 'Indique si le profit de la commande a une influence sur le calcul des frais à charger de livraison/carburant/manutention.';
COMMENT ON COLUMN phenix.customers.cus_print_inv_by_line_switch IS 'Indique si les produits reliés à la facture du client doivent être triés selon l''ordre de la ligne de commande.';
COMMENT ON COLUMN phenix.customers.cus_ovg_code IS 'Indique le code de la grille de rabais volume sur facture';
COMMENT ON COLUMN phenix.customers.cus_recalc_price_at_inv_switch IS 'Indique si on recalcule le prix de vente à la facturation';
COMMENT ON COLUMN phenix.customers.cus_last_balance_dollars IS 'Indique le solde en dollars';
COMMENT ON COLUMN phenix.customers.cus_last_balance_points IS 'Indique le solde en points';
COMMENT ON COLUMN phenix.customers.cus_last_balance_date IS 'Indique la date du dernier calcul du solde';
COMMENT ON COLUMN phenix.customers.cus_vtt_stamp_required_switch IS 'Indique si les documents de transport doivent avoir une étampe comme preuve de livraison';
COMMENT ON COLUMN phenix.customers.cus_invoice_pallets_switch IS 'Indique si on facture / crédite des palettes pour ce client';
COMMENT ON COLUMN phenix.customers.cus_inv_pal_hd_office_switch IS 'Indique si la facture des palettes est envoyée à la maison mère';
COMMENT ON COLUMN phenix.customers.cus_pug_code IS 'Indique le code du regroupement d''achat';
COMMENT ON COLUMN phenix.customers.cus_cdk_code IS 'Indique le code du cross-dock attribué au client';
COMMENT ON COLUMN phenix.customers.cus_combined_tr_invoice_switch IS 'Indique si le client veut avoir une facture de transport groupée';
COMMENT ON COLUMN phenix.customers.cus_detail_tr_invoice_switch IS 'Indique si  l''impression des factures sera détaillée ou pas';
COMMENT ON COLUMN phenix.customers.cus_growth_alloc_percent IS 'Indique le pourcentage d''allocation de croissance';
COMMENT ON COLUMN phenix.customers.cus_additional_alloc_percent IS 'Indique le pourcentage d''allocation additionnel (marque privée)';
COMMENT ON COLUMN phenix.customers.cus_whouse_vol_alloc_percent IS 'Indique le pourcentage d''allocation volume des ventes entrepôt';
COMMENT ON COLUMN phenix.customers.cus_drop_volume_alloc_percent IS 'Indique le pourcentage d''allocation volume sur les ventes indirectes';
COMMENT ON COLUMN phenix.customers.cus_internal_admin_percent IS 'Indique le frais d''administration interne pour les programmes de remise';
COMMENT ON COLUMN phenix.customers.cus_past_due_grace_days IS 'Indique le nombre de jour de grâce avant que la commande soit bloquer par faute de retard de paiement.';
COMMENT ON COLUMN phenix.customers.cus_incl_price_on_route_switch IS 'Indique si le client veut que les prix soient affichés sur les documents imprimés dans les routes de livraison';
COMMENT ON COLUMN phenix.customers.cus_pick_by_prw_zone_switch IS 'Indique si la cueillette se fait selon le type de zone d''entreposage (frais, sec..etc)';
COMMENT ON COLUMN phenix.customers.cus_str_code IS 'Indique le code de regroupement tel qu''utilisé pour regrouper plusieurs clients en lien avec la profitabilité';
COMMENT ON COLUMN phenix.customers.cus_cat_code IS 'Indique si le code de la catégorie du client';
COMMENT ON COLUMN phenix.customers.cus_xrg_code IS 'Indique le  code de grille de reference produit';
COMMENT ON COLUMN phenix.customers.cus_sit_code IS 'Indique le numéro du site physique pour les contrats';
COMMENT ON COLUMN phenix.customers.cus_gen_acct_stmnt_switch IS 'Indique si on génère un état de compte pour ce client';