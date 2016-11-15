CREATE TABLE phenix.vendors (
  ven_code NUMBER(5) NOT NULL,
  ven_cat_code NUMBER(2) NOT NULL,
  ven_terms VARCHAR2(6 BYTE),
  ven_use_code NUMBER(5) NOT NULL,
  ven_auto_order_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ven_auto_order_switch_ck CHECK (VEN_AUTO_ORDER_SWITCH IN (0, 1)),
  ven_delivery_method VARCHAR2(12 BYTE) NOT NULL,
  ven_discount_total_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ven_discount_total_switch_ck CHECK (VEN_DISCOUNT_TOTAL_SWITCH IN (0, 1)),
  ven_drop_warehouse_flag VARCHAR2(1 BYTE) DEFAULT 'W' NOT NULL CONSTRAINT ven_drop_warehouse_flag_ck CHECK (VEN_DROP_WAREHOUSE_FLAG IN ('W', 'B', 'D')),
  ven_fob VARCHAR2(1 BYTE) DEFAULT 'D' NOT NULL CONSTRAINT ven_fob_ck CHECK (VEN_FOB IN ('D', 'O')),
  ven_freight_cost NUMBER(6,3) DEFAULT 0 NOT NULL,
  ven_minimum_order_dollars NUMBER(9,2) DEFAULT 0 NOT NULL,
  ven_minimum_order_quantity NUMBER(7) DEFAULT 1 NOT NULL,
  ven_minimum_order_weight NUMBER(9,3) DEFAULT 0 NOT NULL,
  ven_name VARCHAR2(30 BYTE) NOT NULL,
  ven_short_name VARCHAR2(15 BYTE) NOT NULL,
  ven_status VARCHAR2(1 BYTE) DEFAULT 'A' NOT NULL,
  ven_tobacco_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ven_tobacco_switch_ck CHECK (VEN_TOBACCO_SWITCH IN (0, 1)),
  ven_transmit_po_method VARCHAR2(3 BYTE) DEFAULT 'MAI' NOT NULL CONSTRAINT ven_transmit_po_method_ck CHECK (VEN_TRANSMIT_PO_METHOD IN ('TEL', 'EDI', 'EMA', 'MAI', 'FAX')),
  ven_transport_allocation NUMBER(6,3) DEFAULT 0 NOT NULL,
  ven_wine_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ven_wine_switch_ck CHECK (VEN_WINE_SWITCH IN (0, 1)),
  ven_ven_payable_code NUMBER(5),
  ven_broker_vendor_id NUMBER(10),
  ven_duns_number VARCHAR2(13 BYTE),
  ven_email VARCHAR2(100 BYTE),
  ven_ven_pickup_code NUMBER(5),
  ven_modify_at_match_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT ven_modify_at_match_switch_ck CHECK (VEN_MODIFY_AT_MATCH_SWITCH IN (0, 1)),
  ven_edi_customer_mask VARCHAR2(10 BYTE),
  ven_credit_reference_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ven_credit_reference_switch_ck CHECK (VEN_CREDIT_REFERENCE_SWITCH IN (0, 1)),
  ven_forced_single_pb_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT ven_forced_single_pb_switch_ck CHECK (VEN_FORCED_SINGLE_PB_SWITCH IN (0, 1)),
  ven_create_ar_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ven_create_ar_switch_ck CHECK (VEN_CREATE_AR_SWITCH IN (0, 1)),
  ven_spec_order_process_days NUMBER(3) DEFAULT 0 NOT NULL,
  ven_minimum_order_volume NUMBER(9,3) DEFAULT 0 NOT NULL,
  ven_check_deliv_date_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ven_check_deliv_date_switch_ck CHECK (VEN_CHECK_DELIV_DATE_SWITCH IN (0, 1)),
  ven_negotiator_use_code NUMBER(5),
  ven_freight_calculation_method VARCHAR2(2 BYTE) DEFAULT 'FX' NOT NULL CONSTRAINT ven_freight_calculation_met_ck CHECK (VEN_FREIGHT_CALCULATION_METHOD IN ('FX', 'VO', 'KG', 'IT', 'PC')),
  ven_ven_association_code NUMBER(5),
  ven_association_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ven_association_switch_ck CHECK (VEN_ASSOCIATION_SWITCH IN (0, 1)),
  ven_car_code NUMBER(5),
  ven_creation_date DATE DEFAULT SYSDATE NOT NULL,
  ven_elimination_date DATE,
  ven_modification_date DATE DEFAULT SYSDATE NOT NULL,
  ven_message VARCHAR2(100 BYTE),
  ven_produce_stat_files_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ven_produce_stat_files_swi_ck CHECK (VEN_PRODUCE_STAT_FILES_SWITCH IN (0, 1)),
  ven_calc_drop_prv_tax_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT ven_calc_drop_prv_tax_switch CHECK (VEN_CALC_DROP_PRV_TAX_SWITCH IN (0, 1)),
  ven_match_credit_note_switch NUMBER(1) DEFAULT 0 NOT NULL,
  ven_drop_terms NUMBER(6,3) DEFAULT 0 NOT NULL,
  ven_quart_drop_ship_avr NUMBER(6,3) DEFAULT 0 NOT NULL,
  ven_collected_avr_percent NUMBER(6,3) DEFAULT 0 NOT NULL,
  ven_distributed_avr_percent NUMBER(6,3) DEFAULT 0 NOT NULL,
  ven_federal_tax_exempt_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ven_federal_tax_exempt_swi_ck CHECK (VEN_FEDERAL_TAX_EXEMPT_SWITCH in (0, 1)),
  ven_province_tax_exempt_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ven_province_tax_exempt_swi_ck CHECK (VEN_PROVINCE_TAX_EXEMPT_SWITCH in (0, 1)),
  ven_expiry_date_format VARCHAR2(1 BYTE) DEFAULT 'G' NOT NULL CONSTRAINT ven_expiry_date_format_ck CHECK (VEN_EXPIRY_DATE_FORMAT IN ('G','J','C')),
  ven_net_price_on_inv_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT ven_net_price_on_inv_switch_ck CHECK (VEN_NET_PRICE_ON_INV_SWITCH in (0, 1)),
  ven_language_flag VARCHAR2(1 BYTE) DEFAULT 'F' NOT NULL CONSTRAINT ven_language_flag_ck CHECK (VEN_LANGUAGE_FLAG IN ('E','F')),
  ven_alt_name VARCHAR2(30 BYTE),
  ven_visible_pgs_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT ven_visible_pgs_switch_ck CHECK (VEN_VISIBLE_PGS_SWITCH IN (0, 1)),
  ven_pgs_cus_promotion_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT ven_pgs_cus_promotion_switc_ck CHECK (VEN_PGS_CUS_PROMOTION_SWITCH IN (0, 1)),
  ven_dvn_code NUMBER(3) NOT NULL,
  ven_dsc_code NUMBER(3),
  ven_detail_va_invoice_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ven_detail_va_invoice_swi_ck CHECK (VEN_DETAIL_VA_INVOICE_SWITCH IN (0, 1)),
  ven_detail_vr_invoice_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ven_detail_vr_invoice_swi_ck CHECK (VEN_DETAIL_VR_INVOICE_SWITCH IN (0, 1)),
  ven_no_prices_on_cus_bf_switch NUMBER DEFAULT 0 NOT NULL CONSTRAINT ven_no_prices_on_cus_bf_swi_ck CHECK (VEN_NO_PRICES_ON_CUS_BF_SWITCH IN (0, 1)),
  ven_freegood_admin_percent NUMBER(6,3),
  ven_freegood_rebill_source VARCHAR2(1 BYTE) DEFAULT 'L' NOT NULL CONSTRAINT ven_freegood_rebill_source_ck CHECK (VEN_FREEGOOD_REBILL_SOURCE IN ('L', 'P', 'C')),
  ven_detail_vg_invoice_switch NUMBER(1) DEFAULT 0 NOT NULL,
  ven_calc_consignment_switch NUMBER(1) DEFAULT 1 NOT NULL,
  ven_pgs_price_change_flag VARCHAR2(1 BYTE) DEFAULT 'A' NOT NULL CONSTRAINT ven_pgs_price_change_flag_ck CHECK (VEN_PGS_PRICE_CHANGE_FLAG IN ('A', 'B', 'N')),
  ven_enterprise_identification VARCHAR2(10 BYTE),
  ven_in_association_vendor_code VARCHAR2(10 BYTE),
  ven_detail_vt_invoice_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ven_detail_vt_invoice_swi_ck CHECK (VEN_DETAIL_VT_INVOICE_SWITCH IN (0, 1)),
  ven_reception_charge NUMBER(7,2),
  ven_recept_charge_ven_code NUMBER(5),
  ven_section_on_inv_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ven_section_on_inv_switch_ck CHECK (VEN_SECTION_ON_INV_SWITCH IN (0, 1)),
  ven_logo BLOB,
  ven_oagr_identifier VARCHAR2(3 BYTE),
  ven_oagr_frequency NUMBER(3) DEFAULT 1 NOT NULL,
  ven_oagr_last_invoiced_date DATE,
  ven_oagr_cwd_id VARCHAR2(3 BYTE),
  ven_gln_code NUMBER(13),
  ven_association_admin_percent NUMBER(6,3),
  ven_vgr_code NUMBER(5),
  ven_oagr_marking VARCHAR2(2 BYTE),
  ven_check_price_change_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ven_check_price_change_swi_ck CHECK (ven_check_price_change_switch IN (0, 1)),
  ven_reprint_bf_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ven_reprint_bf_switch_ck CHECK (VEN_REPRINT_BF_SWITCH IN (0,1)),
  ven_detail_vs_invoice_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT ven_detail_vs_invoi_switch_ck CHECK (VEN_DETAIL_VS_INVOICE_SWITCH IN (0,1)),
  ven_carrier_message VARCHAR2(100 BYTE),
  CONSTRAINT ven_status_ck CHECK ( (VEN_STATUS <> 'D' AND VEN_ELIMINATION_DATE IS NULL) OR (VEN_STATUS = 'D' AND VEN_ELIMINATION_DATE IS NOT NULL) ),
  CONSTRAINT ven_oagr_uk UNIQUE (ven_oagr_identifier,ven_oagr_marking) USING INDEX (CREATE UNIQUE INDEX phenix.ven_oagr_uk_i ON phenix.vendors(ven_oagr_identifier,ven_oagr_marking)    ),
  CONSTRAINT ven_pk PRIMARY KEY (ven_code),
  CONSTRAINT ven_car_code_fk FOREIGN KEY (ven_car_code) REFERENCES phenix.carriers (car_code),
  CONSTRAINT ven_cat_fk FOREIGN KEY (ven_cat_code) REFERENCES phenix.categories (cat_code),
  CONSTRAINT ven_dsc_fk FOREIGN KEY (ven_dsc_code) REFERENCES phenix.dock_sharing_codes (dsc_code),
  CONSTRAINT ven_dvn_fk FOREIGN KEY (ven_dvn_code) REFERENCES phenix.division_names (dvn_code),
  CONSTRAINT ven_negotiator_use_fk FOREIGN KEY (ven_negotiator_use_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT ven_recept_charge_ven_fk FOREIGN KEY (ven_recept_charge_ven_code) REFERENCES phenix.vendors (ven_code),
  CONSTRAINT ven_use_fk FOREIGN KEY (ven_use_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT ven_ven_association_fk FOREIGN KEY (ven_ven_association_code) REFERENCES phenix.vendors (ven_code),
  CONSTRAINT ven_ven_payable_fk FOREIGN KEY (ven_ven_payable_code) REFERENCES phenix.vendors (ven_code),
  CONSTRAINT ven_ven_pickup_fk FOREIGN KEY (ven_ven_pickup_code) REFERENCES phenix.vendors (ven_code),
  CONSTRAINT ven_vgr_fk FOREIGN KEY (ven_vgr_code) REFERENCES phenix.vendor_groups (vgr_code)
);
COMMENT ON TABLE phenix.vendors IS 'Information de base du fournisseur';
COMMENT ON COLUMN phenix.vendors.ven_code IS 'Numéro du fournisseur';
COMMENT ON COLUMN phenix.vendors.ven_cat_code IS 'Numéro de catégorie';
COMMENT ON COLUMN phenix.vendors.ven_terms IS 'Code du terme';
COMMENT ON COLUMN phenix.vendors.ven_use_code IS 'Numéro de l''usager (Acheteur)';
COMMENT ON COLUMN phenix.vendors.ven_auto_order_switch IS 'Indique si on établie des commandes automatiques avec ce fournisseur';
COMMENT ON COLUMN phenix.vendors.ven_delivery_method IS 'Type de livraison';
COMMENT ON COLUMN phenix.vendors.ven_discount_total_switch IS 'Indique si les escomptes sont calculés au total ou après les taxes et autres frais';
COMMENT ON COLUMN phenix.vendors.ven_drop_warehouse_flag IS 'Indique si le fournisseur fait des livraisons directe ou indirecte ou les deux';
COMMENT ON COLUMN phenix.vendors.ven_fob IS 'Indique si le fournisseur fait des livraisons';
COMMENT ON COLUMN phenix.vendors.ven_freight_cost IS 'Coût associé au frais de livraison';
COMMENT ON COLUMN phenix.vendors.ven_minimum_order_dollars IS 'Montant minimum de commande pour ce fournisseur';
COMMENT ON COLUMN phenix.vendors.ven_minimum_order_quantity IS 'Quantité minimum de commande pour ce fournisseur';
COMMENT ON COLUMN phenix.vendors.ven_minimum_order_weight IS 'Volume minimum de commande pour ce fournisseur';
COMMENT ON COLUMN phenix.vendors.ven_name IS 'Nom du fournisseur';
COMMENT ON COLUMN phenix.vendors.ven_short_name IS 'Nom court du fournisseur';
COMMENT ON COLUMN phenix.vendors.ven_status IS 'Indique si le fournisseur est actif, inactif ou détruit';
COMMENT ON COLUMN phenix.vendors.ven_tobacco_switch IS 'Indique si le fournisseur vend du tabac';
COMMENT ON COLUMN phenix.vendors.ven_transmit_po_method IS 'Méthode de transmission des commandes d''achats';
COMMENT ON COLUMN phenix.vendors.ven_transport_allocation IS 'Pourcentage de l''allocation de transport';
COMMENT ON COLUMN phenix.vendors.ven_wine_switch IS 'Indique si le fournisseur vend du vin';
COMMENT ON COLUMN phenix.vendors.ven_ven_payable_code IS 'Numéro du fournisseur payable';
COMMENT ON COLUMN phenix.vendors.ven_broker_vendor_id IS 'Numéro du courtier principal';
COMMENT ON COLUMN phenix.vendors.ven_duns_number IS 'Identifiant EDI du fournisseur';
COMMENT ON COLUMN phenix.vendors.ven_email IS 'Courriel du fournisseur';
COMMENT ON COLUMN phenix.vendors.ven_ven_pickup_code IS 'Code de fournisseur comptoir';
COMMENT ON COLUMN phenix.vendors.ven_modify_at_match_switch IS 'Indique si la facture du fournisseur peut être modifier à la réconciliation';
COMMENT ON COLUMN phenix.vendors.ven_edi_customer_mask IS 'Indique la façon que le fournisseur mappe le code client dans les transactions EDI 882';
COMMENT ON COLUMN phenix.vendors.ven_credit_reference_switch IS 'Indique si le fournisseur a besoin d''un numéro de référence avant d''accepter une charge de crédit';
COMMENT ON COLUMN phenix.vendors.ven_forced_single_pb_switch IS 'Indique si on force à piger dans la réservation lorsqu''il y en a qu''une seule';
COMMENT ON COLUMN phenix.vendors.ven_create_ar_switch IS 'Indique si le fournisseur requiert un compte à recevoir dans ACCPAC';
COMMENT ON COLUMN phenix.vendors.ven_minimum_order_volume IS 'Indique le volume minimum requis pour passer une commande chez ce fournisseur (en mètre cubique)';
COMMENT ON COLUMN phenix.vendors.ven_check_deliv_date_switch IS 'Indique si le fournisseur autorise une promotion si la date de livraison est pendant la promotion';
COMMENT ON COLUMN phenix.vendors.ven_ven_association_code IS 'Identifie le programme d''association';
COMMENT ON COLUMN phenix.vendors.ven_association_switch IS 'Indique si le fournisseur va servir à un association';
COMMENT ON COLUMN phenix.vendors.ven_car_code IS 'Numéro du transporteur';
COMMENT ON COLUMN phenix.vendors.ven_creation_date IS 'Date de création';
COMMENT ON COLUMN phenix.vendors.ven_elimination_date IS 'Date d''élimination';
COMMENT ON COLUMN phenix.vendors.ven_modification_date IS 'Date de modification';
COMMENT ON COLUMN phenix.vendors.ven_message IS 'Message';
COMMENT ON COLUMN phenix.vendors.ven_produce_stat_files_switch IS 'Indique si les fichiers de statistiques(.VOL et .VEN) seront générés';
COMMENT ON COLUMN phenix.vendors.ven_calc_drop_prv_tax_switch IS 'Indique si la taxe provinciale est calculée à partir du fournisseur pour les drops';
COMMENT ON COLUMN phenix.vendors.ven_match_credit_note_switch IS 'Indique si le fournisseur doit approuver les charges avant d''être facturé';
COMMENT ON COLUMN phenix.vendors.ven_drop_terms IS 'Indique le pourcentage de rabais volume trimestriel sur les DROPS';
COMMENT ON COLUMN phenix.vendors.ven_quart_drop_ship_avr IS 'Indique le pourcentage de rabais volume trimestriel sur les DROPS ';
COMMENT ON COLUMN phenix.vendors.ven_collected_avr_percent IS 'Indique le pourcentage de rabais volume réclamé par le fournisseur';
COMMENT ON COLUMN phenix.vendors.ven_distributed_avr_percent IS 'Indique le pourcentage de rabais volume distribué aux membres';
COMMENT ON COLUMN phenix.vendors.ven_federal_tax_exempt_switch IS 'Indique si le fournisseur est exempt de taxes fédérales';
COMMENT ON COLUMN phenix.vendors.ven_province_tax_exempt_switch IS 'Indique si le fournisseur est exempt de taxes provinciales';
COMMENT ON COLUMN phenix.vendors.ven_expiry_date_format IS 'Format de date fourni par le fournisseur';
COMMENT ON COLUMN phenix.vendors.ven_net_price_on_inv_switch IS 'Indique si le montant passé du segment SAC est le prix brut ou net pour les factures 810 ';
COMMENT ON COLUMN phenix.vendors.ven_language_flag IS 'Indique la langue de correspondance avec le fournisseur';
COMMENT ON COLUMN phenix.vendors.ven_alt_name IS 'Indique le nom alternatif du fournisseur';
COMMENT ON COLUMN phenix.vendors.ven_visible_pgs_switch IS 'Indique si le fournisseur est visible dans PGS.';
COMMENT ON COLUMN phenix.vendors.ven_pgs_cus_promotion_switch IS 'Indique si ce fournisseur accepte les promotions clients sur ses produits venant du PGS';
COMMENT ON COLUMN phenix.vendors.ven_dvn_code IS 'Indique le code de la division';
COMMENT ON COLUMN phenix.vendors.ven_dsc_code IS 'Indique le code de partage d''un quai d''expédition';
COMMENT ON COLUMN phenix.vendors.ven_detail_va_invoice_switch IS 'Indique si les factures des ententes fournisseur à la vente doivent être détaillées';
COMMENT ON COLUMN phenix.vendors.ven_detail_vr_invoice_switch IS 'Indique si les factures des compteurs ("count and recount") doivent être détaillées';
COMMENT ON COLUMN phenix.vendors.ven_no_prices_on_cus_bf_switch IS 'Indique si le fournisseur utilise un "bon de livraison" (sans prix) pour les factures de type "BF" de ses clients';
COMMENT ON COLUMN phenix.vendors.ven_freegood_admin_percent IS 'Indique le pourcentage pour calculer le montant des frais administratif pour gérer les gratuités.Calculer dans le bas de la facture fournisseur.';
COMMENT ON COLUMN phenix.vendors.ven_freegood_rebill_source IS 'Indique sur quelle base la refacturation des gratuités sont calculées sur leprix de liste manufacturier ou prix de vente du régulier.';
COMMENT ON COLUMN phenix.vendors.ven_detail_vg_invoice_switch IS 'Indique si les factures des gratuités doivent être détaillées';
COMMENT ON COLUMN phenix.vendors.ven_calc_consignment_switch IS 'Indique si on calcule des montants de consignes sur les commandes d''achats pour ce fournisseur.';
COMMENT ON COLUMN phenix.vendors.ven_pgs_price_change_flag IS 'Indique la mannière que ce fournisseur accepte les changements de prix de ses produits venant de PGS';
COMMENT ON COLUMN phenix.vendors.ven_enterprise_identification IS 'Indique le numéro d''idenrification du forunisseur.';
COMMENT ON COLUMN phenix.vendors.ven_in_association_vendor_code IS 'Indique le code du fournisseur dans le programme';
COMMENT ON COLUMN phenix.vendors.ven_detail_vt_invoice_switch IS 'Indique si les factures des compteurs télévente doivent être détaillées';
COMMENT ON COLUMN phenix.vendors.ven_reception_charge IS 'Indique le montant à charger par item reçu';
COMMENT ON COLUMN phenix.vendors.ven_recept_charge_ven_code IS 'Indique le fournisseur à qui on facture les facture les frais de reception';
COMMENT ON COLUMN phenix.vendors.ven_section_on_inv_switch IS 'Indique si le fournisseur nécessite que ses produits vendus aux clients se trouvent sur sa propre page';
COMMENT ON COLUMN phenix.vendors.ven_logo IS 'Indique le logo associé au fournisseur';
COMMENT ON COLUMN phenix.vendors.ven_oagr_identifier IS 'Indique le code d''identifiant du fournisseur dans les fichiers interface pour les ententes partenaires (OA et TPA)';
COMMENT ON COLUMN phenix.vendors.ven_oagr_frequency IS 'Indique la fréquence où les ententes partenaires (OA et TPA) sont refacturées au fournisseur';
COMMENT ON COLUMN phenix.vendors.ven_oagr_last_invoiced_date IS 'Indique la dernière date de facturation au fourniseur pour les ententes partenaires (OA et TPA)';
COMMENT ON COLUMN phenix.vendors.ven_oagr_cwd_id IS 'Indique le code identifiant l''entreprise chez le fournisseur, pour les fichiers interface des ententes partenaires (OA et TPA)';
COMMENT ON COLUMN phenix.vendors.ven_gln_code IS 'Indique le code d''identification du fournisseur chez GS1 Canada';
COMMENT ON COLUMN phenix.vendors.ven_association_admin_percent IS 'Indique le pourcentage d''administration pour le programme de remise';
COMMENT ON COLUMN phenix.vendors.ven_vgr_code IS 'Indique le le code du groupe de fournisseur';
COMMENT ON COLUMN phenix.vendors.ven_oagr_marking IS 'Indique le marquage des produits pour identifier le fournisseur dans les fichiers interface pour les ententes partenaires (OA et TPA)';
COMMENT ON COLUMN phenix.vendors.ven_check_price_change_switch IS 'Indique si le fournisseur fixe le prix à la commande ou à la livraison';
COMMENT ON COLUMN phenix.vendors.ven_reprint_bf_switch IS 'Indique si les factures de type ''BF'' sont imprimés chez le fournisseur';
COMMENT ON COLUMN phenix.vendors.ven_detail_vs_invoice_switch IS 'Indique si le manufacturier veut les factures reclamation prime VS detaillées';
COMMENT ON COLUMN phenix.vendors.ven_carrier_message IS 'Indique le message qui va être imprimé sur le rapport de pickup du transporteur ';