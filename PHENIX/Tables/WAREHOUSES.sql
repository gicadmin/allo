CREATE TABLE phenix.warehouses (
  whs_code VARCHAR2(2 BYTE) NOT NULL,
  whs_prv_code VARCHAR2(2 BYTE) NOT NULL,
  whs_address VARCHAR2(45 BYTE) NOT NULL,
  whs_city VARCHAR2(30 BYTE) NOT NULL,
  whs_duns_number VARCHAR2(15 BYTE) NOT NULL,
  whs_name VARCHAR2(30 BYTE) NOT NULL,
  whs_language_flag VARCHAR2(1 BYTE) NOT NULL CONSTRAINT whs_language_flag_ck CHECK (WHS_LANGUAGE_FLAG IN ('F', 'E')),
  whs_member_id NUMBER(11),
  whs_postal_code VARCHAR2(10 BYTE) NOT NULL,
  whs_telephone NUMBER(11) NOT NULL,
  whs_email VARCHAR2(320 BYTE) NOT NULL,
  whs_fax_number NUMBER(11),
  whs_toll_free_telephone NUMBER(11),
  whs_web_address VARCHAR2(200 BYTE),
  whs_surcharge_gl_account VARCHAR2(40 BYTE),
  whs_printer_by_zone_switch NUMBER(1) DEFAULT 0 NOT NULL,
  whs_transport_services VARCHAR2(40 BYTE) NOT NULL,
  whs_interco_email VARCHAR2(320 BYTE),
  whs_ticket_charge_account VARCHAR2(40 BYTE),
  whs_delivery_charge_account VARCHAR2(40 BYTE),
  whs_match_adjustment_account VARCHAR2(40 BYTE),
  whs_transit_loc_code VARCHAR2(12 BYTE),
  whs_counter_prn_id NUMBER(15),
  whs_web_identification_key VARCHAR2(50 BYTE),
  whs_vct_default_price_code VARCHAR2(2 BYTE) NOT NULL,
  whs_vct_default_quantity_code VARCHAR2(2 BYTE) NOT NULL,
  whs_fuel_surcharge_account VARCHAR2(40 BYTE),
  whs_transport_service_credit VARCHAR2(40 BYTE),
  whs_offinv_vol_reb_gl_account VARCHAR2(40 BYTE),
  whs_provincial_tax_number VARCHAR2(18 BYTE) NOT NULL,
  whs_federal_tax_number VARCHAR2(15 BYTE) NOT NULL,
  whs_tobacco_tax_number VARCHAR2(16 BYTE),
  whs_nir_number VARCHAR2(20 BYTE),
  whs_tabacco_identification VARCHAR2(16 BYTE),
  whs_enterprise_identification VARCHAR2(10 BYTE),
  whs_route_prn_id NUMBER(15),
  whs_send_email_pallet_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT whs_send_email_pallet_swi_ck CHECK (WHS_SEND_EMAIL_PALLET_SWITCH IN (0, 1)),
  whs_pallet_trans_gl_account VARCHAR2(40 BYTE),
  whs_auto_close_transit_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT whs_auto_close_transit_swi_ck CHECK (WHS_AUTO_CLOSE_TRANSIT_SWITCH IN (0, 1)),
  whs_bypass_transit_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT whs_bypass_transit_switch_ck CHECK (WHS_BYPASS_TRANSIT_SWITCH IN (0, 1)),
  whs_assign_second_wave_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT whs_assign_second_wave_swi_ck CHECK (WHS_ASSIGN_SECOND_WAVE_SWITCH IN (0, 1)),
  whs_recept_charge_gl_account VARCHAR2(40 BYTE),
  whs_roadnet_whs_code VARCHAR2(2 BYTE),
  whs_internal_cus_code NUMBER(10),
  whs_ap_internal_admin_account VARCHAR2(40 BYTE),
  whs_bottom_pallet_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT whs_bottom_pallet_switch_ck CHECK (WHS_BOTTOM_PALLET_SWITCH IN (0, 1)),
  whs_sequence NUMBER(2) DEFAULT 1 NOT NULL CONSTRAINT whs_sequence CHECK (WHS_SEQUENCE > 0),
  whs_cash_deposit_limit NUMBER(7,2),
  whs_cash_register_limit NUMBER(7,2),
  whs_rounding_gl_account VARCHAR2(40 BYTE),
  whs_display_in_pci_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT whs_display_in_pci_switch_ck CHECK (WHS_DISPLAY_IN_PCI_SWITCH IN (0,1)),
  whs_c_and_c_pricing_cus_code NUMBER(10),
  CONSTRAINT whs_pk PRIMARY KEY (whs_code),
  CONSTRAINT whs_counter_prn_fk FOREIGN KEY (whs_counter_prn_id) REFERENCES phenix.printers (prn_id),
  CONSTRAINT whs_c_and_c_pricing_cus_fk FOREIGN KEY (whs_c_and_c_pricing_cus_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT whs_internal_cus_code_fk FOREIGN KEY (whs_internal_cus_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT whs_prv_fk FOREIGN KEY (whs_prv_code) REFERENCES phenix.provinces (prv_code),
  CONSTRAINT whs_roadnet_whs_fk FOREIGN KEY (whs_roadnet_whs_code) REFERENCES phenix.warehouses (whs_code),
  CONSTRAINT whs_route_prn_fk FOREIGN KEY (whs_route_prn_id) REFERENCES phenix.printers (prn_id),
  CONSTRAINT whs_transit_loc_fk FOREIGN KEY (whs_transit_loc_code) REFERENCES phenix.locations (loc_code),
  CONSTRAINT whs_vct_default_price_code_fk FOREIGN KEY (whs_vct_default_price_code) REFERENCES phenix.vendor_credit_types (vct_code),
  CONSTRAINT whs_vct_default_qty_code_fk FOREIGN KEY (whs_vct_default_quantity_code) REFERENCES phenix.vendor_credit_types (vct_code)
);
COMMENT ON TABLE phenix.warehouses IS 'Contient l''information pertinant à un entrepôt';
COMMENT ON COLUMN phenix.warehouses.whs_code IS 'Code de l''entrepôt';
COMMENT ON COLUMN phenix.warehouses.whs_prv_code IS 'Code province';
COMMENT ON COLUMN phenix.warehouses.whs_address IS 'Adresse';
COMMENT ON COLUMN phenix.warehouses.whs_city IS 'Ville';
COMMENT ON COLUMN phenix.warehouses.whs_duns_number IS 'Numéro DUNS';
COMMENT ON COLUMN phenix.warehouses.whs_name IS 'Nom';
COMMENT ON COLUMN phenix.warehouses.whs_language_flag IS 'Langue de l''entrepôt';
COMMENT ON COLUMN phenix.warehouses.whs_member_id IS 'Numéro de membre';
COMMENT ON COLUMN phenix.warehouses.whs_postal_code IS 'Code postal';
COMMENT ON COLUMN phenix.warehouses.whs_telephone IS 'Numéro de téléphone';
COMMENT ON COLUMN phenix.warehouses.whs_email IS 'Courriel';
COMMENT ON COLUMN phenix.warehouses.whs_fax_number IS 'Numéro de fax';
COMMENT ON COLUMN phenix.warehouses.whs_toll_free_telephone IS 'Numéro de téléphone sans frais';
COMMENT ON COLUMN phenix.warehouses.whs_web_address IS 'Indique l''adresse du site Internet de l''entrepôt';
COMMENT ON COLUMN phenix.warehouses.whs_surcharge_gl_account IS 'Indique le code des frais d''administration au grand livre ';
COMMENT ON COLUMN phenix.warehouses.whs_printer_by_zone_switch IS 'Indique si on utilise des imprimantes par zone';
COMMENT ON COLUMN phenix.warehouses.whs_transport_services IS 'Indique le compte GL pour les services de transport';
COMMENT ON COLUMN phenix.warehouses.whs_interco_email IS 'Indique l''adresse courriel utilisée pour envoyer la requête pour le transfert';
COMMENT ON COLUMN phenix.warehouses.whs_ticket_charge_account IS 'Indique le compte GL pour la charge des étiquettes';
COMMENT ON COLUMN phenix.warehouses.whs_delivery_charge_account IS 'Indique le compte GL pour la charge des livraisons';
COMMENT ON COLUMN phenix.warehouses.whs_match_adjustment_account IS 'Indique le compte GL pour les ajustements lors de la réconciliation';
COMMENT ON COLUMN phenix.warehouses.whs_transit_loc_code IS 'Indique la localisation de résolution de problème pour cet entrepôt';
COMMENT ON COLUMN phenix.warehouses.whs_counter_prn_id IS 'Indique l''imprimante utilisée pour les commandes comptoires';
COMMENT ON COLUMN phenix.warehouses.whs_web_identification_key IS 'Indique la clé d''identification pour accéder aux services web chez Colabor';
COMMENT ON COLUMN phenix.warehouses.whs_vct_default_price_code IS 'Indique le code de la charge fournisseur utilisé automatiquement lors d''erreurs de prix à la réconciliation';
COMMENT ON COLUMN phenix.warehouses.whs_vct_default_quantity_code IS 'Indique le code de la charge fournisseur utilisé automatiquement lors d''erreurs de quantité à la réconciliation';
COMMENT ON COLUMN phenix.warehouses.whs_fuel_surcharge_account IS 'Indique le compte GL défini pour la surcharge de carburant reliée au transport';
COMMENT ON COLUMN phenix.warehouses.whs_transport_service_credit IS 'Indique le compte GL défini pour le crédit de transport';
COMMENT ON COLUMN phenix.warehouses.whs_offinv_vol_reb_gl_account IS 'Indique le compte GL pour les rabais volumes sur facture';
COMMENT ON COLUMN phenix.warehouses.whs_provincial_tax_number IS 'Indique le numéro de taxe provinciale';
COMMENT ON COLUMN phenix.warehouses.whs_federal_tax_number IS 'Indique le numéro de taxe fédérale';
COMMENT ON COLUMN phenix.warehouses.whs_tobacco_tax_number IS 'Indique le numéro de la taxe tabac';
COMMENT ON COLUMN phenix.warehouses.whs_nir_number IS 'Indique le numéro d''identification au registre des transporteurs';
COMMENT ON COLUMN phenix.warehouses.whs_tabacco_identification IS 'Indique le numéro d''identification tabac';
COMMENT ON COLUMN phenix.warehouses.whs_enterprise_identification IS 'Indique le numéro d''entreprise du Québec (NEQ)';
COMMENT ON COLUMN phenix.warehouses.whs_route_prn_id IS 'Indique l''imprimante utilisée pour la génération des routes par entrepôt.';
COMMENT ON COLUMN phenix.warehouses.whs_send_email_pallet_switch IS 'Indique si on envoie des courriels en cas de relâchement de palette';
COMMENT ON COLUMN phenix.warehouses.whs_pallet_trans_gl_account IS 'Indique le compte GL pour les transacations de palettes';
COMMENT ON COLUMN phenix.warehouses.whs_auto_close_transit_switch IS 'Indique si les missions de transit ayant cet entrepôt comme destination sont fermées directement après la cueillette';
COMMENT ON COLUMN phenix.warehouses.whs_bypass_transit_switch IS 'Indique si on outrepasse les règles de transit normales';
COMMENT ON COLUMN phenix.warehouses.whs_assign_second_wave_switch IS 'Indique si les palettes venant de la seconde vague seront considérés dans l''assignation automatique';
COMMENT ON COLUMN phenix.warehouses.whs_recept_charge_gl_account IS 'Indique le compte GL pour les frais de réception (déchargemet de camion)';
COMMENT ON COLUMN phenix.warehouses.whs_roadnet_whs_code IS 'Indique le code d''entrepôt, qui sera envoyé à Road Net, pour traiter les entrepôts avec le by-pass des transits';
COMMENT ON COLUMN phenix.warehouses.whs_internal_cus_code IS 'Indique le code client interne représentant l''entrepot';
COMMENT ON COLUMN phenix.warehouses.whs_ap_internal_admin_account IS 'Indique le compte GL utilisé pour les frais d''administration interne';
COMMENT ON COLUMN phenix.warehouses.whs_sequence IS 'Indique ordre de tri des entrepôts';
COMMENT ON COLUMN phenix.warehouses.whs_cash_deposit_limit IS 'Indique le montant d’argent permet dans la caisse avant d’aviser pour un dépôt';
COMMENT ON COLUMN phenix.warehouses.whs_cash_register_limit IS 'Indique le montant d’argent maximum dans la caisse avant que les opérations de ventes soient bloquées';
COMMENT ON COLUMN phenix.warehouses.whs_rounding_gl_account IS 'Indique le compte GL des arrondissements du cash and carry';
COMMENT ON COLUMN phenix.warehouses.whs_display_in_pci_switch IS 'Indique si l’entrepot va etre affiché dans le PCI ou pas';
COMMENT ON COLUMN phenix.warehouses.whs_c_and_c_pricing_cus_code IS 'Indique le code de client utilisé dans le "payer et emporter" pour accéder à la structure de prix';