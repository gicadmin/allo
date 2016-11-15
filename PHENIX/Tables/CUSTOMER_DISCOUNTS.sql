CREATE TABLE phenix.customer_discounts (
  cud_id NUMBER(9) NOT NULL,
  cud_pricing_strategy NUMBER(1) NOT NULL CONSTRAINT cud_pricing_strategy_ck CHECK (CUD_PRICING_STRATEGY IN (1,2,3,4,5,6,7)),
  cud_cus_code NUMBER(10),
  cud_dgt_code NUMBER(5),
  cud_pgr_code NUMBER(5),
  cud_prd_code VARCHAR2(10 BYTE),
  cud_prf_prd_code VARCHAR2(10 BYTE),
  cud_prf_fmt_code VARCHAR2(7 BYTE),
  cud_admin_amount NUMBER(6,2),
  cud_admin_percent NUMBER(6,3),
  cud_surcharge_percent NUMBER(6,3),
  cud_group_fmt_code VARCHAR2(7 BYTE),
  cud_group_pgr_code NUMBER(5),
  cud_cost_used NUMBER(2) DEFAULT 10 NOT NULL CONSTRAINT cud_cost_used_ck CHECK (cud_cost_used IN (0, 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11)),
  cud_prd_admin_1_in_cost_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cud_prd_admin_1_in_cost_swi_ck CHECK (CUD_PRD_ADMIN_1_IN_COST_SWITCH IN (0, 1)),
  cud_prd_admin_2_in_cost_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cud_prd_admin_2_in_cost_swi_ck CHECK (CUD_PRD_ADMIN_2_IN_COST_SWITCH IN (0, 1)),
  cud_prd_adj_in_cost_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cud_prd_adj_in_cost_switch_ck CHECK (CUD_PRD_ADJ_IN_COST_SWITCH IN (0, 1)),
  cud_prw_trans_in_cost_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cud_prw_trans_in_cost_swi_ck CHECK (CUD_PRW_TRANS_IN_COST_SWITCH IN (0, 1)),
  CONSTRAINT cud_customer_disc_grid_ck CHECK ((CUD_CUS_CODE is not NULL and
 CUD_DGT_CODE is NULL) or
(CUD_CUS_CODE is  NULL and
 CUD_DGT_CODE is not NULL)),
  CONSTRAINT cud_discount_ck CHECK (
CUD_SURCHARGE_PERCENT		IS NULL AND
 	(CUD_ADMIN_AMOUNT				IS NOT NULL AND CUD_ADMIN_PERCENT  IS NULL) OR
 	(CUD_ADMIN_AMOUNT				IS NULL AND CUD_ADMIN_PERCENT  IS NOT NULL)
OR
CUD_SURCHARGE_PERCENT		IS NOT NULL AND
 	(CUD_ADMIN_AMOUNT				IS NOT NULL AND CUD_ADMIN_PERCENT  IS NULL) OR
 	(CUD_ADMIN_AMOUNT				IS NULL AND CUD_ADMIN_PERCENT  IS NOT NULL)	OR
 	(CUD_ADMIN_AMOUNT				IS NULL AND CUD_ADMIN_PERCENT  IS NULL)
),
  CONSTRAINT cud_product_group_format_ck CHECK ((CUD_PGR_CODE				IS NOT NULL AND
 	CUD_PRD_CODE				IS NULL AND
 	CUD_PRF_FMT_CODE 		IS NULL AND
 	CUD_PRF_PRD_CODE 		IS NULL AND
 	CUD_GROUP_PGR_CODE	IS NULL AND
	CUD_GROUP_FMT_CODE	IS NULL	)
OR
 (CUD_PGR_CODE 				IS NULL AND
	CUD_PRD_CODE 				IS NOT NULL AND
	CUD_PRF_FMT_CODE 		IS NULL AND
	CUD_PRF_PRD_CODE 		IS NULL AND
 	CUD_GROUP_PGR_CODE	IS NULL AND
	CUD_GROUP_FMT_CODE	IS NULL)
OR
 (CUD_PGR_CODE 				IS NULL AND
	CUD_PRD_CODE 				IS NULL AND
	CUD_PRF_FMT_CODE 		IS NOT NULL AND
	CUD_PRF_PRD_CODE 		IS NOT NULL AND
 	CUD_GROUP_PGR_CODE	IS NULL AND
	CUD_GROUP_FMT_CODE	IS NULL)
OR
 (CUD_PGR_CODE 				IS NULL AND
	CUD_PRD_CODE 				IS NULL AND
	CUD_PRF_FMT_CODE 		IS NULL AND
	CUD_PRF_PRD_CODE 		IS NULL AND
 	CUD_GROUP_PGR_CODE	IS NOT NULL AND
	CUD_GROUP_FMT_CODE	IS NOT NULL)
),
  CONSTRAINT cud_pk PRIMARY KEY (cud_id),
  CONSTRAINT cud_cus_fk FOREIGN KEY (cud_cus_code) REFERENCES phenix.customers (cus_code) ON DELETE CASCADE,
  CONSTRAINT cud_dgt_fk FOREIGN KEY (cud_dgt_code) REFERENCES phenix.discount_grid_types (dgt_code),
  CONSTRAINT cud_group_fmt_code_fk FOREIGN KEY (cud_group_fmt_code) REFERENCES phenix.formats (fmt_code),
  CONSTRAINT cud_group_pgr_code_fk FOREIGN KEY (cud_group_pgr_code) REFERENCES phenix.product_groups (pgr_code),
  CONSTRAINT cud_pgr_fk FOREIGN KEY (cud_pgr_code) REFERENCES phenix.product_groups (pgr_code),
  CONSTRAINT cud_prd_fk FOREIGN KEY (cud_prd_code) REFERENCES phenix.products (prd_code),
  CONSTRAINT cud_prf_fk FOREIGN KEY (cud_prf_prd_code,cud_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code)
);
COMMENT ON TABLE phenix.customer_discounts IS 'Lien qui permet de savoir les escomptes aux ventes pour le client';
COMMENT ON COLUMN phenix.customer_discounts.cud_id IS 'Séquence des escomptes client';
COMMENT ON COLUMN phenix.customer_discounts.cud_pricing_strategy IS 'Indique la startégie de l''escompte';
COMMENT ON COLUMN phenix.customer_discounts.cud_cus_code IS 'Numéro de client';
COMMENT ON COLUMN phenix.customer_discounts.cud_dgt_code IS 'Numéro de type de grille d''escompte';
COMMENT ON COLUMN phenix.customer_discounts.cud_pgr_code IS 'Numéro de groupe de produit';
COMMENT ON COLUMN phenix.customer_discounts.cud_prd_code IS 'Code de produit';
COMMENT ON COLUMN phenix.customer_discounts.cud_prf_prd_code IS 'Code produit';
COMMENT ON COLUMN phenix.customer_discounts.cud_prf_fmt_code IS 'Numéro de format';
COMMENT ON COLUMN phenix.customer_discounts.cud_admin_amount IS 'Montant de l''escompte';
COMMENT ON COLUMN phenix.customer_discounts.cud_admin_percent IS 'Pourcentage d''escompte';
COMMENT ON COLUMN phenix.customer_discounts.cud_surcharge_percent IS 'Indique les frais d''administration';
COMMENT ON COLUMN phenix.customer_discounts.cud_group_fmt_code IS 'Indique le code de format de produit ';
COMMENT ON COLUMN phenix.customer_discounts.cud_group_pgr_code IS 'Indique le code de groupe de produit ';
COMMENT ON COLUMN phenix.customer_discounts.cud_cost_used IS 'Indique le coûtant utilisé à appliquer sur les stratégies d''escompte.';
COMMENT ON COLUMN phenix.customer_discounts.cud_prd_admin_1_in_cost_switch IS 'Indique si le coûtant d''administration 1 ($) est pris ou non en considération dans le prix quand le prix de liste est sélectionné';
COMMENT ON COLUMN phenix.customer_discounts.cud_prd_admin_2_in_cost_switch IS 'Indique si le coûtant d''administration 2 (%) est pris ou non en considération dans le prix quand le prix de liste est sélectionné';
COMMENT ON COLUMN phenix.customer_discounts.cud_prd_adj_in_cost_switch IS 'Indique si l''ajustement de coût est pris ou non en considération dans le prix quand le prix de liste est sélectionné';
COMMENT ON COLUMN phenix.customer_discounts.cud_prw_trans_in_cost_switch IS 'Indique si le coefficient de transport au niveau de l''entrepôt est pris ou non en considération quand le prix de liste est sélectionné';