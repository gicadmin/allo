CREATE TABLE phenix.products (
  prd_code VARCHAR2(10 BYTE) NOT NULL,
  prd_cls_code NUMBER(3) NOT NULL,
  prd_pgr_code NUMBER(5) NOT NULL,
  prd_attribute VARCHAR2(3 BYTE) NOT NULL CONSTRAINT prd_attribute_ck CHECK (PRD_ATTRIBUTE IN ('REG', 'TOB', 'ALC', 'CON', 'COU')),
  prd_average_cost_1 NUMBER(11,6) NOT NULL,
  prd_average_cost_2 NUMBER(11,6) NOT NULL,
  prd_average_cost_3 NUMBER(11,6) NOT NULL,
  prd_average_cost_4 NUMBER(11,6) NOT NULL,
  prd_average_list NUMBER(11,6) NOT NULL,
  prd_avg_real_cost_1 NUMBER(11,6) NOT NULL,
  prd_avg_real_cost_2 NUMBER(11,6) NOT NULL,
  prd_avg_real_cost_3 NUMBER(11,6) NOT NULL,
  prd_avg_real_cost_4 NUMBER(11,6) NOT NULL,
  prd_avg_real_list NUMBER(11,6) NOT NULL,
  prd_base_selling_list NUMBER(11,6) NOT NULL,
  prd_broker_switch NUMBER(1) NOT NULL CONSTRAINT prd_broker_switch_ck CHECK (PRD_BROKER_SWITCH IN (0, 1)),
  prd_catalog_sequence_code NUMBER(5),
  prd_cost_adjustment NUMBER(11,6) NOT NULL,
  prd_creation_date DATE DEFAULT SYSDATE NOT NULL,
  prd_description VARCHAR2(45 BYTE) NOT NULL,
  prd_differential NUMBER(8,3) NOT NULL,
  prd_dropship_switch NUMBER(1) NOT NULL CONSTRAINT prd_dropship_switch_ck CHECK (PRD_DROPSHIP_SWITCH IN (0, 1)),
  prd_invoiced_by_weight NUMBER(1) NOT NULL CONSTRAINT prd_invoiced_by_weight_ck CHECK (PRD_INVOICED_BY_WEIGHT IN (0, 1)),
  prd_last_list_paid NUMBER(11,6) NOT NULL,
  prd_lot_control_switch NUMBER(1) NOT NULL CONSTRAINT prd_lot_control_switch_ck CHECK (PRD_LOT_CONTROL_SWITCH IN (0, 1)),
  prd_multi_vendor_switch NUMBER(1) NOT NULL CONSTRAINT prd_multi_vendor_switch_ck CHECK (PRD_MULTI_VENDOR_SWITCH IN (0, 1)),
  prd_scale_product_switch NUMBER(1) NOT NULL CONSTRAINT prd_scale_product_switch_ck CHECK (PRD_SCALE_PRODUCT_SWITCH IN (0, 1)),
  prd_short_description VARCHAR2(15 BYTE) NOT NULL,
  prd_special_order_switch NUMBER(1) NOT NULL CONSTRAINT prd_special_order_switch_ck CHECK (PRD_SPECIAL_ORDER_SWITCH IN (0, 1)),
  prd_status VARCHAR2(1 BYTE) NOT NULL CONSTRAINT prd_status_ck CHECK (PRD_STATUS IN ('W', 'A', 'I', 'P', 'D')),
  prd_cost_admin_1 NUMBER(11,6) NOT NULL,
  prd_brn_code NUMBER(5),
  prd_cmd_code NUMBER(3),
  prd_ctg_code NUMBER(5),
  prd_fmt_solid_inventory_code VARCHAR2(7 BYTE),
  prd_fmt_weighted_inv_code VARCHAR2(7 BYTE),
  prd_ppf_code NUMBER(5),
  prd_prd_is_replacement_code VARCHAR2(10 BYTE),
  prd_prd_is_substitute_code VARCHAR2(10 BYTE),
  prd_srp_fmt_code VARCHAR2(7 BYTE),
  prd_tip_code NUMBER(4),
  prd_ven_code NUMBER(5),
  prd_alt_description VARCHAR2(45 BYTE),
  prd_perishable_alert NUMBER(3),
  prd_perishable_expiry NUMBER(3),
  prd_season_end DATE,
  prd_season_start DATE,
  prd_short_alt_description VARCHAR2(15 BYTE),
  prd_elimination_date DATE,
  prd_check_inventory_switch NUMBER(1) NOT NULL CONSTRAINT prd_check_inventory_switch_ck CHECK (PRD_CHECK_INVENTORY_SWITCH IN (0, 1)),
  prd_definition VARCHAR2(1 BYTE) NOT NULL CONSTRAINT prd_definition_ck CHECK (PRD_DEFINITION IN ('B', 'D', 'F', 'S')),
  prd_avg_cost_recalc_date DATE,
  prd_valid_alt_code_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT prd_valid_alt_code_switch_ck CHECK (PRD_VALID_ALT_CODE_SWITCH IN (0, 1)),
  prd_product_life NUMBER(4),
  prd_minimum_reception_days NUMBER(4),
  prd_fluct_preparation_minutes NUMBER(4) DEFAULT 0 NOT NULL,
  prd_convert_to_spec_ord_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT prd_convert_to_spec_ord_swi_ck CHECK (PRD_CONVERT_TO_SPEC_ORD_SWITCH IN (0, 1)),
  prd_size NUMBER(8,3),
  prd_size_uom VARCHAR2(2 BYTE) CONSTRAINT prd_size_uom_ck CHECK (PRD_SIZE_UOM
IN ('AF', 'AM', 'AR', 'AV', 'BF', 'BG', 'BO', 'BX', 'C3', 'CM',
'DC', 'DG', 'DL', 'EA', 'FG', 'FO', 'FZ', 'F2', 'GN', 'GR', 'IH',
'KG', 'KT', 'LB', 'LT', 'ME', 'ML', 'MM', 'MR', 'OZ', 'PC', 'PD', 'PH',
'PR', 'QB', 'RL', 'SH', 'ST', 'SZ', 'TB', 'U2', 'UN', 'VI', 'V2',
'YD', 'Y4', '1N', '12', '15')),
  prd_date_modified DATE DEFAULT SYSDATE NOT NULL,
  prd_availability_date DATE DEFAULT SYSDATE NOT NULL,
  prd_default_whz_code VARCHAR2(2 BYTE) NOT NULL,
  prd_message_1 VARCHAR2(100 BYTE),
  prd_message_2 VARCHAR2(100 BYTE),
  prd_message_3 VARCHAR2(100 BYTE),
  prd_reception_date_type VARCHAR2(1 BYTE) CONSTRAINT prd_reception_date_type_ck CHECK (PRD_RECEPTION_DATE_TYPE IN ('E', 'P')),
  prd_cigar_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT prd_cigar_switch_ck CHECK (PRD_CIGAR_SWITCH in (0, 1)),
  prd_block_price_over_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT prd_block_price_over_switch_ck CHECK (PRD_BLOCK_PRICE_OVER_SWITCH IN (0, 1)),
  prd_haz_code VARCHAR2(10 BYTE),
  prd_dropship_retailer_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT prd_dropship_retailer_sw_ck CHECK (prd_dropship_retailer_switch IN (0,1)),
  prd_service_type VARCHAR2(3 BYTE) DEFAULT 'ADE' NOT NULL CONSTRAINT prd_service_type_ck CHECK (prd_service_type IN ('ALI','DET','ADE')),
  prd_broker_request_date DATE,
  prd_fragile_product_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT prd_fragile_product_switch_ck CHECK (PRD_FRAGILE_PRODUCT_SWITCH IN (0,1)),
  prd_packaging_type VARCHAR2(3 BYTE) NOT NULL CONSTRAINT prd_packaging_type_ck CHECK (prd_packaging_type IN ('CON','MET','VIT','PLR','PLM','BAR','CAC','TET','CAO','POC','STY','DEF','ALU')),
  prd_no_case_flow_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT prd_no_case_flow_switch_ck CHECK (prd_no_case_flow_switch IN (0,1)),
  prd_exp_date_at_pick_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT prd_exp_date_at_pick_switch_ck CHECK (prd_exp_date_at_pick_switch in (0, 1)),
  prd_last_price_change_date DATE,
  prd_last_base_selling_list NUMBER(11,6),
  prd_liquidation_date DATE,
  prd_cost_admin_2_percent NUMBER(6,3) DEFAULT 0 NOT NULL,
  prd_commodity_discount_amount NUMBER(7,2) DEFAULT 0 NOT NULL,
  prd_reference_code VARCHAR2(10 BYTE),
  prd_cat_code NUMBER(2),
  prd_last_receipt_date DATE,
  prd_last_received_po_list NUMBER(11,6) DEFAULT 0 NOT NULL,
  prd_last_received_po_cost_1 NUMBER(11,6) DEFAULT 0 NOT NULL,
  prd_last_received_po_cost_2 NUMBER(11,6) DEFAULT 0 NOT NULL,
  prd_last_received_po_cost_3 NUMBER(11,6) DEFAULT 0 NOT NULL,
  prd_last_received_po_cost_4 NUMBER(11,6) DEFAULT 0 NOT NULL,
  prd_tbpc_code NUMBER(3),
  CONSTRAINT prd_cigar_ck CHECK (((PRD_ATTRIBUTE <> 'TOB' and PRD_CIGAR_SWITCH = 0) or (PRD_ATTRIBUTE = 'TOB' and PRD_CIGAR_SWITCH in (0,1)))),
  CONSTRAINT prd_delete_ck CHECK ((PRD_ELIMINATION_DATE is NULL and
 PRD_STATUS <> 'D') or
(PRD_ELIMINATION_DATE is not NULL and
 PRD_STATUS  =  'D')),
  CONSTRAINT prd_differential_control_ck CHECK ((PRD_CMD_CODE is NULL and
 PRD_DIFFERENTIAL =  0) or
(PRD_CMD_CODE is not NULL and
 PRD_DIFFERENTIAL is not NULL)),
  CONSTRAINT prd_rotation_ck CHECK (
 ((    PRD_PRODUCT_LIFE >= PRD_MINIMUM_RECEPTION_DAYS
   AND PRD_PRODUCT_LIFE >= PRD_PERISHABLE_ALERT
   AND PRD_PRODUCT_LIFE >= PRD_PERISHABLE_EXPIRY
  )
  OR   PRD_PRODUCT_LIFE IS NULL
 )
 AND
 ((    PRD_MINIMUM_RECEPTION_DAYS >= PRD_PERISHABLE_ALERT
   AND PRD_MINIMUM_RECEPTION_DAYS >= PRD_PERISHABLE_EXPIRY
  )
  OR   PRD_MINIMUM_RECEPTION_DAYS IS NULL
 )
 AND
 (     PRD_PERISHABLE_ALERT >= PRD_PERISHABLE_EXPIRY
  OR  PRD_PERISHABLE_ALERT IS NULL
 )
),
  CONSTRAINT prd_pk PRIMARY KEY (prd_code),
  CONSTRAINT prd_brn_fk FOREIGN KEY (prd_brn_code) REFERENCES phenix.brand_names (brn_code),
  CONSTRAINT prd_cat_fk FOREIGN KEY (prd_cat_code) REFERENCES phenix.categories (cat_code),
  CONSTRAINT prd_cls_fk FOREIGN KEY (prd_cls_code) REFERENCES phenix.classes (cls_code),
  CONSTRAINT prd_cmd_fk FOREIGN KEY (prd_cmd_code) REFERENCES phenix.commodities (cmd_code),
  CONSTRAINT prd_ctg_fk FOREIGN KEY (prd_ctg_code) REFERENCES phenix.catalog_sequences (ctg_code),
  CONSTRAINT prd_default_whz_code_fk FOREIGN KEY (prd_default_whz_code) REFERENCES phenix.warehouse_zones (whz_code),
  CONSTRAINT prd_fmt_solid_inventory_fk FOREIGN KEY (prd_fmt_solid_inventory_code) REFERENCES phenix.formats (fmt_code),
  CONSTRAINT prd_fmt_weighted_inventory_fk FOREIGN KEY (prd_fmt_weighted_inv_code) REFERENCES phenix.formats (fmt_code),
  CONSTRAINT prd_haz_fk FOREIGN KEY (prd_haz_code) REFERENCES phenix.hazardous_materials (haz_code),
  CONSTRAINT prd_pgr_fk FOREIGN KEY (prd_pgr_code) REFERENCES phenix.product_groups (pgr_code),
  CONSTRAINT prd_ppf_fk FOREIGN KEY (prd_ppf_code) REFERENCES phenix.product_families (ppf_code),
  CONSTRAINT prd_prd_is_replacement_fk FOREIGN KEY (prd_prd_is_replacement_code) REFERENCES phenix.products (prd_code),
  CONSTRAINT prd_prd_is_substitute_fk FOREIGN KEY (prd_prd_is_substitute_code) REFERENCES phenix.products (prd_code),
  CONSTRAINT prd_srp_fmt_fk FOREIGN KEY (prd_srp_fmt_code) REFERENCES phenix.formats (fmt_code),
  CONSTRAINT prd_tbpc_fk FOREIGN KEY (prd_tbpc_code) REFERENCES phenix.tobacco_product_categories (tbpc_code),
  CONSTRAINT prd_tip_fk FOREIGN KEY (prd_tip_code) REFERENCES phenix.ticket_types (tip_code),
  CONSTRAINT prd_ven_fk FOREIGN KEY (prd_ven_code) REFERENCES phenix.vendors (ven_code)
);
COMMENT ON TABLE phenix.products IS 'Liste des produits';
COMMENT ON COLUMN phenix.products.prd_code IS 'Numéro de produit';
COMMENT ON COLUMN phenix.products.prd_cls_code IS 'Numéro de classe de produit';
COMMENT ON COLUMN phenix.products.prd_pgr_code IS 'Numéro de groupe de produit';
COMMENT ON COLUMN phenix.products.prd_attribute IS 'Attribut du produit';
COMMENT ON COLUMN phenix.products.prd_average_cost_1 IS 'Moyenne des prix du coûtant 1';
COMMENT ON COLUMN phenix.products.prd_average_cost_2 IS 'Moyenne des prix du coûtant 2';
COMMENT ON COLUMN phenix.products.prd_average_cost_3 IS 'Moyenne des prix du coûtant 3';
COMMENT ON COLUMN phenix.products.prd_average_cost_4 IS 'Moyenne des prix du coûtant 4';
COMMENT ON COLUMN phenix.products.prd_average_list IS 'Moyenne des prix de liste du manufacturier';
COMMENT ON COLUMN phenix.products.prd_avg_real_cost_1 IS 'Vraie moyenne des prix du coûtant 1';
COMMENT ON COLUMN phenix.products.prd_avg_real_cost_2 IS 'Vraie moyenne des prix du coûtant 2';
COMMENT ON COLUMN phenix.products.prd_avg_real_cost_3 IS 'Vraie moyenne des prix du coûtant 3';
COMMENT ON COLUMN phenix.products.prd_avg_real_cost_4 IS 'Vraie moyenne des prix du coûtant 4';
COMMENT ON COLUMN phenix.products.prd_avg_real_list IS 'Vrai moyenne des prix de liste du manufacturier';
COMMENT ON COLUMN phenix.products.prd_base_selling_list IS 'Prix de liste du manufacturier (dernier prix acheté) (affecté par les changements de prix)';
COMMENT ON COLUMN phenix.products.prd_broker_switch IS 'Indique qui est le fournisseur principal';
COMMENT ON COLUMN phenix.products.prd_catalog_sequence_code IS 'Numéro de séquence du bottin';
COMMENT ON COLUMN phenix.products.prd_cost_adjustment IS 'Ajustement au coût';
COMMENT ON COLUMN phenix.products.prd_creation_date IS 'Date de création';
COMMENT ON COLUMN phenix.products.prd_description IS 'Description';
COMMENT ON COLUMN phenix.products.prd_differential IS 'Coût rajouter au produit de base';
COMMENT ON COLUMN phenix.products.prd_dropship_switch IS 'Indique si le produit est livraison directe grossiste';
COMMENT ON COLUMN phenix.products.prd_invoiced_by_weight IS 'Indique si le produit est facturé au poids';
COMMENT ON COLUMN phenix.products.prd_last_list_paid IS 'Prix de liste du manufacturier (dernier prix acheté) (non affecté par les changements de prix)';
COMMENT ON COLUMN phenix.products.prd_lot_control_switch IS 'Indique si il y a un control des lots';
COMMENT ON COLUMN phenix.products.prd_multi_vendor_switch IS 'Indique si le produit est vendu par plusieurs fournisseurs (colabor non-compris)';
COMMENT ON COLUMN phenix.products.prd_scale_product_switch IS 'Indique si le produit est pesé';
COMMENT ON COLUMN phenix.products.prd_short_description IS 'Description courte';
COMMENT ON COLUMN phenix.products.prd_special_order_switch IS 'Indique si le produit est gardé en entrepôt';
COMMENT ON COLUMN phenix.products.prd_status IS 'Indique l''état du produit';
COMMENT ON COLUMN phenix.products.prd_cost_admin_1 IS 'Indique le coûtant d''administration 1 ($) pour le produit';
COMMENT ON COLUMN phenix.products.prd_brn_code IS 'Numéro de marque de commerce';
COMMENT ON COLUMN phenix.products.prd_cmd_code IS 'Numéro de commodité';
COMMENT ON COLUMN phenix.products.prd_ctg_code IS 'Numéro de séquence majeur de bottin';
COMMENT ON COLUMN phenix.products.prd_fmt_solid_inventory_code IS 'Numéro de format solide d''inventaire';
COMMENT ON COLUMN phenix.products.prd_fmt_weighted_inv_code IS 'Numéro de format poids d''inventaire';
COMMENT ON COLUMN phenix.products.prd_ppf_code IS 'Numéro de famille produit';
COMMENT ON COLUMN phenix.products.prd_prd_is_replacement_code IS 'Numéro de produit de remplacement';
COMMENT ON COLUMN phenix.products.prd_prd_is_substitute_code IS 'Numéro de produit de substitution';
COMMENT ON COLUMN phenix.products.prd_srp_fmt_code IS 'Numéro de format PDS';
COMMENT ON COLUMN phenix.products.prd_tip_code IS 'Numéro de type d''étiquette';
COMMENT ON COLUMN phenix.products.prd_ven_code IS 'Numéro du fournisseur';
COMMENT ON COLUMN phenix.products.prd_alt_description IS 'Description alternative';
COMMENT ON COLUMN phenix.products.prd_perishable_alert IS 'Vie minimum de vente';
COMMENT ON COLUMN phenix.products.prd_perishable_expiry IS 'Vie minimum d''entreposage';
COMMENT ON COLUMN phenix.products.prd_season_end IS 'Date de fin de saison';
COMMENT ON COLUMN phenix.products.prd_season_start IS 'Date de début de saison';
COMMENT ON COLUMN phenix.products.prd_short_alt_description IS 'Description alternative courte';
COMMENT ON COLUMN phenix.products.prd_elimination_date IS 'Indique la date losrque que le produit a été éliminé';
COMMENT ON COLUMN phenix.products.prd_check_inventory_switch IS 'Indique si il y a une vérification d''inventaire pour un rempalcement de produit';
COMMENT ON COLUMN phenix.products.prd_definition IS 'Définition de produit';
COMMENT ON COLUMN phenix.products.prd_avg_cost_recalc_date IS 'Date de la dernière recalculation du coût moyen';
COMMENT ON COLUMN phenix.products.prd_valid_alt_code_switch IS 'Indique s''il existe un code alternatif pour le produit';
COMMENT ON COLUMN phenix.products.prd_product_life IS 'Durée de vie du produit exprimée en nombre de jour';
COMMENT ON COLUMN phenix.products.prd_minimum_reception_days IS 'Durée minimale permise entre le jour d''expiration et le jour de réception du produit';
COMMENT ON COLUMN phenix.products.prd_fluct_preparation_minutes IS 'Minutes requis pour la preparation';
COMMENT ON COLUMN phenix.products.prd_convert_to_spec_ord_switch IS 'Utilisé seulement lorsqu''un produit est au statut pré-détruit. Indique que le produit deviendra un produit spécial lorsque l''inventaire sera vidé.';
COMMENT ON COLUMN phenix.products.prd_size IS 'Unité de mesure du format du produit';
COMMENT ON COLUMN phenix.products.prd_size_uom IS 'Unité de mesure';
COMMENT ON COLUMN phenix.products.prd_date_modified IS 'Date de modification du produit';
COMMENT ON COLUMN phenix.products.prd_availability_date IS 'Date de disponibilité du produit';
COMMENT ON COLUMN phenix.products.prd_default_whz_code IS 'Code de la zone d''entreposage par défaut pour ce produit';
COMMENT ON COLUMN phenix.products.prd_message_1 IS 'Message 1';
COMMENT ON COLUMN phenix.products.prd_message_2 IS 'Message 2';
COMMENT ON COLUMN phenix.products.prd_message_3 IS 'Message 3';
COMMENT ON COLUMN phenix.products.prd_reception_date_type IS 'Type de la date de reception';
COMMENT ON COLUMN phenix.products.prd_cigar_switch IS 'Indique si le produit de type tabac est un cigare';
COMMENT ON COLUMN phenix.products.prd_block_price_over_switch IS 'Indique si la modification du prix de vente du produit est bloquée ';
COMMENT ON COLUMN phenix.products.prd_haz_code IS 'Indique le code de la matière dangereuse';
COMMENT ON COLUMN phenix.products.prd_dropship_retailer_switch IS 'Indique si le produit est livraison directe détaillant';
COMMENT ON COLUMN phenix.products.prd_service_type IS 'Indique le type de produit';
COMMENT ON COLUMN phenix.products.prd_broker_request_date IS 'Indique le type de produit';
COMMENT ON COLUMN phenix.products.prd_fragile_product_switch IS 'Indique si le produit est fragile ou non ';
COMMENT ON COLUMN phenix.products.prd_packaging_type IS 'Indique le type d''emballage du produit';
COMMENT ON COLUMN phenix.products.prd_no_case_flow_switch IS 'Indique si le produit ne doit pas être entreposé dans le type de rayonnage ''C''ase-flow';
COMMENT ON COLUMN phenix.products.prd_exp_date_at_pick_switch IS 'Indique si une date d''expiration doit être saisie à la cueillette pour ce produit';
COMMENT ON COLUMN phenix.products.prd_last_price_change_date IS 'Indique la date d''activation du dernier changement de prix';
COMMENT ON COLUMN phenix.products.prd_last_base_selling_list IS 'Indique le prd_base_selling_list qui existait au moment de la mise à jour de prd_last_price_change_date ';
COMMENT ON COLUMN phenix.products.prd_liquidation_date IS 'Indique la date que le produit a été déplacé dans une localisation de liquidation';
COMMENT ON COLUMN phenix.products.prd_cost_admin_2_percent IS 'Indique le coûtant d''administration 2 (%) pour le produit';
COMMENT ON COLUMN phenix.products.prd_commodity_discount_amount IS 'Indique le rabais à appliquer sur le prix de la bourse dans le calcul des produits à fluctuation';
COMMENT ON COLUMN phenix.products.prd_reference_code IS 'Indique un code temporaire, une référence externe ou un code alternatif pour ce produit';
COMMENT ON COLUMN phenix.products.prd_cat_code IS 'Indique si le code de la catégorie du produit';
COMMENT ON COLUMN phenix.products.prd_last_receipt_date IS 'Indique la date de la dernière réception';
COMMENT ON COLUMN phenix.products.prd_last_received_po_list IS 'Indique le coûtant List sur le dernier PO reçu';
COMMENT ON COLUMN phenix.products.prd_last_received_po_cost_1 IS 'Indique le coûtant 1 sur le dernier PO reçu';
COMMENT ON COLUMN phenix.products.prd_last_received_po_cost_2 IS 'Indique le coûtant 2 sur le dernier PO reçu';
COMMENT ON COLUMN phenix.products.prd_last_received_po_cost_3 IS 'Indique le coûtant 3 sur le dernier PO reçu';
COMMENT ON COLUMN phenix.products.prd_last_received_po_cost_4 IS 'Indique le coûtant 4 sur le dernier PO reçu';
COMMENT ON COLUMN phenix.products.prd_tbpc_code IS 'Indique le code de la catégorie de produits tabac';