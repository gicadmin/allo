CREATE TABLE phenix.purchase_order_details (
  pod_poh_id NUMBER(15) NOT NULL,
  pod_line_number NUMBER(4) NOT NULL,
  pod_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  pod_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  pod_avr NUMBER(7,2) NOT NULL,
  pod_back_order_switch NUMBER(1) NOT NULL CONSTRAINT pod_back_order_switch_ck CHECK (POD_BACK_ORDER_SWITCH IN (0, 1)),
  pod_consignment_amount NUMBER(7,2) NOT NULL,
  pod_cost_1 NUMBER(7,2) NOT NULL,
  pod_cost_2 NUMBER(7,2) NOT NULL,
  pod_cost_3 NUMBER(7,2) NOT NULL,
  pod_cost_4 NUMBER(7,2) NOT NULL,
  pod_federal_tax_rate NUMBER(6,3) NOT NULL,
  pod_line_type VARCHAR2(2 BYTE) NOT NULL CONSTRAINT pod_line_type_ck CHECK (POD_LINE_TYPE IN ('RG', 'SP', 'PB')),
  pod_list NUMBER(7,2) NOT NULL,
  pod_manual_discount NUMBER(5,2) NOT NULL,
  pod_provincial_tax_rate NUMBER(6,3) NOT NULL,
  pod_quantity_ordered NUMBER(7),
  pod_special_order_switch NUMBER(1) NOT NULL CONSTRAINT pod_special_order_switch_ck CHECK (POD_SPECIAL_ORDER_SWITCH IN (0, 1)),
  pod_status VARCHAR2(2 BYTE) NOT NULL CONSTRAINT pod_status_ck CHECK (POD_STATUS IN ('OP', 'RC', 'CL')),
  pod_suggested_retail_price NUMBER(7,2) NOT NULL,
  pod_tobacco_tax NUMBER(11,6) NOT NULL,
  pod_weight_ordered NUMBER(9,3),
  pod_prf_prd_original_code VARCHAR2(10 BYTE),
  pod_prf_fmt_original_code VARCHAR2(7 BYTE),
  pod_pty_code NUMBER(3),
  pod_prebook_quantity_left NUMBER(7),
  pod_prebook_weight_left NUMBER(9,3),
  pod_message VARCHAR2(100 BYTE),
  pod_prebook_flag VARCHAR2(2 BYTE) NOT NULL CONSTRAINT pod_prebook_flag_ck CHECK (POD_PREBOOK_FLAG IN ('NA', 'FD', 'DC')),
  pod_pod_poh_id NUMBER(15),
  pod_pod_line_number NUMBER(4),
  pod_allocation_1 NUMBER(7,2) NOT NULL,
  pod_allocation_2 NUMBER(7,2) NOT NULL,
  pod_allocation_3 NUMBER(7,2) NOT NULL,
  pod_allocation_1_applied_on NUMBER(1) NOT NULL CONSTRAINT pod_allocation_1_applied_on_ck CHECK (POD_ALLOCATION_1_APPLIED_ON IN (0, 1, 2, 3, 4)),
  pod_allocation_2_applied_on NUMBER(1) NOT NULL CONSTRAINT pod_allocation_2_applied_on_ck CHECK (POD_ALLOCATION_2_APPLIED_ON IN (0, 1, 2, 3, 4)),
  pod_allocation_3_applied_on NUMBER(1) NOT NULL CONSTRAINT pod_allocation_3_applied_on_ck CHECK (POD_ALLOCATION_3_APPLIED_ON IN (0, 1, 2, 3, 4)),
  pod_quantity_cancelled NUMBER(7),
  pod_weight_cancelled NUMBER(9,3),
  pod_max_quantity_allowed NUMBER(7),
  pod_max_weight_allowed NUMBER(9,3),
  pod_use_code NUMBER(5),
  pod_cancelled_date DATE,
  pod_ven_code NUMBER(5),
  pod_reclaim_message VARCHAR2(100 BYTE),
  pod_reclaim_reference VARCHAR2(15 BYTE),
  pod_affect_match_cost_1_switch NUMBER(1) NOT NULL CONSTRAINT pod_affect_match_cost_1_swi_ck CHECK (POD_AFFECT_MATCH_COST_1_SWITCH IN (0, 1)),
  pod_affect_match_cost_2_switch NUMBER(1) NOT NULL CONSTRAINT pod_affect_match_cost_2_swi_ck CHECK (POD_AFFECT_MATCH_COST_2_SWITCH IN (0, 1)),
  pod_affect_match_cost_3_switch NUMBER(1) NOT NULL CONSTRAINT pod_affect_match_cost_3_swi_ck CHECK (POD_AFFECT_MATCH_COST_3_SWITCH IN (0, 1)),
  pod_match_cost NUMBER(7,2) NOT NULL,
  pod_manual_disc_cost_affected NUMBER(1) NOT NULL CONSTRAINT pod_manual_disc_cost_affect_ck CHECK (POD_MANUAL_DISC_COST_AFFECTED IN (0, 1, 2, 3, 4)),
  pod_ven_payable_code NUMBER(5),
  pod_system_closed_date DATE,
  pod_duplicate_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT pod_duplicate_switch_ck CHECK (POD_DUPLICATE_SWITCH IN (0, 1)),
  pod_suggested_quantity NUMBER(7),
  pod_suggested_weight NUMBER(10,3),
  pod_creation_source VARCHAR2(1 BYTE) CONSTRAINT pod_creation_source_ck CHECK (POD_CREATION_SOURCE IN ('A','C','E','I','L','M','R','S','W')),
  pod_added_transp_amount NUMBER(11,6) DEFAULT 0 NOT NULL,
  pod_match_cost_with_freight NUMBER(7,2) DEFAULT 0 NOT NULL,
  CONSTRAINT pod_max_weight_quantity_ck CHECK ((POD_MAX_WEIGHT_ALLOWED IS NOT NULL AND
POD_MAX_QUANTITY_ALLOWED IS NULL) OR
(POD_MAX_WEIGHT_ALLOWED IS NULL AND
POD_MAX_QUANTITY_ALLOWED IS NOT NULL) OR
(POD_MAX_WEIGHT_ALLOWED IS NULL AND
POD_MAX_QUANTITY_ALLOWED IS NULL)),
  CONSTRAINT pod_ven_ck CHECK ((POD_VEN_PAYABLE_CODE IS NOT NULL AND POD_VEN_CODE IS NOT NULL) OR
(POD_VEN_PAYABLE_CODE IS NULL AND POD_VEN_CODE IS NULL)),
  CONSTRAINT pod_pk PRIMARY KEY (pod_poh_id,pod_line_number),
  CONSTRAINT pod_pod_fk FOREIGN KEY (pod_pod_poh_id,pod_pod_line_number) REFERENCES phenix.purchase_order_details (pod_poh_id,pod_line_number),
  CONSTRAINT pod_poh_fk FOREIGN KEY (pod_poh_id) REFERENCES phenix.purchase_order_headers (poh_id),
  CONSTRAINT pod_prf_fk FOREIGN KEY (pod_prf_prd_code,pod_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code),
  CONSTRAINT pod_prf_original_fk FOREIGN KEY (pod_prf_prd_original_code,pod_prf_fmt_original_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code),
  CONSTRAINT pod_pty_fk FOREIGN KEY (pod_pty_code) REFERENCES phenix.promotion_types (pty_code),
  CONSTRAINT pod_use_fk FOREIGN KEY (pod_use_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT pod_ven_fk FOREIGN KEY (pod_ven_code) REFERENCES phenix.vendors (ven_code),
  CONSTRAINT pod_ven_payable_fk FOREIGN KEY (pod_ven_payable_code) REFERENCES phenix.vendors (ven_code)
);
COMMENT ON TABLE phenix.purchase_order_details IS 'Ligne de détail d''une commande d''achat';
COMMENT ON COLUMN phenix.purchase_order_details.pod_poh_id IS 'Numéro de l''entête de la commande d''achat';
COMMENT ON COLUMN phenix.purchase_order_details.pod_line_number IS 'Ligne de commande';
COMMENT ON COLUMN phenix.purchase_order_details.pod_prf_prd_code IS 'Numéro de produit';
COMMENT ON COLUMN phenix.purchase_order_details.pod_prf_fmt_code IS 'Numéro de format';
COMMENT ON COLUMN phenix.purchase_order_details.pod_avr IS 'Montant des rabais volume annuel';
COMMENT ON COLUMN phenix.purchase_order_details.pod_back_order_switch IS 'Indique si il y commande en attente';
COMMENT ON COLUMN phenix.purchase_order_details.pod_consignment_amount IS 'Montant des consignes';
COMMENT ON COLUMN phenix.purchase_order_details.pod_cost_1 IS 'Coûtant 1';
COMMENT ON COLUMN phenix.purchase_order_details.pod_cost_2 IS 'Coûtant 2';
COMMENT ON COLUMN phenix.purchase_order_details.pod_cost_3 IS 'Coûtant 3';
COMMENT ON COLUMN phenix.purchase_order_details.pod_cost_4 IS 'Coûtant 4';
COMMENT ON COLUMN phenix.purchase_order_details.pod_federal_tax_rate IS 'Montant de taxe fédéral';
COMMENT ON COLUMN phenix.purchase_order_details.pod_line_type IS 'Type de ligne';
COMMENT ON COLUMN phenix.purchase_order_details.pod_list IS 'Prix du manuacturier';
COMMENT ON COLUMN phenix.purchase_order_details.pod_manual_discount IS 'Montant d''allocation';
COMMENT ON COLUMN phenix.purchase_order_details.pod_provincial_tax_rate IS 'Montant de la taxe provincial';
COMMENT ON COLUMN phenix.purchase_order_details.pod_quantity_ordered IS 'Quantité commandé';
COMMENT ON COLUMN phenix.purchase_order_details.pod_special_order_switch IS 'Indique si le produit est fait en commande spéciale';
COMMENT ON COLUMN phenix.purchase_order_details.pod_status IS 'Status de la ligne';
COMMENT ON COLUMN phenix.purchase_order_details.pod_suggested_retail_price IS 'Prix de détail suggéré';
COMMENT ON COLUMN phenix.purchase_order_details.pod_tobacco_tax IS 'Taxe tabac';
COMMENT ON COLUMN phenix.purchase_order_details.pod_weight_ordered IS 'Poids';
COMMENT ON COLUMN phenix.purchase_order_details.pod_prf_prd_original_code IS 'Produit originel (si substitution)';
COMMENT ON COLUMN phenix.purchase_order_details.pod_prf_fmt_original_code IS 'Format originel (si substitution)';
COMMENT ON COLUMN phenix.purchase_order_details.pod_pty_code IS 'Numéro de type de promotion';
COMMENT ON COLUMN phenix.purchase_order_details.pod_prebook_quantity_left IS 'Quantité restante pour les commandes bulletins';
COMMENT ON COLUMN phenix.purchase_order_details.pod_prebook_weight_left IS 'Poids restant pour les commandes bulletins';
COMMENT ON COLUMN phenix.purchase_order_details.pod_message IS 'Message de la ligne de commande d''achat';
COMMENT ON COLUMN phenix.purchase_order_details.pod_prebook_flag IS 'Méthode selon laquelle la commande bulletin est effectuée';
COMMENT ON COLUMN phenix.purchase_order_details.pod_pod_poh_id IS 'Numéro de l''entête de la commande d''achat original';
COMMENT ON COLUMN phenix.purchase_order_details.pod_pod_line_number IS 'Ligne de commande de la commande d''achat original';
COMMENT ON COLUMN phenix.purchase_order_details.pod_allocation_1 IS 'Montant de l''allocation 1';
COMMENT ON COLUMN phenix.purchase_order_details.pod_allocation_2 IS 'Montant de l''allocation 2';
COMMENT ON COLUMN phenix.purchase_order_details.pod_allocation_3 IS 'Montant de l''allocation 3';
COMMENT ON COLUMN phenix.purchase_order_details.pod_allocation_1_applied_on IS 'Coûtant sur lequel les allocations 1 sont appliqués';
COMMENT ON COLUMN phenix.purchase_order_details.pod_allocation_2_applied_on IS 'Coûtant sur lequel les allocations 2 sont appliqués';
COMMENT ON COLUMN phenix.purchase_order_details.pod_allocation_3_applied_on IS 'Coûtant sur lequel les allocations 3 sont appliqués';
COMMENT ON COLUMN phenix.purchase_order_details.pod_quantity_cancelled IS 'Quantité cancellé';
COMMENT ON COLUMN phenix.purchase_order_details.pod_weight_cancelled IS 'Poids cancellé';
COMMENT ON COLUMN phenix.purchase_order_details.pod_max_quantity_allowed IS 'Poids maximum autorisée pour les prebooks';
COMMENT ON COLUMN phenix.purchase_order_details.pod_max_weight_allowed IS 'Quantité maximum autorisée pour les prebooks';
COMMENT ON COLUMN phenix.purchase_order_details.pod_use_code IS 'Usager qui a cancellé la ligne de commande';
COMMENT ON COLUMN phenix.purchase_order_details.pod_cancelled_date IS 'Date de cancellation';
COMMENT ON COLUMN phenix.purchase_order_details.pod_ven_code IS 'Code fournisseur si les code fournisseurs de l''entête est différents des réclamations';
COMMENT ON COLUMN phenix.purchase_order_details.pod_reclaim_message IS 'Note en cas de réclamation';
COMMENT ON COLUMN phenix.purchase_order_details.pod_reclaim_reference IS 'Référence en cas de réclamation';
COMMENT ON COLUMN phenix.purchase_order_details.pod_affect_match_cost_1_switch IS 'Indique si la valeur de l''allocation 1 sera inclus dans la calculation (net) des réconciliation des commandes';
COMMENT ON COLUMN phenix.purchase_order_details.pod_affect_match_cost_2_switch IS 'Indique si la valeur de l''allocation 2 sera inclus dans la calculation (net) des réconciliation des commandes';
COMMENT ON COLUMN phenix.purchase_order_details.pod_affect_match_cost_3_switch IS 'Indique si la valeur de l''allocation 3 sera inclus dans la calculation (net) des réconciliation des commandes';
COMMENT ON COLUMN phenix.purchase_order_details.pod_match_cost IS 'Valeur du coutant réconcillié';
COMMENT ON COLUMN phenix.purchase_order_details.pod_manual_disc_cost_affected IS 'Coûtant sur lequel un escompte manuel est affecté sur une commande d''achat';
COMMENT ON COLUMN phenix.purchase_order_details.pod_ven_payable_code IS 'Indique le code du fournisseur payable de l''allocation 3 (si un code fournisseur spécifique est associé)';
COMMENT ON COLUMN phenix.purchase_order_details.pod_system_closed_date IS 'Indique la date où la ligne a été fermée automatiquement par le système (si c''est la manière dont la ligne a été fermée)';
COMMENT ON COLUMN phenix.purchase_order_details.pod_duplicate_switch IS 'Indique si la ligne a été créée automatiquement par le système lors de l''arrivée de la facture';
COMMENT ON COLUMN phenix.purchase_order_details.pod_suggested_quantity IS 'Indique la quantité suggérée';
COMMENT ON COLUMN phenix.purchase_order_details.pod_suggested_weight IS 'Indique le poids suggéré';
COMMENT ON COLUMN phenix.purchase_order_details.pod_creation_source IS 'Indique l''origine de la commande d''achat';