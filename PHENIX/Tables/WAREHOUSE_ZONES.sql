CREATE TABLE phenix.warehouse_zones (
  whz_code VARCHAR2(2 BYTE) NOT NULL,
  whz_description VARCHAR2(30 BYTE) NOT NULL,
  whz_alt_description VARCHAR2(30 BYTE),
  whz_auto_pick_list_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT whz_auto_pick_list_switch_ck CHECK (WHZ_AUTO_PICK_LIST_SWITCH IN (0, 1)),
  whz_minimum_pallet_volume NUMBER(10,3),
  whz_maximum_pallet_volume NUMBER(10,3),
  whz_segregate_rsrv_misn_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT whz_segregate_rsrv_switch_ck CHECK (whz_segregate_rsrv_misn_switch IN (0,1)),
  whz_mission_by_pallet_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT whz_mission_by_pallet_sw_ck CHECK (whz_mission_by_pallet_switch IN (0,1)),
  whz_confirm_nb_packages_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT whz_confirm_nb_packages_swi_ck CHECK (whz_confirm_nb_packages_switch IN (0,1)),
  whz_conf_repack_sticker_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT whz_conf_repack_sticker_swi_ck CHECK (whz_conf_repack_sticker_switch IN (0,1)),
  whz_disp_deliv_message_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT whz_disp_deliv_message_sw_ck CHECK (WHZ_DISP_DELIV_MESSAGE_SWITCH IN (0,1)),
  whz_go_back_for_shorts_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT whz_go_back_for_shorts_sw_ck CHECK (WHZ_GO_BACK_FOR_SHORTS_SWITCH IN (0,1)),
  whz_skip_location_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT whz_skip_location_sw_ck CHECK (WHZ_SKIP_LOCATION_SWITCH IN (0,1)),
  whz_split_mission_print_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT whz_split_mission_print_sw_ck CHECK (WHZ_SPLIT_MISSION_PRINT_SWITCH IN (0,1)),
  whz_print_report_type VARCHAR2(1 BYTE) DEFAULT 'L' NOT NULL CONSTRAINT whz_print_report_type_ck CHECK (WHZ_PRINT_REPORT_TYPE IN ('L','P','N')),
  whz_load_on_truck_sequence NUMBER(2),
  whz_tot_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT whz_tot_switch_chk CHECK (WHZ_TOT_SWITCH IN (0,1)),
  whz_lot_pick_priority VARCHAR2(1 BYTE) DEFAULT 'P' NOT NULL CONSTRAINT whz_lot_ctrl_pick_priority_ck CHECK (whz_lot_pick_priority IN ('P','O')),
  whz_fifo_pick_priority VARCHAR2(1 BYTE) DEFAULT 'P' NOT NULL CONSTRAINT whz_fifo_ctrl_pick_priority_ck CHECK (whz_fifo_pick_priority IN ('P','O')),
  whz_whc_code VARCHAR2(2 BYTE) NOT NULL,
  whz_prn_id NUMBER(15),
  whz_max_case_weight NUMBER(8,3) DEFAULT 99999.999 NOT NULL,
  whz_split_pallet_by_pmh_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT whz_split_pallet_by_pmh_swi_ck CHECK (WHZ_SPLIT_PALLET_BY_PMH_SWITCH IN (0, 1)),
  whz_min_overstock_pick_volume NUMBER(10,3) DEFAULT 0 NOT NULL,
  whz_whz_code VARCHAR2(2 BYTE),
  whz_collect_at_the_end_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT whz_collect_at_the_end_swit_ck CHECK (WHZ_COLLECT_AT_THE_END_SWITCH IN (0,1)),
  whz_count_pick_interval NUMBER(2) CONSTRAINT whz_count_pick_interval_ck CHECK (WHZ_COUNT_PICK_INTERVAL IS NULL OR WHZ_COUNT_PICK_INTERVAL > 0),
  whz_truck_type VARCHAR2(4 BYTE) DEFAULT 'DRYV' NOT NULL,
  whz_repack_tote_volume NUMBER(10,3),
  CONSTRAINT whz_pk PRIMARY KEY (whz_code),
  CONSTRAINT whz_prn_fk FOREIGN KEY (whz_prn_id) REFERENCES phenix.printers (prn_id),
  CONSTRAINT whz_whc_fk FOREIGN KEY (whz_whc_code) REFERENCES phenix.warehouse_conditions (whc_code),
  CONSTRAINT whz_whz_code_fk FOREIGN KEY (whz_whz_code) REFERENCES phenix.warehouse_zones (whz_code)
);
COMMENT ON TABLE phenix.warehouse_zones IS 'Identifie la zone de l''entrepôt où on prépare la commande';
COMMENT ON COLUMN phenix.warehouse_zones.whz_code IS 'Numéro de zone d''entrepôt';
COMMENT ON COLUMN phenix.warehouse_zones.whz_description IS 'Description';
COMMENT ON COLUMN phenix.warehouse_zones.whz_alt_description IS 'Description alternative';
COMMENT ON COLUMN phenix.warehouse_zones.whz_auto_pick_list_switch IS 'Indique si un bon de cueillette est immédiatement envoyé aprés une commande dans cette zone d''entrepôt';
COMMENT ON COLUMN phenix.warehouse_zones.whz_minimum_pallet_volume IS 'Volume minimum de la palette';
COMMENT ON COLUMN phenix.warehouse_zones.whz_maximum_pallet_volume IS 'Volume maximum de la palette';
COMMENT ON COLUMN phenix.warehouse_zones.whz_segregate_rsrv_misn_switch IS 'Indique si la cueillette à partir des localisations de réserve est générée dans des missions séparées.';
COMMENT ON COLUMN phenix.warehouse_zones.whz_mission_by_pallet_switch IS 'Indique si les missions de réserve sont séparées par palette';
COMMENT ON COLUMN phenix.warehouse_zones.whz_confirm_nb_packages_switch IS 'Indique si on doit confirmer un nombre de collis pour cette zone d''entreposage.';
COMMENT ON COLUMN phenix.warehouse_zones.whz_conf_repack_sticker_switch IS 'Indique si on doit confirmer un nombre d''étiquettes de réemballage pour cette zone d''entreposage.';
COMMENT ON COLUMN phenix.warehouse_zones.whz_disp_deliv_message_switch IS 'Indique si un message concernant le quai de livraison doit être affiché';
COMMENT ON COLUMN phenix.warehouse_zones.whz_go_back_for_shorts_switch IS 'Indique si un cueilleur vérifiera s''il y a un nouvel inventaire disponible pour les éléments en rupture de stock';
COMMENT ON COLUMN phenix.warehouse_zones.whz_skip_location_switch IS 'Indique si une ligne de cueillette ou une localisation peut être ignorée';
COMMENT ON COLUMN phenix.warehouse_zones.whz_split_mission_print_switch IS 'Indique si l''en-tête et les détails de la mission de cueillette seront imprimés séparéments';
COMMENT ON COLUMN phenix.warehouse_zones.whz_print_report_type IS 'Indique si on imprime le rapport de cueillette sur étiquette ou sur papier';
COMMENT ON COLUMN phenix.warehouse_zones.whz_load_on_truck_sequence IS 'Indique l''ordre dans lequel les zones de l''entrepôt seront chargées dans les camions';
COMMENT ON COLUMN phenix.warehouse_zones.whz_tot_switch IS 'Indique si on utilise des bacs pour cette zone d''entreposage ';
COMMENT ON COLUMN phenix.warehouse_zones.whz_lot_pick_priority IS 'Indique de prioriser les localisations de réserve pour cueillir les produits géré par lot';
COMMENT ON COLUMN phenix.warehouse_zones.whz_fifo_pick_priority IS 'Indique de prioriser les localisations de réserve pour cueillir les produits FIFO';
COMMENT ON COLUMN phenix.warehouse_zones.whz_whc_code IS 'Indique à quelle condition d''entreposage appartient ce type';
COMMENT ON COLUMN phenix.warehouse_zones.whz_max_case_weight IS 'Indique le poids maximum d''une caisse pour appliquer dans les règles de positionnement.';
COMMENT ON COLUMN phenix.warehouse_zones.whz_split_pallet_by_pmh_switch IS 'Indique si la zone permet de cueillir une palette séparément par missions';
COMMENT ON COLUMN phenix.warehouse_zones.whz_min_overstock_pick_volume IS 'Indique le volume minimum de cueillette en localisation de réserve';
COMMENT ON COLUMN phenix.warehouse_zones.whz_whz_code IS 'Indique le code de zone d''entreposage liée(parente)';
COMMENT ON COLUMN phenix.warehouse_zones.whz_collect_at_the_end_switch IS 'Indique si on ramasse les colis de cette zone à la fin de la cueillette de la zone parente';
COMMENT ON COLUMN phenix.warehouse_zones.whz_count_pick_interval IS 'Indique après combien de lignes de cueillette une confirmation du nombre d''élément est demandée';
COMMENT ON COLUMN phenix.warehouse_zones.whz_truck_type IS 'Indique le type de camion transporteur';
COMMENT ON COLUMN phenix.warehouse_zones.whz_repack_tote_volume IS 'Indique le volume du contenant / caisse utilisé pour le remballage des produits dans cette zone';