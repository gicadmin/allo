CREATE TABLE phenix.quotation_details (
  qtd_qth_id NUMBER(8) NOT NULL,
  qtd_line_number NUMBER(6) NOT NULL,
  qtd_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  qtd_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  qtd_additional_adjustment NUMBER(7,2) DEFAULT 0 NOT NULL,
  qtd_admin_amount NUMBER(7,2) NOT NULL,
  qtd_auto_extend_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT qtd_auto_extend_switch_ck CHECK (QTD_AUTO_EXTEND_SWITCH IN (0, 1)),
  qtd_cost_strategy NUMBER(1) NOT NULL CONSTRAINT qtd_cost_strategy_ck CHECK (QTD_COST_STRATEGY IN (0, 1, 2, 3, 4, 5, 6, 7)),
  qtd_markup_used NUMBER(6,3) DEFAULT 0 NOT NULL,
  qtd_print_control VARCHAR2(1 BYTE) NOT NULL,
  qtd_print_sequence NUMBER(6),
  qtd_promotion_amount NUMBER(7,2) NOT NULL,
  qtd_selling_price NUMBER(7,2) NOT NULL,
  qtd_customer_product_code VARCHAR2(18 BYTE),
  qtd_suggested_retail_price NUMBER(7,2),
  qtd_count_amount NUMBER(7,2) NOT NULL,
  qtd_original_cost NUMBER(7,2) NOT NULL,
  qtd_original_retail NUMBER(7,2) NOT NULL,
  qtd_tobacco_tax NUMBER(7,2) DEFAULT 0 NOT NULL,
  qtd_srp_quantity NUMBER(6),
  qtd_srp_percentage NUMBER(6,3),
  qtd_sub_total NUMBER(7,2) NOT NULL,
  qtd_royalty_amount NUMBER(7,2) NOT NULL,
  qtd_pty_code NUMBER(3),
  qtd_npf_nac_code NUMBER(4),
  qtd_npf_prf_prd_code VARCHAR2(10 BYTE),
  qtd_npf_prf_fmt_code VARCHAR2(7 BYTE),
  qtd_synchronization_id NUMBER(15),
  qtd_unique_index NUMBER(15),
  qtd_user_set_srp_fix_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT qtd_user_set_srp_fix_switch_ck CHECK (QTD_USER_SET_SRP_FIX_SWITCH in (0, 1)),
  qtd_system_srp_quantity NUMBER(6),
  qtd_system_srp_price NUMBER(7,2),
  qtd_system_srp_profit_percent NUMBER(6,3),
  qtd_car_amount NUMBER(7,2) DEFAULT 0 NOT NULL,
  qtd_recalculated_promo_date DATE,
  qtd_base_cost_type NUMBER(2) DEFAULT 10 NOT NULL CONSTRAINT qtd_base_cost_type_ck CHECK (QTD_BASE_COST_TYPE IN (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,13)),
  qtd_promotional_item_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT qtd_promotional_item_switch_ck CHECK (QTD_PROMOTIONAL_ITEM_SWITCH IN (0, 1)),
  qtd_prw_trans_in_cost_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT qtd_prw_trans_in_cost_swi_ck CHECK (QTD_PRW_TRANS_IN_COST_SWITCH IN (0, 1)),
  qtd_prd_admin_1_in_cost_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT qtd_prd_admin_1_in_cost_swi_ck CHECK (QTD_PRD_ADMIN_1_IN_COST_SWITCH IN (0, 1)),
  qtd_prd_adj_in_cost_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT qtd_prd_adj_in_cost_switch_ck CHECK (QTD_PRD_ADJ_IN_COST_SWITCH IN (0, 1)),
  qtd_prd_admin_2_in_cost_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT qtd_prd_admin_2_in_cost_swi_ck CHECK (QTD_PRD_ADMIN_2_IN_COST_SWITCH IN (0, 1)),
  qtd_contract_volume NUMBER(7),
  qtd_contract_start_date DATE,
  qtd_contract_message VARCHAR2(100 BYTE),
  CONSTRAINT qtd_srp_check CHECK ((QTD_SUGGESTED_RETAIL_PRICE is not NULL and
QTD_SRP_QUANTITY is not NULL and
QTD_SRP_PERCENTAGE is not NULL) or
(QTD_SUGGESTED_RETAIL_PRICE is NULL and
QTD_SRP_QUANTITY is NULL and
QTD_SRP_PERCENTAGE is NULL)),
  CONSTRAINT qtd_pk PRIMARY KEY (qtd_qth_id,qtd_line_number),
  CONSTRAINT qtd_npf_fk FOREIGN KEY (qtd_npf_nac_code,qtd_npf_prf_prd_code,qtd_npf_prf_fmt_code) REFERENCES phenix.nac_product_formats (npf_nac_code,npf_prf_prd_code,npf_prf_fmt_code),
  CONSTRAINT qtd_prf_fk FOREIGN KEY (qtd_prf_prd_code,qtd_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code),
  CONSTRAINT qtd_pty_fk FOREIGN KEY (qtd_pty_code) REFERENCES phenix.promotion_types (pty_code),
  CONSTRAINT qtd_qth_fk FOREIGN KEY (qtd_qth_id) REFERENCES phenix.quotation_headers (qth_id)
);
COMMENT ON TABLE phenix.quotation_details IS 'Détails  des soumissions';
COMMENT ON COLUMN phenix.quotation_details.qtd_qth_id IS 'Numéro d''entête de soumission';
COMMENT ON COLUMN phenix.quotation_details.qtd_line_number IS 'Numéro de ligne';
COMMENT ON COLUMN phenix.quotation_details.qtd_prf_prd_code IS 'Numéro de produit';
COMMENT ON COLUMN phenix.quotation_details.qtd_prf_fmt_code IS 'Numéro de format';
COMMENT ON COLUMN phenix.quotation_details.qtd_additional_adjustment IS 'Ajustement additionnel';
COMMENT ON COLUMN phenix.quotation_details.qtd_admin_amount IS 'Montant administratif';
COMMENT ON COLUMN phenix.quotation_details.qtd_auto_extend_switch IS 'Indique si la soumission est auto-extensible';
COMMENT ON COLUMN phenix.quotation_details.qtd_cost_strategy IS 'Indique la startégie de la soumission';
COMMENT ON COLUMN phenix.quotation_details.qtd_markup_used IS 'Majoration utilisé';
COMMENT ON COLUMN phenix.quotation_details.qtd_print_control IS 'Indique le caractère d''impression';
COMMENT ON COLUMN phenix.quotation_details.qtd_print_sequence IS 'Séquence d''impression';
COMMENT ON COLUMN phenix.quotation_details.qtd_promotion_amount IS 'Montant de la soumission';
COMMENT ON COLUMN phenix.quotation_details.qtd_selling_price IS 'Prix de vente';
COMMENT ON COLUMN phenix.quotation_details.qtd_customer_product_code IS 'Numéro de produit client';
COMMENT ON COLUMN phenix.quotation_details.qtd_suggested_retail_price IS 'Prix de détail suggéré';
COMMENT ON COLUMN phenix.quotation_details.qtd_count_amount IS 'Contient la réclamation du count and recount';
COMMENT ON COLUMN phenix.quotation_details.qtd_original_cost IS 'Coûtant originel';
COMMENT ON COLUMN phenix.quotation_details.qtd_original_retail IS 'Prix originel';
COMMENT ON COLUMN phenix.quotation_details.qtd_tobacco_tax IS 'Taxe tabac';
COMMENT ON COLUMN phenix.quotation_details.qtd_srp_quantity IS 'Quantité du prix de détail suggéré';
COMMENT ON COLUMN phenix.quotation_details.qtd_srp_percentage IS 'Pourcentage utilisé pour calculer le prix de détail suggéré';
COMMENT ON COLUMN phenix.quotation_details.qtd_sub_total IS 'Indique le sous-total de la soumission (avant les royautés)';
COMMENT ON COLUMN phenix.quotation_details.qtd_royalty_amount IS 'Indique le montant de royauté sur le prix';
COMMENT ON COLUMN phenix.quotation_details.qtd_pty_code IS 'Indique le type de promotion';
COMMENT ON COLUMN phenix.quotation_details.qtd_npf_nac_code IS 'Code du compte national';
COMMENT ON COLUMN phenix.quotation_details.qtd_npf_prf_prd_code IS 'Code produit du compte national';
COMMENT ON COLUMN phenix.quotation_details.qtd_npf_prf_fmt_code IS 'Code format du produit du compte national';
COMMENT ON COLUMN phenix.quotation_details.qtd_synchronization_id IS 'Identifiant de synchronization';
COMMENT ON COLUMN phenix.quotation_details.qtd_unique_index IS 'Identifiant unique';
COMMENT ON COLUMN phenix.quotation_details.qtd_user_set_srp_fix_switch IS 'Indique si le prix du PDS vient de la table PRODUCT_SRPS (pour permettre d''aller voir si le PRODUCT_SRPS permet la modification ou pas';
COMMENT ON COLUMN phenix.quotation_details.qtd_system_srp_quantity IS 'Indique la quantité de PDS suggéré par le calcul initial du systeme';
COMMENT ON COLUMN phenix.quotation_details.qtd_system_srp_price IS 'Indique le prix de PDS suggéré par le calcul initial du systeme';
COMMENT ON COLUMN phenix.quotation_details.qtd_system_srp_profit_percent IS 'Indique le pourcentage de profit de PDS suggéré par le calcul initial du systeme';
COMMENT ON COLUMN phenix.quotation_details.qtd_car_amount IS 'Indique le montant du compteur ("count and recount")';
COMMENT ON COLUMN phenix.quotation_details.qtd_recalculated_promo_date IS 'Indique la date du dernier recalcul';
COMMENT ON COLUMN phenix.quotation_details.qtd_base_cost_type IS 'Indique le coûtant à utiliser lors du calcul du prix de la soumission';
COMMENT ON COLUMN phenix.quotation_details.qtd_promotional_item_switch IS 'Indique si le produit est promotionel';
COMMENT ON COLUMN phenix.quotation_details.qtd_prw_trans_in_cost_switch IS 'Indique si le coefficient de transport au niveau de l''entrepôt est pris ou non en considération dans le prix quand c''est un coûtant garanti oÙ le prix de liste est sélectionné';
COMMENT ON COLUMN phenix.quotation_details.qtd_prd_admin_1_in_cost_switch IS 'Indique si le coûtant d''administration 1 ($) est pris ou non en considération dans le prix quand c''est un coûtant garanti oÙ le prix de liste est sélectionné';
COMMENT ON COLUMN phenix.quotation_details.qtd_prd_adj_in_cost_switch IS 'Indique si l''ajustement de coût est pris ou non en considération dans le prix quand c''est un coûtant garanti où le prix de liste est sélectionné';
COMMENT ON COLUMN phenix.quotation_details.qtd_prd_admin_2_in_cost_switch IS 'Indique si le coûtant d''administration 2 (%) est pris ou non en considération dans le prix quand c''est un coûtant garanti où si le prix de liste est sélectionné';
COMMENT ON COLUMN phenix.quotation_details.qtd_contract_volume IS 'Indique le volume prévu pour la durée du contrat';
COMMENT ON COLUMN phenix.quotation_details.qtd_contract_start_date IS 'Indique la date de début du contrat pour ce produit';
COMMENT ON COLUMN phenix.quotation_details.qtd_contract_message IS 'Indique le message optionnel à afficher';