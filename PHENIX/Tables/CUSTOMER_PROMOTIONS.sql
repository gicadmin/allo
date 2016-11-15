CREATE TABLE phenix.customer_promotions (
  cpr_id NUMBER(15) NOT NULL,
  cpr_type VARCHAR2(2 BYTE) NOT NULL CONSTRAINT cpr_type_ck CHECK (CPR_TYPE IN ('PR', 'BA')),
  cpr_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  cpr_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  cpr_pty_code NUMBER(3) NOT NULL,
  cpr_allocation_amount NUMBER(7,2) NOT NULL,
  cpr_count_switch NUMBER(1) NOT NULL CONSTRAINT cpr_count_switch_ck CHECK (CPR_COUNT_SWITCH IN (0, 1)),
  cpr_from_date DATE NOT NULL,
  cpr_position_promo VARCHAR2(2 BYTE),
  cpr_prebook_only_switch NUMBER(1) NOT NULL CONSTRAINT cpr_prebook_only_switch_ck CHECK (CPR_PREBOOK_ONLY_SWITCH IN (0, 1)),
  cpr_to_date DATE NOT NULL,
  cpr_ven_car_code NUMBER(5),
  cpr_banner_to_date DATE,
  cpr_banner_from_date DATE,
  cpr_car_amount NUMBER(7,2),
  cpr_last_order_date DATE,
  cpr_prebook_price NUMBER(7,2),
  cpr_special_allocation NUMBER(7,2) NOT NULL,
  cpr_srp_promo_price NUMBER(7,2),
  cpr_srp_quantity NUMBER(3),
  cpr_opening_inventory_quantity NUMBER(10),
  cpr_opening_inventory_weight NUMBER(10,3),
  cpr_page_number NUMBER(4),
  cpr_recount_processed_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cpr_recount_processed_swit_ck CHECK (CPR_RECOUNT_PROCESSED_SWITCH IN (0, 1)),
  cpr_guaranteed_price NUMBER(7,2),
  cpr_message_1 VARCHAR2(100 BYTE),
  cpr_message_2 VARCHAR2(100 BYTE),
  cpr_message_3 VARCHAR2(100 BYTE),
  cpr_number_of_stickers NUMBER(5),
  cpr_creation_date DATE DEFAULT SYSDATE NOT NULL,
  cpr_modification_date DATE DEFAULT SYSDATE NOT NULL,
  cpr_member_fmt_code VARCHAR2(7 BYTE),
  cpr_member_fmt_price NUMBER(7,2),
  cpr_coupon_amount NUMBER(7,2),
  cpr_approval_switch NUMBER(1) NOT NULL,
  cpr_member_price NUMBER(7,2),
  cpr_member_profit_percent NUMBER(6,3),
  cpr_retailer_profit_percent NUMBER(6,3),
  cpr_retailer_price NUMBER(7,2),
  cpr_retailer_fmt_price NUMBER(7,2),
  cpr_srp_cost NUMBER(7,2),
  cpr_pty_source_code NUMBER(3) NOT NULL,
  cpr_recount_rebill_method VARCHAR2(2 BYTE) DEFAULT 'PR' NOT NULL CONSTRAINT cpr_recount_rebill_method_ck CHECK (cpr_recount_rebill_method IN ('PE','MO','PR','NA')),
  cpr_broker_car_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cpr_broker_car_switch_ck CHECK (cpr_broker_car_switch IN (0, 1)),
  CONSTRAINT cpr_banner_date_ck CHECK ((CPR_BANNER_FROM_DATE <
 CPR_BANNER_TO_DATE)),
  CONSTRAINT cpr_banner_type_ck CHECK ((CPR_TYPE = 'BA' and
 CPR_BANNER_FROM_DATE is not NULL and
 CPR_BANNER_TO_DATE is not NULL and
 CPR_SRP_PROMO_PRICE is not NULL) or
(CPR_TYPE = 'PR' and
 CPR_BANNER_FROM_DATE is NULL and
 CPR_BANNER_TO_DATE is NULL and
 CPR_SRP_PROMO_PRICE is NULL)),
  CONSTRAINT cpr_car_ck CHECK ((CPR_VEN_CAR_CODE is not NULL and
CPR_CAR_AMOUNT is not NULL) or
(CPR_VEN_CAR_CODE is NULL and
CPR_CAR_AMOUNT is NULL)),
  CONSTRAINT cpr_date_ck CHECK ((CPR_FROM_DATE <=
 CPR_TO_DATE)),
  CONSTRAINT cpr_prebook_only_last_date_ck CHECK (((CPR_LAST_ORDER_DATE is NULL or CPR_LAST_ORDER_DATE is not NULL) and
CPR_PREBOOK_ONLY_SWITCH = 0) or
(CPR_LAST_ORDER_DATE is not NULL and
CPR_PREBOOK_ONLY_SWITCH = 1)),
  CONSTRAINT cpr_pk PRIMARY KEY (cpr_id),
  CONSTRAINT cpr_member_fmt_code_fk FOREIGN KEY (cpr_member_fmt_code) REFERENCES phenix.formats (fmt_code),
  CONSTRAINT cpr_prf_fk FOREIGN KEY (cpr_prf_prd_code,cpr_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code),
  CONSTRAINT cpr_pty_fk FOREIGN KEY (cpr_pty_code) REFERENCES phenix.promotion_types (pty_code),
  CONSTRAINT cpr_pty_source_fk FOREIGN KEY (cpr_pty_source_code) REFERENCES phenix.promotion_types (pty_code),
  CONSTRAINT cpr_ven_fk FOREIGN KEY (cpr_ven_car_code) REFERENCES phenix.vendors (ven_code)
);
COMMENT ON TABLE phenix.customer_promotions IS 'Identifie les promotions client';
COMMENT ON COLUMN phenix.customer_promotions.cpr_id IS 'Numéro d''identifiant pour la promotion client';
COMMENT ON COLUMN phenix.customer_promotions.cpr_type IS 'Type de la promotion client';
COMMENT ON COLUMN phenix.customer_promotions.cpr_prf_prd_code IS 'Code de produit';
COMMENT ON COLUMN phenix.customer_promotions.cpr_prf_fmt_code IS 'Numéro de format de produit';
COMMENT ON COLUMN phenix.customer_promotions.cpr_pty_code IS 'Numéro de type de promotion';
COMMENT ON COLUMN phenix.customer_promotions.cpr_allocation_amount IS 'Montant de la promotion';
COMMENT ON COLUMN phenix.customer_promotions.cpr_count_switch IS 'Indique si on active un compteur pour cette promotion';
COMMENT ON COLUMN phenix.customer_promotions.cpr_from_date IS 'Date de début de la promotion';
COMMENT ON COLUMN phenix.customer_promotions.cpr_position_promo IS 'Position de la promotion';
COMMENT ON COLUMN phenix.customer_promotions.cpr_prebook_only_switch IS 'Indique si la promotion est exclusivement attribué au promotion dites bulletin';
COMMENT ON COLUMN phenix.customer_promotions.cpr_to_date IS 'Date de fin de la promotion';
COMMENT ON COLUMN phenix.customer_promotions.cpr_ven_car_code IS 'Numéro du fournisseur servant au "count and recount"';
COMMENT ON COLUMN phenix.customer_promotions.cpr_banner_to_date IS 'Date de fin de la bannière';
COMMENT ON COLUMN phenix.customer_promotions.cpr_banner_from_date IS 'Date de début de la bannière';
COMMENT ON COLUMN phenix.customer_promotions.cpr_car_amount IS 'Montant servant au "count and recount"';
COMMENT ON COLUMN phenix.customer_promotions.cpr_last_order_date IS 'Date de la dernière commande sur cette promotion';
COMMENT ON COLUMN phenix.customer_promotions.cpr_prebook_price IS 'Prix fixe pour une commande bulletin';
COMMENT ON COLUMN phenix.customer_promotions.cpr_special_allocation IS 'Montant pour allocation spéciale';
COMMENT ON COLUMN phenix.customer_promotions.cpr_srp_promo_price IS 'Prix de détail suggéré en promotion';
COMMENT ON COLUMN phenix.customer_promotions.cpr_srp_quantity IS 'Quantité suggéré';
COMMENT ON COLUMN phenix.customer_promotions.cpr_opening_inventory_quantity IS 'Quantité en inventaire au début de la promotion';
COMMENT ON COLUMN phenix.customer_promotions.cpr_opening_inventory_weight IS 'Poids en inventaire au début de la promotion';
COMMENT ON COLUMN phenix.customer_promotions.cpr_page_number IS 'Contient soit le numéro de page ou d''illustration du circulaire promotionelle';
COMMENT ON COLUMN phenix.customer_promotions.cpr_recount_processed_switch IS 'Indique si l''enregistrement a été traité par le processus de "count and recount"';
COMMENT ON COLUMN phenix.customer_promotions.cpr_guaranteed_price IS 'Prix garantie de la promotion';
COMMENT ON COLUMN phenix.customer_promotions.cpr_message_1 IS 'Contient un message par rapport à la promotion';
COMMENT ON COLUMN phenix.customer_promotions.cpr_message_2 IS 'Contient un message par rapport à la promotion';
COMMENT ON COLUMN phenix.customer_promotions.cpr_message_3 IS 'Contient un message par rapport à la promotion';
COMMENT ON COLUMN phenix.customer_promotions.cpr_number_of_stickers IS 'Contient le nombre d''étiquettes associés à la promotion';
COMMENT ON COLUMN phenix.customer_promotions.cpr_creation_date IS 'Date de création de la promotion';
COMMENT ON COLUMN phenix.customer_promotions.cpr_modification_date IS 'Date de la dernière modification de la promotion';
COMMENT ON COLUMN phenix.customer_promotions.cpr_member_fmt_code IS 'Format vendu par le membre';
COMMENT ON COLUMN phenix.customer_promotions.cpr_member_fmt_price IS 'Le prix du format vendu par le membre';
COMMENT ON COLUMN phenix.customer_promotions.cpr_coupon_amount IS 'Le montant en coupon';
COMMENT ON COLUMN phenix.customer_promotions.cpr_approval_switch IS 'Indique si la bannière est activé ou non';
COMMENT ON COLUMN phenix.customer_promotions.cpr_member_price IS 'Prix vendant du membre pour ce format';
COMMENT ON COLUMN phenix.customer_promotions.cpr_member_profit_percent IS 'Pourcentage de profit du membre';
COMMENT ON COLUMN phenix.customer_promotions.cpr_retailer_profit_percent IS 'Pourcentage de profit du détaillant';
COMMENT ON COLUMN phenix.customer_promotions.cpr_retailer_price IS 'Prix vendant du détaillant pour ce format';
COMMENT ON COLUMN phenix.customer_promotions.cpr_retailer_fmt_price IS 'Prix du format vendu par le détaillant';
COMMENT ON COLUMN phenix.customer_promotions.cpr_srp_cost IS 'Indique le coûtant du PDS sur les promotions client';
COMMENT ON COLUMN phenix.customer_promotions.cpr_pty_source_code IS 'Indique le type de promotion source';
COMMENT ON COLUMN phenix.customer_promotions.cpr_recount_rebill_method IS 'Indique à quel moment la refacturation des count and recount sera effectué :
	à la fin de la période ou à la fin du mois ou à la fin de la promotion';
COMMENT ON COLUMN phenix.customer_promotions.cpr_broker_car_switch IS 'Indique si le courtier réclame ce compteur';