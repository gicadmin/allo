CREATE TABLE phenix.vendor_promotions (
  vpr_id NUMBER(15) NOT NULL,
  vpr_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  vpr_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  vpr_pty_code NUMBER(3) NOT NULL,
  vpr_ven_code NUMBER(5) NOT NULL,
  vpr_end_date DATE NOT NULL,
  vpr_start_date DATE NOT NULL,
  vpr_freegood_volume NUMBER(8,3),
  vpr_freegood_quantity NUMBER(8,3),
  vpr_last_order_date DATE,
  vpr_prebook_flag VARCHAR2(2 BYTE) NOT NULL CONSTRAINT vpr_prebook_flag_ck CHECK (VPR_PREBOOK_FLAG IN ('NA', 'FD', 'DC')),
  vpr_allocation_1 NUMBER(7,2) NOT NULL,
  vpr_allocation_2 NUMBER(7,2) NOT NULL,
  vpr_allocation_3 NUMBER(7,2) NOT NULL,
  vpr_allocation_1_applied_on NUMBER(1) NOT NULL CONSTRAINT vpr_allocation_1_applied_on_ck CHECK (VPR_ALLOCATION_1_APPLIED_ON IN (0, 1, 2, 3, 4)),
  vpr_allocation_2_applied_on NUMBER(1) NOT NULL CONSTRAINT vpr_allocation_2_applied_on_ck CHECK (VPR_ALLOCATION_2_APPLIED_ON IN (0, 1, 2, 3, 4)),
  vpr_allocation_3_applied_on NUMBER(1) NOT NULL CONSTRAINT vpr_allocation_3_applied_on_ck CHECK (VPR_ALLOCATION_3_APPLIED_ON IN (0, 1, 2, 3, 4)),
  vpr_max_quantity_allowed NUMBER(7),
  vpr_max_weight_allowed NUMBER(9,3),
  vpr_prebook_only_switch NUMBER(1) NOT NULL CONSTRAINT vpr_prebook_only_switch CHECK (VPR_PREBOOK_ONLY_SWITCH IN (0, 1)),
  vpr_affect_match_cost_1_switch NUMBER(1) NOT NULL CONSTRAINT vpr_affect_match_cost_1_swi_ck CHECK (VPR_AFFECT_MATCH_COST_1_SWITCH IN (0, 1)),
  vpr_affect_match_cost_2_switch NUMBER(1) NOT NULL CONSTRAINT vpr_affect_match_cost_2_swi_ck CHECK (VPR_AFFECT_MATCH_COST_2_SWITCH IN (0, 1)),
  vpr_affect_match_cost_3_switch NUMBER(1) NOT NULL CONSTRAINT vpr_affect_match_cost_3_swi_ck CHECK (VPR_AFFECT_MATCH_COST_3_SWITCH IN (0, 1)),
  vpr_reclaim_ven_code NUMBER(5),
  vpr_reclaim_reference VARCHAR2(15 BYTE),
  vpr_reclaim_message VARCHAR2(100 BYTE),
  CONSTRAINT vpr_date_ck CHECK ((VPR_END_DATE >=
 VPR_START_DATE)),
  CONSTRAINT vpr_freegood_ck CHECK ((VPR_FREEGOOD_QUANTITY is NULL and
 VPR_FREEGOOD_VOLUME is NULL) or
(VPR_FREEGOOD_QUANTITY is not NULL and
 VPR_FREEGOOD_VOLUME is not NULL)),
  CONSTRAINT vpr_max_weight_quantity_ck CHECK ((VPR_MAX_WEIGHT_ALLOWED IS NOT NULL AND
VPR_MAX_QUANTITY_ALLOWED IS NULL) OR
(VPR_MAX_WEIGHT_ALLOWED IS NULL AND
VPR_MAX_QUANTITY_ALLOWED IS NOT NULL) OR
(VPR_MAX_WEIGHT_ALLOWED IS NULL AND
VPR_MAX_QUANTITY_ALLOWED IS NULL)),
  CONSTRAINT vpr_prebook_only_last_date_ck CHECK ((((VPR_LAST_ORDER_DATE is NULL or VPR_LAST_ORDER_DATE is not NULL) and
VPR_PREBOOK_ONLY_SWITCH = 0) or
(VPR_LAST_ORDER_DATE is not NULL and
VPR_PREBOOK_ONLY_SWITCH = 1))),
  CONSTRAINT vpr_pk PRIMARY KEY (vpr_id),
  CONSTRAINT vpr_prf_fk FOREIGN KEY (vpr_prf_prd_code,vpr_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code),
  CONSTRAINT vpr_pty_fk FOREIGN KEY (vpr_pty_code) REFERENCES phenix.promotion_types (pty_code),
  CONSTRAINT vpr_reclaim_ven_fk FOREIGN KEY (vpr_reclaim_ven_code) REFERENCES phenix.vendors (ven_code),
  CONSTRAINT vpr_ven_fk FOREIGN KEY (vpr_ven_code) REFERENCES phenix.vendors (ven_code)
);
COMMENT ON TABLE phenix.vendor_promotions IS 'Promotion et "billbacks" au niveau du fournisseur';
COMMENT ON COLUMN phenix.vendor_promotions.vpr_id IS 'Numéro d''identifiant de promotion fournisseur';
COMMENT ON COLUMN phenix.vendor_promotions.vpr_prf_prd_code IS 'Numéro de produit';
COMMENT ON COLUMN phenix.vendor_promotions.vpr_prf_fmt_code IS 'Numéro du format';
COMMENT ON COLUMN phenix.vendor_promotions.vpr_pty_code IS 'Numéro de type de promotion';
COMMENT ON COLUMN phenix.vendor_promotions.vpr_ven_code IS 'Numéro du fournisseur';
COMMENT ON COLUMN phenix.vendor_promotions.vpr_end_date IS 'Date de fin de la promotion';
COMMENT ON COLUMN phenix.vendor_promotions.vpr_start_date IS 'Date de début de la promotion';
COMMENT ON COLUMN phenix.vendor_promotions.vpr_freegood_volume IS 'Quantité requise pour bien gratuit';
COMMENT ON COLUMN phenix.vendor_promotions.vpr_freegood_quantity IS 'Quantité de biens gratuits';
COMMENT ON COLUMN phenix.vendor_promotions.vpr_last_order_date IS 'Date de la dernière commande';
COMMENT ON COLUMN phenix.vendor_promotions.vpr_prebook_flag IS 'Type de commande bulletin si apllicable';
COMMENT ON COLUMN phenix.vendor_promotions.vpr_allocation_1 IS 'Montant de l''allocation 1';
COMMENT ON COLUMN phenix.vendor_promotions.vpr_allocation_2 IS 'Montant de l''allocation 2';
COMMENT ON COLUMN phenix.vendor_promotions.vpr_allocation_3 IS 'Montant de l''allocation 3';
COMMENT ON COLUMN phenix.vendor_promotions.vpr_allocation_1_applied_on IS 'Coûtant sur lequel les allocations 1 sont appliqués';
COMMENT ON COLUMN phenix.vendor_promotions.vpr_allocation_2_applied_on IS 'Coûtant sur lequel les allocations 2 sont appliqués';
COMMENT ON COLUMN phenix.vendor_promotions.vpr_allocation_3_applied_on IS 'Coûtant sur lequel les allocations 3 sont appliqués';
COMMENT ON COLUMN phenix.vendor_promotions.vpr_max_quantity_allowed IS 'Quantité maximale autorisée pour les prebooks';
COMMENT ON COLUMN phenix.vendor_promotions.vpr_max_weight_allowed IS 'Poids maximum autorisé pour les prebooks';
COMMENT ON COLUMN phenix.vendor_promotions.vpr_prebook_only_switch IS 'Indique si la promotion est exclusivement attribué au promotion dites bulletin';
COMMENT ON COLUMN phenix.vendor_promotions.vpr_affect_match_cost_1_switch IS 'Indique si la valeur de l''allocation 1 sera inclus dans la calculation des réconciliation des commandes';
COMMENT ON COLUMN phenix.vendor_promotions.vpr_affect_match_cost_2_switch IS 'Indique si la valeur de l''allocation 2 sera inclus dans la calculation des réconciliation des commandes';
COMMENT ON COLUMN phenix.vendor_promotions.vpr_affect_match_cost_3_switch IS 'Indique si la valeur de l''allocation 3 sera inclus dans la calculation des réconciliation des commandes';
COMMENT ON COLUMN phenix.vendor_promotions.vpr_reclaim_ven_code IS 'Fournisseur à qui on réclame l''allocation 3';
COMMENT ON COLUMN phenix.vendor_promotions.vpr_reclaim_reference IS 'La référence pour le fournisseur à qui on réclame';
COMMENT ON COLUMN phenix.vendor_promotions.vpr_reclaim_message IS 'Le message pour le fournisseur à qui on réclame';