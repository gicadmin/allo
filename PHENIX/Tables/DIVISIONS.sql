CREATE TABLE phenix.divisions (
  div_ap_drops VARCHAR2(40 BYTE) NOT NULL,
  div_ap_purchases VARCHAR2(40 BYTE) NOT NULL,
  div_ap_transport VARCHAR2(40 BYTE) NOT NULL,
  div_ar_billbacks VARCHAR2(40 BYTE) NOT NULL,
  div_ar_credits VARCHAR2(40 BYTE) NOT NULL,
  div_ar_drops VARCHAR2(40 BYTE) NOT NULL,
  div_ar_sales VARCHAR2(40 BYTE) NOT NULL,
  div_ar_vendor_credits VARCHAR2(40 BYTE) NOT NULL,
  div_ar_vendor_discounts VARCHAR2(40 BYTE) NOT NULL,
  div_alt_description VARCHAR2(30 BYTE),
  div_ar_recount_promotions VARCHAR2(40 BYTE) NOT NULL,
  div_billbacks_flag VARCHAR2(1 BYTE) NOT NULL CONSTRAINT div_billbacks_flag_ck CHECK (DIV_BILLBACKS_FLAG IN ('P', 'R')),
  div_recount_promotions_flag VARCHAR2(1 BYTE) NOT NULL CONSTRAINT div_recount_promotions_flag_ck CHECK (DIV_RECOUNT_PROMOTIONS_FLAG IN ('P', 'R')),
  div_vendor_credits_flag VARCHAR2(1 BYTE) NOT NULL CONSTRAINT div_vendor_credits_flag_ck CHECK (DIV_VENDOR_CREDITS_FLAG IN ('P', 'R')),
  div_vendor_discounts_flag VARCHAR2(1 BYTE) NOT NULL CONSTRAINT div_vendor_discounts_flag_ck CHECK (DIV_VENDOR_DISCOUNTS_FLAG IN ('P', 'R')),
  div_ar_vendor_sales_agreement VARCHAR2(40 BYTE) NOT NULL,
  div_warehouse_drop_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT div_warehouse_drop_switch_ck CHECK (div_warehouse_drop_switch IN (0, 1)),
  div_bill_for_transactions VARCHAR2(40 BYTE) NOT NULL,
  div_bill_for_trans_flag VARCHAR2(1 BYTE) DEFAULT 'R' NOT NULL CONSTRAINT div_bill_for_trans_flag_ck CHECK (DIV_BILL_FOR_TRANS_FLAG IN ('P', 'R')),
  div_id NUMBER(15) NOT NULL,
  div_dvn_code NUMBER(3) NOT NULL,
  div_whs_code VARCHAR2(2 BYTE) NOT NULL,
  div_freegoods VARCHAR2(40 BYTE) NOT NULL,
  div_freegoods_flag VARCHAR2(1 BYTE) DEFAULT 'R' NOT NULL,
  div_freegoods_admin VARCHAR2(40 BYTE) NOT NULL,
  div_freegoods_admin_flag VARCHAR2(1 BYTE) DEFAULT 'R' NOT NULL,
  div_transfer_inventory_account VARCHAR2(40 BYTE),
  div_transfer_freight_account VARCHAR2(40 BYTE),
  div_vendor_admin VARCHAR2(40 BYTE) NOT NULL,
  div_oa_account VARCHAR2(40 BYTE) NOT NULL,
  div_oa_flag VARCHAR2(1 BYTE) DEFAULT 'P' NOT NULL CONSTRAINT div_oa_flag_ck CHECK (DIV_OA_FLAG IN ('P', 'R')),
  div_tpa_account VARCHAR2(40 BYTE) NOT NULL,
  div_tpa_flag VARCHAR2(1 BYTE) DEFAULT 'P' NOT NULL CONSTRAINT div_tpa_flag_ck CHECK (DIV_TPA_FLAG IN ('P', 'R')),
  div_ar_drop_surcharges VARCHAR2(40 BYTE) NOT NULL,
  div_discount_account VARCHAR2(40 BYTE) NOT NULL,
  div_taxable_charge_account VARCHAR2(40 BYTE) NOT NULL,
  div_not_taxable_charge_account VARCHAR2(40 BYTE) NOT NULL,
  div_telemarketer_counters VARCHAR2(40 BYTE) DEFAULT 'A CHANGER' NOT NULL,
  div_telemarketer_counters_flag VARCHAR2(1 BYTE) DEFAULT 'R' NOT NULL CONSTRAINT div_telemark_counters_flag_ck CHECK (DIV_TELEMARKETER_COUNTERS_FLAG IN ('P','R')),
  div_ap_alloc_transport VARCHAR2(40 BYTE),
  div_ap_alloc_transport_volume VARCHAR2(40 BYTE),
  div_ap_quart_rebate VARCHAR2(40 BYTE),
  div_ap_quart_rebate_volume VARCHAR2(40 BYTE),
  div_ap_term_drop VARCHAR2(40 BYTE),
  div_ap_term_drop_volume VARCHAR2(40 BYTE),
  div_ap_alloc_growth VARCHAR2(40 BYTE),
  div_ap_alloc_additional VARCHAR2(40 BYTE),
  div_ap_alloc_prog VARCHAR2(40 BYTE),
  div_ap_alloc_prog_volume VARCHAR2(40 BYTE),
  div_ar_sales_incentive VARCHAR2(40 BYTE) DEFAULT 'A CHANGER' NOT NULL,
  CONSTRAINT div_pk PRIMARY KEY (div_id),
  CONSTRAINT div_whs_uk UNIQUE (div_dvn_code,div_whs_code),
  CONSTRAINT div_dvn_fk FOREIGN KEY (div_dvn_code) REFERENCES phenix.division_names (dvn_code) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.divisions IS 'Contient les numéro de compte GL des différentes transactions';
COMMENT ON COLUMN phenix.divisions.div_ap_drops IS 'Compte payable aux livraisons directes';
COMMENT ON COLUMN phenix.divisions.div_ap_purchases IS 'Compte payable aux achats';
COMMENT ON COLUMN phenix.divisions.div_ap_transport IS 'Compte payable au transport';
COMMENT ON COLUMN phenix.divisions.div_ar_billbacks IS 'Compte à recevoir aux billbacks';
COMMENT ON COLUMN phenix.divisions.div_ar_credits IS 'Compte à recevoir au crédit';
COMMENT ON COLUMN phenix.divisions.div_ar_drops IS 'Compte à recevoir aux livraisons directes';
COMMENT ON COLUMN phenix.divisions.div_ar_sales IS 'Compte à recevoir à la vente';
COMMENT ON COLUMN phenix.divisions.div_ar_vendor_credits IS 'Compte à recevoir aux crédits fournisseur';
COMMENT ON COLUMN phenix.divisions.div_ar_vendor_discounts IS 'Compte à recevoir des escomptes fournisseurs';
COMMENT ON COLUMN phenix.divisions.div_alt_description IS 'Description alternative';
COMMENT ON COLUMN phenix.divisions.div_ar_recount_promotions IS 'Compte à recevoir des recounts promotions';
COMMENT ON COLUMN phenix.divisions.div_billbacks_flag IS 'Indique si les billbacks sont payables ou recevables';
COMMENT ON COLUMN phenix.divisions.div_recount_promotions_flag IS 'Indique si les recounts promotions sont payables ou recevables';
COMMENT ON COLUMN phenix.divisions.div_vendor_credits_flag IS 'Indique si les crédits fournisseurs sont payables ou recevables';
COMMENT ON COLUMN phenix.divisions.div_vendor_discounts_flag IS 'Indique si les montants des escomptes fournisseurs sont payables ou recevables';
COMMENT ON COLUMN phenix.divisions.div_ar_vendor_sales_agreement IS 'Contient le compte posté de  l''accord de réclamation des fournisseurs';
COMMENT ON COLUMN phenix.divisions.div_warehouse_drop_switch IS 'Indique si c''est un drop entrepôt';
COMMENT ON COLUMN phenix.divisions.div_bill_for_transactions IS 'Indique le compte à recevoir pour les rachats de facture (type BF)';
COMMENT ON COLUMN phenix.divisions.div_bill_for_trans_flag IS 'Indique compte payable ou recevable';
COMMENT ON COLUMN phenix.divisions.div_id IS 'Indique l''identifiant unique de la table';
COMMENT ON COLUMN phenix.divisions.div_dvn_code IS 'Indique le code de la division';
COMMENT ON COLUMN phenix.divisions.div_whs_code IS 'Indique l''entrepôt de la division';
COMMENT ON COLUMN phenix.divisions.div_freegoods IS 'Indique le compte grand livre pour les gratuités.';
COMMENT ON COLUMN phenix.divisions.div_freegoods_flag IS 'Indique si le report pour les gratuités est un compte payable ou recevable.';
COMMENT ON COLUMN phenix.divisions.div_freegoods_admin IS 'Indique le compte grand livre pour les frais d''administratiom sur les gratuités.';
COMMENT ON COLUMN phenix.divisions.div_freegoods_admin_flag IS 'Indique si le report pour les frais admin sur les gratuités est un compte payable ou recevable.';
COMMENT ON COLUMN phenix.divisions.div_transfer_inventory_account IS 'Indique le numéro de compte du grand livre pour les ajustements d¿inventaire reliés à un transfert entre deux entrepôts.';
COMMENT ON COLUMN phenix.divisions.div_transfer_freight_account IS 'Indique le numéro de compte du grand livre pour les frais de transport reliés à un transfert entre deux entrepôts.';
COMMENT ON COLUMN phenix.divisions.div_vendor_admin IS 'Indique le compte des frais d''administration sur les charges fournisseurs';
COMMENT ON COLUMN phenix.divisions.div_oa_account IS 'Indique le compte grand livre pour les ententes partenaires de type ''OAGR''';
COMMENT ON COLUMN phenix.divisions.div_oa_flag IS 'Indique le compte payable ou recevable';
COMMENT ON COLUMN phenix.divisions.div_tpa_account IS 'Indique le compte grand livre pour les ententes partenaires de type ''TPA''';
COMMENT ON COLUMN phenix.divisions.div_tpa_flag IS 'Indique le compte payable ou recevable';
COMMENT ON COLUMN phenix.divisions.div_ar_drop_surcharges IS 'Indique le compte GL des surcharges livraison client';
COMMENT ON COLUMN phenix.divisions.div_discount_account IS 'Indique le compte GL d''escompte';
COMMENT ON COLUMN phenix.divisions.div_taxable_charge_account IS 'Indique le compte GL des charges taxables';
COMMENT ON COLUMN phenix.divisions.div_not_taxable_charge_account IS 'Indique le compte GL des charges non taxables';
COMMENT ON COLUMN phenix.divisions.div_telemarketer_counters IS 'Indique le numéro de compte du grand livre pour les réclamations des compteurs de type télévente';
COMMENT ON COLUMN phenix.divisions.div_telemarketer_counters_flag IS 'Indique si le report pour les réclamations des compteurs de type télévente est un compte payable ou recevable';
COMMENT ON COLUMN phenix.divisions.div_ap_alloc_transport IS 'Indique le compte GL pour les allocations transport';
COMMENT ON COLUMN phenix.divisions.div_ap_alloc_transport_volume IS 'Indique le compte GL pour les allocations transport';
COMMENT ON COLUMN phenix.divisions.div_ap_quart_rebate IS 'Indique le compte GL pour les remises trimestrielles';
COMMENT ON COLUMN phenix.divisions.div_ap_quart_rebate_volume IS 'Indique le compte GL pour les remises trimestrielles sur volume inférieur à 100%';
COMMENT ON COLUMN phenix.divisions.div_ap_term_drop IS 'Indique le compte GL pour les remises terme drop';
COMMENT ON COLUMN phenix.divisions.div_ap_term_drop_volume IS 'Indique le compte GL pour les remises terme drop sur volume inférieur à 100%';
COMMENT ON COLUMN phenix.divisions.div_ap_alloc_growth IS 'Indique le compte GL pour les allocations de croissance';
COMMENT ON COLUMN phenix.divisions.div_ap_alloc_additional IS 'Indique le compte GL pour les allocations additionnelles';
COMMENT ON COLUMN phenix.divisions.div_ap_alloc_prog IS 'Indique le compte GL pour les allocations du programme de remises';
COMMENT ON COLUMN phenix.divisions.div_ap_alloc_prog_volume IS 'Indique le compte GL pour les allocations du programme de remises sur volume inférieur à 100%';
COMMENT ON COLUMN phenix.divisions.div_ar_sales_incentive IS 'Indique le compte posté de l''accord de réclamation primes  des manufacturiers';